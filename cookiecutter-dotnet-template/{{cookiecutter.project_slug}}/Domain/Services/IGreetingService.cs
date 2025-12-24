using {{cookiecutter.namespace}}.Domain.Models;

namespace {{cookiecutter.namespace}}.Domain.Services
{
    public interface IGreetingService
    {
        Greeting Greet(string? name);
    }
}
