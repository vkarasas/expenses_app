package com.expenses.repositories;

import com.expenses.entities.Expense;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Date;

@Repository
public interface ExpenseRepository extends JpaRepository<Expense, Long> {

    @Query("""
        SELECT COALESCE(SUM(e.totalAmount), 0)
        FROM Expense e
        WHERE e.date BETWEEN :startDate AND :endDate
    """)
    BigDecimal sumTotalAmountBetweenDates(
            @Param("startDate") Date startDate,
            @Param("endDate") Date endDate
    );
}
