package com.expenses.contollers;

import com.expenses.util.RequestAttributeUtil;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login(HttpServletRequest request,
                        Model model,
                        @RequestParam(required = false) String error,
                        @RequestParam(required = false) String logout) {
        model.addAttribute("csrf", RequestAttributeUtil.getCsrfToken(request));
        model.addAttribute("error", error);
        model.addAttribute("logout", logout);

        return "pages/login";
    }

    @GetMapping("/access-denied")
    public String showAccessDenied() {

        return "pages/access-denied";
    }
}