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

-- Listage des données de la table recettes.categorie : ~3 rows (environ)
REPLACE INTO `categorie` (`id_categorie`, `nom_categorie`) VALUES
	(1, 'entrée'),
	(2, 'plat'),
	(3, 'dessert');

-- Listage des données de la table recettes.composer : ~13 rows (environ)
REPLACE INTO `composer` (`id_recette`, `id_ingredient`, `qte`) VALUES
	(1, 1, 1),
	(2, 2, 12),
	(3, 3, 1),
	(4, 1, 1),
	(4, 4, 1),
	(5, 5, 45),
	(6, 6, 1),
	(7, 7, 4),
	(8, 8, 1),
	(8, 9, 1),
	(9, 10, 1),
	(10, 11, 1),
	(10, 12, 2);

-- Listage des données de la table recettes.ingredient : ~12 rows (environ)
REPLACE INTO `ingredient` (`id_ingredient`, `nom_ingredient`, `unite_mesure`, `prix`) VALUES
	(1, 'Pâte', 'kg', 45.000000),
	(2, 'Huitre', 'pce', 2.000000),
	(3, 'Salade', 'pce', 4.500000),
	(4, 'Chocolat', 'kg', 120.000000),
	(5, 'Fraise', 'kg', 0.520000),
	(6, 'Thon', 'kg', 152.000000),
	(7, 'Patata', 'kg', 4.600000),
	(8, 'Poulet', 'pce', 25.000000),
	(9, 'Champignon', 'kg', 4545.000000),
	(10, 'Crème', 'kg', 16.000000),
	(11, 'Saumon', 'kg', 252.000000),
	(12, 'Herbes', 'g', 12.000000);

-- Listage des données de la table recettes.recette : ~10 rows (environ)
REPLACE INTO `recette` (`id_recette`, `nom_recette`, `tps_preparation`, `instructions`, `id_categorie`) VALUES
	(1, 'Pâtes', 15, 'cuire', 2),
	(2, 'Huitres', 1, 'cuire', 1),
	(3, 'Salade', 48, 'cuire', 1),
	(4, 'Eclair au chocolat', 120, 'cuire', 3),
	(5, 'Fraises ', 0, 'cuire', 3),
	(6, 'Thon braisé', 45, 'cuire', 2),
	(7, 'Frites', 5452, 'cuire', 1),
	(8, 'Poulet aux champignons', 47, 'cuire', 2),
	(9, 'Crème brûlée', 14, 'cuire', 3),
	(10, 'Saumon aux herbes', 848, 'cuire', 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
