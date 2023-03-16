-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 16 avr. 2022 à 09:02
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestionappro`
--

-- --------------------------------------------------------

--
-- Structure de la table `fournir`
--

DROP TABLE IF EXISTS `fournir`;
CREATE TABLE IF NOT EXISTS `fournir` (
  `idFournir` int(11) NOT NULL AUTO_INCREMENT,
  `codeFrs` varchar(255) NOT NULL,
  `dateAppro` date NOT NULL,
  PRIMARY KEY (`idFournir`),
  KEY `fk_1` (`codeFrs`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fournir`
--

INSERT INTO `fournir` (`idFournir`, `codeFrs`, `dateAppro`) VALUES
(4, 'FRS04', '2022-04-06'),
(6, 'FRS03', '2022-04-11');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `codeFrs` varchar(20) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `adr` varchar(40) NOT NULL,
  PRIMARY KEY (`codeFrs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`codeFrs`, `nom`, `adr`) VALUES
('FRS03', 'MIhary', 'ivory'),
('FRS04', 'Mi', 'Sahalava'),
('FRS05', 'Melanie', 'mandry');

-- --------------------------------------------------------

--
-- Structure de la table `lignefr`
--

DROP TABLE IF EXISTS `lignefr`;
CREATE TABLE IF NOT EXISTS `lignefr` (
  `idLignefr` int(11) NOT NULL AUTO_INCREMENT,
  `idFournir` int(11) NOT NULL,
  `codePro` varchar(20) NOT NULL,
  `qteAppro` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`idLignefr`),
  KEY `fk_2` (`idFournir`),
  KEY `fk_3` (`codePro`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lignefr`
--

INSERT INTO `lignefr` (`idLignefr`, `idFournir`, `codePro`, `qteAppro`) VALUES
(16, 4, 'PRO1', 80),
(18, 4, 'PRO2', 14),
(20, 6, 'PRO3', 40);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `codePro` varchar(20) NOT NULL,
  `design` varchar(50) NOT NULL,
  `pu` int(11) UNSIGNED DEFAULT NULL,
  `stock` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`codePro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`codePro`, `design`, `pu`, `stock`) VALUES
('PRO1', 'ovy', 1000, 80),
('PRO2', 'akoho', 5000, 102),
('PRO3', 'trondrokely', 5000, 40);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fournir`
--
ALTER TABLE `fournir`
  ADD CONSTRAINT `fk_1` FOREIGN KEY (`codeFrs`) REFERENCES `fournisseur` (`codeFrs`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lignefr`
--
ALTER TABLE `lignefr`
  ADD CONSTRAINT `fk_2` FOREIGN KEY (`idFournir`) REFERENCES `fournir` (`idFournir`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_3` FOREIGN KEY (`codePro`) REFERENCES `produits` (`codePro`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
