-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Апр 05 2021 г., 07:55
-- Версия сервера: 5.7.24-0ubuntu0.16.04.1
-- Версия PHP: 7.3.27-9+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yjvjydch_m2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `airports`
--

CREATE TABLE `airports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iata` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `airports`
--

INSERT INTO `airports` (`id`, `city`, `name`, `iata`, `created_at`, `updated_at`) VALUES
(1, 'Kazan', 'Kazan', 'KZN', NULL, NULL),
(2, 'Moscow', 'Sheremetyevo', 'SVO', NULL, NULL),
(3, 'St Petersburg', 'Pulkovo', 'LED', NULL, NULL),
(4, 'Sochi', 'Sochi', 'AER', NULL, NULL),
(5, 'Saransk', 'Saransk', 'SKX', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flight_from` bigint(20) UNSIGNED NOT NULL,
  `flight_back` bigint(20) UNSIGNED DEFAULT NULL,
  `date_from` date NOT NULL,
  `date_back` date DEFAULT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bookings`
--

INSERT INTO `bookings` (`id`, `flight_from`, `flight_back`, `date_from`, `date_back`, `code`, `created_at`, `updated_at`) VALUES
(2, 1, 2, '2021-02-10', '2021-02-11', '4MGWP', '2021-01-02 13:57:04', '2021-01-02 13:57:04'),
(3, 1, 2, '2021-02-10', '2021-02-11', 'VXLEI', '2021-01-02 14:00:56', '2021-01-02 14:00:56'),
(4, 1, 2, '2021-02-10', '2021-02-11', 'QCYBC', '2021-01-02 14:00:59', '2021-01-02 14:00:59'),
(5, 1, 2, '2021-02-10', '2021-02-11', 'Z2AN7', '2021-01-02 14:03:59', '2021-01-02 14:03:59'),
(6, 1, 2, '2021-02-10', '2021-02-11', 'HS5Y1', '2021-01-02 14:07:42', '2021-01-02 14:07:42'),
(7, 1, 2, '2021-02-10', '2021-02-11', '0SWHW', '2021-01-04 09:30:00', '2021-01-04 09:30:00');

-- --------------------------------------------------------

--
-- Структура таблицы `flights`
--

CREATE TABLE `flights` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flight_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) UNSIGNED NOT NULL,
  `to_id` bigint(20) UNSIGNED NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `cost` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `flights`
--

