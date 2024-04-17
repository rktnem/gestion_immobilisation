-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 17 avr. 2024 à 07:59
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
-- Structure de la table `agentdemolisseur`
--

DROP TABLE IF EXISTS `agentdemolisseur`;
CREATE TABLE IF NOT EXISTS `agentdemolisseur` (
  `idAgentDemolisseur` smallint NOT NULL AUTO_INCREMENT,
  `idEmployee` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idAgentDemolisseur`),
  KEY `agentdemolisseur_idemployee_foreign` (`idEmployee`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `agentrecenseurs`
--

DROP TABLE IF EXISTS `agentrecenseurs`;
CREATE TABLE IF NOT EXISTS `agentrecenseurs` (
  `idAgentRecenseur` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idEmployee` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idAgentRecenseur`),
  KEY `agentrecenseurs_idemployee_foreign` (`idEmployee`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `idCategorie` smallint NOT NULL AUTO_INCREMENT,
  `nomenclature` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `deficits`
--

DROP TABLE IF EXISTS `deficits`;
CREATE TABLE IF NOT EXISTS `deficits` (
  `idDeficit` int NOT NULL AUTO_INCREMENT,
  `quantite` int NOT NULL,
  `idMatiere` smallint NOT NULL,
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
(4, 'Direction des Relations Publiques et Institutionelles', 'DRPI'),
(5, 'Direction de la Maitrise Ouvrage de Services Publics', 'DMOSP'),
(6, 'Personne Responsable Des Marchés Publics', 'PRMP');

-- --------------------------------------------------------

--
-- Structure de la table `depotmatieres`
--

DROP TABLE IF EXISTS `depotmatieres`;
CREATE TABLE IF NOT EXISTS `depotmatieres` (
  `idDepotMatiere` smallint NOT NULL AUTO_INCREMENT,
  `idEmployee` smallint NOT NULL,
  `idMatiere` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idDepotMatiere`),
  UNIQUE KEY `depotmatieres_idemployee_unique` (`idEmployee`),
  KEY `depotmatieres_idmatiere_foreign` (`idMatiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `idEmployee` smallint NOT NULL AUTO_INCREMENT,
  `matricule` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poste` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idDepartement` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idEmployee`),
  UNIQUE KEY `employees_matricule_unique` (`matricule`),
  KEY `employees_iddepartement_foreign` (`idDepartement`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`idEmployee`, `matricule`, `nom`, `prenom`, `poste`, `idDepartement`, `created_at`, `updated_at`) VALUES
(1, '225263', 'Rakotondramanantsoa', 'Nehemia', 'Directeur de cabinet', 2, '2024-04-16 08:13:18', '2024-04-16 08:13:18'),
(2, '263855', 'Ratovoherimanana', 'Arotoby', 'Chef d\'entretien', 4, '2024-04-16 08:14:58', '2024-04-16 08:14:58'),
(3, '692522', 'Randriampahafahana', 'Nomenjanahary Tsiky', 'Chef de file UGPM', 6, '2024-04-17 06:28:36', '2024-04-17 06:28:36');

-- --------------------------------------------------------

--
-- Structure de la table `especeunites`
--

