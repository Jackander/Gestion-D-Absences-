-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Lun 15 Janvier 2018 à 20:43
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestionabsences`
--

-- --------------------------------------------------------

--
-- Structure de la table `absence`
--

CREATE TABLE `absence` (
  `idAbsence` int(11) NOT NULL,
  `idEtudiant` int(11) NOT NULL,
  `idEnseingant` int(11) NOT NULL,
  `idMatiere` int(11) NOT NULL,
  `idClasse` int(11) NOT NULL,
  `numSeance` int(11) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `periode1` tinyint(1) DEFAULT NULL,
  `periode2` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `absence`
--

INSERT INTO `absence` (`idAbsence`, `idEtudiant`, `idEnseingant`, `idMatiere`, `idClasse`, `numSeance`, `date`, `periode1`, `periode2`) VALUES
(1, 2, 1, 2, 1, 2, '2018-01-04 00:00:00', 1, 0),
(2, 4, 5, 3, 2, 6, '2018-01-05 00:00:00', 0, 1),
(5, 1, 1, 1, 2, 1, '2018-01-09 00:00:00', 1, 1),
(6, 1, 1, 1, 2, 1, '2018-01-02 00:00:00', 1, 1),
(7, 1, 1, 1, 1, 1, '2018-01-03 00:00:00', 1, 1),
(8, 1, 2, 4, 1, 1, '2018-01-09 00:00:00', 1, 1),
(10, 1, 1, 1, 1, 2, '2018-01-10 00:00:00', 1, 1),
(11, 2, 1, 5, 8, 4, '2018-01-09 00:00:00', 0, 1),
(16, 5, 2, 2, 3, 1, '2018-01-15 08:45:55', 1, 1),
(18, 9, 1, 1, 3, 2, '2018-01-15 10:25:12', 1, 1),
(19, 5, 2, 2, 3, 1, '2018-01-15 13:36:36', 1, 1),
(20, 5, 1, 1, 3, 1, '2018-01-15 15:38:42', 1, 0),
(21, 9, 1, 1, 3, 1, '2018-01-15 15:38:43', 1, 0),
(22, 14, 2, 0, 2, 1, '2018-01-15 18:27:17', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `idClasse` int(11) NOT NULL,
  `libelle` varchar(45) DEFAULT NULL,
  `niveau` int(11) DEFAULT NULL,
  `filiere` varchar(45) DEFAULT 'Ingénierie Des Connaissances et Des Données'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `classe`
--

INSERT INTO `classe` (`idClasse`, `libelle`, `niveau`, `filiere`) VALUES
(1, '1 Année / A', 1, 'Ingénierie Des Connaissances et Des Données'),
(2, '1 Année / B', 1, 'Ingénierie Des Connaissances et Des Données'),
(3, '2 Année / A', 2, 'Ingénierie Des Connaissances et Des Données'),
(4, '2 Année / B', 2, 'Ingénierie Des Connaissances et Des Données'),
(5, 'BigData/BI', 3, 'Ingénierie Des Connaissances et Des Données'),
(6, 'DataMining/IngenieurieDocumentaire', 3, 'Ingénierie Des Connaissances et Des Données');

-- --------------------------------------------------------

--
-- Structure de la table `correspondance`
--

CREATE TABLE `correspondance` (
  `idMatiere` int(11) NOT NULL,
  `idClasse` int(11) NOT NULL,
  `idEnseignant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `correspondance`
--

INSERT INTO `correspondance` (`idMatiere`, `idClasse`, `idEnseignant`) VALUES
(1, 3, 1),
(1, 4, 1),
(2, 3, 1),
(2, 3, 2),
(3, 5, 5),
(4, 6, 6),
(5, 3, 2),
(5, 4, 2),
(6, 3, 1),
(6, 4, 1),
(7, 1, 5),
(7, 2, 5),
(100, 100, 100),
(1, 1, 9);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `idEnseignant` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `pwd` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `enseignant`
--

