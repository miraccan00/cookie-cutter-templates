package {{cookiecutter.package_name}}.domain.service;

import {{cookiecutter.package_name}}.domain.model.Greeting;

public interface GreetingService {
    Greeting greet(String name);
}
