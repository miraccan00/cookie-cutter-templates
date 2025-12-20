package com.company.platform.hello.api.infrastructure.web;

import com.company.platform.hello.api.domain.model.Greeting;
import com.company.platform.hello.api.domain.service.GreetingService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class HelloController {

    private final GreetingService greetingService;

    public HelloController(GreetingService greetingService) {
        this.greetingService = greetingService;
    }

    @GetMapping("/{name}")
    public Greeting hello(@PathVariable String name) {
        return greetingService.greet(name);
    }
}
