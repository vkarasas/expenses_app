package com.expenses.services.impl;

import com.expenses.dto.ExpenseDTO;
import com.expenses.entities.Expense;
import com.expenses.repositories.ExpenseRepository;
import com.expenses.services.CategoryService;
import com.expenses.services.ExpenseService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ExpenseServiceImpl implements ExpenseService {

    @Autowired
    private ExpenseRepository expenseRepository;

    @Autowired
    private CategoryService categoryService;

    @Override
    public Expense saveExpense(ExpenseDTO expenseDTO) {
        Expense expense = toEntity(expenseDTO);

        return expenseRepository.save(expense);
    }

    private Expense toEntity(ExpenseDTO expenseDTO) {
        Expense expense = new Expense();

        BeanUtils.copyProperties(expenseDTO, expense);

        expense.setCategory(categoryService.getById(expenseDTO.id()));

        return expense;
    }

    @Override
    public ExpenseDTO toDTO(Expense expense) {
        return new ExpenseDTO(
                expense.getId(),
                expense.getCategory().getId(),
                expense.getCategory().getDescription(),
                expense.getDate(),
                expense.getDescription(),
                expense.getQuantity(),
                expense.getAmount(),
                expense.getTotalAmount()
        );
    }

    @Override
    public List<ExpenseDTO> getExpenses() {
        List<Expense> expenseList = expenseRepository.findAll();
        List<ExpenseDTO> expenseDTOList = new ArrayList<>();
        for(Expense expense: expenseList) {
            expenseDTOList.add(toDTO(expense));
        }

        return expenseDTOList;
    }
}
