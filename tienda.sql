-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS `gestion_tienda`;

-- Seleccionar la base de datos
USE `gestion_tienda`;

-- Crear la tabla `user`
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(512) NOT NULL,
  `role` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insertar datos en la tabla `user`
INSERT INTO `user` (`name`, `surname`, `lastname`, `email`, `username`, `password`, `role`) VALUES
('Pedro', 'Picapiedra', 'Roca', 'pedropicapiedra@tienda.com', 'pedropicapiedra', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 0),
('Pablo', 'Mármol', 'Granito', 'pablomarmol@tienda.com', 'pablomarmol', 'e2cac5c5f7e52ab03441bb70e89726ddbd1f6e5b683dde05fb65e0720290179e', 1);

-- Crear la tabla `compra`
CREATE TABLE `compra` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Crear la tabla `producto`
CREATE TABLE `producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `stock` int NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Crear la tabla intermedia `compra_producto` para manejar la relación muchos a muchos entre `compra` y `producto`
CREATE TABLE `compra_producto` (
  `compra_id` bigint NOT NULL,
  `producto_id` bigint NOT NULL,
  PRIMARY KEY (`compra_id`, `producto_id`),
  FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`),
  FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
