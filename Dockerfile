FROM openjdk:24-slim as Build
RUN apt-get update && apt-get install -y maven
WORKDIR /app
COPY . .
RUN mvn clean install

FROM openjdk:8-jre 
WORKDIR /app
COPY --from=Build ./app/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]

