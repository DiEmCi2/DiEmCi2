-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2022 a las 20:05:12
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS `ping`;
CREATE DATABASE `ping`;
USE `ping`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ping2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bill`
--

CREATE TABLE `aboutus` (
  `id` int(11) NOT NULL,
  `text` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `aboutus`
--

INSERT INTO `aboutus` (`id`, `text`) VALUES
(1, 'Somos una marca colombiana especializada en el estampado de camisetas siuu');

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `billStates_id` int(5) NOT NULL,
  `paymentMethod_id` int(11) NOT NULL,
  `subTotal` int(11) NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bill`
--

INSERT INTO `bills` (`id`, `billStates_id`, `paymentMethod_id`,`subTotal` ,`users_id`) VALUES
(1, 1, 1,15000 ,2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `billStates`
--

CREATE TABLE `billStates` (
  `id` int(5) NOT NULL,
  `state` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `billStates`
--

INSERT INTO `billStates` (`id`, `state`) VALUES
(1, 'Por Enviar'),
(2, 'Completado'),
(3, 'Por Entreg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Hombres'),
(2, 'Mujeres'),
(3, 'Niños'),
(4, 'Jovenes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `direction` varchar(100) NOT NULL,
  `bills_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descountsettings`
--

CREATE TABLE `descountSettings` (
  `id` int(11) NOT NULL,
  `descriptionDescount` varchar(45) NOT NULL,
  `descount` float NOT NULL,
  `applyDate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `descountsettings`
--

INSERT INTO `descountSettings` (`id`, `descriptionDescount`, `descount`, `applyDate`) VALUES
(1, 'sin descuento', 0, '0000-00-00'),
(2, 'descuento por frecuencia', 10, '2022-11-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dimensionPrint`
--

CREATE TABLE `dimensionPrint` (
  `id` int(11) NOT NULL,
  `dimension` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dimensionPrint`
--

INSERT INTO `dimensionPrint` (`id`, `dimension`) VALUES
(1, 'Grande'),
(2, 'Mediano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `managementPqrs`
--

CREATE TABLE `managementPqrs` (
  `id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `fechaPqrs` date NOT NULL,
  `state` varchar(1) NOT NULL,
  `typesPqrs_id` int(11) NOT NULL,
  `users_id` bigint(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `managementPqrs`
--

INSERT INTO `managementPqrs` (`id`, `description`, `fechaPqrs`, `state`, `typesPqrs_id`, `users_id`) VALUES
(1, '¿cómo funciona la página web?', '2022-11-02', '1', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordersBase`
--

CREATE TABLE `ordersBase` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `bills_id` int(11) NOT NULL,
  `dimensionPrint_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordersBase`
--

INSERT INTO `ordersBase` (`id`, `quantity`, `bills_id`, `dimensionPrint_id`, `products_id`) VALUES
(1, 2, 1, 1, 1),
(2, 10, 1, 2, 1),
(3, 3, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paymentMethods`
--

CREATE TABLE `paymentMethods` (
  `id` int(11) NOT NULL,
  `method` varchar(60) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paymentMethods`
--

INSERT INTO `paymentMethods` (`id`, `method`) VALUES
(1, 'payPal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_Types` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productCalification`
--

CREATE TABLE `productCalification` (
  `id` int(11) NOT NULL,
  `calification` int(11) DEFAULT NULL,
  `users_id` bigint(20) UNSIGNED DEFAULT NULL,
  `products_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `garanty` int(11) DEFAULT NULL,
  `QuantityAvailable` int(11) DEFAULT NULL,
  `shirtTypes_id` int(11) NOT NULL,
  `shirtSizes_id` int(11) NOT NULL,
  `shirtColors_id` int(11) NOT NULL,
  `typesPrint_id` int(11) NOT NULL,
  `descountSettings_id` int(11) NOT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `garanty`, `QuantityAvailable`, `shirtTypes_id`, `shirtSizes_id`, `shirtColors_id`, `typesPrint_id`, `descountSettings_id`, `categories_id`) VALUES
(1, 'Camisa Roblox', 80000, 'camisa con personaje de roblox', 5, 10, 1, 2, 2, 1, 1, 4),
(2, 'Fiesta Navideña', 32000, 'Estilo navideño y bonitos colores rojos', 3, 20, 2, 1, 3, 4, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shirtColors`
--

CREATE TABLE `shirtColors` (
  `id` int(11) NOT NULL,
  `color` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shirtColors`
--

INSERT INTO `shirtColors` (`id`, `color`) VALUES
(1, 'rojo'),
(2, 'azul'),
(3, 'Violeta'),
(4, 'Verde');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shirtSizes`
--

CREATE TABLE `shirtSizes` (
  `id` int(11) NOT NULL,
  `Sizes` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shirtSizes`
--

INSERT INTO `shirtSizes` (`id`, `Sizes`) VALUES
(1, 'XXL'),
(2, 'M'),
(3, 'L'),
(4, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shirtTypes`
--

CREATE TABLE `shirtTypes` (
  `id` int(11) NOT NULL,
  `Types` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shirtTypes`
--

INSERT INTO `shirtTypes` (`id`, `Types`) VALUES
(1, 'playera'),
(2, 'Camisón'),
(3, 'Blusa'),
(4, 'Sudadera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typesPqrs`
--

CREATE TABLE `typesPqrs` (
  `id` int(11) NOT NULL,
  `typesPqrs` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `typesPqrs`
--

INSERT INTO `typesPqrs` (`id`, `typesPqrs`) VALUES
(1, 'Pregunta'),
(2, 'Queja'),
(3, 'Reclamo'),
(4, 'Sugerencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typesPrint`
--

CREATE TABLE `typesPrint` (
  `id` int(11) NOT NULL,
  `typesPrint` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `typesPrint`
--

INSERT INTO `typesPrint` (`id`, `typesPrint`) VALUES
(1, 'prensada'),
(2, 'forjada'),
(3, 'Tejida'),
(4, 'Plasmada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UICode`
--

CREATE TABLE `UICode` (
  `id` int(11) NOT NULL,
  `file` varchar(200) NOT NULL,
  `roles_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `UICode`
--

INSERT INTO `UICode` (`id`, `file`, `roles_id`) VALUES
(1, 'ieunfiuwenwiupc pqeiufndncuiqerbviajdcnerpbapieucnierbvediu', 1),
(2, 'owijvnpiqeb9upefoifcjeuhntiuerhncifeqhnoifuerhaiofhneldnheiourghfoeihgfnuojdifwrnhuofhnqeipjmqgneonhfmjqpoierhnouaehnfpioqermhiguoehmpiofxherniuocfmjwEOIGCHNOURIEJFOIERHNOUIAEJMPFWNHOFJWIOGNHEWUIFJIPO', 1),
(3, '2eufehwiuebfiuwbediunweifunwiejwqeoediwejfoiwecweufweiucneiufbeiucnwefi weoifhweoifoejweoifhoweneofhjeofhqwiudh2fhwoenp2efn24ufhe98cnweipfnweu9n4mf34', 1),
(4, '9uwehf9hec9uhfuenc2e9fh29x82ef89ehdoqefh9e8xj29u2fhweoijwefwe', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(50) COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birthDate` DATE COLLATE utf8mb4_unicode_ci NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles_id` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastName`, `email`, `email_verified_at`, `phone`, `roles_id`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'María del Pilar', 'Sánchez Gómez Ariza', 'mapisago@píng.com', NULL, '301838193', 1, 'secret2', NULL, '2022-11-02 17:34:23', '2022-11-02 17:34:23'),
(2, 'Fernando', 'Borrero', 'feborrero@ping.com', NULL, '3029392925', 2, 'secret3', NULL, '2022-11-02 17:34:59', '2022-11-02 17:34:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aboutus`
--
ALTER TABLE `aboutus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bill`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paymentMethod_id` (`paymentMethod_id`),
  ADD KEY `users_bills` (`users_id`),
  ADD KEY `billStates_bills` (`billStates_id`);

--
-- Indices de la tabla `billStates`
--
ALTER TABLE `billStates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `delivery`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_id` (`bills_id`);

--
-- Indices de la tabla `descountsettings`
--
ALTER TABLE `descountSettings`
  ADD PRIMARY KEY (`id`,`descount`);

--
-- Indices de la tabla `dimensionPrint`
--
ALTER TABLE `dimensionPrint`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `managementPqrs`
--
ALTER TABLE `managementPqrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `typesPqrs_id` (`typesPqrs_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordersBase`
--
ALTER TABLE `ordersBase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_id` (`bills_id`),
  ADD KEY `dimensionPrint_id` (`dimensionPrint_id`),
  ADD KEY `products_id` (`products_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `paymentmethod`
--
ALTER TABLE `paymentMethods`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_Types_tokenable_id_index` (`tokenable_Types`,`tokenable_id`);

--
-- Indices de la tabla `productCalification`
--
ALTER TABLE `productCalification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `products_id` (`products_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shirtTypes_id` (`shirtTypes_id`),
  ADD KEY `shirtSizes_id` (`shirtSizes_id`),
  ADD KEY `shirtColors_id` (`shirtColors_id`),
  ADD KEY `typesPrint_id` (`typesPrint_id`),
  ADD KEY `descountSettings_products` (`descountSettings_id`),
  ADD KEY `categories_products` (`categories_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shirtColors`
--
ALTER TABLE `shirtColors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shirtSizes`
--
ALTER TABLE `shirtSizes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shirtTypes`
--
ALTER TABLE `shirtTypes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `typesPqrs`
--
ALTER TABLE `typesPqrs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `typesPrint`
--
ALTER TABLE `typesPrint`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `UICode`
--
ALTER TABLE `UICode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_id` (`roles_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `roles_users` (`roles_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bill`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `billStates`
--
ALTER TABLE `billStates`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `delivery`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descountsettings`
--
ALTER TABLE `descountSettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `dimensionPrint`
--
ALTER TABLE `dimensionPrint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `managementPqrs`
--
ALTER TABLE `managementPqrs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ordersBase`
--
ALTER TABLE `ordersBase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `shirtColors`
--
ALTER TABLE `shirtColors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `shirtSizes`
--
ALTER TABLE `shirtSizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `shirtTypes`
--
ALTER TABLE `shirtTypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `typesPrint`
--
ALTER TABLE `typesPrint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bill`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `billStates_bills` FOREIGN KEY (`billStates_id`) REFERENCES `billStates` (`id`),
  ADD CONSTRAINT `paymentMethods_bills` FOREIGN KEY (`paymentMethod_id`) REFERENCES `paymentMethods` (`id`),
  ADD CONSTRAINT `users_bills` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `delivery`
--
ALTER TABLE `deliveries`
ADD CONSTRAINT `bills_deliveries` FOREIGN KEY (`bills_id`) REFERENCES `bills` (`id`);

--
-- Filtros para la tabla `managementPqrs`
--
ALTER TABLE `managementPqrs`
  ADD CONSTRAINT `typesPqrs_magagementPqrs` FOREIGN KEY (`typesPqrs_id`) REFERENCES `typesPqrs` (`id`),
  ADD CONSTRAINT `users_managementPqrs` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ordersBase`
--
ALTER TABLE `ordersBase`
  ADD CONSTRAINT `bills_ordersBase` FOREIGN KEY (`bills_id`) REFERENCES `bills` (`id`),
  ADD CONSTRAINT `dimensionPrint_ordersBase` FOREIGN KEY (`dimensionPrint_id`) REFERENCES `dimensionPrint` (`id`),
  ADD CONSTRAINT `products_ordersBase` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `productCalification`
--
ALTER TABLE `productCalification`
  ADD CONSTRAINT `products_productCalification` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `users_productCalification` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `shirtColors_products` FOREIGN KEY (`shirtColors_id`) REFERENCES `shirtColors` (`id`),
  ADD CONSTRAINT `shirtSizes_products` FOREIGN KEY (`shirtSizes_id`) REFERENCES `shirtSizes` (`id`),
  ADD CONSTRAINT `shirtTypes_products` FOREIGN KEY (`shirtTypes_id`) REFERENCES `shirtTypes` (`id`),
  ADD CONSTRAINT `typesPrint_products` FOREIGN KEY (`typesPrint_id`) REFERENCES `typesPrint` (`id`),
  ADD CONSTRAINT `categories_products` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `descountSettings_products` FOREIGN KEY (`descountSettings_id`) REFERENCES `descountSettings` (`id`);

--
-- Filtros para la tabla `UICode`
--
ALTER TABLE `UICode`
  ADD CONSTRAINT `rol_UICode` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `roles_users` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;