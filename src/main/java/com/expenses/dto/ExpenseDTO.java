package com.expenses.dto;

import java.math.BigDecimal;
import java.util.Date;

public record ExpenseDTO(
        Long id,
        Long categoryId,
        String categoryDescription,
        Date date,
        String description,
        BigDecimal quantity,
        BigDecimal amount,
        BigDecimal totalAmount
        ) {
}
