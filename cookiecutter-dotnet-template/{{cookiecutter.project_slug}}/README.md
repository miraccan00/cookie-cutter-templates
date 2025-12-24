# {{cookiecutter.project_slug}}

.NET 8 Web API starter generated via cookiecutter with a lightweight DDD-inspired layout.

## Quickstart
- Build: `dotnet build {{cookiecutter.project_slug}}.sln`
- Run: `dotnet run --project {{cookiecutter.project_slug}}.csproj`
- Test: `dotnet test {{cookiecutter.project_slug}}.sln`
- Endpoint: `GET http://localhost:5000/hello/{name}` -> `{"name":"{name}","message":"Hello, {name}!"}`

## Structure
- `Domain` (model + ports): `Greeting`, `IGreetingService`
- `Application` (use cases): `DefaultGreetingService`
- `Controllers` (web adapters): `HelloController`

## Requirements
- .NET SDK {{cookiecutter.target_framework}} or later
