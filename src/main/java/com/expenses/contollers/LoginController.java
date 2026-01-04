package com.expenses.contollers;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login(HttpServletRequest request, Model model) {
        CsrfToken csrf = (CsrfToken) request.getAttribute(CsrfToken.class.getName());
        model.addAttribute("csrf", csrf);

        return "pages/login";
    }

    @GetMapping("/access-denied")
    public String showAccessDenied() {

        return "pages/access-denied";
    }
}