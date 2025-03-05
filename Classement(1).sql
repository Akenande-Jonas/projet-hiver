-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 05 mars 2025 à 15:33
-- Version du serveur : 10.5.23-MariaDB-0+deb11u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Classement`
--

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE `equipe` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`id`, `nom`) VALUES
(1, 'Ciel2'),
(2, 'BTS ELEC'),
(3, '1 bac pro'),
(4, 'ciel1'),
(5, '2tne'),
(6, 'tles bac pro'),
(7, '3pm'),
(8, 'Ciel2'),
(9, 'BTS ELEC'),
(10, '1 BAC PRO'),
(11, 'Ciel1'),
(12, '2TNE'),
(13, 'TLES BAC PRO'),
(14, '3PM');

-- --------------------------------------------------------

--
-- Structure de la table `Matchs`
--

CREATE TABLE `Matchs` (
  `id` int(7) NOT NULL,
  `heure` datetime NOT NULL,
  `Equipe1` int(7) NOT NULL,
  `Equipe2` int(7) NOT NULL,
  `Butequipe1` int(11) NOT NULL,
  `Butequipe2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Matchs`
--

INSERT INTO `Matchs` (`id`, `heure`, `Equipe1`, `Equipe2`, `Butequipe1`, `Butequipe2`) VALUES
(1, '2025-02-24 16:54:20', 1, 2, 0, 0),
(2, '2025-02-24 16:57:00', 3, 2, 0, 0),
(3, '2025-02-24 17:05:14', 4, 3, 0, 0),
(4, '2025-03-05 15:19:54', 3, 4, 2, 0),
(5, '2025-03-05 15:19:54', 1, 2, 3, 2),
(6, '2025-03-05 15:19:54', 7, 3, 0, 7);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `equipe` varchar(255) NOT NULL,
  `classement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `equipe`, `classement`) VALUES
(1, 'CIEL2', 1),
(2, 'BTS ELEC', 2),
(3, '1ere BAC PRO', 3),
(4, 'CIEL1', 4),
(5, '2TNE', 5),
(6, 'TLES BAC PRO', 6),
(7, '3PM', 7);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Matchs`
--
ALTER TABLE `Matchs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Equipe1` (`Equipe1`,`Equipe2`),
  ADD KEY `Equipe2` (`Equipe2`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `Matchs`
--
ALTER TABLE `Matchs`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Matchs`
--
ALTER TABLE `Matchs`
  ADD CONSTRAINT `Matchs_ibfk_3` FOREIGN KEY (`Equipe1`) REFERENCES `equipe` (`id`),
  ADD CONSTRAINT `Matchs_ibfk_4` FOREIGN KEY (`Equipe2`) REFERENCES `equipe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
