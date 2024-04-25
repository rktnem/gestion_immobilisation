-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 25 avr. 2024 à 06:04
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
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `classe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `deficits`
--

DROP TABLE IF EXISTS `deficits`;
CREATE TABLE IF NOT EXISTS `deficits` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantite` int NOT NULL,
  `matiere_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deficits_matiere_id_foreign` (`matiere_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `demolitions`
--

DROP TABLE IF EXISTS `demolitions`;
CREATE TABLE IF NOT EXISTS `demolitions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` linestring NOT NULL,
  `dateDemolition` date NOT NULL,
  `quantite` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matiere_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `demolitions_matiere_id_foreign` (`matiere_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

DROP TABLE IF EXISTS `departements`;
CREATE TABLE IF NOT EXISTS `departements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `departement` varchar(150) DEFAULT NULL,
  `sigle` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`id`, `departement`, `sigle`) VALUES
(1, 'Direction Administrative et Financière', 'DAF'),
(2, 'Direction Generale', 'DG'),
(3, 'Direction Infrastructure Géographique et Hydrographique', 'DIGH'),
(4, 'Direction des Relations Publiques et Institutionnelles', 'DRPI'),
(5, 'Direction de la Maitrise Ouvrage de Services Publics', 'DMOSP'),
(6, 'Personne Responsable Des Marchés Publics', 'PRMP');

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `matricule` varchar(10) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `email` varchar(200) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `poste` varchar(255) NOT NULL,
  `idDepartement` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`id`, `matricule`, `nom`, `prenom`, `email`, `genre`, `poste`, `idDepartement`) VALUES
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
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeUnite` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etats`
--

DROP TABLE IF EXISTS `etats`;
CREATE TABLE IF NOT EXISTS `etats` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeEtat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `excedents`
--

DROP TABLE IF EXISTS `excedents`;
CREATE TABLE IF NOT EXISTS `excedents` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantite` int NOT NULL,
  `matiere_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `excedents_matiere_id_foreign` (`matiere_id`)
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
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantite` smallint NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `sous_matiere_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fiche_detenteurs_employee_id_foreign` (`employee_id`),
  KEY `fiche_detenteurs_sous_matiere_id_foreign` (`sous_matiere_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fiche_recensements`
--

DROP TABLE IF EXISTS `fiche_recensements`;
CREATE TABLE IF NOT EXISTS `fiche_recensements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `dateRecensement` date NOT NULL,
  `observation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exercice` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sous_matiere_id` bigint UNSIGNED NOT NULL,
  `excedent_id` bigint UNSIGNED NOT NULL,
  `deficit_id` bigint UNSIGNED NOT NULL,
  `etat_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fiche_recensements_sous_matiere_id_foreign` (`sous_matiere_id`),
  KEY `fiche_recensements_excedent_id_foreign` (`excedent_id`),
  KEY `fiche_recensements_deficit_id_foreign` (`deficit_id`),
  KEY `fiche_recensements_etat_id_foreign` (`etat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
CREATE TABLE IF NOT EXISTS `matieres` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specification` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Aucune specification',
  `dateAcquisition` date NOT NULL,
  `prix` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prixMinimal` int DEFAULT '0',
  `prixMaximal` int DEFAULT '0',
  `societeAchat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantite` smallint NOT NULL,
  `dateActualisation` datetime NOT NULL,
  `dateSortie` date NOT NULL,
  `numeroFolio` smallint NOT NULL,
  `observation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `etape` smallint NOT NULL,
  `validate` smallint NOT NULL DEFAULT '0',
  `reception_id` bigint UNSIGNED NOT NULL,
  `type_entree_id` bigint UNSIGNED NOT NULL,
  `table_amortissement_id` bigint UNSIGNED NOT NULL,
  `espece_unite_id` bigint UNSIGNED NOT NULL,
  `categorie_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matieres_reception_id_foreign` (`reception_id`),
  KEY `matieres_type_entree_id_foreign` (`type_entree_id`),
  KEY `matieres_table_amortissement_id_foreign` (`table_amortissement_id`),
  KEY `matieres_espece_unite_id_foreign` (`espece_unite_id`),
  KEY `matieres_categorie_id_foreign` (`categorie_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `matieres`
--

INSERT INTO `matieres` (`id`, `designation`, `specification`, `dateAcquisition`, `prix`, `prixMinimal`, `prixMaximal`, `societeAchat`, `quantite`, `dateActualisation`, `dateSortie`, `numeroFolio`, `observation`, `etape`, `validate`, `reception_id`, `type_entree_id`, `table_amortissement_id`, `espece_unite_id`, `categorie_id`, `created_at`, `updated_at`) VALUES
(1, 'Ordinateur HP', 'Portable - 1920*1024 - core i7eme 5gen', '2024-04-24', '0', 1250000, 2500000, '', 3, '2024-04-24 18:05:07', '2024-04-24', 1, '', 1, 0, 1, 0, 0, 0, 0, '2024-04-24 15:05:07', '2024-04-24 15:05:07'),
(2, 'Moniteur Acer', NULL, '2024-04-24', '0', 500000, 650000, '', 7, '2024-04-24 18:05:07', '2024-04-24', 1, '', 1, 0, 1, 0, 0, 0, 0, '2024-04-24 15:05:07', '2024-04-24 15:05:07'),
(3, 'Chaise roulante', 'Aucune specification', '2024-04-24', '0', 250000, 3000000, '', 25, '2024-04-24 21:16:45', '2024-04-24', 1, '', 1, 0, 2, 0, 0, 0, 0, '2024-04-24 18:16:45', '2024-04-24 18:16:45'),
(4, 'Table de bureau', 'Aucune specification', '2024-04-24', '0', 1000000, 2000000, '', 2, '2024-04-24 21:16:45', '2024-04-24', 1, '', 1, 0, 2, 0, 0, 0, 0, '2024-04-24 18:16:45', '2024-04-24 18:16:45');

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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_25_080312_create_departement_table', 1),
(6, '2024_03_25_103726_create_categorie_table', 1),
(7, '2024_03_25_115824_create_etat_table', 1),
(8, '2024_03_25_183255_create_employee_table', 1),
(27, '2024_03_25_190411_create_matiere_table', 4),
(10, '2024_03_25_195632_create_deficit_table', 1),
(11, '2024_03_25_200323_create_excedent_table', 1),
(12, '2024_04_03_071612_create_demolition_table', 1),
(13, '2024_04_03_072740_create_ordre_entree_table', 1),
(14, '2024_04_03_075600_create_ordre_sortie_table', 1),
(28, '2024_04_03_080225_create_reception_table', 5),
(16, '2024_04_19_064800_create_taux_amortissements_table', 1),
(17, '2024_04_19_065000_create_espece_unites_table', 1),
(18, '2024_04_19_065238_create_fiche_detenteurs_table', 1),
(19, '2024_04_19_065353_create_fiche_recensements_table', 1),
(20, '2024_04_19_065441_create_sous_matieres_table', 1),
(21, '2024_04_19_065628_create_table_amortissements_table', 1),
(22, '2024_04_19_065817_create_type_entrees_table', 1);

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
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `referenceDAO` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objet` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreLot` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `receptions`
--

INSERT INTO `receptions` (`id`, `referenceDAO`, `objet`, `nombreLot`, `created_at`, `updated_at`) VALUES
(1, '04-22 FTM', 'Materiel informatique', 2, '2024-04-24 15:05:07', '2024-04-24 15:05:07'),
(2, '04-24 FTM', 'Mobilier de bureau', 2, '2024-04-24 18:16:45', '2024-04-24 18:16:45');

-- --------------------------------------------------------

--
-- Structure de la table `sous_matieres`
--

DROP TABLE IF EXISTS `sous_matieres`;
CREATE TABLE IF NOT EXISTS `sous_matieres` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `datePriseEnCharge` date NOT NULL,
  `etat_id` bigint UNSIGNED NOT NULL,
  `matiere_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sous_matieres_etat_id_foreign` (`etat_id`),
  KEY `sous_matieres_matiere_id_foreign` (`matiere_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `table_amortissements`
--

DROP TABLE IF EXISTS `table_amortissements`;
CREATE TABLE IF NOT EXISTS `table_amortissements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `amortissementAnterieur` int NOT NULL,
  `dotationExercice` int NOT NULL,
  `taux_amortissement_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table_amortissements_taux_amortissement_id_foreign` (`taux_amortissement_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `taux_amortissements`
--

DROP TABLE IF EXISTS `taux_amortissements`;
CREATE TABLE IF NOT EXISTS `taux_amortissements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `rubrique` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taux` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_entrees`
--

DROP TABLE IF EXISTS `type_entrees`;
CREATE TABLE IF NOT EXISTS `type_entrees` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeEntree` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `employee_id` bigint UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_employee_id_foreign` (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `pseudo`, `email`, `email_verified_at`, `password`, `matricule`, `poste`, `sigle`, `employee_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rakotondramanantsoa', 'Nehemia', 'Nehemia', 'nehemiarakotondramanantsoa19@gmail.com', NULL, '$2y$12$xMOEIY2hna8mR5cPMwWvHumL7Zrw5pUEvds/aCCCuWiyFUE/yAHbe', 'admin1', 'Super admin', 'DAF', 84, 'iNAcT7DSEUHN6badC9DwVkanK7wP6xpZLhWVIRZTDGhaPET8pAO4dqt6fxn7', '2024-04-24 07:19:37', '2024-04-24 07:19:37');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