INSERT INTO `enseignant` (`idEnseignant`, `nom`, `prenom`, `login`, `pwd`) VALUES
(1, 'Youssfi', 'Sihame', 'Sihame', '0000'),
(2, 'Malika', 'Hanane', 'Malika', '0000'),
(3, 'Sennouni', 'Amine', 'Sennouni', '0000'),
(4, 'Rhoule', 'Hanaae', 'Rhoule', '0000'),
(5, 'Bachr', 'Ahmed', 'BachrB', '0000'),
(6, 'Amimi', 'Med Oussama', 'AmimiM', '0000'),
(8, 'Abdalaoui', 'Samir', 'AbdalaouiS', '0000');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `idEtudiant` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `idClasse` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `niveau` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`idEtudiant`, `nom`, `prenom`, `idClasse`, `login`, `pwd`, `niveau`) VALUES
(1, 'El Meslouhi', 'Mouaad', 1, 'Mouaad', '0000', 1),
(2, 'Khalouq', 'Mounir', 1, 'Mounir', '0000', 1),
(3, 'Zrhal', 'Oumaima', 4, 'Oumaima', '0000', 1),
(4, 'Zarud', 'Najwa', 1, 'Najwa', '0000', 1),
(5, 'Chahma', 'Oumaima', 3, 'OumaimaC', '0000', 2),
(6, 'Souhail', 'Idrissi', 5, 'Idrissi', '0000', 3),
(7, 'Soufi', 'Ali', 6, 'AliS', '0000', 3),
(8, 'El hajouli', 'samia', 2, 'SamiaH', '0000', 2),
(9, 'Tagnaouiti', 'Ghita', 3, 'GhitaT', '0000', 3),
(10, 'Safwani', 'Khalid', 4, 'KhalidS', '0000', 1),
(11, 'Kawtari', 'Hamid', 5, 'KawtariH', '0000', 2),
(12, 'Smati', 'Hichame', 6, 'HichameS', '0000', 2),
(13, 'EL Bsabssi ', 'Imane', 1, 'ImaneB', '0000', 2),
(14, 'Amimi', 'Mohamed Oussama', 2, 'MedOussamaA', '0000', 3),
(15, 'Garnaoui', 'Ahmed', 2, 'GarA', '0000', 1),
(16, 'Ghali', 'Ali', 1, 'AliG', '0000', 1);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `idMatiere` int(11) NOT NULL,
  `libelle` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `matiere`
--

INSERT INTO `matiere` (`idMatiere`, `libelle`) VALUES
(1, 'JAVA'),
(2, 'UML'),
(3, 'BIG DATA'),
(4, 'DATA MINING'),
(5, 'GED'),
(6, 'SAE'),
(7, 'PHP'),
(8, 'RESEAUX'),
(9, 'UNIMARC'),
(10, 'GOUVERNANCE DOCUMENTAIRE'),
(11, 'Droit');

-- --------------------------------------------------------

--
-- Structure de la table `responsable`
--

CREATE TABLE `responsable` (
  `idResponsable` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `pwd` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `responsable`
--

INSERT INTO `responsable` (`idResponsable`, `nom`, `prenom`, `login`, `pwd`) VALUES
(1, 'ZAKKA', 'Fatima Zahra', 'FatimaZ', '0000'),
(2, 'Chawki', 'Ilham', 'ChawkiI', '0000'),
(3, 'Faysali', 'Hamza', 'FaysaliH', '0000'),
(4, 'Ouatabe', 'Zakaria', 'OuatabeZ', '0000'),
(5, 'Kaddami', 'Basma', 'KaddamiB', '0000');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`idAbsence`),
  ADD KEY `fk_Absence_Etudiant_idx` (`idEtudiant`),
  ADD KEY `fk_Absence_Classe1_idx` (`idClasse`),
  ADD KEY `fk_Absence_matiere1_idx` (`idMatiere`),
  ADD KEY `fk_Absence_Enseignant1_idx` (`idEnseingant`);

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`idClasse`);

--
-- Index pour la table `correspondance`
--
ALTER TABLE `correspondance`
  ADD KEY `idMatiere` (`idMatiere`),
  ADD KEY `idClasse` (`idClasse`),
  ADD KEY `idEnseignant` (`idEnseignant`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`idEnseignant`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`idEtudiant`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`idMatiere`);

--
-- Index pour la table `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`idResponsable`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `absence`
--
ALTER TABLE `absence`
  MODIFY `idAbsence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `idClasse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `idEnseignant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `idEtudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `idMatiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `responsable`
--
ALTER TABLE `responsable`
  MODIFY `idResponsable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `absence_ibfk_1` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`idEtudiant`),
  ADD CONSTRAINT `absence_ibfk_2` FOREIGN KEY (`idEnseingant`) REFERENCES `enseignant` (`idEnseignant`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
