-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 25 avr. 2024 à 06:09
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_immobilisation`
--

-- --------------------------------------------------------

--
-- Structure de la table `taux_amortissements`
--

DROP TABLE IF EXISTS `taux_amortissements`;
CREATE TABLE IF NOT EXISTS `taux_amortissements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `rubrique` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `taux` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `taux_amortissements`
--

INSERT INTO `taux_amortissements` (`id`, `rubrique`, `taux`, `created_at`, `updated_at`) VALUES
(1, 'Equipements industriel', 10.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(2, 'Engins de levage', 20.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(3, 'Gros outillages de travaux publics', 0.33, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(4, 'Materiel informatique', 25.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(5, 'Materiel medical et de laboratoire', 10.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(6, 'Groupes electrogenes', 10.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(7, 'Transports terrestre touristiques affectes au transport public ou a la location', 0.33, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(8, 'Autre vehicules terrestres', 20.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(9, 'Cammionettes et fourgonnettes', 25.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(10, 'Camions', 25.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(11, 'Vehicule a deux roues', 25.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(12, 'Transport ferroviaire', 10.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(13, 'Transport fluvial', 10.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(14, 'Transport maritime', 15.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(15, 'Transport aerien', 15.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(16, 'Mobilier de bureau', 10.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19'),
(17, 'Materiel de bureau', 20.00, '2024-04-19 06:10:19', '2024-04-19 06:10:19');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
