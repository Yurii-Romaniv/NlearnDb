SET
SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET
time_zone = "+00:00";

CREATE TABLE `answer_variant`
(
    `id`          int(11) NOT NULL,
    `answer_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `is_correct`  bit(1) NOT NULL,
    `question_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `answer_variant` (`id`, `answer_text`, `is_correct`, `question_id`)
VALUES (1, '4', b'1', 1),
       (2, '465', b'0', 1),
       (3, '8686', b'0', 1),
       (4, '686', b'0', 2),
       (5, '8686', b'0', 2),
       (6, '0', b'1', 2),
       (7, '2', b'1', 3),
       (8, '4-2', b'1', 3),
       (9, '54', b'0', 3),
       (10, '0', b'1', 4),
       (11, '3', b'0', 4),
       (12, 'дата база', b'0', 5),
       (13, 'база даних', b'1', 5),
       (14, 'основа дати', b'0', 5),
       (15, 'оцінка', b'1', 6),
       (16, 'порушення', b'0', 6),
       (17, 'поломка', b'0', 6),
       (18, 'bugg', b'0', 7),
       (19, 'bag', b'0', 7),
       (20, 'bagg', b'0', 7),
       (21, 'bug', b'1', 7),
       (22, '15', b'0', 8),
       (23, '150', b'1', 8),
       (24, '250', b'0', 8),
       (25, '16', b'1', 9),
       (26, '19', b'0', 9),
       (27, '17', b'0', 9),
       (28, '200', b'0', 10),
       (29, '100', b'1', 10),
       (30, '99', b'0', 10),
       (31, '99+1', b'1', 10),
       (32, '1000', b'0', 10),
       (33, '200-100', b'1', 10),
       (34, '120', b'1', 11),
       (35, '60', b'0', 11),
       (36, '5!', b'1', 11),
       (37, '240/2', b'1', 11),
       (38, '140', b'0', 11),
       (39, 'correct response', b'1', 12),
       (40, 'incorrect', b'0', 12),
       (41, 'also correct', b'1', 12),
       (42, 'incorrect', b'0', 13),
       (43, 'correct', b'1', 13),
       (44, 'also correct', b'1', 13),
       (45, 'also correct', b'1', 13),
       (46, 'correct', b'1', 14),
       (47, 'incorrect', b'0', 14),
       (48, 'incorrect', b'0', 14),
       (49, 'incorrect', b'0', 15),
       (50, 'correct', b'1', 15),
       (51, '3', b'0', 16),
       (52, '2', b'1', 16),
       (53, '1', b'0', 16),
       (54, '6', b'1', 17),
       (55, '7', b'0', 17),
       (56, '8', b'0', 17),
       (57, '9', b'0', 17),
       (58, '8', b'0', 18),
       (59, '9', b'1', 18),
       (60, '12', b'0', 18),
       (61, '6+3', b'1', 18);

CREATE TABLE `group_user`
(
    `students_group_id` int(11) NOT NULL,
    `user_id`           int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `group_user` (`students_group_id`, `user_id`)
VALUES (1, 37),
       (4, 37),
       (1, 38),
       (8, 38),
       (1, 39),
       (1, 40),
       (10, 40),
       (1, 42);

CREATE TABLE `mark`
(
    `id`                       int(11) NOT NULL,
    `passing_duration_minutes` int(11) DEFAULT NULL,
    `value`                    int(11) NOT NULL,
    `test_id`                  int(11) DEFAULT NULL,
    `user_id`                  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `mark` (`id`, `passing_duration_minutes`, `value`, `test_id`, `user_id`)
VALUES (1, 1, 100, 1, 37),
       (2, 8, 50, 1, 37),
       (3, 3, 66, 2, 37),
       (4, 1, 33, 2, 37),
       (5, 10, 0, 2, 37),
       (6, 5, 66, 2, 37),
       (7, 2, 0, 3, 38),
       (8, 3, 66, 3, 38),
       (9, 7, 100, 3, 38),
       (10, 8, 0, 1, 39),
       (11, 4, 100, 1, 39),
       (12, 1, 0, 1, 39),
       (13, 9, 100, 1, 39),
       (14, 6, 75, 4, 39),
       (15, 7, 100, 4, 39),
       (16, 1, 75, 4, 39),
       (17, 1, 57, 5, 40),
       (18, 1, 75, 4, 40),
       (19, 4, 100, 1, 40),
       (20, 1, 100, 5, 40),
       (21, 1, 0, 1, 39),
       (22, 1, 0, 1, 39),
       (23, 1, 100, 1, 39),
       (24, 1, 50, 1, 39);

CREATE TABLE `mark_detail`
(
    `id`                         int(11) NOT NULL,
    `selected_answer_variant_id` int(11) DEFAULT NULL,
    `mark_id`                    int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `mark_detail` (`id`, `selected_answer_variant_id`, `mark_id`)
VALUES (1, 1, 1),
       (2, 6, 1),
       (3, 1, 2),
       (4, 7, 3),
       (5, 10, 3),
       (6, 7, 4),
       (7, 9, 4),
       (8, 10, 4),
       (9, 7, 5),
       (10, 11, 5),
       (11, 7, 6),
       (12, 10, 6),
       (13, 13, 7),
       (14, 15, 7),
       (15, 18, 7),
       (16, 19, 7),
       (17, 20, 7),
       (18, 21, 7),
       (19, 13, 8),
       (20, 15, 8),
       (21, 18, 8),
       (22, 21, 8),
       (23, 13, 9),
       (24, 15, 9),
       (25, 21, 9),
       (26, 1, 10),
       (27, 5, 10),
       (28, 1, 11),
       (29, 6, 11),
       (30, 2, 12),
       (31, 6, 12),
       (32, 1, 13),
       (33, 6, 13),
       (34, 23, 14),
       (35, 25, 14),
       (36, 26, 14),
       (37, 29, 14),
       (38, 31, 14),
       (39, 33, 14),
       (40, 34, 14),
       (41, 36, 14),
       (42, 23, 15),
       (43, 25, 15),
       (44, 29, 15),
       (45, 31, 15),
       (46, 33, 15),
       (47, 34, 15),
       (48, 36, 15),
       (49, 37, 15),
       (50, 24, 16),
       (51, 25, 16),
       (52, 29, 16),
       (53, 31, 16),
       (54, 33, 16),
       (55, 34, 16),
       (56, 36, 16),
       (57, 37, 16),
       (58, 39, 17),
       (59, 42, 17),
       (60, 44, 17),
       (61, 45, 17),
       (62, 46, 17),
       (63, 50, 17),
       (64, 23, 18),
       (65, 25, 18),
       (66, 29, 18),
       (67, 34, 18),
       (68, 36, 18),
       (69, 37, 18),
       (70, 1, 19),
       (71, 6, 19),
       (72, 39, 20),
       (73, 41, 20),
       (74, 43, 20),
       (75, 44, 20),
       (76, 45, 20),
       (77, 46, 20),
       (78, 50, 20),
       (79, 2, 21),
       (80, 5, 21),
       (81, 1, 22),
       (82, 5, 22),
       (83, 1, 23),
       (84, 6, 23),
       (85, 1, 24);

CREATE TABLE `question`
(
    `id`            int(11) NOT NULL,
    `question_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `test_id`       int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `question` (`id`, `question_text`, `test_id`)
VALUES (1, '2+2', 1),
       (2, '3-3', 1),
       (3, '1+1', 2),
       (4, '1-1', 2),
       (5, 'translate \"data base\"', 3),
       (6, 'translate \"valuation\"', 3),
       (7, 'translate \"баг\"', 3),
       (8, '30*5', 4),
       (9, '4*4', 4),
       (10, '10*10', 4),
       (11, '12*10', 4),
       (12, 'some question', 5),
       (13, 'another question', 5),
       (14, 'another question 2', 5),
       (15, 'another question 3', 5),
       (16, '1+1', 6),
       (17, '2+2+2', 6),
       (18, '3*3', 6);

CREATE TABLE `students_group`
(
    `id`   int(11) NOT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `students_group` (`id`, `name`)
VALUES (1, 'ipz'),
       (4, 'ipz-11'),
       (5, 'kn-12'),
       (8, 'kn-11'),
       (10, 'kn-13');

CREATE TABLE `test`
(
    `id`                int(11) NOT NULL,
    `duration`          int(11) NOT NULL,
    `end_time`          datetime                                DEFAULT NULL,
    `name`              varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `number_of_retries` int(11) NOT NULL,
    `author_id`         int(11) DEFAULT NULL,
    `students_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `test` (`id`, `duration`, `end_time`, `name`, `number_of_retries`, `author_id`, `students_group_id`)
VALUES (1, 15, '2024-02-26 01:32:00', 'math', 10, 1, 1),
       (2, 12, '2024-03-28 01:33:00', 'math 2', 8, 1, 4),
       (3, 15, '2024-03-26 03:38:00', 'English test', 5, 1, 8),
       (4, 10, '2023-12-31 03:44:00', 'Multiplication test', 3, 1, 1),
       (5, 10, '2023-12-31 04:11:00', 'some test for kn-13', 2, 1, 10),
       (6, 12, '2023-12-29 04:18:00', 'Arithmetic test', 1, 41, 10);

CREATE TABLE `test_session_info`
(
    `id`              int(11) NOT NULL,
    `end_time`        datetime DEFAULT NULL,
    `is_active`       bit(1) NOT NULL,
    `current_test_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `test_session_info` (`id`, `end_time`, `is_active`, `current_test_id`)
VALUES (2, '2023-12-26 03:17:48', b'0', 2),
       (3, '2023-12-26 04:06:59', b'0', 3),
       (4, '2024-01-01 02:47:43', b'0', 1),
       (5, '2023-12-26 04:26:55', b'0', 5);

CREATE TABLE `user`
(
    `id`                   int(11) NOT NULL,
    `email`                varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `name`                 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `role`                 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `test_session_info_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `user` (`id`, `email`, `name`, `role`, `test_session_info_id`)
VALUES (1, 'arderchinsky@gmail.com', 'admin', 'ADMIN', NULL),
       (37, 'john@pnu.edu.ua', 'John Black', 'STUDENT', 2),
       (38, 'vasya@pnu.edu.ua', 'Vasya Pupkovich', 'STUDENT', 3),
       (39, 'yurii.romaniv.22@pnu.edu.ua', 'Richard Snow', 'STUDENT', 4),
       (40, 'andry@pnu.edu.ua', 'Andry Bondar', 'STUDENT', 5),
       (41, 'yu2@pnu.edu.ua', 'Bob Smith', 'TEACHER', NULL),
       (42, 'elena@pnu.edu.ua', 'Elena White', 'TEACHER', NULL),
       (43, 'stepan@pnu.edu.ua', 'Stepan Potter', 'TEACHER', NULL);


ALTER TABLE `answer_variant`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK4vpoe3ahmrfgxw1dva7k2owsq` (`question_id`);

ALTER TABLE `group_user`
    ADD PRIMARY KEY (`students_group_id`, `user_id`),
  ADD KEY `FK6u7jb50qa69gr3505uttxm86x` (`user_id`);

ALTER TABLE `mark`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK188cfnbumsqq2yc0wp70ay1y4` (`test_id`),
  ADD KEY `FKlqq420tc6l50pax8so16fane0` (`user_id`);

ALTER TABLE `mark_detail`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK2lmayymlf0kjk9ebubhwwbxod` (`selected_answer_variant_id`),
  ADD KEY `FK3hlsg9wac2t27w8mm9056vpfx` (`mark_id`);

ALTER TABLE `question`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FK8hejcpbbiq1qje11346akp3uj` (`test_id`);

ALTER TABLE `students_group`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `test`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKri5vnwoi057j5f2a6angur1xp` (`author_id`),
  ADD KEY `FK6ku0wnkif8l2tuscctmgto7wc` (`students_group_id`);

ALTER TABLE `test_session_info`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKnmd8kg4wp6j2txrlf8syne637` (`current_test_id`);

ALTER TABLE `user`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKfsem155dxiobywccnaa7kf5ms` (`test_session_info_id`);


ALTER TABLE `answer_variant`
    MODIFY `id` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

ALTER TABLE `mark`
    MODIFY `id` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

ALTER TABLE `mark_detail`
    MODIFY `id` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

ALTER TABLE `question`
    MODIFY `id` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

ALTER TABLE `students_group`
    MODIFY `id` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `test`
    MODIFY `id` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `test_session_info`
    MODIFY `id` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `user`
    MODIFY `id` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;


ALTER TABLE `answer_variant`
    ADD CONSTRAINT `FK4vpoe3ahmrfgxw1dva7k2owsq` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE;

ALTER TABLE `group_user`
    ADD CONSTRAINT `FK5iakvdytna6798ls48bex8350` FOREIGN KEY (`students_group_id`) REFERENCES `students_group` (`id`),
  ADD CONSTRAINT `FK6u7jb50qa69gr3505uttxm86x` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `mark`
    ADD CONSTRAINT `FK188cfnbumsqq2yc0wp70ay1y4` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKlqq420tc6l50pax8so16fane0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON
DELETE
CASCADE;

ALTER TABLE `mark_detail`
    ADD CONSTRAINT `FK2lmayymlf0kjk9ebubhwwbxod` FOREIGN KEY (`selected_answer_variant_id`) REFERENCES `answer_variant` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK3hlsg9wac2t27w8mm9056vpfx` FOREIGN KEY (`mark_id`) REFERENCES `mark` (`id`) ON
DELETE
CASCADE;

ALTER TABLE `question`
    ADD CONSTRAINT `FK8hejcpbbiq1qje11346akp3uj` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE;

ALTER TABLE `test`
    ADD CONSTRAINT `FK6ku0wnkif8l2tuscctmgto7wc` FOREIGN KEY (`students_group_id`) REFERENCES `students_group` (`id`),
  ADD CONSTRAINT `FKri5vnwoi057j5f2a6angur1xp` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

ALTER TABLE `test_session_info`
    ADD CONSTRAINT `FKnmd8kg4wp6j2txrlf8syne637` FOREIGN KEY (`current_test_id`) REFERENCES `test` (`id`) ON DELETE SET NULL;

ALTER TABLE `user`
    ADD CONSTRAINT `FKfsem155dxiobywccnaa7kf5ms` FOREIGN KEY (`test_session_info_id`) REFERENCES `test_session_info` (`id`);
COMMIT;