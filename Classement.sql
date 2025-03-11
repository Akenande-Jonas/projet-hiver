-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 11 mars 2025 à 17:18
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
-- Structure de la table `connexion`
--

CREATE TABLE `connexion` (
  `id` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `mail` varchar(200) NOT NULL,
  `mot de passe` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `connexion`
--

INSERT INTO `connexion` (`id`, `nom`, `mail`, `mot de passe`) VALUES
(1, 'Jonas', 'jonasakenande7@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE `equipe` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `id` int(11) NOT NULL,
  `Nom` varchar(200) NOT NULL,
  `Prenom` varchar(200) NOT NULL,
  `Mail` varchar(200) NOT NULL,
  `Date de naissance` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE `login` (
  `id` int(11) DEFAULT NULL,
  `mail` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
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
  `Butequipe1` int(11) NOT NULL,
  `Butequipe2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `connexion`
--
ALTER TABLE `connexion`
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
-- AUTO_INCREMENT pour la table `connexion`
--
ALTER TABLE `connexion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Matchs`
--
ALTER TABLE `Matchs`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
