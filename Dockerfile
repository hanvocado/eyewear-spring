FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/target/EyewearECM-0.0.1-SNAPSHOT.war app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]