SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `arbol` 
  ( nodo int NOT NULL, texto varchar (500), pregunta BOOLEAN, 
  PRIMARY KEY (nodo) 
)



//si pregunta es 0 quiere decir que es falso