# Golang Fiber Cookiecutter Template

## Overview
This cookiecutter template bootstraps a Golang Fiber web application with a minimal Hello World REST API.
It generates a ready-to-run Go project using the Fiber framework and standard Go conventions.

---

## Features
- Auto-generates Go module and folder structure
- Includes a Hello World REST API endpoint
- Minimal dependencies and configuration
- Runs instantly with a single command
- Uses idiomatic Go conventions (cmd/, internal/)

---

## Project Structure
```
{{cookiecutter.project_slug}}/
|-- .github/workflows/build-and-publish.yaml
|-- cmd/main.go
|-- internal/handler/hello.go
|-- go.mod
|-- go.sum
|-- Dockerfile
|-- README.md
`-- .gitignore
```

---

## How It Works
During cookiecutter generation, you'll be prompted for:
- Project name
- Go module path (example: github.com/yourname/{{cookiecutter.project_slug}})
- Go version (default: 1.21)

The template scaffolds a runnable Go Fiber app with a main entrypoint and a simple handler.

---

## Example Endpoint
```go
package handler

import "github.com/gofiber/fiber/v2"

func Hello(c *fiber.Ctx) error {
    return c.SendString("Hello, World!")
}
```

main.go:
```go
package main

import (
    "log"

    "github.com/gofiber/fiber/v2"
    "{{cookiecutter.module_path}}/internal/handler"
)

func main() {
    app := fiber.New()
    app.Get("/hello", handler.Hello)

    if err := app.Listen(":8080"); err != nil {
        log.Fatal(err)
    }
}
```

Run the application:
```bash
go run cmd/main.go
```

Then open:
```
http://localhost:8080/hello
```

Expected response:
```
Hello, World!
```

---

## Acceptance Criteria
- Developer can generate a Go Fiber app via cookiecutter
- Generated project builds and runs successfully
- /hello endpoint returns Hello, World!
- Folder structure follows Go conventions (cmd/, internal/)
- Example usage documented in the repository README

---

## Notes
This template is part of the multi-framework cookiecutter automation initiative.
It ensures a consistent and minimal setup experience across languages and frameworks (e.g., Spring Boot, FastAPI, Fiber).

---

## Quickstart
```bash
cookiecutter gh:your-org/your-repo --directory="cookiecutter-fiber-template"
cd {{cookiecutter.project_slug}}
go run cmd/main.go
```