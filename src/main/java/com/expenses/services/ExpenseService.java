package com.expenses.services;

import com.expenses.dto.ExpenseDTO;
import com.expenses.entities.Expense;

import java.math.BigDecimal;
import java.util.List;

public interface ExpenseService {

    Expense saveExpense(ExpenseDTO expenseDTO);

    ExpenseDTO toDTO(Expense expense);

    List<ExpenseDTO> getExpenses();

    Expense getById(Long id);

    void deleteExpense(Long id);

    BigDecimal getTotalAmountOfCurrentMonth();

    BigDecimal getTotalAmountOfNextMonth();

    BigDecimal getTotalAmountOfPreviousMonth();
}
