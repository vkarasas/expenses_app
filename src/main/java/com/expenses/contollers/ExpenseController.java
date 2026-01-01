package com.expenses.contollers;

import com.expenses.dto.ExpenseDTO;
import com.expenses.entities.Expense;
import com.expenses.services.CategoryService;
import com.expenses.services.ExpenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/expenses")
public class ExpenseController {

    @Autowired
    private ExpenseService expenseService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String getExpenses(Model model) {
        model.addAttribute("expenses", expenseService.getExpenses());

        return "pages/expenses";
    }

    @PostMapping(value = "/save")
    public String saveExpense(@ModelAttribute ExpenseDTO expenseDTO, RedirectAttributes redirectAttributes) {
        Expense expense = expenseService.saveExpense(expenseDTO);

        if(expense != null) {
            redirectAttributes.addFlashAttribute(
                    "successMessage",
                    "Expense saved successfully!"
            );
        }

        return "redirect:/expenses?success";
    }

    @GetMapping(value = "/new")
    public String newExpense(Model model) {
        model.addAttribute("categories", categoryService.getCategories());
        return "pages/expense-new";
    }

    @PostMapping(value = "/delete")
    public String deleteExpense(@RequestParam Long id, RedirectAttributes redirectAttributes) {
        expenseService.deleteExpense(id);

        redirectAttributes.addFlashAttribute(
                "successMessage",
                "Expense deleted successfully!"
        );

        return "redirect:/expenses";
    }
}
