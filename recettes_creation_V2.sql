-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour exo_recettes
CREATE DATABASE IF NOT EXISTS `exo_recettes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exo_recettes`;

-- Listage de la structure de table exo_recettes. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exo_recettes.categorie : ~3 rows (environ)
INSERT INTO `categorie` (`id_categorie`, `nom_categorie`) VALUES
	(1, 'Entrée'),
	(2, 'Plat'),
	(3, 'Dessert');

-- Listage de la structure de table exo_recettes. composer
CREATE TABLE IF NOT EXISTS `composer` (
  `qte` int NOT NULL,
  `id_recette` int DEFAULT NULL,
  `id_ingredient` int DEFAULT NULL,
  KEY `id_recette` (`id_recette`),
  KEY `id_ingredient` (`id_ingredient`),
  CONSTRAINT `FK_composer_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  CONSTRAINT `FK_composer_recette` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id_recette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exo_recettes.composer : ~21 rows (environ)
INSERT INTO `composer` (`qte`, `id_recette`, `id_ingredient`) VALUES
	(1, 1, 1),
	(1, 1, 2),
	(1, 2, 3),
	(1, 4, 4),
	(1, 4, 5),
	(1, 5, 6),
	(10, 5, 7),
	(1, 6, 8),
	(1, 6, 9),
	(1, 7, 9),
	(1, 7, 4),
	(1, 8, 10),
	(4, 9, 11),
	(1, 10, 12),
	(1, 11, 9),
	(1, 11, 4),
	(0, 3, NULL),
	(3, 9, 14),
	(3, 9, 15),
	(3, 9, 16),
	(1000, 4, 17);

-- Listage de la structure de table exo_recettes. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unite_mesure` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exo_recettes.ingredient : ~17 rows (environ)
INSERT INTO `ingredient` (`id_ingredient`, `nom_ingredient`, `unite_mesure`, `prix`) VALUES
	(1, 'Coq', 'pce', 30),
	(2, 'Vin', 'pce', 15),
	(3, 'Salade', 'pce', 4.5),
	(4, 'Farine', 'kg', 6.5),
	(5, 'Beurre', 'kg', 12),
	(6, 'Thon', 'kg', 60),
	(7, 'Anchois', 'pce', 2),
	(8, 'Chocolat', 'kg', 35),
	(9, 'Creme', 'L', 25),
	(10, 'Choux', 'pce', 4.5),
	(11, 'Pomme de terre', 'pce', 0.3),
	(12, 'Poulet', 'pce', 25),
	(13, 'Poivre', 'Cuillère à café', 2.5),
	(14, 'Poivre', 'Cuillère à café', 2.5),
	(15, 'textInsert15', 'Test', 1.5),
	(16, 'textInsert15', 'Test', 1.5),
	(17, 'Feuille', 'Pce', 0.1);

-- Listage de la structure de table exo_recettes. recette
CREATE TABLE IF NOT EXISTS `recette` (
  `id_recette` int NOT NULL AUTO_INCREMENT,
  `nom_recette` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tps_preparation` int NOT NULL DEFAULT '0',
  `instructions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_categorie` int DEFAULT NULL,
  `image_recette` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'indisponible.jpg',
  PRIMARY KEY (`id_recette`),
  KEY `id_categorie` (`id_categorie`),
  CONSTRAINT `FK_recette_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Listage des données de la table exo_recettes.recette : ~11 rows (environ)
INSERT INTO `recette` (`id_recette`, `nom_recette`, `tps_preparation`, `instructions`, `id_categorie`, `image_recette`) VALUES
	(1, 'Coq-au-vin', 40, 'Cuire dans le vin', 2, 'https://royal-opera.fr/wp-content/uploads/2018/05/lhistoire-de-la-recette-du-coq-au-vin.jpg'),
	(2, 'Salade', 6, 'Laver, couper et assaisonner', 1, 'https://i.notretemps.com/1200x628/smart/2021/05/06/les-bienfaits-de-la-salade.jpeg'),
	(3, 'Tasse d\'eau très chaude', 8, 'Chauffer jusqu\'à ébullition', 1, 'https://image.jimcdn.com/app/cms/image/transf/none/path/sce3746a340b115f4/image/i99a7a2f6e9273c80/version/1473162391/image.jpg'),
	(4, 'Mille-feuilles', 90, 'Patisser', 3, 'https://mapatisserie.fr/wp-content/uploads/2022/03/mille-feuille-P1100843-012-scaled.jpeg'),
	(5, 'Salade nicoise', 15, 'Laver, couper, ajouter  la garniture et assaisonner', 1, 'https://img.cuisineaz.com/660x660/2013/12/20/i34581-salade-nicoise-rapide.jpeg'),
	(6, 'Eclair au chocolat', 45, 'Patisser', 3, 'https://mapatisserie.fr/wp-content/uploads/2021/09/eclair-chocolat-P1080408-03-scaled.jpeg'),
	(7, 'Choux a la crème', 50, 'Patisser', 3, 'https://www.academiedugout.fr/images/14591/1200-686/fotolia_36531162_subscription_xxl.jpg?poix=50&poiy=50'),
	(8, 'Soupe au choux', 35, 'Couper le choux, faire bouillir dans de l\'eau et assaisonner', 2, 'https://dxpulwm6xta2f.cloudfront.net/eyJidWNrZXQiOiJhZGMtZGV2LWltYWdlcy1yZWNpcGVzIiwia2V5IjoicmVwXzEzOTU0X3NvdXBlX2Nob3VfbGFyZF9mdW1lLmpwZyIsImVkaXRzIjp7ImpwZWciOnsicXVhbGl0eSI6ODB9LCJwbmciOnsicXVhbGl0eSI6ODB9LCJ3ZWJwIjp7InF1YWxpdHkiOjgwfX19'),
	(9, 'Frites', 20, 'Couper les pommes de terre en tiges et les faire frire', 1, 'https://chefcuisto.com/files/2023/08/frites-style-mcdo-friteuse-air-chaud-1140x599.jpg'),
	(10, 'Poulet rôti', 40, 'Rôtir le poulet jusqu\'à satisfaction', 2, 'https://legarconboucher.com/903-large_default/poulet-roti-fermier.jpg'),
	(11, 'Pâtes à la carbonara', 20, 'Faire les pâtes puis rajouter de la crème', 2, 'https://img.cuisineaz.com/660x660/2023/04/11/i192604-pates-a-la-carbonara.jpg');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
