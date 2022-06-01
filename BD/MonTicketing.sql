SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `T_COMMENTAIRE`;
CREATE TABLE `T_COMMENTAIRE` (
  `COM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COM_DATE` datetime NOT NULL,
  `COM_AUTEUR` varchar(100) NOT NULL,
  `COM_CONTENU` varchar(200) NOT NULL,
  `TIC_ID` int(11) NOT NULL,
  PRIMARY KEY (`COM_ID`),
  KEY `fk_com_tic` (`TIC_ID`),
  CONSTRAINT `fk_com_tic` FOREIGN KEY (`TIC_ID`) REFERENCES `T_TICKET` (`TIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `T_COMMENTAIRE` (`COM_ID`, `COM_DATE`, `COM_AUTEUR`, `COM_CONTENU`, `TIC_ID`) VALUES
(3,	'2022-03-05 15:09:22',	'Robert',	'Bien joué!',	2),
(4,	'2022-03-05 15:09:33',	'Albert',	'Excellent',	1),
(5,	'2005-03-22 03:12:05',	'Etienne',	'Bon travail',	1);

DROP TABLE IF EXISTS `T_TICKET`;
CREATE TABLE `T_TICKET` (
  `TIC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIC_DATE` datetime NOT NULL,
  `TIC_TITRE` varchar(100) NOT NULL,
  `TIC_CONTENU` varchar(400) NOT NULL,
  PRIMARY KEY (`TIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `T_TICKET` (`TIC_ID`, `TIC_DATE`, `TIC_TITRE`, `TIC_CONTENU`) VALUES
(1,	'2022-03-05 15:08:45',	'Problème affichage',	'Aucun affichage'),
(2,	'2022-03-05 15:09:07',	'Couleur écran ',	'Modifier la couleur de l\'écran');

-- 2022-03-05 16:36:02
