-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 19 2023 г., 21:16
-- Версия сервера: 5.6.51
-- Версия PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `NlearnM2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answer_variant`
--

CREATE TABLE `answer_variant` (
  `id` int(11) NOT NULL,
  `answer_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_correct` bit(1) NOT NULL,
  `question_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `mark`
--

CREATE TABLE `mark` (
  `id` int(11) NOT NULL,
  `passing_duration_minutes` int(11) DEFAULT NULL,
  `value` int(11) NOT NULL,
  `test_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `mark_detail`
--

CREATE TABLE `mark_detail` (
  `id` int(11) NOT NULL,
  `mark_id` int(11) DEFAULT NULL,
  `selected_answer_variants_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `number_of_correct_answers` int(11) NOT NULL,
  `question_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_retries` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `test_session_info`
--

CREATE TABLE `test_session_info` (
  `id` int(11) NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `current_test_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `test_users`
--

CREATE TABLE `test_users` (
  `test_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `test_session_info_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answer_variant`
--
ALTER TABLE `answer_variant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4vpoe3ahmrfgxw1dva7k2owsq` (`question_id`);

--
-- Индексы таблицы `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK188cfnbumsqq2yc0wp70ay1y4` (`test_id`),
  ADD KEY `FKlqq420tc6l50pax8so16fane0` (`user_id`);

--
-- Индексы таблицы `mark_detail`
--
ALTER TABLE `mark_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3hlsg9wac2t27w8mm9056vpfx` (`mark_id`),
  ADD KEY `FKnusnfvp2y3g8uvbmo9gmmdebs` (`selected_answer_variants_id`);

--
-- Индексы таблицы `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8hejcpbbiq1qje11346akp3uj` (`test_id`);

--
-- Индексы таблицы `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKri5vnwoi057j5f2a6angur1xp` (`author_id`);

--
-- Индексы таблицы `test_session_info`
--
ALTER TABLE `test_session_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnmd8kg4wp6j2txrlf8syne637` (`current_test_id`);

--
-- Индексы таблицы `test_users`
--
ALTER TABLE `test_users`
  ADD KEY `FK9pd7suc5kgf3uy3esnujnmq02` (`users_id`),
  ADD KEY `FKad5hh6lggcxdmged26xauk5p6` (`test_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfsem155dxiobywccnaa7kf5ms` (`test_session_info_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answer_variant`
--
ALTER TABLE `answer_variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mark`
--
ALTER TABLE `mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mark_detail`
--
ALTER TABLE `mark_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `test_session_info`
--
ALTER TABLE `test_session_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `answer_variant`
--
ALTER TABLE `answer_variant`
  ADD CONSTRAINT `FK4vpoe3ahmrfgxw1dva7k2owsq` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`);

--
-- Ограничения внешнего ключа таблицы `mark`
--
ALTER TABLE `mark`
  ADD CONSTRAINT `FK188cfnbumsqq2yc0wp70ay1y4` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKlqq420tc6l50pax8so16fane0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `mark_detail`
--
ALTER TABLE `mark_detail`
  ADD CONSTRAINT `FK3hlsg9wac2t27w8mm9056vpfx` FOREIGN KEY (`mark_id`) REFERENCES `mark` (`id`),
  ADD CONSTRAINT `FKnusnfvp2y3g8uvbmo9gmmdebs` FOREIGN KEY (`selected_answer_variants_id`) REFERENCES `answer_variant` (`id`);

--
-- Ограничения внешнего ключа таблицы `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK8hejcpbbiq1qje11346akp3uj` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `FKri5vnwoi057j5f2a6angur1xp` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `test_session_info`
--
ALTER TABLE `test_session_info`
  ADD CONSTRAINT `FKnmd8kg4wp6j2txrlf8syne637` FOREIGN KEY (`current_test_id`) REFERENCES `test` (`id`);

--
-- Ограничения внешнего ключа таблицы `test_users`
--
ALTER TABLE `test_users`
  ADD CONSTRAINT `FK9pd7suc5kgf3uy3esnujnmq02` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKad5hh6lggcxdmged26xauk5p6` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKfsem155dxiobywccnaa7kf5ms` FOREIGN KEY (`test_session_info_id`) REFERENCES `test_session_info` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
