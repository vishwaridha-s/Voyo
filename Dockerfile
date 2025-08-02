FROM maven:3.8.5-openjdk-17 AS build
COPY src/main/java/com/example/travellapp .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/*.jar travellapp.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "travellapp.jar"]
