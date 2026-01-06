package com.expenses.contollers;

import com.expenses.services.ExpenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.RoundingMode;
import java.security.Principal;
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

    @GetMapping(value = "/")
    public String home(Principal principal, Model model) {
        model.addAttribute("username", principal.getName());
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