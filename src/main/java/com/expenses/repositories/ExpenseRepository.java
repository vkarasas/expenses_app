package com.expenses.repositories;

import com.expenses.entities.Expense;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Repository
public interface ExpenseRepository extends JpaRepository<Expense, Long> {

    @Query("""
        SELECT COALESCE(SUM(e.totalAmount), 0)
        FROM Expense e
        WHERE (e.date BETWEEN :startDate AND :endDate)
        AND e.user.id = :userId
    """)
    BigDecimal sumTotalAmountBetweenDates(
            @Param("startDate") Date startDate,
            @Param("endDate") Date endDate,
            @Param("userId") Long userId
    );

    List<Expense> findAllByUserId(Long userId);
}
