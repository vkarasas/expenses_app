ALTER TABLE `expense` ADD COLUMN `user_id` BIGINT(20) DEFAULT NULL COMMENT 'Reference to user id' AFTER `category_id`;

UPDATE `expense` SET `user_id` = (SELECT `id` FROM `user` WHERE `username` = 'john') WHERE `user_id` IS NULL;

ALTER TABLE `expense` MODIFY COLUMN `user_id` BIGINT(20) NOT NULL COMMENT 'Reference to user id';

ALTER TABLE `expense` ADD CONSTRAINT `FK_expense_user_id` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);