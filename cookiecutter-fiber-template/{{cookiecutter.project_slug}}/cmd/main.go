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