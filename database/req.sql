DROP TABLE IF EXISTS `UTILISATEUR`;
CREATE TABLE IF NOT EXISTS `UTILISATEUR` (
  `idC` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomC` varchar(40) NOT NULL,
  `prenomC` varchar(20) NOT NULL,
  `adresseC` varchar(40) NOT NULL,
  `cpC` char(5) NOT NULL,
  `villeC` varchar(40) NOT NULL,
  `mailC` varchar(50) NOT NULL,
  `passwordC` varchar(32) NOT NULL,
  PRIMARY KEY (`idC`),
  UNIQUE KEY `mailC` (`mailC`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;



CREATE  TABLE `SERVICE`(
`IdSERVICE` int(10)   NOT NULL AUTO_INCREMENT,
`PRIxNEUF` NUMERIC(50),
`MOTS_CLEF` VARCHAR(50),
`DESCRIPTION` VARCHAR(255),
`LIEnPHOTO` VARCHAR(100),
 PRIMARY KEY (`IdSERVICE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0;



CREATE TABLE `DATE`(
`DATE_DEBUT` DATE 
);

alter table `DATE` add constraint `date_pk` primary key (`DATE_DEBUT`);


CREATE TABLE `PROPOSE`(
 `ID_P` NUMERIC(10),
`IDSERVICE_P` int(10) ,
`IDUSER_P` int(10) unsigned,
`DATE_fIN` DATE
);
ALTER TABLE `PROPOSE` AUTO_INCREMENT=0;
alter table `PROPOSE` add constraint `propose_pk` primary key(`ID_P`,`IDUSER_P`, `IDSERVICE_P` ,`DATE_fIN`);
ALTER TABLE `PROPOSE` ADD CONSTRAINT `user_fK` FOREIGN KEY (`IDUSER_P`) REFERENCES `UTILISATEUR` (`idC`);
alter table `PROPOSE` add constraint `SERVICE_P_FK` FOREIGN KEY (`IDSERVICE_P`) REFERENCES `SERVICE`(`IdSERVICE`) ;
ALTER TABLE `PROPOSE` ADD CONSTRAINT `DATE_P_FK` FOREIGN KEY (`DATE_fIN`) REFERENCES `DATE` (`DATE_DEBUT`);



