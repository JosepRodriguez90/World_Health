
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";




CREATE TABLE IF NOT EXISTS `usuari` (
  `id_usuari` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id taula autoincrementada',
  `nom` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nom de la persona',
  `cognom` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Cognom de la persona',
  `telefon` int(13) NOT NULL COMMENT 'Telefon ',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Correu electronic',
  `dni` varchar(9) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'DNI del usuari',
  `contrasenya` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Contrasenya de l''usuari',
  PRIMARY KEY (`id_usuari`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `medicaments` (
  `id_medicament` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del medicament',
  `composicio` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Composicio del medicament',
  `nom` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nom del medicament',
  `codi_barres` varchar(19) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Codi de barres del medicament',
  `comentaris` varchar(2000) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL COMMENT 'Comentari del medicament',
  `idioma` int(1) NOT NULL COMMENT 'Idioma del medicament',
  PRIMARY KEY (`id_medicament`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `efectes_secundaris` (
  
  `id_efectes` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del efecte secundari',
  `descripcio` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcio del efecte secundari',
  `id_medicament` int(11) NOT NULL,
  FOREIGN KEY ( `id_medicament`) REFERENCES `medicaments`( `id_medicament`),
  PRIMARY KEY (`id_efectes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `forma_farmaceutica` (
  `id_forma` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la forma farmaceutica',
  `descripcio` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcio de la forma farmaceutica',
  `id_medicament` int(11) NOT NULL,
  FOREIGN KEY ( `id_medicament`) REFERENCES `medicaments`( `id_medicament`),
  PRIMARY KEY (`id_forma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `laboratori` (
  `id_laboratori` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del laboratori',
  `descripcio` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcio del laboratori',
  `nom` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nom del laboratori',
  `id_medicament` int(11) NOT NULL,
  FOREIGN KEY ( `id_medicament`) REFERENCES `medicaments`( `id_medicament`),
  PRIMARY KEY (`id_laboratori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `patologia` (
  `id_patologia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la patologia',
  `descripcio` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcio de la patologia',
  `id_medicament` int(11) NOT NULL,
  FOREIGN KEY ( `id_medicament`) REFERENCES `medicaments`( `id_medicament`),
  PRIMARY KEY (`id_patologia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `simptomatologia` (
  `id_simptomatologia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la simptomatologia',
  `descripcio` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcio de la simptomatologia',
  `id_medicament` int(11) NOT NULL,
  FOREIGN KEY ( `id_medicament`) REFERENCES `medicaments`( `id_medicament`),
  PRIMARY KEY (`id_simptomatologia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `farmaceutic` (
  `id_farmaceutic` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del farmaceutic',
  `num_colegiat` int(9) NOT NULL COMMENT 'Numero de colegiat de cada farmaceutic',
  `farmacia` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nom de la farmacia',
  `id_usuari` int(11) NOT NULL,
  PRIMARY KEY (`id_farmaceutic`),
  FOREIGN KEY (`id_usuari`) REFERENCES `usuari`(`id_usuari`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `metges` (
  `id_metge` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de cada metge',
  `num_colegiat` int(9) NOT NULL COMMENT 'Numero de colegiat de cada metge',
  `especialitat` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Especialitat de cada metge',
  `id_usuari` int(11) NOT NULL,
  PRIMARY KEY (`id_metge`),
    FOREIGN KEY (`id_usuari`) REFERENCES `usuari`(`id_usuari`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE `arbol` 
  ( nodo int NOT NULL, texto varchar (500), pregunta BOOLEAN, 
  PRIMARY KEY (nodo) 
)



/*Eliminar taules*/
DROP TABLE usuari;
DROP TABLE medicaments;
DROP TABLE efectes_secundaris;
DROP TABLE forma_farmaceutica;
DROP TABLE laboratori;
DROP TABLE patologia;
DROP TABLE simptomatologia;
DROP TABLE farmaceutic;
DROP TABLE metges;

/*Buidar taules*/
truncate table usuari;
truncate table medicaments;
truncate table efectes_secundaris;
truncate table forma_farmaceutica;
truncate table laboratori;
truncate table patologia;
truncate table simptomatologia;
truncate table farmaceutic;
truncate table metges;

/*Select taules*/

/*Mostrar medicaments*/
Select medicaments.nom, efectes_secundaris.descripcio, forma_farmaceutica.descripcio,
laboratori.descripcio, patologia.descripcio, simptomatologia.descripcio
from medicaments
inner join efectes_secundaris on efectes_secundaris.id_efectes = medicaments.id_medicament
inner join laboratori on laboratori.id_laboratori = medicaments.id_medicament
inner join patologia on patologia.id_patologia = medicaments.id_medicament
inner join simptomatologia on simptomatologia.id_simptomatologia = medicaments.id_medicament
inner join farmaceutic on farmaceutic.id_farmaceutic = medicaments.id_medicament;

/*Busqueda metges/farmaceutics segons especialitat/farmacia*/
select * from metges where especialitat = "";
select * from farmaceutic where farmacia = "";

/*Insert taules*/

/*Insert medicaments*/
INSERT INTO medicaments values('composicio','nom','codi_barres','comentaris','idioma');
INSERT INTO efectes_secundaris values('descripcio','id_medicament');
INSERT INTO forma_farmaceutica values('descripcio','id_medicament',);
INSERT INTO laboratori values('descripcio','nom','id_medicament');
INSERT INTO patologia values('descripcio','id_medicament',);
INSERT INTO simptomatologia values('descripcio','id_medicament',);

/*Insert metges*/
INSERT INTO usuari values('nom','cognom','telefon','email','dni','contrasenya');
INSERT INTO metges values('num_colegiat','especialitat','id_usuari');

/*Insert farmaceutics*/
INSERT INTO usuari values('nom','cognom','telefon','email','dni','contrasenya');
INSERT INTO farmaceutic values('num_colegiat','farmacia','id_usuari');

/*Insert arbol*/
/*Mai Mai farem servir nosaltres un insert per a arbol, aixo ho fara automaticament*/
INSERT INTO arbol (nodo,texto,pregunta) VALUES (1,'Covid 19',FALSE)