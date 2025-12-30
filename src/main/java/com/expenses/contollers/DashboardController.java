package com.expenses.contollers;

import com.expenses.services.ExpenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.RoundingMode;

@Controller
public class DashboardController {

    @Autowired
    private ExpenseService expenseService;

    @GetMapping(value = "/")
    public String home(Model model) {
        model.addAttribute("username", "John Doe");
        model.addAttribute(
                "currentMonthTotalAmount",
                expenseService
                        .getTotalAmountOfCurrentMonth()
                        .setScale(2, RoundingMode.HALF_UP));
        model.addAttribute(
                "nextMonthTotalAmount",
                expenseService
                        .getTotalAmountOfNextMonth()
                        .setScale(2, RoundingMode.HALF_UP));

        return "pages/dashboard";
    }
}