package com.expenses.contollers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login(Model model,
                        @RequestParam(required = false) String error,
                        @RequestParam(required = false) String logout) {
        model.addAttribute("error", error);
        model.addAttribute("logout", logout);

        return "pages/login";
    }

    @GetMapping("/access-denied")
    public String showAccessDenied() {

        return "pages/access-denied";
    }
}