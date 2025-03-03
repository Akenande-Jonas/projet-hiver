-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 03 mars 2025 à 17:40
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
  `nom` varchar(255) NOT NULL,
  `points` int(50) NOT NULL,
  `joué` int(50) NOT NULL,
  `gagné` int(50) NOT NULL,
  `nul` int(50) NOT NULL,
  `perdu` int(50) NOT NULL,
  `BP` int(50) NOT NULL,
  `BC` int(50) NOT NULL,
  `diff` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`id`, `nom`, `points`, `joué`, `gagné`, `nul`, `perdu`, `BP`, `BC`, `diff`) VALUES
(1, 'Ciel2', 16, 8, 5, 1, 2, 20, 8, 12),
(2, 'BTS ELEC', 15, 6, 5, 0, 1, 38, 3, 35),
(3, '1 bac pro', 13, 6, 4, 1, 1, 28, 5, 23),
(4, 'ciel1', 13, 10, 4, 1, 5, 23, 29, -6),
(5, '2tne', 7, 4, 2, 1, 1, 13, 10, 3),
(6, 'tles bac pro', 6, 8, 2, 0, 6, 12, 20, -8),
(7, '3pm', 0, 6, 0, 0, 6, 1, 60, -59);

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `user` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Matchs`
--

CREATE TABLE `Matchs` (
  `id` int(7) NOT NULL,
  `heure` datetime NOT NULL,
  `Equipe1` int(7) NOT NULL,
  `Equipe2` int(7) NOT NULL,
  `Gagnant` int(7) NOT NULL,
  `users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Matchs`
--

INSERT INTO `Matchs` (`id`, `heure`, `Equipe1`, `Equipe2`, `Gagnant`, `users`) VALUES
(1, '2025-02-24 16:54:20', 1, 2, 1, 0),
(2, '2025-02-24 16:57:00', 3, 2, 2, 0),
(3, '2025-02-24 17:05:14', 4, 3, 4, 0);

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
-- Index pour la table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Matchs`
--
ALTER TABLE `Matchs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idgagnant` (`Gagnant`),
  ADD KEY `Equipe1` (`Equipe1`,`Equipe2`),
  ADD KEY `Equipe2` (`Equipe2`),
  ADD KEY `idusers` (`users`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Matchs`
--
ALTER TABLE `Matchs`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
