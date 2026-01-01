package com.expenses.dto;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

public record ExpenseDTO(
        Long id,
        Long categoryId,
        String categoryDescription,
        @DateTimeFormat(pattern = "yyyy-MM-dd")
        Date date,
        String description,
        String url,
        String orderNumber,
        BigDecimal quantity,
        BigDecimal amount,
        BigDecimal totalAmount
        ) {
}
