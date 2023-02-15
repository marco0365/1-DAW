| Creación de Base de Datos |

DROP DATABASE cocina;
// Se usa el comando "DROP" para eliminar la base de datos si ya existe.

CREATE DATABASE IF NOT EXISTS cocina DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
// Se utiliza el comando "CREATE DATABASE" para crear la base de datos, con el parámetro "IF NOT EXISTS" para evitar errores en caso de que ya exista. También se incluyen los caracteres "utf8" en español para la codificación de caracteres.

USE cocina;
// Se utiliza el comando "USE" para indicar que se va a trabajar con la base de datos "cocina".

------------------------------------------------------------------------------------------------------
| Creación de Tablas |

CREATE TABLE nombre_de_la_tabla
// Se utiliza el comando "CREATE TABLE" para crear una tabla en la base de datos.

(tipos de datos)
VARCHAR
INT
ENUM
// Se definen los tipos de datos que se van a utilizar en la tabla.

(valor en tablas)
primary key
not NULL
foreign key (fk)
// Se definen los valores que se van a utilizar en las tablas, como claves primarias, valores no nulos y claves foráneas.


------------------------------------------------------------------------------------------------------


| Creación de Relaciones |

ALTER TABLE Ingrediente ADD CONSTRAINT FK_INGREDIENTE_PAIS FOREIGN KEY (nombrepais) REFERENCES Pais(nom_pais);
// Se utiliza el comando "ALTER TABLE" para agregar una relación a una tabla existente. En este caso, se está creando una clave foránea en la tabla "Ingrediente" que referencia a la tabla "Pais".

// La sintaxis es:
// ADD CONSTRAINT FK_TABLA-FK_TABLA-REFERENCIADA
// FOREIGN KEY (nombre de la fk)
// REFERENCES nombre de la tabla referenciada (pk de la tabla)