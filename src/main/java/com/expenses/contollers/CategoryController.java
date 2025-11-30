package com.expenses.contollers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class CategoryController {


    @GetMapping("/expenses")
    public String getExpenses(Model model) {
        model.addAttribute("categories", List.of("Super Market", "Water", "Electricity"));
        return "expenses";
    }

}
