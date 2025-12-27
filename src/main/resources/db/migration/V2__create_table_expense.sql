CREATE TABLE `expense` (
    `id` BIGINT(20) AUTO_INCREMENT,
    `category_id` BIGINT(20) NOT NULL COMMENT 'Category id reference key',
    `date` DATETIME NOT NULL COMMENT 'Datetime of expense',
    `description` VARCHAR(250) DEFAULT NULL COMMENT 'Description',
    `quantity` DECIMAL(16, 4) DEFAULT 1 COMMENT 'Quantity of expense',
    `amount` DECIMAL(16, 4) DEFAULT 0 COMMENT 'Amount of expense',
    `total_amount` DECIMAL(16, 4) DEFAULT 0 COMMENT 'Total Amount of expense',
    PRIMARY KEY (`id`),
    CONSTRAINT `FK_expense_category_id` FOREIGN KEY (`category_id`) REFERENCES category(`id`)
) COMMENT 'Expense Table';