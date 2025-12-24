# .NET 8 Web API Cookiecutter Template

## Overview
This cookiecutter template bootstraps a .NET 8 Web API project with a simple greeting endpoint and a lightweight DDD-inspired layout.
It generates a ready-to-run project with tests, Docker support, and a GitHub Actions workflow.

---

## Features
- .NET 8 Web API scaffold with Program.cs and Controllers
- DDD-style separation: Domain, Application, Controllers
- /hello/{name} endpoint returning a JSON greeting (defaults to World)
- xUnit test project using WebApplicationFactory
- Dockerfile and GitHub Actions workflow for Docker builds
- Works out-of-the-box with .NET 8 SDK or higher

---

## Project Structure
```
{{cookiecutter.project_slug}}/
|-- .github/workflows/build-and-publish.yaml
|-- Application/Services/DefaultGreetingService.cs
|-- Controllers/HelloController.cs
|-- Domain/Models/Greeting.cs
|-- Domain/Services/IGreetingService.cs
|-- Properties/launchSettings.json
|-- tests/{{cookiecutter.project_slug}}.Tests/
|   |-- {{cookiecutter.project_slug}}.Tests.csproj
|   `-- HelloControllerTests.cs
|-- {{cookiecutter.project_slug}}.csproj
|-- {{cookiecutter.project_slug}}.sln
|-- appsettings.json
|-- Dockerfile
|-- README.md
`-- .gitignore
```

---

## How It Works
During cookiecutter generation, you'll be prompted for:
- Project name
- Namespace
- Target framework (default: net8.0)

The template scaffolds a .NET Web API project that can be run immediately.

---

## Example Endpoint
```csharp
using Microsoft.AspNetCore.Mvc;
using {{cookiecutter.namespace}}.Domain.Models;
using {{cookiecutter.namespace}}.Domain.Services;

namespace {{cookiecutter.namespace}}.Controllers
{
    [ApiController]
    [Route("hello")]
    public class HelloController : ControllerBase
    {
        private readonly IGreetingService _greetingService;

        public HelloController(IGreetingService greetingService)
        {
            _greetingService = greetingService;
        }

        [HttpGet("{name?}")]
        public ActionResult<Greeting> Get(string? name)
        {
            return _greetingService.Greet(name);
        }
    }
}
```

Program.cs:
```csharp
using {{cookiecutter.namespace}}.Application.Services;
using {{cookiecutter.namespace}}.Domain.Services;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddSingleton<IGreetingService, DefaultGreetingService>();

var app = builder.Build();

app.MapControllers();

app.Run();

public partial class Program { }
```

Run the application:
```bash
dotnet run --project {{cookiecutter.project_slug}}.csproj
```

Then open:
```
http://localhost:5000/hello/Codex
```

Expected response:
```
{"name":"Codex","message":"Hello, Codex!"}
```

---

## Acceptance Criteria
- Developer can generate a .NET Web API app via cookiecutter
- Project runs successfully with dotnet run
- /hello/{name} endpoint returns a JSON greeting
- Folder structure follows .NET conventions (Controllers/, Program.cs)
- Example usage documented in the repository README

---

## Notes
This template is part of the multi-framework cookiecutter automation initiative.
It ensures consistent and quick bootstrapping across supported technologies (e.g., Spring Boot, Fiber, FastAPI, .NET).

---

## Quickstart
```bash
cookiecutter gh:your-org/your-repo --directory="cookiecutter-dotnet-template"
cd {{cookiecutter.project_slug}}
dotnet build {{cookiecutter.project_slug}}.sln
dotnet run --project {{cookiecutter.project_slug}}.csproj
```
