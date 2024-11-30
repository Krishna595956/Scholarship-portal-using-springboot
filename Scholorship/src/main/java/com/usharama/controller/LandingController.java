package com.usharama.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LandingController {
    @GetMapping("/")
    public String landingPage() {
        return "index"; // JSP for the landing page
    }
}

