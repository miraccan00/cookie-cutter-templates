package {{cookiecutter.package_name}}.domain.model;

public class Greeting {
    private String name;

    public Greeting() {
    }

    public Greeting(String name) {
        setName(name);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = normalizeName(name);
    }

    public String getMessage() {
        return "Hello, " + normalizeName(name) + "!";
    }

    private String normalizeName(String candidate) {
        return (candidate == null || candidate.isBlank()) ? "World" : candidate.trim();
    }
}
