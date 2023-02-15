DROP DATABASE cocina;
CREATE DATABASE IF NOT EXISTS cocina DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE cocina;

CREATE TABLE Ingrediente (
  nom_ingred VARCHAR(50) PRIMARY KEY,
  metodo_conservacion VARCHAR(50) NOT NULL,
  temperatura VARCHAR(50),
  nombrepais VARCHAR(50) NOT NULL
  
);

CREATE TABLE Compone (
  nom_ingred VARCHAR(50),
  nom_receta VARCHAR(200),
  cantidad VARCHAR(150) NOT NULL,
  preparacion VARCHAR(250)
  
);

CREATE TABLE Receta (
  nom_receta VARCHAR(200) PRIMARY KEY,
  precio DECIMAL(2,2) NOT NULL,
  tipo ENUM('ENTRANTE', 'PLATO', 'POSTRE') NOT NULL,
  vino ENUM('BLANCO', 'TINTO', 'ROSADO'),
  cubierto ENUM('CARNE', 'PESCADO'),
  azucar ENUM('SI', 'NO'),
  lactosa ENUM('SI', 'NO'),
  nombrepais VARCHAR(50) NOT NULL,
  numeroconcursante INT
  
);

CREATE TABLE Concursante (
  numero INT PRIMARY KEY,
  nom_concur VARCHAR(150) NOT NULL,
  tipo ENUM('AMATEUR', 'PROFESIONAL') NOT NULL,
  nombrepais VARCHAR(50) NOT NULL
);

CREATE TABLE Amateur (
  numeroconcursante INT PRIMARY KEY,
  numeroprofesional INT
  
);

CREATE TABLE Profesional (
  numeroconcursante INT PRIMARY KEY
  
);

CREATE TABLE Pais (
  nom_pais VARCHAR(50) PRIMARY KEY,
  capital VARCHAR(50) NOT NULL UNIQUE
);


ALTER TABLE Ingrediente ADD CONSTRAINT FK_INGREDIENTE FOREIGN KEY (nombrepais) REFERENCES Pais(nom_pais);

ALTER TABLE Compone ADD CONSTRAINT FK_COMPONE_INGREDIENTE FOREIGN KEY (nom_ingred) REFERENCES Ingrediente(nom_ingred);

ALTER TABLE Compone ADD CONSTRAINT FK_COMPONE_RECETA FOREIGN KEY (nom_receta) REFERENCES Receta(nom_receta);

ALTER TABLE Receta ADD CONSTRAINT FK_RECETA_PAIS FOREIGN KEY (nombrepais) REFERENCES Pais(nom_pais);

ALTER TABLE Receta ADD CONSTRAINT FK_RECETA_CONCURSANTE FOREIGN KEY (numeroconcursante) REFERENCES Concursante(numero);

ALTER TABLE Concursante ADD CONSTRAINT FK_CONCURSANTE_PAIS FOREIGN KEY (nombrepais) REFERENCES Pais(nom_pais);

ALTER TABLE Amateur ADD CONSTRAINT FK_AMATEUR_CONCURSANTE FOREIGN KEY (numeroconcursante) REFERENCES Concursante(numero);

ALTER TABLE Amateur ADD CONSTRAINT FK_AMATEUR_PROFESIONAL FOREIGN KEY (numeroprofesional) REFERENCES Profesional(numeroconcursante);

ALTER TABLE Profesional ADD CONSTRAINT FK_PROFESIONAL_CONCURSANTE FOREIGN KEY (numeroconcursante) REFERENCES Concursante(numero);

ALTER TABLE Compone ADD CONSTRAINT PK_PROFESIONAL PRIMARY KEY (nom_receta, nom_ingred);


