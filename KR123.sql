-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 16 2025 г., 3:38
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `KR123`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Coef_mat_model`
--

CREATE TABLE `Coef_mat_model` (
  `id` int NOT NULL,
  `conditional_designation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Coef_mat_model`
--

INSERT INTO `Coef_mat_model` (`id`, `conditional_designation`) VALUES
(3, 'Температура начала изменения цвета материала (Td)'),
(4, 'Энергия активации процесса термической деструкции материала (Ed)'),
(5, 'Время, соответствующее началу изменения цвета материала (τd)');

-- --------------------------------------------------------

--
-- Структура таблицы `Polimer_materials`
--

CREATE TABLE `Polimer_materials` (
  `id` int NOT NULL,
  `type_mat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Polimer_materials`
--

INSERT INTO `Polimer_materials` (`id`, `type_mat`) VALUES
(1, 'Поливинилхлорид'),
(14, 'Полиметилметакрилат');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `login` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(72) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `is_admin`) VALUES
(1, '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 0),
(30, 'admin', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 1),
(32, '2', 'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35', 1),
(33, '12', '6b51d431df5d7f141cbececcf79edf3dd861c3b4069f0b11661a3eefacbba918', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `Values_coef_model`
--

CREATE TABLE `Values_coef_model` (
  `polimer_mat_id` int NOT NULL,
  `coef_mat_model_id` int NOT NULL,
  `values_coef` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Values_coef_model`
--

INSERT INTO `Values_coef_model` (`polimer_mat_id`, `coef_mat_model_id`, `values_coef`) VALUES
(1, 3, 190),
(1, 4, 79000),
(1, 5, 10),
(14, 3, 200),
(14, 4, 80000),
(14, 5, 12);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Coef_mat_model`
--
ALTER TABLE `Coef_mat_model`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Polimer_materials`
--
ALTER TABLE `Polimer_materials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Values_coef_model`
--
ALTER TABLE `Values_coef_model`
  ADD UNIQUE KEY `polimer_mat_id_2` (`polimer_mat_id`,`coef_mat_model_id`),
  ADD KEY `coef_mat_model_id` (`coef_mat_model_id`),
  ADD KEY `polimer_mat_id` (`polimer_mat_id`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Coef_mat_model`
--
ALTER TABLE `Coef_mat_model`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Polimer_materials`
--
ALTER TABLE `Polimer_materials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Values_coef_model`
--
ALTER TABLE `Values_coef_model`
  ADD CONSTRAINT `values_coef_model_ibfk_1` FOREIGN KEY (`coef_mat_model_id`) REFERENCES `Coef_mat_model` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `values_coef_model_ibfk_2` FOREIGN KEY (`polimer_mat_id`) REFERENCES `Polimer_materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
