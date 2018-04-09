DROP DATABASE IF EXISTS `Events`;

CREATE DATABASE `Events`;

USE `Events`;


DROP TABLE IF EXISTS `Empresa`;

CREATE TABLE `Empresa`
(
	`id_Empresa` INT NOT NULL PRIMARY KEY,
	`NIT` VARCHAR ( 50 ) NOT NULL,
	`Nombre` VARCHAR ( 120 ) NOT NULL,
	`Banner` VARCHAR ( 450 ) NOT NULL,
	`Icono` VARCHAR ( 450 ) NOT NULL,
	`BG` VARCHAR ( 450 ) NOT NULL
)
ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = "Tabla para parametrizar a cualquier empresa";


DROP TABLE IF EXISTS `Genero`;

CREATE TABLE `Genero` 
(
	`id_Genero` INT NOT NULL PRIMARY KEY,
	`Tipo` VARCHAR (10) NOT NULL
)
ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = "Generos";


DROP TABLE IF EXISTS `Persona`;

CREATE TABLE `Persona` 
(
	`id_Persona` INT NOT NULL PRIMARY KEY,
	`Fecha_Nacimiento` date NOT NULL,
	`Identificacion` NUMERIC ( 12 ) NOT NULL,
	`Nombre1` VARCHAR ( 70 ) NOT NULL,
	`Nombre2` VARCHAR ( 70 ) NULL,
	`Apellido1` VARCHAR ( 70 ) NOT NULL,
	`Apellido2` VARCHAR ( 70 ) NULL,
	`Telefono` VARCHAR ( 10 ) NOT NULL,
	`Estado` ENUM ('Activo','Inactivo') NOT NULL,
	`fk_genero` INT NOT NULL 
)
ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = "tabla para Personas";

ALTER TABLE `Persona` ADD CONSTRAINT `Genero_fk` FOREIGN KEY ( `fk_genero` ) REFERENCES `Genero` ( `id_Genero` );


DROP TABLE IF EXISTS `Usuario`;

CREATE TABLE `Usuario` 
(
	`id_Usuario` INT NOT NULL PRIMARY KEY,
	`Email` VARCHAR ( 320 ) NOT NULL,
	`PASSWORD` VARCHAR ( 300 ) NOT NULL,
	`Fecha` DATE NOT NULL,
	`Estado` ENUM ('Activo','Inactivo') NOT NULL,
	`fk_Persona` INT NOT NULL,
	`fk_Rol` INT NOT NULL
)
ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = "Tabla para usuarios de personas";

ALTER TABLE `Usuario` ADD CONSTRAINT `Persona_fk_user` FOREIGN KEY ( `fk_Persona` ) REFERENCES `Persona` ( `id_Persona` );


DROP TABLE IF EXISTS `Rol`;

CREATE TABLE `Rol` 
(
	`id_Rol` INT NOT NULL PRIMARY KEY,
	`Nombre` VARCHAR ( 70 ) NOT NULL,
	`Estado` ENUM ('Activo','Inactivo') NOT NULL
)
ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = "Roles del sistema";

ALTER TABLE `Usuario` ADD CONSTRAINT `Persona_Rol_fk` FOREIGN KEY ( `fk_Rol`) REFERENCES `Rol` ( `id_Rol` );


DROP TABLE IF EXISTS `Vistas`;

CREATE TABLE `Vistas`
(
	`id_Vista` INT NOT NULL PRIMARY KEY,
	`Url` VARCHAR ( 400 ) NOT NULL,
	`Titulo` VARCHAR ( 70 ) NOT NULL,
	`Fabicon` VARCHAR ( 70 ) NOT NULL,
	`Estado` ENUM ('Activa','Inactiva') NOT NULL
)
ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = "Item del menu dinamico";


DROP TABLE IF EXISTS Sub_Vistas;

CREATE TABLE `Sub_Vistas`
(
	`id_SubVista` INT NOT NULL PRIMARY KEY,
	`Url` VARCHAR( 400 ) NOT NULL,
	`Titulo` VARCHAR( 70 ) NOT NULL,
	`fk_Vista` INT NOT NULL,
	`Estado` ENUM ('Activa','Inactiva') NOT NULL
)
ENGINE = InnoDB DEFAULT CHARSET = latin1;

ALTER TABLE `Sub_Vistas` ADD CONSTRAINT `Sub_vistas_FK` FOREIGN KEY ( `fk_Vista` ) REFERENCES `Vistas` ( `id_Vista` );


DROP TABLE IF EXISTS `Vistas_Roles`;

CREATE TABLE `Vistas_Roles`
(
	`Estado` ENUM ('Activo','Inactivo') NOT NULL,
	`fk_SubVista` INT NOT NULL,
	`fk_Rol` INT NOT NULL
)
ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = "Tabla para conocer permisos";

ALTER TABLE `Vistas_Roles` ADD CONSTRAINT `Rol_fkk` FOREIGN KEY ( `fk_Rol` ) REFERENCES `Rol` ( `id_Rol` );
ALTER TABLE `Vistas_Roles` ADD CONSTRAINT `subVista_fkk` FOREIGN KEY ( `fk_SubVista` ) REFERENCES `Sub_Vistas` ( `id_SubVista` );


DROP TABLE IF EXISTS `Type_Event`;
#Falta procedimiento
CREATE TABLE `Type_Event`
(
	`id_TypeEvent` INT NOT NULL PRIMARY KEY,
	`TipoDeEvento` VARCHAR ( 50 ) NOT NULL,
	`DescriptionType` VARCHAR ( 400 ) NOT NULL
)ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'Table type of event';


DROP TABLE IF EXISTS `Event`;
#Falta procedimiento
CREATE TABLE `Event`
(
	`id_Event` INT NOT NULL PRIMARY KEY,
	`Nombre` VARCHAR ( 100 ) NOT NULL,
	`FechaInicio` DATETIME NOT NULL,
	`FechaFin` DATETIME NOT NULL,
	`Estado` ENUM('Finalizado','En Desarrollo','Aprobado','Sin Aprobar'),
	`fk_user` INT NOT NULL,
	`fk_type` INT NOT NULL
)
ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = "Tabla para Eventos";

ALTER TABLE `Event` ADD CONSTRAINT `referenciadeusuario` FOREIGN KEY ( `fk_user` ) REFERENCES `Usuario` ( `id_Usuario` );
ALTER TABLE `Event` ADD CONSTRAINT `TipoEvento` FOREIGN KEY ( `fk_type` ) REFERENCES `Type_Event` ( `id_TypeEvent` );


DROP TABLE IF EXISTS `Campus`;
#Falta procedimiento
CREATE TABLE `Campus`
(
	`id_Campus` INT NOT NULL PRIMARY KEY,
	`Nombre` VARCHAR ( 200 ) NOT NULL,
	`Direccion` VARCHAR ( 150 ) NOT NULL
)
ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = "Tabla para los campus de la empresa";


DROP TABLE IF EXISTS `Ubicacion`;
#Falta procedimiento
CREATE TABLE `Ubicacion`
(
	`id_Ubicacion` INT NOT NULL PRIMARY KEY,
	`Ubicacion` VARCHAR ( 60 ) NOT NULL,
	`fk_Campus` INT NOT NULL
)
ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = "Tabla para lugar especifico";

ALTER TABLE `Ubicacion` ADD CONSTRAINT `referencia_campus` FOREIGN KEY ( `fk_Campus` ) REFERENCES `Campus` ( `id_Campus` );
