package com.usharama.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExampleController {
	@GetMapping("/example")
    public String example(Model model) {
        model.addAttribute("message", "Hello, JSP!");
        return "example"; // Maps to /WEB-INF/views/example.jsp
    }
}
