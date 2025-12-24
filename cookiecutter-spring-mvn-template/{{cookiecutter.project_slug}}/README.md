# {{cookiecutter.project_slug}}

Java Spring Boot starter generated via cookiecutter with a simple DDD-style layout.

## Quickstart
- Build: `mvn clean package`
- Run: `mvn spring-boot:run` (or `java -jar target/{{cookiecutter.artifact_id}}-0.0.1-SNAPSHOT.jar`)
- Test: `mvn test`
- Endpoint: `GET http://localhost:8080/hello/{name}` -> `{"name":"{name}","message":"Hello, {name}!"}`

## Structure
- `domain` (model + ports): `Greeting` (name with getters/setters), `GreetingService`
- `application` (use cases): `DefaultGreetingService`
- `infrastructure/web` (adapters): `HelloController`

## Requirements
- Java {{cookiecutter.java_version}} or later
- Maven 3.9+ installed (or add the Maven Wrapper if desired)
