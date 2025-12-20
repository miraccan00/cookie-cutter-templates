package com.company.platform.hello.api.domain.service;

import com.company.platform.hello.api.domain.model.Greeting;

public interface GreetingService {
    Greeting greet(String name);
}
