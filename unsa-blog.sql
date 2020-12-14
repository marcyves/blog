-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 14 déc. 2020 à 13:04
-- Version du serveur :  5.7.30
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id_article` int(11) NOT NULL,
  `titre` varchar(120) NOT NULL,
  `texte` varchar(1024) NOT NULL,
  `auteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id_article`, `titre`, `texte`, `auteur`) VALUES
(1, 'top article', 'sdgsgsfsg', 2),
(2, 'un autre', 'gdfgdfhdhh', 5),
(3, 'Le COVID est transmis par la 5G', 'Long bla bla complotiste', 34),
(4, 'Présidentielles Américaines', 'Quel suspens...', 2),
(5, 'Un tout nouveau tout chaud', 'un texte', 5),
(6, 'le titre', 'le texte', 11),
(7, 'le titre', 'le texte', 11),
(8, 'le titre de l\'article :num', 'le texte de l\'article :num', 1),
(9, 'le titre de l\'article :num', 'le texte de l\'article :num', 2),
(10, 'le titre de l\'article :num', 'le texte de l\'article :num', 3),
(11, 'le titre de l\'article :num', 'le texte de l\'article :num', 4),
(12, 'le titre de l\'article :num', 'le texte de l\'article :num', 5),
(13, 'le titre de l\'article :num', 'le texte de l\'article :num', 6),
(14, 'le titre de l\'article :num', 'le texte de l\'article :num', 7),
(15, 'le titre de l\'article :num', 'le texte de l\'article :num', 8),
(16, 'le titre de l\'article :num', 'le texte de l\'article :num', 9),
(17, 'le titre de l\'article :num', 'le texte de l\'article :num', 10),
(18, 'le titre de l\'article :num', 'le texte de l\'article :num', 11),
(19, 'le titre de l\'article :num', 'le texte de l\'article :num', 12),
(20, 'le titre de l\'article :num', 'le texte de l\'article :num', 13),
(21, 'le titre de l\'article :num', 'le texte de l\'article :num', 14),
(22, 'le titre de l\'article :num', 'le texte de l\'article :num', 15),
(23, 'le titre de l\'article :num', 'le texte de l\'article :num', 16),
(24, 'le titre de l\'article :num', 'le texte de l\'article :num', 17),
(25, 'le titre de l\'article :num', 'le texte de l\'article :num', 18),
(26, 'le titre de l\'article :num', 'le texte de l\'article :num', 19),
(27, 'le titre de l\'article :num', 'le texte de l\'article :num', 20),
(28, 'le titre de l\'article :num', 'le texte de l\'article :num', 21),
(29, 'le titre de l\'article :num', 'le texte de l\'article :num', 22),
(30, 'le titre de l\'article :num', 'le texte de l\'article :num', 23),
(31, 'le titre de l\'article :num', 'le texte de l\'article :num', 24),
(32, 'le titre de l\'article :num', 'le texte de l\'article :num', 25),
(33, 'le titre de l\'article :num', 'le texte de l\'article :num', 26),
(34, 'le titre de l\'article :num', 'le texte de l\'article :num', 27),
(35, 'le titre de l\'article :num', 'le texte de l\'article :num', 28),
(36, 'le titre de l\'article :num', 'le texte de l\'article :num', 29),
(37, 'le titre de l\'article :num', 'le texte de l\'article :num', 30),
(38, 'le titre de l\'article :num', 'le texte de l\'article :num', 31),
(39, 'le titre de l\'article :num', 'le texte de l\'article :num', 32),
(40, 'le titre de l\'article :num', 'le texte de l\'article :num', 33),
(41, 'le titre de l\'article :num', 'le texte de l\'article :num', 34),
(42, 'une nouveauté', 'de dernière minute', 9),
(43, 'tretetr', 'erterte', 34);

-- --------------------------------------------------------

--
-- Structure de la table `article_x_categorie`
--

CREATE TABLE `article_x_categorie` (
  `article` int(11) NOT NULL,
  `categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article_x_categorie`
--

INSERT INTO `article_x_categorie` (`article`, `categorie`) VALUES
(2, 1),
(3, 1),
(4, 1),
(1, 2),
(1, 3),
(4, 3),
(1, 4),
(2, 4),
(3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `id` int(11) NOT NULL,
  `prénom` varchar(60) DEFAULT NULL,
  `nom` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`id`, `prénom`, `nom`) VALUES
(1, 'Gédéon', 'ALAKAISDEPARGNE'),
(2, 'Jean', 'BAILLE'),
(3, 'Annie', 'BALLE'),
(4, 'Jean', 'BONNEAU'),
(5, 'Jean', 'BREILLE'),
(6, 'Francis', 'CAIN'),
(7, 'Dominique', 'CAIN'),
(8, 'Charles', 'CAIN'),
(9, 'Jacques', 'CELERE'),
(10, 'Harry', 'COVER'),
(11, 'Guy', 'DONDEVELO'),
(12, 'Mélusine', 'ENFAILLITE'),
(13, 'Alain', 'FERNAL'),
(14, 'Sophie', 'FONFEC'),
(15, 'Pat', 'HIBULAIRE'),
(16, 'Paul', 'HOCHON'),
(17, 'Charles', 'MAGNE'),
(18, 'Gérard', 'MANSOIF'),
(19, 'Gérard', 'MANVUSSA'),
(20, 'Serge', 'OIN'),
(21, 'Josée', 'PALEDIRE'),
(22, 'Vincent', 'PASBON'),
(23, 'Pierre', 'PONCE'),
(24, 'Alain', 'PROVISTE'),
(25, 'Raoul', 'TABOSSE'),
(26, 'Guy', 'TARE'),
(27, 'Alain', 'TERIEUR'),
(28, 'Alex', 'TERIEUR'),
(29, 'Pierre', 'TOMBALE'),
(30, 'Alphonse', 'TOUDROIT'),
(31, 'Jean', 'TRANSEN'),
(32, 'Jacques', 'UMUL'),
(33, 'Annie', 'VERSAIRE'),
(34, 'Agathe', 'ZEBLOUSE');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`) VALUES
(1, 'Société'),
(2, 'Sport'),
(3, 'Culture'),
(4, 'Loisirs');

-- --------------------------------------------------------

--
-- Structure de la table `label`
--

CREATE TABLE `label` (
  `id` int(11) NOT NULL,
  `langue` char(2) NOT NULL,
  `label` varchar(20) NOT NULL,
  `texte` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `label`
--

INSERT INTO `label` (`id`, `langue`, `label`, `texte`) VALUES
(1, 'FR', 'titre', 'Le blog du XXIe siècle'),
(2, 'EN', 'titre', 'The blog of the 21st Century'),
(3, 'EN', 'liste-auteurs', 'Authors List');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `FK_auteur` (`auteur`);

--
-- Index pour la table `article_x_categorie`
--
ALTER TABLE `article_x_categorie`
  ADD PRIMARY KEY (`article`,`categorie`),
  ADD KEY `categorie` (`categorie`);

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `label`
--
ALTER TABLE `label`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `label`
--
ALTER TABLE `label`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_auteur` FOREIGN KEY (`auteur`) REFERENCES `auteur` (`id`);

--
-- Contraintes pour la table `article_x_categorie`
--
ALTER TABLE `article_x_categorie`
  ADD CONSTRAINT `FK_articles` FOREIGN KEY (`article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `article_x_categorie_ibfk_1` FOREIGN KEY (`categorie`) REFERENCES `categorie` (`id_categorie`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
