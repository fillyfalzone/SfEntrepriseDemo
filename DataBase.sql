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


-- Listage de la structure de la base pour sfentreprisedemo
CREATE DATABASE IF NOT EXISTS `sfentreprisedemo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sfentreprisedemo`;

-- Listage de la structure de table sfentreprisedemo. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Listage des données de la table sfentreprisedemo.doctrine_migration_versions : ~1 rows (environ)
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20230921092503', '2023-09-21 09:29:31', 1376);

-- Listage de la structure de table sfentreprisedemo. employe
CREATE TABLE IF NOT EXISTS `employe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entreprise_id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` datetime DEFAULT NULL,
  `date_embauche` datetime NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F804D3B9A4AEAFEA` (`entreprise_id`),
  CONSTRAINT `FK_F804D3B9A4AEAFEA` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfentreprisedemo.employe : ~60 rows (environ)
INSERT INTO `employe` (`id`, `entreprise_id`, `nom`, `prenom`, `date_naissance`, `date_embauche`, `ville`) VALUES
	(1, 1, 'Machine', 'Pauline', '1993-02-21 14:25:45', '2020-09-21 14:26:04', 'New York'),
	(2, 2, 'Gerard', 'Pique', '1985-08-21 14:25:45', '2010-11-21 14:25:45', 'New York'),
	(3, 1, 'John', 'Doe', '1990-05-15 08:00:00', '2015-03-10 09:30:00', 'New York'),
	(4, 2, 'Alice', 'Smith', '1988-12-20 11:45:00', '2012-09-05 10:15:00', 'New York'),
	(5, 3, 'Bob', 'Johnson', '1995-03-02 14:20:00', '2017-06-18 08:45:00', 'New York'),
	(6, 4, 'Emma', 'Williams', '1992-07-10 09:30:00', '2016-02-27 11:00:00', 'New York'),
	(7, 5, 'Michael', 'Brown', '1987-04-05 13:15:00', '2011-11-30 14:30:00', 'New York'),
	(8, 6, 'Olivia', 'Davis', '1993-09-12 10:45:00', '2018-04-22 08:00:00', 'New York'),
	(9, 7, 'James', 'Miller', '1998-01-25 12:00:00', '2019-07-14 09:15:00', 'New York'),
	(10, 8, 'Sophia', 'Wilson', '1994-11-08 15:30:00', '2014-05-03 12:45:00', 'New York'),
	(11, 9, 'William', 'Jones', '1989-06-18 08:45:00', '2013-08-17 11:30:00', 'Los Angeles'),
	(12, 10, 'Ava', 'Garcia', '1997-02-28 10:00:00', '2015-12-05 13:00:00', ''),
	(13, 11, 'Daniel', 'Clark', '1991-08-04 14:10:00', '2016-10-20 10:30:00', 'Los Angeles'),
	(14, 12, 'Mia', 'Martinez', '1996-10-15 09:15:00', '2018-02-14 08:45:00', 'Los Angeles'),
	(15, 13, 'Elijah', 'Rodriguez', '1990-03-30 11:30:00', '2013-04-11 14:20:00', 'Los Angeles'),
	(16, 14, 'Grace', 'Lee', '1994-12-07 12:45:00', '2017-03-25 09:30:00', ''),
	(17, 15, 'Benjamin', 'Harris', '1988-05-22 13:45:00', '2011-07-02 10:15:00', 'Los Angeles'),
	(18, 16, 'Lily', 'Scott', '1993-06-02 08:15:00', '2019-09-08 08:00:00', 'Los Angeles'),
	(19, 1, 'Samuel', 'Turner', '1992-04-11 11:00:00', '2014-08-12 12:00:00', 'Los Angeles'),
	(20, 2, 'Chloe', 'White', '1997-07-28 15:15:00', '2016-12-20 10:45:00', ''),
	(21, 3, 'Jackson', 'Brown', '1995-09-03 08:30:00', '2018-06-22 14:30:00', 'Miami'),
	(22, 4, 'Scarlett', 'Hall', '1989-03-17 14:45:00', '2012-10-31 08:15:00', 'Miami'),
	(23, 5, 'Liam', 'Moore', '1998-08-24 09:45:00', '2015-05-18 09:00:00', 'Miami'),
	(24, 6, 'Madison', 'Evans', '1991-11-19 12:15:00', '2017-01-05 11:45:00', 'Miami'),
	(25, 7, 'Noah', 'Johnson', '1993-12-28 10:30:00', '2018-09-16 13:30:00', 'Miami'),
	(26, 8, 'Emily', 'Gonzalez', '1996-02-14 08:45:00', '2019-11-10 12:45:00', 'Miami'),
	(27, 9, 'Aiden', 'Walker', '1990-06-07 15:00:00', '2013-07-27 10:00:00', 'Miami'),
	(28, 10, 'Avery', 'Green', '1994-01-09 09:15:00', '2016-03-14 11:30:00', ''),
	(29, 11, 'Ethan', 'Baker', '1992-10-31 11:30:00', '2017-05-06 08:45:00', 'Miami'),
	(30, 12, 'Abigail', 'Adams', '1997-04-23 08:00:00', '2018-08-09 13:15:00', 'Miami'),
	(31, 13, 'Mason', 'Perez', '1988-09-16 10:15:00', '2011-12-03 10:45:00', 'Chicago'),
	(32, 14, 'Ella', 'Wright', '1995-03-14 09:30:00', '2014-10-19 14:00:00', 'Chicago'),
	(33, 15, 'Logan', 'Carter', '1991-07-02 12:30:00', '2015-06-29 08:30:00', 'Chicago'),
	(34, 16, 'Aria', 'Taylor', '1993-08-27 14:45:00', '2019-02-18 09:45:00', ''),
	(35, 1, 'Sophie', 'Anderson', '1990-05-15 08:00:00', '2015-03-10 09:30:00', 'Chicago'),
	(36, 2, 'David', 'Martin', '1988-12-20 11:45:00', '2012-09-05 10:15:00', 'Chicago'),
	(37, 3, 'Isabella', 'Garcia', '1995-03-02 14:20:00', '2017-06-18 08:45:00', 'Chicago'),
	(38, 4, 'Jackson', 'Wilson', '1992-07-10 09:30:00', '2016-02-27 11:00:00', 'Chicago'),
	(39, 5, 'Liam', 'Thompson', '1987-04-05 13:15:00', '2011-11-30 14:30:00', 'Chicago'),
	(40, 6, 'Olivia', 'Davis', '1993-09-12 10:45:00', '2018-04-22 08:00:00', 'Chicago'),
	(41, 7, 'Benjamin', 'Taylor', '1998-01-25 12:00:00', '2019-07-14 09:15:00', 'Boston'),
	(42, 8, 'Ava', 'Hernandez', '1994-11-08 15:30:00', '2014-05-03 12:45:00', ''),
	(43, 9, 'William', 'Robinson', '1989-06-18 08:45:00', '2013-08-17 11:30:00', 'Boston'),
	(44, 10, 'Emma', 'Lewis', '1997-02-28 10:00:00', '2015-12-05 13:00:00', 'Boston'),
	(45, 11, 'Lucas', 'Walker', '1991-08-04 14:10:00', '2016-10-20 10:30:00', 'Boston'),
	(46, 12, 'Mia', 'Clark', '1996-10-15 09:15:00', '2018-02-14 08:45:00', 'Boston'),
	(47, 13, 'Ethan', 'Allen', '1990-03-30 11:30:00', '2013-04-11 14:20:00', ''),
	(48, 14, 'Charlotte', 'Harris', '1994-12-07 12:45:00', '2017-03-25 09:30:00', 'Boston'),
	(49, 15, 'Noah', 'Moore', '1988-05-22 13:45:00', '2011-07-02 10:15:00', 'Boston'),
	(50, 16, 'Sophia', 'Smith', '1993-06-02 08:15:00', '2019-09-08 08:00:00', 'Boston'),
	(51, 1, 'Matthew', 'Parker', '1992-04-11 11:00:00', '2014-08-12 12:00:00', 'Seattle'),
	(52, 2, 'Chloe', 'Baker', '1997-07-28 15:15:00', '2016-12-20 10:45:00', ''),
	(53, 3, 'Daniel', 'Allen', '1995-09-03 08:30:00', '2018-06-22 14:30:00', 'Seattle'),
	(54, 4, 'Aria', 'Evans', '1989-03-17 14:45:00', '2012-10-31 08:15:00', 'Seattle'),
	(55, 5, 'Logan', 'Carter', '1998-08-24 09:45:00', '2015-05-18 09:00:00', 'Seattle'),
	(56, 6, 'Ella', 'Wright', '1991-11-19 12:15:00', '2017-01-05 11:45:00', 'Seattle'),
	(57, 7, 'Samuel', 'Rodriguez', '1993-12-28 10:30:00', '2018-09-16 13:30:00', 'Seattle'),
	(58, 8, 'Madison', 'Lee', '1996-02-14 08:45:00', '2019-11-10 12:45:00', ''),
	(59, 9, 'Aiden', 'Johnson', '1990-06-07 15:00:00', '2013-07-27 10:00:00', 'Seattle'),
	(60, 10, 'Avery', 'Adams', '1994-01-09 09:15:00', '2016-03-14 11:30:00', 'Seattle');

-- Listage de la structure de table sfentreprisedemo. entreprise
CREATE TABLE IF NOT EXISTS `entreprise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `raison_sociale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_creation` datetime NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfentreprisedemo.entreprise : ~18 rows (environ)
INSERT INTO `entreprise` (`id`, `raison_sociale`, `date_creation`, `adresse`, `cp`, `ville`) VALUES
	(1, 'ELANFORMATION', '2023-09-21 14:15:41', '7 place de la republique ', '68000\r\n', 'Colmar'),
	(2, 'Acme Corporation', '2023-09-21 14:15:41', '123 Main Street', '12345', 'New York'),
	(3, 'ABC Ltd', '2023-09-21 14:15:41', '456 Elm Avenue', '67890', 'Los Angeles'),
	(4, 'Tech Innovators Inc.', '2023-09-21 14:15:41', '789 Oak Lane', '23456', 'San Francisco'),
	(5, 'Global Solutions Group', '2023-09-21 14:15:41', '1010 Maple Drive', '34567', 'Chicago'),
	(6, 'Sunshine Enterprises', '2023-09-21 14:15:41', '2020 Palm Street', '45678', 'Miami'),
	(7, 'Pacific Coast Ventures', '2023-09-21 14:15:41', '303 Beach Boulevard', '56789', 'San Diego'),
	(8, 'SilverTech Solutions', '2023-09-21 14:15:41', '404 Silver Lane', '90123', 'Boston'),
	(9, 'Eagle Eye Innovations', '2023-09-21 14:15:41', '505 Eagle Avenue', '01234', 'Seattle'),
	(10, 'Golden Gate Group', '2023-09-21 14:15:41', '606 Golden Gate Street', '12345', 'San Francisco'),
	(11, 'Starlight Enterprises', '2023-09-21 14:15:41', '707 Star Lane', '23456', 'Los Angeles'),
	(12, 'TechWorld Inc.', '2023-09-21 14:15:41', '808 Tech Avenue', '34567', 'New York'),
	(13, 'GreenTech Solutions', '2023-09-21 14:15:41', '909 Green Street', '45678', 'Chicago'),
	(14, 'BlueWave Ventures', '2023-09-21 14:15:41', '101 Blue Way', '56789', 'Miami'),
	(15, 'Sunset Enterprises', '2023-09-21 14:15:41', '202 Sunset Drive', '67890', 'San Diego'),
	(16, 'Innovate IT Solutions', '2023-09-21 14:15:41', '303 Innovation Lane', '78901', 'San Francisco'),
	(17, 'Allianz', '2023-09-22 06:53:48', '63 rue cartier bresson', '93450', 'Pantin'),
	(18, 'Asso2023', '2023-09-22 06:54:42', '18 Boulevard des rois', '78560', 'Trappes');

-- Listage de la structure de table sfentreprisedemo. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table sfentreprisedemo.messenger_messages : ~0 rows (environ)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
