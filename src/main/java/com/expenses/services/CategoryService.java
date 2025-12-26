package com.expenses.services;

import com.expenses.dto.CategoryDTO;
import com.expenses.entities.Category;

import java.util.List;

public interface CategoryService {

    Category saveCategory(CategoryDTO categoryDTO);

    CategoryDTO toDto(Category category);

    List<CategoryDTO> getCategories();

    void deleteCategory(Long id);
}
