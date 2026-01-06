package com.expenses.services.impl;

import com.expenses.dto.CategoryDTO;
import com.expenses.entities.Category;
import com.expenses.repositories.CategoryRepository;
import com.expenses.services.CategoryService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    private final CategoryRepository categoryRepository;

    @Autowired
    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public Category saveCategory(CategoryDTO categoryDTO) {
        Category category = toEntity(categoryDTO);

        categoryRepository.save(category);
        return category;
    }

    private Category toEntity(CategoryDTO categoryDTO) {
        Category category = new Category();

        BeanUtils.copyProperties(categoryDTO, category);

        return category;
    }

    @Override
    public CategoryDTO toDto(Category category) {
        return new CategoryDTO(
                category.getId(),
                category.getDescription()
        );
    }

    @Override
    public Category getById(Long id) {
        if(id == null) return null;

        return categoryRepository.getReferenceById(id);
    }

    @Override
    public List<CategoryDTO> getCategories() {
        List<Category> categoryList = categoryRepository.findAll();
        List<CategoryDTO> categoryDTOS = new ArrayList<>();
        for(Category category : categoryList) {
            categoryDTOS.add(toDto(category));
        }
        return categoryDTOS;
    }

    @Override
    public void deleteCategory(Long id) {
        if(id == null) return;

        Category category = categoryRepository.getReferenceById(id);

        categoryRepository.delete(category);
    }

}