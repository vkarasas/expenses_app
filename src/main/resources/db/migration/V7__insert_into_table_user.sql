-- Password is 'password123' hashed with BCrypt https://bcrypt-generator.com/
INSERT INTO `user` (`username`, `password`, `enabled`)
VALUES ('john', '$2a$20$Wv/c4YLvbik44iQMXEyFh.ezXrhfib.8mM.btRW23ProIdd7W6GCW', true);

INSERT INTO `role` (`name`) VALUES ('ROLE_USER'), ('ROLE_ADMIN');

INSERT INTO `user_role` (`user_id`, `role_id`)
VALUES (
           (SELECT `id` FROM `user` WHERE `username` = 'john'),
           (SELECT `id` FROM `role` WHERE `name` = 'ROLE_USER')
       ),
       (
           (SELECT `id` FROM `user` WHERE `username` = 'john'),
           (SELECT `id` FROM `role` WHERE `name` = 'ROLE_ADMIN')
       );