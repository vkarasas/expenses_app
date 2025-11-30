package com.expenses.entities;

import java.util.Map;

public class Category {
    public static Map<Long, String> NAME = Map.of(1L,"Φαγητό",
            2L, "Σούπερ Μάρκετ",
            3L, "ΕΥΑΘ");

    public static Map<Long, String> getNAME() {
        return NAME;
    }
}
