package com.expenses.contollers;

import com.expenses.dto.CategoryDTO;
import com.expenses.entities.Category;
import com.expenses.services.CategoryService;
import com.expenses.util.RequestAttributeUtil;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
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
        model.addAttribute("csrf", RequestAttributeUtil.getCsrfToken(request));
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