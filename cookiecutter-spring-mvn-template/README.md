# ☕ Java Spring Boot Project Template

## 🧩 Overview
This cookiecutter template bootstraps a **Java Spring Boot** application preconfigured for **Maven** using a lightweight DDD-inspired layout (domain, application, infrastructure/web).  
It generates a runnable REST API with `/hello/{name}` so you can start from a clean, layered baseline.

---

## ⚙️ Features
- ✅ Maven build preconfigured
- ✅ DDD-style layering: domain, application, infrastructure/web
- ✅ `/hello/{name}` REST endpoint backed by service + domain model
- ✅ Minimal dependencies and configuration
- ✅ Runs out-of-the-box using a single command

---

## 🧱 Project Structure
```
{{cookiecutter.project_slug}}/
├── pom.xml
├── src/main/java/{{cookiecutter.package_path}}/
│   ├── Application.java
│   ├── domain/
│   │   ├── model/Greeting.java
│   │   └── service/GreetingService.java
│   ├── application/service/DefaultGreetingService.java
│   └── infrastructure/web/HelloController.java
├── src/main/resources/application.properties
└── src/test/java/{{cookiecutter.package_path}}/...
```
---

## 🚀 How It Works
During cookiecutter generation, you'll be prompted for:
- **group_id** (e.g., `com.company`)
- **domain_name** (e.g., `platform`)
- **service_name** (e.g., `hello`)
- **service_type** (`api` or `gateway`)
- **java_version** and **spring_boot_version**

Based on your choice, the template will scaffold a complete **Spring Boot project** configured with:

```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-web</artifactId>
</dependency>
```

## ✅ Acceptance Criteria
- Maven build files generated during cookiecutter execution
- Generated project builds and runs successfully
- `/hello/{name}` returns a greeting including the provided name
- Folder and package structure follow Java + DDD conventions
- Example usage documented in the repository README
