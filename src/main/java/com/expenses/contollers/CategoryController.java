package com.expenses.contollers;

import com.expenses.dto.CategoryDTO;
import com.expenses.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String save(@ModelAttribute CategoryDTO categoryDTO) {
        categoryService.saveCategory(categoryDTO);

        return "redirect:/categories?success";
    }

}