INSERT INTO `flights` (`id`, `flight_code`, `from_id`, `to_id`, `time_from`, `time_to`, `cost`, `created_at`, `updated_at`) VALUES
(1, 'FP2100', 2, 1, '08:35:00', '10:05:00', 10500, NULL, NULL),
(2, 'FP1200', 1, 2, '12:00:00', '13:35:00', 9500, NULL, NULL),
(3, 'FP2300', 2, 3, '07:05:00', '08:20:00', 4500, NULL, NULL),
(4, 'FP3200', 3, 2, '11:35:00', '12:50:00', 5500, NULL, NULL),
(5, 'FP2400', 2, 4, '10:00:00', '11:20:00', 3500, NULL, NULL),
(6, 'FP4200', 4, 2, '13:00:00', '14:20:00', 4500, NULL, NULL),
(7, 'FP3100', 3, 1, '15:00:00', '16:50:00', 7000, NULL, NULL),
(8, 'FP1300', 1, 3, '18:30:00', '20:10:00', 7500, NULL, NULL),
(9, 'FP3400', 3, 4, '18:00:00', '20:10:00', 10450, NULL, NULL),
(10, 'FP4300', 4, 3, '21:30:00', '23:10:00', 12050, NULL, NULL),
(11, 'FP1400', 1, 4, '14:30:00', '16:30:00', 15050, NULL, NULL),
(12, 'FP1400', 1, 4, '17:30:00', '19:30:00', 14050, NULL, NULL),
(13, 'FP2101', 2, 1, '12:10:00', '13:35:00', 12500, NULL, NULL),
(14, 'FP1201', 1, 2, '08:45:00', '10:05:00', 10500, NULL, NULL),
(15, 'FP2301', 2, 3, '11:45:00', '12:50:00', 5000, NULL, NULL),
(16, 'FP3201', 3, 2, '07:15:00', '08:20:00', 6000, NULL, NULL),
(17, 'FP2401', 2, 4, '13:10:00', '14:20:00', 2500, NULL, NULL),
(18, 'FP4201', 4, 2, '10:10:00', '11:20:00', 3500, NULL, NULL),
(19, 'FP3101', 3, 1, '18:40:00', '20:10:00', 7500, NULL, NULL),
(20, 'FP1301', 1, 3, '15:10:00', '16:50:00', 6500, NULL, NULL),
(21, 'FP3401', 3, 4, '21:40:00', '23:10:00', 9450, NULL, NULL),
(22, 'FP4301', 4, 3, '18:10:00', '20:10:00', 13050, NULL, NULL),
(23, 'FP1401', 1, 4, '17:40:00', '19:30:00', 13050, NULL, NULL),
(24, 'FP1401', 1, 4, '14:40:00', '16:30:00', 12050, NULL, NULL),
(25, 'FP8000', 5, 2, '17:25:00', '19:10:00', 9500, NULL, NULL),
(26, 'FP8001', 5, 2, '08:35:00', '10:05:00', 10500, NULL, NULL),
(27, 'FP9000', 2, 5, '08:35:00', '10:05:00', 10500, NULL, NULL),
(28, 'FP9001', 2, 5, '12:00:00', '13:35:00', 12500, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `passengers`
--

CREATE TABLE `passengers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `document_number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_from` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place_back` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `passengers`
--

INSERT INTO `passengers` (`id`, `booking_id`, `first_name`, `last_name`, `birth_date`, `document_number`, `place_from`, `place_back`, `created_at`, `updated_at`) VALUES
(3, 5, 'TestCase1_first_name', 'TestCase1_last_name', '1990-02-20', '7788223311', NULL, NULL, '2021-01-02 14:03:59', '2021-01-02 14:03:59'),
(4, 5, 'TestCase2_first_name', 'TestCase2_last_name', '1992-09-22', '9922335577', NULL, NULL, '2021-01-02 14:03:59', '2021-01-02 14:03:59'),
(5, 6, 'TestCase1_first_name', 'TestCase1_last_name', '1990-02-20', '7788223311', NULL, NULL, '2021-01-02 14:07:42', '2021-01-02 14:07:42'),
(6, 6, 'TestCase2_first_name', 'TestCase2_last_name', '1992-09-22', '9922335577', NULL, NULL, '2021-01-02 14:07:42', '2021-01-02 14:07:42'),
(7, 7, 'TestCase1_first_name', 'TestCase1_last_name', '1990-02-20', '7788223311', NULL, NULL, '2021-01-04 09:30:00', '2021-01-04 09:30:00'),
(8, 7, 'TestCase2_first_name', 'TestCase2_last_name', '1992-09-22', '9922335577', NULL, NULL, '2021-01-04 09:30:00', '2021-01-04 09:30:00');

-- --------------------------------------------------------

--
-- Структура таблицы `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `password`, `document_number`, `api_token`, `created_at`, `updated_at`) VALUES
(2, 'TestCase1_first_name', 'TestCase1_last_name', '89001238833', 'password', '7788223311', 'rQdwhjLWl6yrFFOg', '2021-01-01 15:14:01', '2021-01-05 12:10:49');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_flight_from_foreign` (`flight_from`),
  ADD KEY `bookings_flight_back_foreign` (`flight_back`);

--
-- Индексы таблицы `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flights_from_id_foreign` (`from_id`),
  ADD KEY `flights_to_id_foreign` (`to_id`);

--
-- Индексы таблицы `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passengers_booking_id_foreign` (`booking_id`);

--
-- Индексы таблицы `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `airports`
--
ALTER TABLE `airports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `flights`
--
ALTER TABLE `flights`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT для таблицы `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_flight_back_foreign` FOREIGN KEY (`flight_back`) REFERENCES `flights` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_flight_from_foreign` FOREIGN KEY (`flight_from`) REFERENCES `flights` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_from_id_foreign` FOREIGN KEY (`from_id`) REFERENCES `airports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flights_to_id_foreign` FOREIGN KEY (`to_id`) REFERENCES `airports` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;