CREATE TABLE `user_role` (
    `id` BIGINT(20) AUTO_INCREMENT,
    `user_id` BIGINT(20) NOT NULL COMMENT 'User id reference key',
    `role_id` BIGINT(20) NOT NULL COMMENT 'Role id reference key',
    PRIMARY KEY (`id`),
    CONSTRAINT `FK_user_role_user_id` FOREIGN KEY (`user_id`) REFERENCES user(`id`),
    CONSTRAINT `FK_user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES role(`id`)
) COMMENT 'Third Table User-Role';