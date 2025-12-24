using {{cookiecutter.namespace}}.Domain.Models;
using {{cookiecutter.namespace}}.Domain.Services;

namespace {{cookiecutter.namespace}}.Application.Services
{
    public class DefaultGreetingService : IGreetingService
    {
        public Greeting Greet(string? name)
        {
            return new Greeting(name);
        }
    }
}
