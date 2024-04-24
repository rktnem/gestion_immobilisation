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
-- Structure de la table `tblemployees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(10) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `email` varchar(200) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `poste` varchar(255) NOT NULL,
  `idDepartement` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tblemployees`
--

INSERT INTO `employees` (`id`, `matricule`, `nom`, `prenom`, `email`, `genre`, `poste`, `idDepartement`) VALUES
(1, '335546', 'RANDRIAMANANA', 'Malala Fidèle', 'malala@gmail.com', 'Male', 'Directeur du DRPI', 4),
(2, '318831', 'SOAMIAFARA ', 'Valivonintsoa', 'valivonintsoa@gmail.com', 'Female', 'Secretaire du DRPI', 4),
(3,'255335','RAZANAHARIMAVO','Lalao','lalao@gmail.com','Female','Chef de service bureau des ventes', 4),
(4, '255332', 'RAHAGALALAO', 'Marie Germaine', 'marie@gmail.com', 'Female', 'Chef de division communication institutionnelle', 4),
(5, '318814', 'RAHARISON', 'Paul Henrili', 'paul@gmail.com', 'Male', 'Chef de division imprimerie', 4),
(6, '287179', 'RAVELO', 'Felasoa', 'felasoa@gmail.com', 'Female', 'Agent de reception', 4),
(7, '318840', 'RATSIMBAZAFY', 'Toavina Luc Valerie', 'luc@gmail.com', 'Male', 'Operateur PAO', 4),
(8, '318817', 'RANDRIANARY', 'Elie', 'elie@gmail.com', 'Male', 'Agent de finition', 4),
(9, '274699', 'RAKOTONIAINA', 'Albert', 'albert@gmail.com', 'Male', 'Agent de finition', 4),
(10, '318827', 'ANDRIANARY', 'Narcisse Eric', 'eric@gmail.com', 'Male', 'Agent de finition', 4),
(11, '318878', 'RAZAKAHERILALA', 'Rija Mampionona', 'rija@gmail.com', 'Male', 'Conducteur offset', 4),
(12, '274713', 'RAKOTOARISOA', 'Stéphane Fabrice', 'fabrice@gmail.com', 'Male', 'Agent de finition', 4),
(13, '318842', 'RAKOTONDRABARY', 'Luc Anatole', 'anatole@gmail.com', 'Male', 'Agent de finition', 4),
(14, '000008', 'RAJAONARY', 'Dina Harilalaina Christian', 'dina@gmail.com', 'Male', 'Chauffeur mecanicien', 4),
(15, '318823', 'NARY HERINIRINA', 'Iarivo', 'iarivo@gmail.com', 'Female', 'Directeur du DIGH', 3),
(16, '318875', 'ANDRIANARISON', "Misan'ny Farany Nirina", 'misa@gmail.com', 'Male', 'Chef de service geodesie et nivellement', 3),
(17, '387173', 'RAHAJANIRINA', 'Michelle', 'michelle@gmail.com', 'Female', 'Chef de service imagerie espace et photographie', 3),
(18, '274701', 'RANDRIATAFIKA', 'Nivomalala Tinasoa', 'tinasoa@gmail.com', 'Female', 'Chef de division cartes thematiques', 3),
(19, '273114', 'ANDRIATSARAFARA', 'Lanto Harimanana', 'lanto@gmail.com', 'Male', 'Operateur', 3),
(20, '318818', 'RAKOTOMALALA', 'Elie Rinah', 'rinah@gmail.com', 'Male', 'Operateur', 3),
(21, '287166', 'RAMANANDRAIBE', 'Andoniaina Abel Dennis', 'dennis@gmail.com', 'Male', 'Operateur', 3),
(22, '318882', 'RANDIMBISON', 'Mamy', 'mamy@gmail.com', 'Male', 'Operateur', 3),
(23, '318838', 'RAVELOMANANTSOA', 'Andriamifidy', 'andriamifidy@gmail.com', 'Male', 'Chef de division cartes topographiques', 3),
(24, '287172', 'RANDRIAMANANA', 'Lydia Veromanitra', 'lydia@gmail.com', 'Female', 'Operateur', 3),
(25, '494146', 'RANDRIAMIARAMBOLANA', 'Iratra Sarobidy', 'iratra@gmail.com', 'Female', 'Collaborateur technique', 3),
(26, '287170', 'RANGODONARISON', 'Fanja Rasoarinoro Onitraina', 'fanja@gmail.com', 'Female', 'Operateur', 3),
(27, '318839', 'RAZAFINDRAZAKA', 'Fanomezantsoa Johanesa', 'johanesa@gmail.com', 'Male', 'Operateur', 3),
(28, '255325', 'RANDRIAMANANTENA', 'Andriamboavonjy Pierre R', 'pierre@gmail.com', 'Male', 'Operateur', 3),
(29, '318849', 'RANDRENJASON', 'Lalaharizo Andriamiadana Eugene', 'eugene@gmail.com', 'Male', 'Operateur', 3),
(30, '318825', 'RAMBOLATIANA', 'Alphonse', 'alphonse@gmail.com', 'Male', 'Operateur', 3),
(31, '287168', 'RAFARASOA', 'Hanta', 'hanta@gmail.com', 'Female', '', 3),
(32, '287171', 'RAJAOBSON', 'Solofoniaina Fanomezantsoa', 'solofoniaina@gmail.com', 'Male', '', 3),
(33, '273111', 'ANDRIANJATOVO', 'Haja', 'haja@gmail.com', 'Male', 'Operateur', 3),
(34, '318847', 'RAZAFINANTOANINA', 'Hery Tsiry', 'tsiry@gmail.com', 'Male', '', 3),
(35, '297160', 'RASOLONIRINA', 'Haja Lalao', 'lalao@gmail.com', 'Male', '', 3),
(36, '484143', 'RAKOTOARIMAHEFA', 'Tojo Nirina', 'nirina@gmail.com', 'Male', '', 3),
(37, '318845', 'RAKOTONDRAINIBE', 'Norolalao', 'norolalao@gmail.com', 'Female', 'Personne responsables des marchés publiques', 6),
(38, '273112', 'RAKOTONDRABAKO', 'Lisy Misarivelo ', 'lisy@gmail.com', 'Female', 'Chef de file UGPM', 6),
(39, '318870', 'RAVELOSON', 'Jean Jacques', 'jjacques@gmail.com', 'Male', "Agent de l'UGPM", 6),
(40, '318871', 'RAMANANTSOA', 'John Eric', 'johneric@gmail.com', 'Male', "Agent de l'UGPM", 6),
(41, '247596', 'RAHAINGOALISON', 'Narizo Mahefa', 'narizo@gmail.com', 'Male', 'Directeur du DMOSP', 5),
(42, '352679', 'ANDRIANJAFIRAVELO', 'Tsitohaina', 'tsito@gmail.com', 'Male', 'Chef de service de reglementation normalisation et VISA', 5),
(43, '352580', 'BAOVOLA', 'Marie Anna', 'anna@gmail.com', 'Female', "Chef de service systeme d'informatique", 5),
(44, '318853', 'HERSSIL', 'Adolphe', 'adolphe@gmail.com', 'Male', 'Chef de division maintenance', 5),
(45, '318833', 'RAKOTONIAINA', 'Harinjaka Roger Jimmy Michaud', 'michaud@gmail.com', 'Male', 'Agent de maintenance', 5),
(46, '318854', 'RAKOTOARIVONY', 'Alpha', 'alpha@gmail.com', 'Male', 'Agent de maintenance', 5),
(47, '318880', 'RAKOTONIAINA', 'Tiana Lucien', 'tlucien@gmail.com', 'Male', 'Archiviste cartotheque et phototheque', 5),
(48, '274697', 'RAKOTOARIVELO', 'Yvon Tony Rodolphe', 'yvon@gmail.com', 'Male', 'Operateur', 5),
(49, '274700', 'RASOANAIVO', 'Réné Marius', 'rmarius@gmail.com', 'Male', 'Archive numerique', 5),
(50, '255337', 'RAKOTONIAINA RABENORO', 'Barry ', 'barry@gmail.com', 'Male', 'Directeur du DAF', 1),
(51, '000009', 'RAZAFINIMARO', 'Miorantsalama Sandra', 'miorasandra@gmail.com', 'Female', 'Secretaire du DAF', 1),
(52, '318852', 'RAMINOARISOA', 'Fanjaniaina Fortunat', 'fanjafortunat@gmail.com', 'Female', 'Chef de service administratif et approvisionnement', 1),
(53, '318841', 'RAINIZAFINDRAFARASON', 'Jean Bartho Mathieu', 'bartho@gmail.com', 'Male', "Chef d'equipe garage", 1),
(54, '000007', 'RADIMY ANDRIAMIZAO', 'Niainaharilala', 'niainharilala@gmail.com', 'Male', '', 1),
(55, '318828', 'RAMANANTSIALONINA', 'Alain Raymond', 'alraymond@gmail.com', 'Male', '', 1),
(56, '000006', 'ANDRIAMANANTENA', 'Tojomampianina Joharisoa', 'johary@gmail.com', 'Male', '', 1),
(57, '318828', 'RAHARIMALALA', 'Voahangy Odette', 'voahangy@gmail.com', 'Female', '', 1),
(58, '318844', 'RANAIVOSON', 'Tiana Alexandre', 'tialexandre@gmail.com', 'Male', '', 1),
(59, '249684', 'RAZAFINDRAMANANA', 'Solange', 'solange@gmail.com', 'Female', '', 1),
(60, '000009', 'RAHARISON', 'Felaniaina Prisca', 'felanaprisca@gmail.com', 'Female', '', 1),
(61, '249694', 'SOLONIRINA', 'Rolland', 'rol@gmail.com', 'Male', '', 1),
(62, '318815', 'RAKOTOMAMONJY', 'Baka Olivier', 'olivierb@gmail.com', 'Male', '', 1),
(63, '318874', 'RABEATOANDRO', 'Anjaranirina Harinelina', 'anjaranirina@gmail.com', 'Female', 'Chef de service ressources humaines', 1),
(64, '318851', 'RAKOTOARINORO', 'Bina Harimalala', 'bina@gmail.com', 'Female', 'Chef de division gestion administrative', 1),
(65, '255321', 'ANDRIANARIVELO', 'Fanomezantsoa H Loeticia', 'hloeticia@gmail.com', 'Female', '', 1),
(66, '287167', 'RABARIVELOARIJAONA', 'Njakandraibe', 'njaka@gmail.com', 'Male', '', 1),
(67, '318832', 'RALALASOA', 'Andriamanana Solofoniaina David', 'laladavid@gmail.com', 'Male', '', 1),
(68, '405508', 'RABEARISOA', 'Lanto Nirivola', 'lantoniry@gmail.com', 'Female', 'Chef de service finances et comptabilité', 1),
(69, '318881', 'RAVAOMIARANA', 'Farasoa Yvette', 'farasoa@gmail.com', 'Female', 'Aide comptable(comptabilité matiere)', 1),
(70, '405508', 'RANDRIANARIMANANA', 'Nangolanjara', 'nangolanjara@gmail.com', 'Male', 'Comptable', 1),
(71, '318837', 'RAJAONARISON', 'Jean Desiré Delphin', 'jean@gmail.com', 'Male', 'Directeur générale', 2),
(72, '312336', 'MAHASOLO', 'Désiré Auguste', 'dauguste@gmail.com', 'Male', 'Agent comptable', 2),
(73, '405567', 'RAHOLY', 'Herimamy', 'herimamy@gmail.com', 'Female', 'Aide comptable', 2),
(74, '287174', 'RAZAFINIRINA', 'Marie Clemence', 'marieclemence@gmail.com', 'Female', 'Regisseur de recettes', 2),
(75, '316830', 'RADERASON', 'Andriantiana Hery', 'andryhery@gmail.com', 'Male', 'Agent de recouvrement', 2),
(76, '318877', 'RAZAFINDRAMIARA', 'Lova Salohy', 'salohy@gmail.com', 'Female', 'Secretaire du DG', 2),
(77, '405509', 'IARIVONY', 'Felana', 'iaryfelana@gmail.com', 'Female', 'Seretaire du DG', 2),
(78, '318866', 'RANDRIANANDRASANA', 'Tovoniaina Dannie', 'tovodannie@gmail.com', 'Male', 'Vaguemestre', 2),
(79, '318816', 'RAKOTOMALALA', 'Bruno', 'bruno@gmail.com', 'Male', 'Chauffeur du DG', 2),
(80, '274712', 'RAHANTALALAO', 'Marie Claire', 'marieclaire@gmail.com', 'Female', 'Aide magasinier', 2),
(81, '318872', 'ANDRIAMPERASOA', 'Fidena', 'fidena@gmail.com', 'Male', 'Aide magasinier', 2),
(82, '287178', 'RAZAFINJATO', 'Haingotiana', 'haingotiana@gmail.com', 'Male', 'Depositaire comptable', 2),
(83, '255322', 'RAFIDIARISON', 'Cyrille', 'rafidicyrille@gmail.com', 'Male', 'Depositaire comptable technique', 2),
(84, 'admin1', 'Rakotondramanantsoa', 'Nehemia', 'nehemiarakotondramanantsoa19@gmail.com', 'Male', 'Super admin', 1),
(85, 'admin2', 'Ratovoherimanana', 'Arotoby', 'arotobyratovohery@gmail.com', 'Male', 'Super admin', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
