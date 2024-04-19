-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 16 avr. 2024 à 06:15
-- Version du serveur : 5.7.40
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `employeeleavedb`
--

-- --------------------------------------------------------

--
-- Structure de la table `tbldepartments`
--

DROP TABLE IF EXISTS `departements`;
CREATE TABLE IF NOT EXISTS `departements` (
  `idDepartement` int(11) NOT NULL AUTO_INCREMENT,
  `departement` varchar(150) DEFAULT NULL,
  `sigle` varchar(20) NOT NULL,
  PRIMARY KEY (`idDepartement`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tbldepartments`
--

INSERT INTO `departements` (`idDepartement`, `departement`, `sigle`) VALUES
(1, 'Direction Administrative et Financière', 'DAF'),
(2, 'Direction Generale', 'DG'),
(3, 'Direction Infrastructure Géographique et Hydrographique', 'DIGH'),
(4, 'Direction des Relations Publiques et Institutionnelles', 'DRPI'),
(5, 'Direction de la Maitrise Ouvrage de Services Publics', 'DMOSP'),
(6, 'Personne Responsable Des Marchés Publics', 'PRMP');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
