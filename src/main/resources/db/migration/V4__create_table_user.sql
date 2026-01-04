CREATE TABLE `user` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(50) NOT NULL COMMENT 'Username',
    `password` CHAR(80) NOT NULL COMMENT 'Password Encrypted',
    `enabled` TINYINT NOT NULL COMMENT 'Is User Active',
    PRIMARY KEY (`id`)
) COMMENT 'Users Table';