namespace {{cookiecutter.namespace}}.Domain.Models
{
    public class Greeting
    {
        public string Name { get; }

        public string Message => $"Hello, {Name}!";

        public Greeting(string? name)
        {
            Name = NormalizeName(name);
        }

        private static string NormalizeName(string? candidate)
        {
            return string.IsNullOrWhiteSpace(candidate) ? "World" : candidate.Trim();
        }
    }
}
