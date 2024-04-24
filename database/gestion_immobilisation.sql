-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 19 avr. 2024 à 12:07
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
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `idCategorie` smallint NOT NULL AUTO_INCREMENT,
  `classe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`idCategorie`, `classe`, `created_at`, `updated_at`) VALUES
(1, 'classe 1', '2024-04-19 11:26:24', '2024-04-19 11:26:24'),
(2, 'classe 2', '2024-04-19 11:26:24', '2024-04-19 11:26:24'),
(3, 'classe 3', '2024-04-19 11:26:24', '2024-04-19 11:26:24'),
(4, 'classe 4', '2024-04-19 11:26:24', '2024-04-19 11:26:24'),
(5, 'classe 5', '2024-04-19 11:26:24', '2024-04-19 11:26:24'),
(6, 'classe 6', '2024-04-19 11:26:24', '2024-04-19 11:26:24'),
(7, 'classe 7', '2024-04-19 11:26:24', '2024-04-19 11:26:24'),
(8, 'classe 8', '2024-04-19 11:26:24', '2024-04-19 11:26:24');

-- --------------------------------------------------------

--
-- Structure de la table `deficits`
--

DROP TABLE IF EXISTS `deficits`;
CREATE TABLE IF NOT EXISTS `deficits` (
  `idDeficit` int NOT NULL AUTO_INCREMENT,
  `quantite` int NOT NULL,
  `idMatiere` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idDeficit`),
  KEY `deficits_idmatiere_foreign` (`idMatiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `demolitions`
--

DROP TABLE IF EXISTS `demolitions`;
CREATE TABLE IF NOT EXISTS `demolitions` (
  `idType` smallint NOT NULL AUTO_INCREMENT,
  `type` linestring NOT NULL,
  `dateDemolition` date NOT NULL,
  `quantite` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idMatiere` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idType`),
  KEY `demolitions_idmatiere_foreign` (`idMatiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

DROP TABLE IF EXISTS `departements`;
CREATE TABLE IF NOT EXISTS `departements` (
  `idDepartement` int NOT NULL AUTO_INCREMENT,
  `departement` varchar(150) DEFAULT NULL,
  `sigle` varchar(20) NOT NULL,
  PRIMARY KEY (`idDepartement`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`idDepartement`, `departement`, `sigle`) VALUES
(1, 'Direction Administrative et Financière', 'DAF'),
(2, 'Direction Generale', 'DG'),
(3, 'Direction Infrastructure Géographique et Hydrographique', 'DIGH'),
(4, 'Direction des Relations Publiques et Institutionnelles', 'DRPI'),
(5, 'Direction de la Maitrise Ouvrage de Services Publics', 'DMOSP'),
(6, 'Personne Responsable Des Marchés Publics', 'PRMP');

-- --------------------------------------------------------

--
-- Structure de la table `dossierreference`
--

DROP TABLE IF EXISTS `dossierreference`;
CREATE TABLE IF NOT EXISTS `dossierreference` (
  `idDossierReference` smallint NOT NULL AUTO_INCREMENT,
  `DAO` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PVR` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paiement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OE` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idDossierReference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `idEmployee` int NOT NULL AUTO_INCREMENT,
  `matricule` varchar(10) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `email` varchar(200) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `poste` varchar(255) NOT NULL,
  `idDepartement` varchar(200) NOT NULL,
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`idEmployee`, `matricule`, `nom`, `prenom`, `email`, `genre`, `poste`, `idDepartement`) VALUES
(1, '335546', 'RANDRIAMANANA', 'Malala Fidèle', 'malala@gmail.com', 'Male', 'Directeur du DRPI', '4'),
(2, '318831', 'SOAMIAFARA ', 'Valivonintsoa', 'valivonintsoa@gmail.com', 'Female', 'Secretaire du DRPI', '4'),
(3, '255335', 'RAZANAHARIMAVO', 'Lalao', 'lalao@gmail.com', 'Female', 'Chef de service bureau des ventes', '4'),
(4, '255332', 'RAHAGALALAO', 'Marie Germaine', 'marie@gmail.com', 'Female', 'Chef de division communication institutionnelle', '4'),
(5, '318814', 'RAHARISON', 'Paul Henrili', 'paul@gmail.com', 'Male', 'Chef de division imprimerie', '4'),
(6, '287179', 'RAVELO', 'Felasoa', 'felasoa@gmail.com', 'Female', 'Agent de reception', '4'),
(7, '318840', 'RATSIMBAZAFY', 'Toavina Luc Valerie', 'luc@gmail.com', 'Male', 'Operateur PAO', '4'),
(8, '318817', 'RANDRIANARY', 'Elie', 'elie@gmail.com', 'Male', 'Agent de finition', '4'),
(9, '274699', 'RAKOTONIAINA', 'Albert', 'albert@gmail.com', 'Male', 'Agent de finition', '4'),
(10, '318827', 'ANDRIANARY', 'Narcisse Eric', 'eric@gmail.com', 'Male', 'Agent de finition', '4'),
(11, '318878', 'RAZAKAHERILALA', 'Rija Mampionona', 'rija@gmail.com', 'Male', 'Conducteur offset', '4'),
(12, '274713', 'RAKOTOARISOA', 'Stéphane Fabrice', 'fabrice@gmail.com', 'Male', 'Agent de finition', '4'),
(13, '318842', 'RAKOTONDRABARY', 'Luc Anatole', 'anatole@gmail.com', 'Male', 'Agent de finition', '4'),
(14, '000008', 'RAJAONARY', 'Dina Harilalaina Christian', 'dina@gmail.com', 'Male', 'Chauffeur mecanicien', '4'),
(15, '318823', 'NARY HERINIRINA', 'Iarivo', 'iarivo@gmail.com', 'Female', 'Directeur du DIGH', '3'),
(16, '318875', 'ANDRIANARISON', 'Misan\'ny Farany Nirina', 'misa@gmail.com', 'Male', 'Chef de service geodesie et nivellement', '3'),
(17, '387173', 'RAHAJANIRINA', 'Michelle', 'michelle@gmail.com', 'Female', 'Chef de service imagerie espace et photographie', '3'),
(18, '274701', 'RANDRIATAFIKA', 'Nivomalala Tinasoa', 'tinasoa@gmail.com', 'Female', 'Chef de division cartes thematiques', '3'),
(19, '273114', 'ANDRIATSARAFARA', 'Lanto Harimanana', 'lanto@gmail.com', 'Male', 'Operateur', '3'),
(20, '318818', 'RAKOTOMALALA', 'Elie Rinah', 'rinah@gmail.com', 'Male', 'Operateur', '3'),
(21, '287166', 'RAMANANDRAIBE', 'Andoniaina Abel Dennis', 'dennis@gmail.com', 'Male', 'Operateur', '3'),
(22, '318882', 'RANDIMBISON', 'Mamy', 'mamy@gmail.com', 'Male', 'Operateur', '3'),
(23, '318838', 'RAVELOMANANTSOA', 'Andriamifidy', 'andriamifidy@gmail.com', 'Male', 'Chef de division cartes topographiques', '3'),
(24, '287172', 'RANDRIAMANANA', 'Lydia Veromanitra', 'lydia@gmail.com', 'Female', 'Operateur', '3'),
(25, '494146', 'RANDRIAMIARAMBOLANA', 'Iratra Sarobidy', 'iratra@gmail.com', 'Female', 'Collaborateur technique', '3'),
(26, '287170', 'RANGODONARISON', 'Fanja Rasoarinoro Onitraina', 'fanja@gmail.com', 'Female', 'Operateur', '3'),
(27, '318839', 'RAZAFINDRAZAKA', 'Fanomezantsoa Johanesa', 'johanesa@gmail.com', 'Male', 'Operateur', '3'),
(28, '255325', 'RANDRIAMANANTENA', 'Andriamboavonjy Pierre R', 'pierre@gmail.com', 'Male', 'Operateur', '3'),
(29, '318849', 'RANDRENJASON', 'Lalaharizo Andriamiadana Eugene', 'eugene@gmail.com', 'Male', 'Operateur', '3'),
(30, '318825', 'RAMBOLATIANA', 'Alphonse', 'alphonse@gmail.com', 'Male', 'Operateur', '3'),
(31, '287168', 'RAFARASOA', 'Hanta', 'hanta@gmail.com', 'Female', '', '3'),
(32, '287171', 'RAJAOBSON', 'Solofoniaina Fanomezantsoa', 'solofoniaina@gmail.com', 'Male', '', '3'),
(33, '273111', 'ANDRIANJATOVO', 'Haja', 'haja@gmail.com', 'Male', 'Operateur', '3'),
(34, '318847', 'RAZAFINANTOANINA', 'Hery Tsiry', 'tsiry@gmail.com', 'Male', '', '3'),
(35, '297160', 'RASOLONIRINA', 'Haja Lalao', 'lalao@gmail.com', 'Male', '', '3'),
(36, '484143', 'RAKOTOARIMAHEFA', 'Tojo Nirina', 'nirina@gmail.com', 'Male', '', '3'),
(37, '318845', 'RAKOTONDRAINIBE', 'Norolalao', 'norolalao@gmail.com', 'Female', 'Personne responsables des marchés publiques', '6'),
(38, '273112', 'RAKOTONDRABAKO', 'Lisy Misarivelo ', 'lisy@gmail.com', 'Female', 'Chef de file UGPM', '6'),
(39, '318870', 'RAVELOSON', 'Jean Jacques', 'jjacques@gmail.com', 'Male', 'Agent de l\'UGPM', '6'),
(40, '318871', 'RAMANANTSOA', 'John Eric', 'johneric@gmail.com', 'Male', 'Agent de l\'UGPM', '6'),
(41, '247596', 'RAHAINGOALISON', 'Narizo Mahefa', 'narizo@gmail.com', 'Male', 'Directeur du DMOSP', '5'),
(42, '352679', 'ANDRIANJAFIRAVELO', 'Tsitohaina', 'tsito@gmail.com', 'Male', 'Chef de service de reglementation normalisation et VISA', '5'),
(43, '352580', 'BAOVOLA', 'Marie Anna', 'anna@gmail.com', 'Female', 'Chef de service systeme d\'informatique', '5'),
(44, '318853', 'HERSSIL', 'Adolphe', 'adolphe@gmail.com', 'Male', 'Chef de division maintenance', '5'),
(45, '318833', 'RAKOTONIAINA', 'Harinjaka Roger Jimmy Michaud', 'michaud@gmail.com', 'Male', 'Agent de maintenance', '5'),
(46, '318854', 'RAKOTOARIVONY', 'Alpha', 'alpha@gmail.com', 'Male', 'Agent de maintenance', '5'),
(47, '318880', 'RAKOTONIAINA', 'Tiana Lucien', 'tlucien@gmail.com', 'Male', 'Archiviste cartotheque et phototheque', '5'),
(48, '274697', 'RAKOTOARIVELO', 'Yvon Tony Rodolphe', 'yvon@gmail.com', 'Male', 'Operateur', '5'),
(49, '274700', 'RASOANAIVO', 'Réné Marius', 'rmarius@gmail.com', 'Male', 'Archive numerique', '5'),
(50, '255337', 'RAKOTONIAINA RABENORO', 'Barry ', 'barry@gmail.com', 'Male', 'Directeur du DAF', '1'),
(51, '000009', 'RAZAFINIMARO', 'Miorantsalama Sandra', 'miorasandra@gmail.com', 'Female', 'Secretaire du DAF', '1'),
(52, '318852', 'RAMINOARISOA', 'Fanjaniaina Fortunat', 'fanjafortunat@gmail.com', 'Female', 'Chef de service administratif et approvisionnement', '1'),
(53, '318841', 'RAINIZAFINDRAFARASON', 'Jean Bartho Mathieu', 'bartho@gmail.com', 'Male', 'Chef d\'equipe garage', '1'),
(54, '000007', 'RADIMY ANDRIAMIZAO', 'Niainaharilala', 'niainharilala@gmail.com', 'Male', '', '1'),
(55, '318828', 'RAMANANTSIALONINA', 'Alain Raymond', 'alraymond@gmail.com', 'Male', '', '1'),
(56, '000006', 'ANDRIAMANANTENA', 'Tojomampianina Joharisoa', 'johary@gmail.com', 'Male', '', '1'),
(57, '318828', 'RAHARIMALALA', 'Voahangy Odette', 'voahangy@gmail.com', 'Female', '', '1'),
(58, '318844', 'RANAIVOSON', 'Tiana Alexandre', 'tialexandre@gmail.com', 'Male', '', '1'),
(59, '249684', 'RAZAFINDRAMANANA', 'Solange', 'solange@gmail.com', 'Female', '', '1'),
(60, '000009', 'RAHARISON', 'Felaniaina Prisca', 'felanaprisca@gmail.com', 'Female', '', '1'),
(61, '249694', 'SOLONIRINA', 'Rolland', 'rol@gmail.com', 'Male', '', '1'),
(62, '318815', 'RAKOTOMAMONJY', 'Baka Olivier', 'olivierb@gmail.com', 'Male', '', '1'),
(63, '318874', 'RABEATOANDRO', 'Anjaranirina Harinelina', 'anjaranirina@gmail.com', 'Female', 'Chef de service ressources humaines', '1'),
(64, '318851', 'RAKOTOARINORO', 'Bina Harimalala', 'bina@gmail.com', 'Female', 'Chef de division gestion administrative', '1'),
(65, '255321', 'ANDRIANARIVELO', 'Fanomezantsoa H Loeticia', 'hloeticia@gmail.com', 'Female', '', '1'),
(66, '287167', 'RABARIVELOARIJAONA', 'Njakandraibe', 'njaka@gmail.com', 'Male', '', '1'),
(67, '318832', 'RALALASOA', 'Andriamanana Solofoniaina David', 'laladavid@gmail.com', 'Male', '', '1'),
(68, '405508', 'RABEARISOA', 'Lanto Nirivola', 'lantoniry@gmail.com', 'Female', 'Chef de service finances et comptabilité', '1'),
(69, '318881', 'RAVAOMIARANA', 'Farasoa Yvette', 'farasoa@gmail.com', 'Female', 'Aide comptable(comptabilité matiere)', '1'),
(70, '405508', 'RANDRIANARIMANANA', 'Nangolanjara', 'nangolanjara@gmail.com', 'Male', 'Comptable', '1'),
(71, '318837', 'RAJAONARISON', 'Jean Desiré Delphin', 'jean@gmail.com', 'Male', 'Directeur générale', '2'),
(72, '312336', 'MAHASOLO', 'Désiré Auguste', 'dauguste@gmail.com', 'Male', 'Agent comptable', '2'),
(73, '405567', 'RAHOLY', 'Herimamy', 'herimamy@gmail.com', 'Female', 'Aide comptable', '2'),
(74, '287174', 'RAZAFINIRINA', 'Marie Clemence', 'marieclemence@gmail.com', 'Female', 'Regisseur de recettes', '2'),
(75, '316830', 'RADERASON', 'Andriantiana Hery', 'andryhery@gmail.com', 'Male', 'Agent de recouvrement', '2'),
(76, '318877', 'RAZAFINDRAMIARA', 'Lova Salohy', 'salohy@gmail.com', 'Female', 'Secretaire du DG', '2'),
(77, '405509', 'IARIVONY', 'Felana', 'iaryfelana@gmail.com', 'Female', 'Seretaire du DG', '2'),
(78, '318866', 'RANDRIANANDRASANA', 'Tovoniaina Dannie', 'tovodannie@gmail.com', 'Male', 'Vaguemestre', '2'),
(79, '318816', 'RAKOTOMALALA', 'Bruno', 'bruno@gmail.com', 'Male', 'Chauffeur du DG', '2'),
(80, '274712', 'RAHANTALALAO', 'Marie Claire', 'marieclaire@gmail.com', 'Female', 'Aide magasinier', '2'),
(81, '318872', 'ANDRIAMPERASOA', 'Fidena', 'fidena@gmail.com', 'Male', 'Aide magasinier', '2'),
(82, '287178', 'RAZAFINJATO', 'Haingotiana', 'haingotiana@gmail.com', 'Male', 'Depositaire comptable', '2'),
(83, '255322', 'RAFIDIARISON', 'Cyrille', 'rafidicyrille@gmail.com', 'Male', 'Depositaire comptable technique', '2'),
(84, 'admin1', 'Rakotondramanantsoa', 'Nehemia', 'nehemiarakotondramanantsoa19@gmail.com', 'Male', 'Super admin', '1'),
(85, 'admin2', 'Ratovoherimanana', 'Arotoby', 'arotobyratovohery@gmail.com', 'Male', 'Super admin', '1');

-- --------------------------------------------------------

--
-- Structure de la table `espece_unites`
--

DROP TABLE IF EXISTS `espece_unites`;
CREATE TABLE IF NOT EXISTS `espece_unites` (
  `idEspeceUnite` smallint NOT NULL AUTO_INCREMENT,
  `typeUnite` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idEspeceUnite`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `espece_unites`
--

INSERT INTO `espece_unites` (`idEspeceUnite`, `typeUnite`, `created_at`, `updated_at`) VALUES
(1, 'piece', '2024-04-19 08:19:15', '2024-04-19 08:19:15'),
(2, 'nombre', '2024-04-19 08:19:15', '2024-04-19 08:19:15');

-- --------------------------------------------------------

--
-- Structure de la table `etats`
--

DROP TABLE IF EXISTS `etats`;
CREATE TABLE IF NOT EXISTS `etats` (
  `idEtat` smallint NOT NULL AUTO_INCREMENT,
  `typeEtat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idEtat`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etats`
--

INSERT INTO `etats` (`idEtat`, `typeEtat`, `created_at`, `updated_at`) VALUES
(1, 'Neuf', '2024-04-19 08:26:38', '2024-04-19 08:26:38'),
(2, 'Bon', '2024-04-19 08:26:38', '2024-04-19 08:26:38'),
(3, 'Abimé', '2024-04-19 08:26:38', '2024-04-19 08:26:38'),
(4, 'Hors d\'usa', '2024-04-19 08:26:38', '2024-04-19 08:26:38');

-- --------------------------------------------------------

--
-- Structure de la table `excedents`
--

DROP TABLE IF EXISTS `excedents`;
CREATE TABLE IF NOT EXISTS `excedents` (
  `idExcedent` int NOT NULL AUTO_INCREMENT,
  `quantite` int NOT NULL,
  `idMatiere` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idExcedent`),
  KEY `excedents_idmatiere_foreign` (`idMatiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fiche_detenteurs`
--

DROP TABLE IF EXISTS `fiche_detenteurs`;
CREATE TABLE IF NOT EXISTS `fiche_detenteurs` (
  `idFicheDetenteur` smallint NOT NULL AUTO_INCREMENT,
  `quantite` smallint NOT NULL,
  `idEmployee` bigint UNSIGNED NOT NULL,
  `idSousMatiere` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idFicheDetenteur`),
  KEY `fiche_detenteurs_idemployee_foreign` (`idEmployee`),
  KEY `fiche_detenteurs_idsousmatiere_foreign` (`idSousMatiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fiche_recensements`
--

DROP TABLE IF EXISTS `fiche_recensements`;
CREATE TABLE IF NOT EXISTS `fiche_recensements` (
  `idFicheRecensement` smallint NOT NULL AUTO_INCREMENT,
  `dateRecensement` date NOT NULL,
  `observation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exercice` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idSousMatiere` bigint UNSIGNED NOT NULL,
  `idExcedent` bigint UNSIGNED NOT NULL,
  `idDeficit` bigint UNSIGNED NOT NULL,
  `idEtat` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idFicheRecensement`),
  KEY `fiche_recensements_idsousmatiere_foreign` (`idSousMatiere`),
  KEY `fiche_recensements_idexcedent_foreign` (`idExcedent`),
  KEY `fiche_recensements_iddeficit_foreign` (`idDeficit`),
  KEY `fiche_recensements_idetat_foreign` (`idEtat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
CREATE TABLE IF NOT EXISTS `matieres` (
  `idMatiere` smallint NOT NULL AUTO_INCREMENT,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specification` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Aucune specification',
  `dateAcquisition` date NOT NULL,
  `prix` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prixMinimal` int DEFAULT '0',
  `prixMaximal` int DEFAULT '0',
  `societeAchat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dossierReference` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantite` smallint NOT NULL,
  `dateActualisation` datetime NOT NULL,
  `dateSortie` date NOT NULL,
  `numeroFolio` smallint NOT NULL,
  `observation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `etape` smallint NOT NULL,
  `idTypeEntree` bigint UNSIGNED NOT NULL,
  `idTableAmortissement` bigint UNSIGNED NOT NULL,
  `idEspeceUnite` bigint UNSIGNED NOT NULL,
  `idCategorie` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idMatiere`),
  KEY `matieres_idtypeentree_foreign` (`idTypeEntree`),
  KEY `matieres_idtableamortissement_foreign` (`idTableAmortissement`),
  KEY `matieres_idespeceunite_foreign` (`idEspeceUnite`),
  KEY `matieres_idcategorie_foreign` (`idCategorie`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matiere_receptions`
--

DROP TABLE IF EXISTS `matiere_receptions`;
CREATE TABLE IF NOT EXISTS `matiere_receptions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `idMatiere` bigint UNSIGNED NOT NULL,
  `idReception` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matiere_receptions_idmatiere_foreign` (`idMatiere`),
  KEY `matiere_receptions_idreception_foreign` (`idReception`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(26, '2014_10_12_000000_create_users_table', 3),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_25_080312_create_departement_table', 1),
(36, '2024_03_25_103726_create_categorie_table', 6),
(28, '2024_03_25_114425_create_taux_amortissement_table', 4),
(8, '2024_03_25_115824_create_etat_table', 1),
(9, '2024_03_25_120423_create_espece_unite_table', 1),
(10, '2024_03_25_120840_create_type_entree_table', 1),
(11, '2024_03_25_121454_create_table_amortissement_table', 1),
(25, '2024_03_25_183255_create_employee_table', 2),
(13, '2024_03_25_190411_create_matiere_table', 1),
(14, '2024_03_25_195632_create_deficit_table', 1),
(15, '2024_03_25_200323_create_excedent_table', 1),
(16, '2024_03_25_200853_create_sous_matiere_table', 1),
(17, '2024_03_25_202130_create_fiche_detenteur_table', 1),
(18, '2024_03_26_122324_create_fiche_recensement_table', 1),
(19, '2024_04_03_071612_create_demolition_table', 1),
(20, '2024_04_03_072740_create_ordre_entree_table', 1),
(21, '2024_04_03_075600_create_ordre_sortie_table', 1),
(22, '2024_04_03_080225_create_reception_table', 1),
(23, '2024_04_03_083817_create_dossier_reference_table', 1),
(24, '2024_04_08_184559_create_matiere_reception_table', 1),
(29, '2024_04_19_064800_create_taux_amortissements_table', 5),
(30, '2024_04_19_065000_create_espece_unites_table', 5),
(31, '2024_04_19_065238_create_fiche_detenteurs_table', 5),
(32, '2024_04_19_065353_create_fiche_recensements_table', 5),
(33, '2024_04_19_065441_create_sous_matieres_table', 5),
(34, '2024_04_19_065628_create_table_amortissements_table', 5),
(35, '2024_04_19_065817_create_type_entrees_table', 5);

-- --------------------------------------------------------

--
-- Structure de la table `ordreentree`
--

DROP TABLE IF EXISTS `ordreentree`;
CREATE TABLE IF NOT EXISTS `ordreentree` (
  `idPiece` smallint NOT NULL,
  `numeroOrdre` int NOT NULL,
  PRIMARY KEY (`idPiece`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ordresortie`
--

DROP TABLE IF EXISTS `ordresortie`;
CREATE TABLE IF NOT EXISTS `ordresortie` (
  `idPiece` smallint NOT NULL,
  `numeroOrdre` int NOT NULL,
  PRIMARY KEY (`idPiece`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `receptions`
--

DROP TABLE IF EXISTS `receptions`;
CREATE TABLE IF NOT EXISTS `receptions` (
  `idReception` smallint NOT NULL AUTO_INCREMENT,
  `referenceDAO` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objet` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreLot` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idReception`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sous_matieres`
--

DROP TABLE IF EXISTS `sous_matieres`;
CREATE TABLE IF NOT EXISTS `sous_matieres` (
  `idSousMatiere` smallint NOT NULL AUTO_INCREMENT,
  `datePriseEnCharge` date NOT NULL,
  `idEtat` bigint UNSIGNED NOT NULL,
  `idMatiere` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idSousMatiere`),
  KEY `sous_matieres_idetat_foreign` (`idEtat`),
  KEY `sous_matieres_idmatiere_foreign` (`idMatiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `table_amortissements`
--

DROP TABLE IF EXISTS `table_amortissements`;
CREATE TABLE IF NOT EXISTS `table_amortissements` (
  `idTableAmortissement` smallint NOT NULL AUTO_INCREMENT,
  `amortissementAnterieur` int NOT NULL,
  `dotationExercice` int NOT NULL,
  `idTauxAmortissement` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idTableAmortissement`),
  KEY `table_amortissements_idtauxamortissement_foreign` (`idTauxAmortissement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `taux_amortissements`
--

DROP TABLE IF EXISTS `taux_amortissements`;
CREATE TABLE IF NOT EXISTS `taux_amortissements` (
  `idTauxAmortissement` smallint NOT NULL AUTO_INCREMENT,
  `rubrique` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `taux` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idTauxAmortissement`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `taux_amortissements`
--

INSERT INTO `taux_amortissements` (`idTauxAmortissement`, `rubrique`, `taux`, `created_at`, `updated_at`) VALUES
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

-- --------------------------------------------------------

--
-- Structure de la table `type_entrees`
--

DROP TABLE IF EXISTS `type_entrees`;
CREATE TABLE IF NOT EXISTS `type_entrees` (
  `idTypeEntree` smallint NOT NULL AUTO_INCREMENT,
  `typeEntree` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idTypeEntree`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_entrees`
--

INSERT INTO `type_entrees` (`idTypeEntree`, `typeEntree`, `created_at`, `updated_at`) VALUES
(1, 'Titre honnereux', '2024-04-19 08:26:38', '2024-04-19 08:26:38'),
(2, 'Titre de don', '2024-04-19 08:26:38', '2024-04-19 08:26:38'),
(3, 'Titre de transfert', '2024-04-19 08:26:38', '2024-04-19 08:26:38');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricule` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poste` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sigle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idEmployee` bigint UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_idemployee_foreign` (`idEmployee`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `pseudo`, `email`, `email_verified_at`, `password`, `matricule`, `poste`, `sigle`, `idEmployee`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rakotondramanantsoa', 'Nehemia', 'Nehemia', 'nehemiarakotondramanantsoa19@gmail.com', NULL, '$2y$12$TuAOpBgi218EkgGWt9O13.Q7Dj3dSJpnLiTzgtmS7hEe8n70esRlm', 'admin1', 'Super admin', 'DAF', 84, 'tSiqeWpbg0y03FnfoA8A14ifCcEk1gOH58WsBS5yH309lBdQWgDg0lmuB4QH', '2024-04-18 08:14:47', '2024-04-18 08:14:47'),
(2, 'Tsara', 'Apostoly', 'Tsara', 'tsara@gmail.com', NULL, '$2y$12$nmt9PBGf2R3ZqvTngp5JmOlFG9s3NPD5.gjkKFEcgSaRyWD6zSxq2', 'admin3', 'Super admin', 'DAF', 86, NULL, '2024-04-18 08:45:37', '2024-04-18 08:45:37');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
