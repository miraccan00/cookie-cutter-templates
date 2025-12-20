package com.company.platform.hello.api.application.service;

import com.company.platform.hello.api.domain.model.Greeting;
import com.company.platform.hello.api.domain.service.GreetingService;
import org.springframework.stereotype.Service;

@Service
public class DefaultGreetingService implements GreetingService {

    @Override
    public Greeting greet(String name) {
        return new Greeting(name);
    }
}
