package com.expenses.services.impl;

import com.expenses.dto.ExpenseDTO;
import com.expenses.entities.Expense;
import com.expenses.repositories.ExpenseRepository;
import com.expenses.services.CategoryService;
import com.expenses.services.ExpenseService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

        expense.setCategory(categoryService.getById(expenseDTO.categoryId()));

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
                expense.getUrl(),
                expense.getOrderNumber(),
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

    @Override
    public Expense getById(Long id) {
        if(id == null) return null;

        return expenseRepository.getReferenceById(id);
    }

    @Override
    public void deleteExpense(Long id) {
        if(id == null) return;

        Expense expense = getById(id);

        if(expense == null) return;

        expenseRepository.delete(expense);
    }

    @Override
    public BigDecimal getTotalAmountOfCurrentMonth() {
        Calendar cal = Calendar.getInstance();

        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        Date startDate = cal.getTime();

        cal.add(Calendar.MONTH, 1);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.add(Calendar.MILLISECOND, -1);
        Date endDate = cal.getTime();

        return expenseRepository.sumTotalAmountBetweenDates(startDate, endDate);
    }

    @Override
    public BigDecimal getTotalAmountOfNextMonth() {
        Calendar cal = Calendar.getInstance();

        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.add(Calendar.MONTH, 1);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        Date startDate = cal.getTime();

        cal.add(Calendar.MONTH, 1);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.add(Calendar.MILLISECOND, -1);
        Date endDate = cal.getTime();

        return expenseRepository.sumTotalAmountBetweenDates(startDate, endDate);
    }
}