DROP TABLE IF EXISTS `especeunites`;
CREATE TABLE IF NOT EXISTS `especeunites` (
  `idEspeceUnite` smallint NOT NULL AUTO_INCREMENT,
  `typeUnite` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idEspeceUnite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `excedents`
--

DROP TABLE IF EXISTS `excedents`;
CREATE TABLE IF NOT EXISTS `excedents` (
  `idExcedent` int NOT NULL AUTO_INCREMENT,
  `quantite` int NOT NULL,
  `idMatiere` smallint NOT NULL,
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
-- Structure de la table `fichedetenteurs`
--

DROP TABLE IF EXISTS `fichedetenteurs`;
CREATE TABLE IF NOT EXISTS `fichedetenteurs` (
  `idEmployee` smallint NOT NULL,
  `idSousMatiere` smallint NOT NULL,
  `idFicheDetenteur` smallint NOT NULL AUTO_INCREMENT,
  `quantite` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idEmployee`,`idSousMatiere`),
  UNIQUE KEY `fichedetenteurs_idfichedetenteur_unique` (`idFicheDetenteur`),
  KEY `fichedetenteurs_idsousmatiere_foreign` (`idSousMatiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ficherecensements`
--

DROP TABLE IF EXISTS `ficherecensements`;
CREATE TABLE IF NOT EXISTS `ficherecensements` (
  `idAgentRecenseur` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idExcedent` int NOT NULL,
  `idEtat` smallint NOT NULL,
  `idSousMatiere` smallint NOT NULL,
  `idDeficit` int NOT NULL,
  `idFicheRecensement` smallint NOT NULL AUTO_INCREMENT,
  `dateRecensement` date NOT NULL,
  `observation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exercice` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idAgentRecenseur`,`idExcedent`,`idEtat`,`idSousMatiere`,`idDeficit`),
  UNIQUE KEY `ficherecensements_idficherecensement_unique` (`idFicheRecensement`),
  KEY `ficherecensements_idexcedent_foreign` (`idExcedent`),
  KEY `ficherecensements_idetat_foreign` (`idEtat`),
  KEY `ficherecensements_idsousmatiere_foreign` (`idSousMatiere`),
  KEY `ficherecensements_iddeficit_foreign` (`idDeficit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matierereceptions`
--

DROP TABLE IF EXISTS `matierereceptions`;
CREATE TABLE IF NOT EXISTS `matierereceptions` (
  `idMatiere` smallint NOT NULL,
  `idReception` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idMatiere`,`idReception`),
  KEY `matierereceptions_idreception_foreign` (`idReception`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
CREATE TABLE IF NOT EXISTS `matieres` (
  `idMatiere` smallint NOT NULL AUTO_INCREMENT,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateAcquisition` date NOT NULL,
  `prix` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `societeAchat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dossierReference` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantite` smallint NOT NULL,
  `dateActualisation` datetime NOT NULL,
  `dateSortie` date NOT NULL,
  `numeroFolio` smallint NOT NULL,
  `observation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phase` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idTypeEntree` smallint NOT NULL,
  `idTableAmortissement` smallint NOT NULL,
  `idPiece` smallint NOT NULL,
  `idEspeceUnite` smallint NOT NULL,
  `idCategorie` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `etape` int NOT NULL,
  PRIMARY KEY (`idMatiere`),
  UNIQUE KEY `matieres_idtypeentree_unique` (`idTypeEntree`),
  UNIQUE KEY `matieres_idtableamortissement_unique` (`idTableAmortissement`),
  UNIQUE KEY `matieres_idespeceunite_unique` (`idEspeceUnite`),
  KEY `matieres_idcategorie_foreign` (`idCategorie`)
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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(35, '2014_10_12_000000_create_users_table', 2),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_25_080312_create_departement_table', 1),
(6, '2024_03_25_103726_create_categorie_table', 1),
(7, '2024_03_25_114425_create_taux_amortissement_table', 1),
(8, '2024_03_25_115824_create_etat_table', 1),
(9, '2024_03_25_120251_create_piece_justificative_table', 1),
(10, '2024_03_25_120423_create_espece_unite_table', 1),
(11, '2024_03_25_120840_create_type_entree_table', 1),
(12, '2024_03_25_121454_create_table_amortissement_table', 1),
(13, '2024_03_25_183255_create_employee_table', 1),
(14, '2024_03_25_183854_create_agent_recenseur_table', 1),
(15, '2024_03_25_185734_create_agent_demolisseur_table', 1),
(16, '2024_03_25_190411_create_matiere_table', 1),
(17, '2024_03_25_194925_create_depot_matiere_table', 1),
(18, '2024_03_25_195632_create_deficit_table', 1),
(19, '2024_03_25_200323_create_excedent_table', 1),
(20, '2024_03_25_200853_create_sous_matiere_table', 1),
(21, '2024_03_25_202130_create_fiche_detenteur_table', 1),
(22, '2024_03_26_122324_create_fiche_recensement_table', 1),
(23, '2024_04_03_071612_create_demolition_table', 1),
(24, '2024_04_03_072740_create_ordre_entree_table', 1),
(25, '2024_04_03_075600_create_ordre_sortie_table', 1),
(26, '2024_04_03_080225_create_reception_table', 1),
(27, '2024_04_03_083817_create_dossier_reference_table', 1),
(28, '2024_04_03_084612_modify_matiere_table', 1),
(29, '2024_04_08_074914_modify_taux_amortissement_table', 1),
(30, '2024_04_08_104712_modify_reception_table', 1),
(31, '2024_04_08_184559_create_appartient_table', 1);

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
-- Structure de la table `piecejustificative`
--

DROP TABLE IF EXISTS `piecejustificative`;
CREATE TABLE IF NOT EXISTS `piecejustificative` (
  `idPiece` smallint NOT NULL AUTO_INCREMENT,
  `quantite` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idPiece`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `receptions`
--

DROP TABLE IF EXISTS `receptions`;
CREATE TABLE IF NOT EXISTS `receptions` (
  `idReception` smallint NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `referenceDAO` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objet` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreLot` smallint NOT NULL,
  PRIMARY KEY (`idReception`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sousmatieres`
--

DROP TABLE IF EXISTS `sousmatieres`;
CREATE TABLE IF NOT EXISTS `sousmatieres` (
  `idSousMatiere` smallint NOT NULL AUTO_INCREMENT,
  `datePriseEnCharge` date NOT NULL,
  `idEtat` smallint NOT NULL,
  `idMatiere` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idSousMatiere`),
  KEY `sousmatieres_idetat_foreign` (`idEtat`),
  KEY `sousmatieres_idmatiere_foreign` (`idMatiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tableamortissements`
--

DROP TABLE IF EXISTS `tableamortissements`;
CREATE TABLE IF NOT EXISTS `tableamortissements` (
  `idTableAmortissement` smallint NOT NULL AUTO_INCREMENT,
  `amortissementAnterieur` int NOT NULL,
  `dotationExercice` int NOT NULL,
  `idTauxAmortissement` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idTableAmortissement`),
  KEY `tableamortissements_idtauxamortissement_foreign` (`idTauxAmortissement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tauxamortissements`
--

DROP TABLE IF EXISTS `tauxamortissements`;
CREATE TABLE IF NOT EXISTS `tauxamortissements` (
  `idTauxAmortissement` smallint NOT NULL AUTO_INCREMENT,
  `rubrique` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taux` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idTauxAmortissement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `typeentrees`
--

DROP TABLE IF EXISTS `typeentrees`;
CREATE TABLE IF NOT EXISTS `typeentrees` (
  `idTypeEntree` smallint NOT NULL AUTO_INCREMENT,
  `typeEntree` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idTypeEntree`)
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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `pseudo`, `email`, `email_verified_at`, `password`, `matricule`, `poste`, `sigle`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rakotondramanantsoa', 'Nehemia', 'Toby', 'rakoto@gmail.com', NULL, '$2y$12$fk86MfF2WhIrYuSrcKPEveCARTazDGPXX8svoIT.9IKKNLukD8q8C', '225263', 'Directeur de cabinet', 'DG', NULL, '2024-04-17 02:58:51', '2024-04-17 02:58:51'),
(2, 'Ratovoherimanana', 'Arotoby', 'Nehemia', 'nehemiarakotondramanantsoa19@gmail.com', NULL, '$2y$12$11wOCApF66cELgj6.B6oie9cXqZWEnwsPALaES4qH92hx7wo0rUk6', '263855', 'Chef d\'entretien', 'DRPI', NULL, '2024-04-17 03:27:06', '2024-04-17 03:27:06'),
(3, 'Randriampahafahana', 'Nomenjanahary Tsiky', 'Tsiky', 'tsiky@gmail.com', NULL, '$2y$12$puju/zFNfR1pDIzOhu7l1.CunSClB.4G1/hRYgC4roxgcm5aAGuJG', '692522', 'Chef de file UGPM', 'PRMP', NULL, '2024-04-17 04:51:35', '2024-04-17 04:51:35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
