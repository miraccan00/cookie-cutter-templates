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
