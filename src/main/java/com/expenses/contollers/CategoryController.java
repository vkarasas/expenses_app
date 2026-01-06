package com.expenses.contollers;

import com.expenses.dto.CategoryDTO;
import com.expenses.entities.Category;
import com.expenses.services.CategoryService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/categories")
public class CategoryController {

    private final CategoryService categoryService;

    @Autowired
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping
    public String getExpenses(HttpServletRequest request, Model model) {
        model.addAttribute("categories", categoryService.getCategories());
        CsrfToken csrf = (CsrfToken) request.getAttribute(CsrfToken.class.getName());
        model.addAttribute("csrf", csrf);
        return "pages/categories";
    }

    @PostMapping(value = "/save")
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

    @PostMapping(value = "/delete")
    public String delete(@RequestParam Long id, RedirectAttributes redirectAttributes) {
        categoryService.deleteCategory(id);
        redirectAttributes.addFlashAttribute(
                "successMessage",
                "Category has been deleted successfully!"
                );

        return "redirect:/categories";
    }
}