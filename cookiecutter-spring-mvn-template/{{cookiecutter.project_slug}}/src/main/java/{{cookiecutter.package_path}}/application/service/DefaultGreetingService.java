package {{cookiecutter.package_name}}.application.service;

import {{cookiecutter.package_name}}.domain.model.Greeting;
import {{cookiecutter.package_name}}.domain.service.GreetingService;
import org.springframework.stereotype.Service;

@Service
public class DefaultGreetingService implements GreetingService {

    @Override
    public Greeting greet(String name) {
        return new Greeting(name);
    }
}
