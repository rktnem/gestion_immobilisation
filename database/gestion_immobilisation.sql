-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2024 at 10:28 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion_immobilisation`
--
CREATE DATABASE IF NOT EXISTS `gestion_immobilisation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestion_immobilisation`;

-- --------------------------------------------------------

--
-- Table structure for table `agentdemolisseur`
--

CREATE TABLE `agentdemolisseur` (
  `idAgentDemolisseur` smallint(6) NOT NULL,
  `idEmployee` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agentrecenseur`
--

CREATE TABLE `agentrecenseur` (
  `idAgentRecenseur` varchar(50) NOT NULL,
  `idEmployee` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appartient`
--

CREATE TABLE `appartient` (
  `idMatiere` smallint(6) NOT NULL,
  `idReception` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` smallint(6) NOT NULL,
  `nomenclature` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deficit`
--

CREATE TABLE `deficit` (
  `idDeficit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `idMatiere` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demolition`
--

CREATE TABLE `demolition` (
  `idType` smallint(6) NOT NULL,
  `type` linestring NOT NULL,
  `dateDemolition` date NOT NULL,
  `quantite` varchar(50) NOT NULL,
  `idMatiere` smallint(6) NOT NULL,
  `idAgentDemolisseur` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departement`
--

CREATE TABLE `departement` (
  `idDepartement` smallint(6) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `sigle` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `depotmatiere`
--

CREATE TABLE `depotmatiere` (
  `idDepotMatiere` smallint(6) NOT NULL,
  `idEmployee` smallint(6) NOT NULL,
  `idMatiere` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dossierreference`
--

CREATE TABLE `dossierreference` (
  `idDossierReference` smallint(6) NOT NULL,
  `DAO` varchar(255) DEFAULT NULL,
  `PVR` varchar(255) NOT NULL,
  `paiement` varchar(255) DEFAULT NULL,
  `OE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `idEmployee` smallint(6) NOT NULL,
  `matricule` varchar(7) NOT NULL,
  `idDepartement` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `especeunite`
--

CREATE TABLE `especeunite` (
  `idEspeceUnite` smallint(6) NOT NULL,
  `typeUnite` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `etat`
--

CREATE TABLE `etat` (
  `idEtat` smallint(6) NOT NULL,
  `typeEtat` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `excedent`
--

CREATE TABLE `excedent` (
  `idExcedent` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `idMatiere` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fichedetenteur`
--

CREATE TABLE `fichedetenteur` (
  `idEmployee` smallint(6) NOT NULL,
  `idSousMatiere` smallint(6) NOT NULL,
  `idFicheDetenteur` smallint(7) NOT NULL,
  `quantite` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ficherecensement`
--

CREATE TABLE `ficherecensement` (
  `idAgentRecenseur` varchar(50) NOT NULL,
  `idExcedent` int(11) NOT NULL,
  `idEtat` smallint(6) NOT NULL,
  `idSousMatiere` smallint(6) NOT NULL,
  `idDeficit` int(11) NOT NULL,
  `idFicheRecensement` smallint(7) NOT NULL,
  `dateRecensement` date NOT NULL,
  `observation` text NOT NULL,
  `exercice` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matiere`
--

CREATE TABLE `matiere` (
  `idMatiere` smallint(6) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `dateAcquisition` date NOT NULL,
  `prix` varchar(10) NOT NULL,
  `societeAchat` varchar(50) NOT NULL,
  `dossierReference` varchar(4) NOT NULL,
  `quantite` smallint(6) NOT NULL,
  `dateActualisation` datetime NOT NULL,
  `dateSortie` date NOT NULL,
  `numeroFolio` smallint(6) NOT NULL,
  `observation` text NOT NULL,
  `phase` varchar(255) NOT NULL,
  `idTypeEntree` smallint(6) NOT NULL,
  `idTableAmortissement` smallint(6) NOT NULL,
  `idPiece` smallint(6) NOT NULL,
  `idEspeceUnite` smallint(6) NOT NULL,
  `idCategorie` smallint(6) NOT NULL,
  `idDossierReference` smallint(6) NOT NULL,
  `etape` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(363, '2014_10_12_000000_create_users_table', 1),
(364, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(365, '2019_08_19_000000_create_failed_jobs_table', 1),
(366, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(367, '2024_03_25_080312_create_departement_table', 1),
(368, '2024_03_25_103726_create_categorie_table', 1),
(369, '2024_03_25_114425_create_taux_amortissement_table', 1),
(370, '2024_03_25_115824_create_etat_table', 1),
(371, '2024_03_25_120251_create_piece_justificative_table', 1),
(372, '2024_03_25_120423_create_espece_unite_table', 1),
(373, '2024_03_25_120840_create_type_entree_table', 1),
(374, '2024_03_25_121454_create_table_amortissement_table', 1),
(375, '2024_03_25_183255_create_employee_table', 1),
(376, '2024_03_25_183854_create_agent_recenseur_table', 1),
(377, '2024_03_25_185734_create_agent_demolisseur_table', 1),
(378, '2024_03_25_190411_create_matiere_table', 1),
(379, '2024_03_25_194925_create_depot_matiere_table', 1),
(380, '2024_03_25_195632_create_deficit_table', 1),
(381, '2024_03_25_200323_create_excedent_table', 1),
(382, '2024_03_25_200853_create_sous_matiere_table', 1),
(383, '2024_03_25_202130_create_fiche_detenteur_table', 1),
(384, '2024_03_26_122324_create_fiche_recensement_table', 1),
(385, '2024_04_03_071612_create_demolition_table', 1),
(386, '2024_04_03_072740_create_ordre_entree_table', 1),
(387, '2024_04_03_075600_create_ordre_sortie_table', 1),
(388, '2024_04_03_080225_create_reception_table', 1),
(389, '2024_04_03_083817_create_dossier_reference_table', 1),
(390, '2024_04_03_084612_modify_matiere_table', 1),
(391, '2024_04_08_074914_modify_taux_amortissement_table', 1),
(392, '2024_04_08_104712_modify_reception_table', 1),
(393, '2024_04_08_184559_create_appartient_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ordreentree`
--

CREATE TABLE `ordreentree` (
  `idPiece` smallint(6) NOT NULL,
  `numeroOrdre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ordresortie`
--

CREATE TABLE `ordresortie` (
  `idPiece` smallint(6) NOT NULL,
  `numeroOrdre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piecejustificative`
--

CREATE TABLE `piecejustificative` (
  `idPiece` smallint(6) NOT NULL,
  `quantite` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reception`
--

CREATE TABLE `reception` (
  `idReception` smallint(6) NOT NULL,
  `referenceDAO` varchar(30) NOT NULL,
  `objet` varchar(150) NOT NULL,
  `nombreLot` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sousmatiere`
--

CREATE TABLE `sousmatiere` (
  `idSousMatiere` smallint(6) NOT NULL,
  `datePriseEnCharge` date NOT NULL,
  `idEtat` smallint(6) NOT NULL,
  `idMatiere` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tableamortissement`
--

CREATE TABLE `tableamortissement` (
  `idTableAmortissement` smallint(6) NOT NULL,
  `amortissementAnterieur` int(11) NOT NULL,
  `dotationExercice` int(11) NOT NULL,
  `idTauxAmortissement` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tauxamortissement`
--

CREATE TABLE `tauxamortissement` (
  `idTauxAmortissement` smallint(6) NOT NULL,
  `rubrique` varchar(200) NOT NULL,
  `taux` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typeentree`
--

CREATE TABLE `typeentree` (
  `idTypeEntree` smallint(6) NOT NULL,
  `typeEntree` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agentdemolisseur`
--
ALTER TABLE `agentdemolisseur`
  ADD PRIMARY KEY (`idAgentDemolisseur`),
  ADD KEY `agentdemolisseur_idemployee_foreign` (`idEmployee`);

--
-- Indexes for table `agentrecenseur`
--
ALTER TABLE `agentrecenseur`
  ADD PRIMARY KEY (`idAgentRecenseur`),
  ADD KEY `agentrecenseur_idemployee_foreign` (`idEmployee`);

--
-- Indexes for table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`idMatiere`,`idReception`),
  ADD KEY `appartient_idreception_foreign` (`idReception`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Indexes for table `deficit`
--
ALTER TABLE `deficit`
  ADD PRIMARY KEY (`idDeficit`),
  ADD KEY `deficit_idmatiere_foreign` (`idMatiere`);

--
-- Indexes for table `demolition`
--
ALTER TABLE `demolition`
  ADD PRIMARY KEY (`idType`),
  ADD KEY `demolition_idmatiere_foreign` (`idMatiere`),
  ADD KEY `demolition_idagentdemolisseur_foreign` (`idAgentDemolisseur`);

--
-- Indexes for table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`idDepartement`),
  ADD UNIQUE KEY `departement_sigle_unique` (`sigle`);

--
-- Indexes for table `depotmatiere`
--
ALTER TABLE `depotmatiere`
  ADD PRIMARY KEY (`idDepotMatiere`),
  ADD UNIQUE KEY `depotmatiere_idemployee_unique` (`idEmployee`),
  ADD KEY `depotmatiere_idmatiere_foreign` (`idMatiere`);

--
-- Indexes for table `dossierreference`
--
ALTER TABLE `dossierreference`
  ADD PRIMARY KEY (`idDossierReference`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`idEmployee`),
  ADD UNIQUE KEY `employee_matricule_unique` (`matricule`),
  ADD KEY `employee_iddepartement_foreign` (`idDepartement`);

--
-- Indexes for table `especeunite`
--
ALTER TABLE `especeunite`
  ADD PRIMARY KEY (`idEspeceUnite`);

--
-- Indexes for table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`idEtat`);

--
-- Indexes for table `excedent`
--
ALTER TABLE `excedent`
  ADD PRIMARY KEY (`idExcedent`),
  ADD KEY `excedent_idmatiere_foreign` (`idMatiere`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fichedetenteur`
--
ALTER TABLE `fichedetenteur`
  ADD PRIMARY KEY (`idEmployee`,`idSousMatiere`),
  ADD UNIQUE KEY `fichedetenteur_idfichedetenteur_unique` (`idFicheDetenteur`),
  ADD KEY `fichedetenteur_idsousmatiere_foreign` (`idSousMatiere`);

--
-- Indexes for table `ficherecensement`
--
ALTER TABLE `ficherecensement`
  ADD PRIMARY KEY (`idAgentRecenseur`,`idExcedent`,`idEtat`,`idSousMatiere`,`idDeficit`),
  ADD UNIQUE KEY `ficherecensement_idficherecensement_unique` (`idFicheRecensement`),
  ADD KEY `ficherecensement_idexcedent_foreign` (`idExcedent`),
  ADD KEY `ficherecensement_idetat_foreign` (`idEtat`),
  ADD KEY `ficherecensement_idsousmatiere_foreign` (`idSousMatiere`),
  ADD KEY `ficherecensement_iddeficit_foreign` (`idDeficit`);

--
-- Indexes for table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`idMatiere`),
  ADD UNIQUE KEY `matiere_idtypeentree_unique` (`idTypeEntree`),
  ADD UNIQUE KEY `matiere_idtableamortissement_unique` (`idTableAmortissement`),
  ADD UNIQUE KEY `matiere_idespeceunite_unique` (`idEspeceUnite`),
  ADD KEY `matiere_idpiece_foreign` (`idPiece`),
  ADD KEY `matiere_idcategorie_foreign` (`idCategorie`),
  ADD KEY `matiere_iddossierreference_foreign` (`idDossierReference`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordreentree`
--
ALTER TABLE `ordreentree`
  ADD PRIMARY KEY (`idPiece`);

--
-- Indexes for table `ordresortie`
--
ALTER TABLE `ordresortie`
  ADD PRIMARY KEY (`idPiece`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `piecejustificative`
--
ALTER TABLE `piecejustificative`
  ADD PRIMARY KEY (`idPiece`);

--
-- Indexes for table `reception`
--
ALTER TABLE `reception`
  ADD PRIMARY KEY (`idReception`);

--
-- Indexes for table `sousmatiere`
--
ALTER TABLE `sousmatiere`
  ADD PRIMARY KEY (`idSousMatiere`),
  ADD KEY `sousmatiere_idetat_foreign` (`idEtat`),
  ADD KEY `sousmatiere_idmatiere_foreign` (`idMatiere`);

--
-- Indexes for table `tableamortissement`
--
ALTER TABLE `tableamortissement`
  ADD PRIMARY KEY (`idTableAmortissement`),
  ADD KEY `tableamortissement_idtauxamortissement_foreign` (`idTauxAmortissement`);

--
-- Indexes for table `tauxamortissement`
--
ALTER TABLE `tauxamortissement`
  ADD PRIMARY KEY (`idTauxAmortissement`);

--
-- Indexes for table `typeentree`
--
ALTER TABLE `typeentree`
  ADD PRIMARY KEY (`idTypeEntree`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agentdemolisseur`
--
ALTER TABLE `agentdemolisseur`
  MODIFY `idAgentDemolisseur` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deficit`
--
ALTER TABLE `deficit`
  MODIFY `idDeficit` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demolition`
--
ALTER TABLE `demolition`
  MODIFY `idType` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departement`
--
ALTER TABLE `departement`
  MODIFY `idDepartement` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `depotmatiere`
--
ALTER TABLE `depotmatiere`
  MODIFY `idDepotMatiere` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dossierreference`
--
ALTER TABLE `dossierreference`
  MODIFY `idDossierReference` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `idEmployee` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `especeunite`
--
ALTER TABLE `especeunite`
  MODIFY `idEspeceUnite` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `etat`
--
ALTER TABLE `etat`
  MODIFY `idEtat` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `excedent`
--
ALTER TABLE `excedent`
  MODIFY `idExcedent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fichedetenteur`
--
ALTER TABLE `fichedetenteur`
  MODIFY `idFicheDetenteur` smallint(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ficherecensement`
--
ALTER TABLE `ficherecensement`
  MODIFY `idFicheRecensement` smallint(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `idMatiere` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=394;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `piecejustificative`
--
ALTER TABLE `piecejustificative`
  MODIFY `idPiece` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reception`
--
ALTER TABLE `reception`
  MODIFY `idReception` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sousmatiere`
--
ALTER TABLE `sousmatiere`
  MODIFY `idSousMatiere` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tableamortissement`
--
ALTER TABLE `tableamortissement`
  MODIFY `idTableAmortissement` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tauxamortissement`
--
ALTER TABLE `tauxamortissement`
  MODIFY `idTauxAmortissement` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typeentree`
--
ALTER TABLE `typeentree`
  MODIFY `idTypeEntree` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agentdemolisseur`
--
ALTER TABLE `agentdemolisseur`
  ADD CONSTRAINT `agentdemolisseur_idemployee_foreign` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`idEmployee`);

--
-- Constraints for table `agentrecenseur`
--
ALTER TABLE `agentrecenseur`
  ADD CONSTRAINT `agentrecenseur_idemployee_foreign` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`idEmployee`);

--
-- Constraints for table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_idmatiere_foreign` FOREIGN KEY (`idMatiere`) REFERENCES `matiere` (`idMatiere`),
  ADD CONSTRAINT `appartient_idreception_foreign` FOREIGN KEY (`idReception`) REFERENCES `reception` (`idReception`);

--
-- Constraints for table `deficit`
--
ALTER TABLE `deficit`
  ADD CONSTRAINT `deficit_idmatiere_foreign` FOREIGN KEY (`idMatiere`) REFERENCES `matiere` (`idMatiere`);

--
-- Constraints for table `demolition`
--
ALTER TABLE `demolition`
  ADD CONSTRAINT `demolition_idagentdemolisseur_foreign` FOREIGN KEY (`idAgentDemolisseur`) REFERENCES `agentdemolisseur` (`idAgentDemolisseur`),
  ADD CONSTRAINT `demolition_idmatiere_foreign` FOREIGN KEY (`idMatiere`) REFERENCES `matiere` (`idMatiere`);

--
-- Constraints for table `depotmatiere`
--
ALTER TABLE `depotmatiere`
  ADD CONSTRAINT `depotmatiere_idemployee_foreign` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`idEmployee`),
  ADD CONSTRAINT `depotmatiere_idmatiere_foreign` FOREIGN KEY (`idMatiere`) REFERENCES `matiere` (`idMatiere`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_iddepartement_foreign` FOREIGN KEY (`idDepartement`) REFERENCES `departement` (`idDepartement`);

--
-- Constraints for table `excedent`
--
ALTER TABLE `excedent`
  ADD CONSTRAINT `excedent_idmatiere_foreign` FOREIGN KEY (`idMatiere`) REFERENCES `matiere` (`idMatiere`);

--
-- Constraints for table `fichedetenteur`
--
ALTER TABLE `fichedetenteur`
  ADD CONSTRAINT `fichedetenteur_idemployee_foreign` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`idEmployee`),
  ADD CONSTRAINT `fichedetenteur_idsousmatiere_foreign` FOREIGN KEY (`idSousMatiere`) REFERENCES `sousmatiere` (`idSousMatiere`);

--
-- Constraints for table `ficherecensement`
--
ALTER TABLE `ficherecensement`
  ADD CONSTRAINT `ficherecensement_idagentrecenseur_foreign` FOREIGN KEY (`idAgentRecenseur`) REFERENCES `agentrecenseur` (`idAgentRecenseur`),
  ADD CONSTRAINT `ficherecensement_iddeficit_foreign` FOREIGN KEY (`idDeficit`) REFERENCES `deficit` (`idDeficit`),
  ADD CONSTRAINT `ficherecensement_idetat_foreign` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`idEtat`),
  ADD CONSTRAINT `ficherecensement_idexcedent_foreign` FOREIGN KEY (`idExcedent`) REFERENCES `excedent` (`idExcedent`),
  ADD CONSTRAINT `ficherecensement_idsousmatiere_foreign` FOREIGN KEY (`idSousMatiere`) REFERENCES `sousmatiere` (`idSousMatiere`);

--
-- Constraints for table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `matiere_idcategorie_foreign` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`),
  ADD CONSTRAINT `matiere_iddossierreference_foreign` FOREIGN KEY (`idDossierReference`) REFERENCES `dossierreference` (`idDossierReference`),
  ADD CONSTRAINT `matiere_idespeceunite_foreign` FOREIGN KEY (`idEspeceUnite`) REFERENCES `especeunite` (`idEspeceUnite`),
  ADD CONSTRAINT `matiere_idpiece_foreign` FOREIGN KEY (`idPiece`) REFERENCES `piecejustificative` (`idPiece`),
  ADD CONSTRAINT `matiere_idtableamortissement_foreign` FOREIGN KEY (`idTableAmortissement`) REFERENCES `tableamortissement` (`idTableAmortissement`),
  ADD CONSTRAINT `matiere_idtypeentree_foreign` FOREIGN KEY (`idTypeEntree`) REFERENCES `typeentree` (`idTypeEntree`);

--
-- Constraints for table `ordreentree`
--
ALTER TABLE `ordreentree`
  ADD CONSTRAINT `ordreentree_idpiece_foreign` FOREIGN KEY (`idPiece`) REFERENCES `piecejustificative` (`idPiece`);

--
-- Constraints for table `ordresortie`
--
ALTER TABLE `ordresortie`
  ADD CONSTRAINT `ordresortie_idpiece_foreign` FOREIGN KEY (`idPiece`) REFERENCES `piecejustificative` (`idPiece`);

--
-- Constraints for table `sousmatiere`
--
ALTER TABLE `sousmatiere`
  ADD CONSTRAINT `sousmatiere_idetat_foreign` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`idEtat`),
  ADD CONSTRAINT `sousmatiere_idmatiere_foreign` FOREIGN KEY (`idMatiere`) REFERENCES `matiere` (`idMatiere`);

--
-- Constraints for table `tableamortissement`
--
ALTER TABLE `tableamortissement`
  ADD CONSTRAINT `tableamortissement_idtauxamortissement_foreign` FOREIGN KEY (`idTauxAmortissement`) REFERENCES `tauxamortissement` (`idTauxAmortissement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
