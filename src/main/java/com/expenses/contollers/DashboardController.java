package com.expenses.contollers;

import com.expenses.services.ExpenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;

@Controller
public class DashboardController {

    private final ExpenseService expenseService;

    @Autowired
    public DashboardController(ExpenseService expenseService) {
        this.expenseService = expenseService;
    }

    @GetMapping(value = "/dashboard")
    public String home(Authentication authentication, Model model) {

        if (authentication.getPrincipal() instanceof UserDetails userDetails) {
            model.addAttribute("username", userDetails.getUsername());
        } else if (authentication.getPrincipal() instanceof OAuth2User oauth2User) {
            model.addAttribute("username", oauth2User.getAttribute("name"));
        }

        model.addAttribute(
                "previousMonthTotalAmount",
                expenseService.getTotalAmountOfPreviousMonth()
                        .setScale(2, RoundingMode.HALF_UP));
        model.addAttribute(
                "currentMonthTotalAmount",
                expenseService.getTotalAmountOfCurrentMonth()
                        .setScale(2, RoundingMode.HALF_UP));
        model.addAttribute(
                "nextMonthTotalAmount",
                expenseService.getTotalAmountOfNextMonth()
                        .setScale(2, RoundingMode.HALF_UP));
        model.addAttribute(
                "currentDate",
                LocalDate.now().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.LONG)));

        return "pages/dashboard";
    }
}