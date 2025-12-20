# syntax=docker/dockerfile:1

ARG JAVA_VERSION=21

FROM maven:3.9-eclipse-temurin-${JAVA_VERSION} AS build
WORKDIR /workspace
COPY pom.xml .
COPY src src
RUN mvn -B -DskipTests package

FROM eclipse-temurin:${JAVA_VERSION}-jre
WORKDIR /app
# non-root runtime user
RUN addgroup --system app && adduser --system --ingroup app app
COPY --from=build /workspace/target/*.jar /app/app.jar
USER app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
