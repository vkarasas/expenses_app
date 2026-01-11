ALTER TABLE `user` ADD COLUMN `sub_id` VARCHAR(55) DEFAULT NULL COMMENT 'provider(github, google, etc' AFTER `password`;
ALTER TABLE `user` ADD COLUMN `email` VARCHAR(55) DEFAULT NULL COMMENT 'email' AFTER `sub_id`;
ALTER TABLE `user` ADD COLUMN `provider` VARCHAR(55) DEFAULT NULL COMMENT 'provider(github, google, etc)' AFTER `email`;