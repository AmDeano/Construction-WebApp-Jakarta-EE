-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 18 déc. 2024 à 17:12
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `constructiondb`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_C` int(11) NOT NULL,
  `nom_C` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `id_U` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_C`, `nom_C`, `phone`, `email`, `address`, `id_U`) VALUES
(1, 'Saas', '0643580864', 'profreelance.service@gmail.com', 'hey salam', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `devis`
--

CREATE TABLE `devis` (
  `id_D` int(11) NOT NULL,
  `date_D` date DEFAULT NULL,
  `id_P` int(11) DEFAULT NULL,
  `id_F` int(11) DEFAULT NULL,
  `id_C` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id_F` int(11) NOT NULL,
  `date_F` date DEFAULT NULL,
  `id_U` int(11) DEFAULT NULL,
  `nom_C` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `project`
--

CREATE TABLE `project` (
  `id_P` int(11) NOT NULL,
  `nom_Proj` varchar(100) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `id_C` int(11) DEFAULT NULL,
  `id_U` int(11) NOT NULL,
  `id_F` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `project`
--

INSERT INTO `project` (`id_P`, `nom_Proj`, `date_start`, `date_finish`, `description`, `status`, `id_C`, `id_U`, `id_F`) VALUES
(1, 'const Villa', '2024-12-18', '2024-12-25', 'Construction of a Villa', NULL, NULL, 4, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `proj_supp`
--

CREATE TABLE `proj_supp` (
  `id_P` int(11) NOT NULL,
  `id_S` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `supplies`
--

CREATE TABLE `supplies` (
  `id_S` int(11) NOT NULL,
  `nom_S` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `id_U` int(11) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `supplies`
--

INSERT INTO `supplies` (`id_S`, `nom_S`, `phone`, `id_U`, `email`, `address`) VALUES
(2, 'Ideal Menuiserie', '0643580864', 4, 'menuiserie@gmail.com', 'CT El Alej My Miloud  Oujda'),
(3, 'SAAS', '+212621926620', 4, 'moiho@gklb.liyg', 'hey salam');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_U` int(11) NOT NULL,
  `nom_U` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_U`, `nom_U`, `phone`, `email`, `password`) VALUES
(1, '', '0662445108', 'melabdelislam@gmail.com', 'abdou'),
(2, 'Abdel', '0662445108', 'profreelance.service@gmail.com', '48f40641590a478e64d4a3785036e0cac7984767201c1d057dd34bec0c9bdde3'),
(3, 'AmDee', '0662445108', 'moiho@gklb.liyg', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
(4, 'Abdel', '0662445108', 'profreelance.service@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_C`),
  ADD KEY `id_U` (`id_U`);

--
-- Index pour la table `devis`
--
ALTER TABLE `devis`
  ADD PRIMARY KEY (`id_D`),
  ADD KEY `id_P` (`id_P`),
  ADD KEY `id_F` (`id_F`),
  ADD KEY `id_C` (`id_C`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id_F`),
  ADD KEY `id_U` (`id_U`);

--
-- Index pour la table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id_P`),
  ADD KEY `id_C` (`id_C`),
  ADD KEY `id_U` (`id_U`),
  ADD KEY `id_F` (`id_F`);

--
-- Index pour la table `proj_supp`
--
ALTER TABLE `proj_supp`
  ADD PRIMARY KEY (`id_P`,`id_S`),
  ADD KEY `id_S` (`id_S`);

--
-- Index pour la table `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`id_S`),
  ADD KEY `id_U` (`id_U`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_U`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_C` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `devis`
--
ALTER TABLE `devis`
  MODIFY `id_D` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `id_F` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `project`
--
ALTER TABLE `project`
  MODIFY `id_P` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `supplies`
--
ALTER TABLE `supplies`
  MODIFY `id_S` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_U` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_U`) REFERENCES `user` (`id_U`);

--
-- Contraintes pour la table `devis`
--
ALTER TABLE `devis`
  ADD CONSTRAINT `devis_ibfk_1` FOREIGN KEY (`id_P`) REFERENCES `project` (`id_P`),
  ADD CONSTRAINT `devis_ibfk_2` FOREIGN KEY (`id_F`) REFERENCES `facture` (`id_F`),
  ADD CONSTRAINT `devis_ibfk_3` FOREIGN KEY (`id_C`) REFERENCES `client` (`id_C`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`id_U`) REFERENCES `user` (`id_U`);

--
-- Contraintes pour la table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`id_C`) REFERENCES `client` (`id_C`),
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`id_U`) REFERENCES `user` (`id_U`),
  ADD CONSTRAINT `project_ibfk_3` FOREIGN KEY (`id_F`) REFERENCES `facture` (`id_F`);

--
-- Contraintes pour la table `proj_supp`
--
ALTER TABLE `proj_supp`
  ADD CONSTRAINT `proj_supp_ibfk_1` FOREIGN KEY (`id_P`) REFERENCES `project` (`id_P`),
  ADD CONSTRAINT `proj_supp_ibfk_2` FOREIGN KEY (`id_S`) REFERENCES `supplies` (`id_S`);

--
-- Contraintes pour la table `supplies`
--
ALTER TABLE `supplies`
  ADD CONSTRAINT `supplies_ibfk_1` FOREIGN KEY (`id_U`) REFERENCES `user` (`id_U`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
