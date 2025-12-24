# {{cookiecutter.project_name}}

{{cookiecutter.description}}

## Quickstart
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

## Docker
Build and run locally:
```bash
docker build -t {{cookiecutter.project_slug}} .
docker run --rm -p 8080:8080 {{cookiecutter.project_slug}}
```