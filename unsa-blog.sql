-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 26, 2020 at 07:28 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id_article` int(11) NOT NULL,
  `titre` varchar(120) NOT NULL,
  `texte` varchar(1024) NOT NULL,
  `auteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id_article`, `titre`, `texte`, `auteur`) VALUES
(1, 'top article', 'sdgsgsfsg', 2),
(2, 'un autre', 'gdfgdfhdhh', 5);

-- --------------------------------------------------------

--
-- Table structure for table `article_x_categorie`
--

CREATE TABLE `article_x_categorie` (
  `article` int(11) NOT NULL,
  `categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auteur`
--

CREATE TABLE `auteur` (
  `id` int(11) NOT NULL,
  `prénom` varchar(60) DEFAULT NULL,
  `nom` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auteur`
--

INSERT INTO `auteur` (`id`, `prénom`, `nom`) VALUES
(1, 'déon', 'ALAKAISDEPARGNE'),
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
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`) VALUES
(1, 'Société'),
(2, 'Sport'),
(3, 'Culture'),
(4, 'Loisirs');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `FK_auteur` (`auteur`);

--
-- Indexes for table `article_x_categorie`
--
ALTER TABLE `article_x_categorie`
  ADD PRIMARY KEY (`article`,`categorie`),
  ADD KEY `categorie` (`categorie`);

--
-- Indexes for table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_auteur` FOREIGN KEY (`auteur`) REFERENCES `auteur` (`id`);

--
-- Constraints for table `article_x_categorie`
--
ALTER TABLE `article_x_categorie`
  ADD CONSTRAINT `FK_articles` FOREIGN KEY (`article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `article_x_categorie_ibfk_1` FOREIGN KEY (`categorie`) REFERENCES `categorie` (`id_categorie`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
