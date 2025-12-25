# Cookiecutter Templates Wiki

## Overview
This repository collects multiple Cookiecutter templates for quickly bootstrapping API services across common stacks. Each template lives in its own directory and can be generated independently.

Included stacks:
- Python Django
- .NET 8 Web API
- Go Fiber
- Java Spring Boot (Maven)

## Index
- Getting Started
- Template Index
- Django Template
- .NET 8 Web API Template
- Go Fiber Template
- Spring Boot Maven Template
- Common Conventions
- Adding a Template
- Notes

## Getting Started

### Prerequisites
- Python 3 with pip
- Cookiecutter (installed via `requirements.txt`)
- Stack-specific toolchains when you generate a template (Go, .NET SDK, Java + Maven)

### Setup (local)
Use the Makefile on Unix-like systems:
```bash
make venv
```

Or set up manually:
```bash
python -m venv venv
venv\Scripts\activate  # Windows
source venv/bin/activate  # macOS/Linux
pip install -r requirements.txt
```

### Generate a Project
From the repo root, run Cookiecutter against the desired template directory:
```bash
cookiecutter cookiecutter-dotnet-template
```

From GitHub:
```bash
cookiecutter gh:miraccan00/cookie-cutter-templates --directory "cookiecutter-dotnet-template"
```

## Template Index

| Template | Directory | Stack | Default Port | Sample Endpoint |
| --- | --- | --- | --- | --- |
| Django | `cookiecutter-django-template` | Python / Django 5.x | 8000 | `GET /hello/` (HTML) |
| .NET 8 Web API | `cookiecutter-dotnet-template` | C# / .NET 8 | 5000 (dev), 8080 (Docker) | `GET /hello/{name}` (JSON) |
| Go Fiber | `cookiecutter-fiber-template` | Go / Fiber | 8080 | `GET /hello` (text) |
| Spring Boot Maven | `cookiecutter-spring-mvn-template` | Java / Spring Boot 3.x | 8080 | `GET /hello/{name}` (JSON) |

## Django Template
Location: `cookiecutter-django-template`

Inputs (from the template README):
- `project_slug`
- `project_creator`
- `project_type` (Rest API or Monolith)
- `service_name`
- `version`

Generated project highlights inside `{{cookiecutter.project_slug}}/`:
- `core/` Django project settings and URLs
- `{{cookiecutter.service_name}}/` Django app with a `/hello/` view
- `manage.py`, `requirements.txt`, `Dockerfile`
- `application-manifest.yaml`

Additional template file:
- `catalog-info.yaml` (Backstage component metadata)

Run locally:
```bash
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```

Sample endpoint:
- `http://localhost:8000/hello/`

Docker:
```bash
docker build -t {{cookiecutter.project_slug}} .
docker run --rm -p 8000:8000 {{cookiecutter.project_slug}}
```
Note: the Dockerfile runs `gunicorn`, so add it to `requirements.txt` if you plan to use the container as-is.

## .NET 8 Web API Template
Location: `cookiecutter-dotnet-template`

Inputs:
- `project_name`
- `namespace`
- `target_framework`
- `description`

Generated project highlights inside `{{cookiecutter.project_slug}}/`:
- `Controllers/HelloController.cs`
- `Application/Services/DefaultGreetingService.cs`
- `Domain/Models/Greeting.cs`, `Domain/Services/IGreetingService.cs`
- `Program.cs`
- `tests/{{cookiecutter.project_slug}}.Tests/`

Run locally:
```bash
dotnet build {{cookiecutter.project_slug}}.sln
dotnet run --project {{cookiecutter.project_slug}}.csproj
```

Test:
```bash
dotnet test {{cookiecutter.project_slug}}.sln
```

Sample endpoint:
- `http://localhost:5000/hello/Codex`

Docker:
```bash
docker build -t {{cookiecutter.project_slug}} .
docker run --rm -p 8080:8080 {{cookiecutter.project_slug}}
```

## Go Fiber Template
Location: `cookiecutter-fiber-template`

Inputs:
- `project_name`
- `module_path`
- `go_version`
- `description`

Generated project highlights inside `{{cookiecutter.project_slug}}/`:
- `cmd/main.go`
- `internal/handler/hello.go`
- `go.mod`, `go.sum`

Run locally:
```bash
go run cmd/main.go
```

Sample endpoint:
- `http://localhost:8080/hello`

Docker:
```bash
docker build -t {{cookiecutter.project_slug}} .
docker run --rm -p 8080:8080 {{cookiecutter.project_slug}}
```

## Spring Boot Maven Template
Location: `cookiecutter-spring-mvn-template`

Inputs:
- `group_id`
- `domain_name`
- `service_name`
- `service_type` (api or gateway)
- `java_version`
- `spring_boot_version`

Generated project highlights inside `{{cookiecutter.project_slug}}/`:
- `src/main/java/{{cookiecutter.package_path}}/Application.java`
- `domain/`, `application/`, `infrastructure/web/` DDD-style layers
- `src/test/java/{{cookiecutter.package_path}}/infrastructure/web/HelloControllerTest.java`
- `pom.xml`

Run locally:
```bash
mvn clean package
mvn spring-boot:run
```

Test:
```bash
mvn test
```

Sample endpoint:
- `http://localhost:8080/hello/Codex`

Docker:
```bash
docker build -t {{cookiecutter.project_slug}} .
docker run --rm -p 8080:8080 {{cookiecutter.project_slug}}
```

## Common Conventions
- Each template provides a minimal "hello" endpoint to validate the generated service.
- .NET and Spring templates use a simple DDD-style layering (domain, application, infrastructure/web).
- Dockerfiles are included for container builds.

## Adding a Template
1. Create a new `cookiecutter-<name>-template/` directory.
2. Add a `cookiecutter.json` file that defines template inputs.
3. Add a `{{cookiecutter.project_slug}}/` directory containing the project skeleton.
4. Include a template README that documents usage and expected output.
5. Update this wiki with the new template details.

## Notes
- The Django template documents its `cookiecutter.json` in `cookiecutter-django-template/README.md`; add the file to enable generation.
- Template `.github/` directories are present but do not include workflow files yet.
