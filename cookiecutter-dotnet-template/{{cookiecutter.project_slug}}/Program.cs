using {{cookiecutter.namespace}}.Application.Services;
using {{cookiecutter.namespace}}.Domain.Services;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddSingleton<IGreetingService, DefaultGreetingService>();

var app = builder.Build();

app.MapControllers();

app.Run();

public partial class Program { }
