using System.Net.Http.Json;
using Microsoft.AspNetCore.Mvc.Testing;
using Xunit;

namespace {{cookiecutter.namespace}}.Tests
{
    public class HelloControllerTests : IClassFixture<WebApplicationFactory<Program>>
    {
        private readonly HttpClient _client;

        public HelloControllerTests(WebApplicationFactory<Program> factory)
        {
            _client = factory.CreateClient();
        }

        [Fact]
        public async Task HelloEndpointReturnsGreetingForName()
        {
            var response = await _client.GetFromJsonAsync<GreetingResponse>("/hello/Codex");

            Assert.NotNull(response);
            Assert.Equal("Codex", response!.Name);
            Assert.Equal("Hello, Codex!", response.Message);
        }

        private sealed class GreetingResponse
        {
            public string? Name { get; set; }
            public string? Message { get; set; }
        }
    }
}
