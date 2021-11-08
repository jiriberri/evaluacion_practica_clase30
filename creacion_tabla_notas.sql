CREATE TABLE `notas` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `fecha_de_creacion` datetime NOT NULL,
  `fecha_ultima_modificacion` datetime NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `puede_ser_eliminada` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `id_categoria` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria_idx` (`id_categoria`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
)