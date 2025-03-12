-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 12 mars 2025 à 13:34
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
-- Structure de la table `Admin`
--

CREATE TABLE `Admin` (
  `id` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  `Mail` varchar(200) NOT NULL,
  `mot de passe` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Admin`
--

INSERT INTO `Admin` (`id`, `nom`, `prenom`, `Mail`, `mot de passe`) VALUES
(1, 'Akenande', 'Jonas', 'jonasakenande7@gmail', '1234');

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
(1, 'CIEL2'),
(2, 'CIEL1'),
(3, 'BTS ELEC'),
(4, '1 BAC PRO'),
(5, '2TNE'),
(6, 'TLES BAC PRO'),
(7, '3PM');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  `mail` varchar(200) NOT NULL,
  `Date de naissance` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `nom`, `prenom`, `mail`, `Date de naissance`) VALUES
(3, 'Akenande', 'Jonas junior', 'jonasakenande7@gmail.com', '03/06/2005');

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `mot de passe` varchar(200) NOT NULL,
  `users` int(11) NOT NULL,
  `inscription` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`id`, `nom`, `mot de passe`, `users`, `inscription`) VALUES
(2, 'azerty', '12340987', 4, 3);

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
  `Butequipe2` int(11) NOT NULL,
  `Admin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Matchs`
--

INSERT INTO `Matchs` (`id`, `heure`, `Equipe1`, `Equipe2`, `Butequipe1`, `Butequipe2`, `Admin`) VALUES
(93, '2024-11-13 12:00:46', 4, 1, 4, 3, '0'),
(94, '2024-11-13 12:00:46', 7, 1, 0, 22, '0'),
(95, '2024-11-20 12:00:46', 5, 1, 3, 9, '0'),
(96, '2024-11-27 12:00:46', 3, 1, 4, 2, '0'),
(97, '2024-12-04 12:00:46', 2, 1, 3, 7, '0'),
(98, '2024-12-11 12:00:46', 6, 1, 3, 4, '0'),
(99, '2024-12-18 12:00:46', 4, 2, 5, 3, '0'),
(100, '2025-01-08 12:00:46', 4, 3, 2, 3, '0'),
(101, '2025-01-15 12:00:46', 4, 5, 4, 1, '0'),
(102, '2025-01-22 12:00:46', 4, 6, 3, 1, '0'),
(103, '2025-01-29 12:00:46', 4, 7, 12, 0, '0'),
(104, '2025-02-05 12:00:46', 2, 7, 13, 1, '0'),
(105, '2025-02-12 12:00:46', 2, 5, 5, 3, '0'),
(106, '2025-03-05 12:00:46', 2, 6, 4, 6, '0'),
(107, '2025-03-12 12:00:46', 2, 3, 1, 11, '0'),
(108, '2025-03-19 12:00:46', 7, 5, 1, 8, '0'),
(109, '2025-03-26 12:00:46', 7, 6, 0, 15, '0'),
(110, '2025-04-02 12:00:46', 7, 3, 0, 25, '0'),
(111, '2025-04-09 12:00:46', 5, 6, 2, 2, '0'),
(112, '2025-04-16 12:00:46', 5, 3, 6, 5, '0'),
(113, '2025-04-23 12:00:46', 6, 3, 2, 3, '0'),
(114, '2025-03-12 11:42:13', 5, 2, 2, 2, 'Jonas alias Yuzu_2.0'),
(115, '2025-03-12 11:42:13', 5, 2, 2, 2, 'Jonas alias Yuzu_2.0');

-- --------------------------------------------------------

--
-- Structure de la table `seConnecter`
--

CREATE TABLE `seConnecter` (
  `id` int(11) NOT NULL,
  `inscription` int(11) NOT NULL,
  `verifier` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `seConnecter`
--

INSERT INTO `seConnecter` (`id`, `inscription`, `verifier`) VALUES
(1, 3, 'ok');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `mot de passe` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `mot de passe`) VALUES
(4, 'Junior', '1234');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users` (`users`),
  ADD KEY `inscription` (`inscription`);

--
-- Index pour la table `Matchs`
--
ALTER TABLE `Matchs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Equipe1` (`Equipe1`,`Equipe2`),
  ADD KEY `Equipe2` (`Equipe2`),
  ADD KEY `Admin` (`Admin`);

--
-- Index pour la table `seConnecter`
--
ALTER TABLE `seConnecter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inscription` (`inscription`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Matchs`
--
ALTER TABLE `Matchs`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT pour la table `seConnecter`
--
ALTER TABLE `seConnecter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`users`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`inscription`) REFERENCES `inscription` (`id`);

--
-- Contraintes pour la table `Matchs`
--
ALTER TABLE `Matchs`
  ADD CONSTRAINT `Matchs_ibfk_3` FOREIGN KEY (`Equipe1`) REFERENCES `equipe` (`id`),
  ADD CONSTRAINT `Matchs_ibfk_4` FOREIGN KEY (`Equipe2`) REFERENCES `equipe` (`id`);

--
-- Contraintes pour la table `seConnecter`
--
ALTER TABLE `seConnecter`
  ADD CONSTRAINT `seConnecter_ibfk_1` FOREIGN KEY (`inscription`) REFERENCES `inscription` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
