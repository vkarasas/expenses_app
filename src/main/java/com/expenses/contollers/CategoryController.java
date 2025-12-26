package com.expenses.contollers;

import com.expenses.dto.CategoryDTO;
import com.expenses.entities.Category;
import com.expenses.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/categories")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String getExpenses(Model model) {
        model.addAttribute("categories", categoryService.getCategories());
        return "pages/categories";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute CategoryDTO categoryDTO, RedirectAttributes redirectAttributes) {
        Category category = categoryService.saveCategory(categoryDTO);

        if(category != null) {
            redirectAttributes.addFlashAttribute(
                    "successMessage",
                    "Category saved successfully!"
            );
        }

        return "redirect:/categories?success";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam Long id, RedirectAttributes redirectAttributes) {
        categoryService.deleteCategory(id);

        redirectAttributes.addFlashAttribute(
                "successMessage",
                "Category has been deleted successfully!"
                );

        return "redirect:/categories";
    }

}