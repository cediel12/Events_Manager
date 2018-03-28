/*PROCEDIMIENTOS ALMACENADOS*/

USE `Events`;


DROP PROCEDURE IF EXISTS `insert_Empresa`;

Delimiter $$

CREATE PROCEDURE `insert_Empresa`
(
	`NIT` VARCHAR ( 50 ),
	`Nombre` VARCHAR ( 120 ),
	`Banner` VARCHAR ( 450 ),
	`Icono` VARCHAR ( 450 ),
	`BG` VARCHAR ( 450 )
)
BEGIN
	DECLARE
		`id` INT DEFAULT 
		(
			SELECT 
				COUNT( `id_Empresa` )+1
			FROM
				`Empresa`
		) ;
	DECLARE
		`exi` INT DEFAULT
		(
			SELECT 
				`id_Empresa`
			FROM
				`Empresa` AS e 
			WHERE 
				`NIT`=e.`NIT`
		);
	IF  (`exi` IS NULL)
	AND ( LENGTH ( `Nombre` ) >= 4 )
	AND ( LENGTH( `Banner` ) >= 10)
	AND ( LENGTH( `Icono` ) >= 10)
	AND ( LENGTH( `BG` ) >= 10)
	AND ( LENGTH( `NIT`) >= 7)
		THEN
			INSERT INTO `Empresa` 
			VALUES 
			(
				`id`,
				`NIT`,
				`Nombre`,
				`Banner`,
				`Icono`,
				`BG`
			);
	END IF;
END ;

$$ Delimiter ; 


DROP PROCEDURE IF EXISTS `insert_Genero`;

Delimiter $$

CREATE PROCEDURE `insert_Genero` 
(
	`_Genero` VARCHAR ( 10 )
)
BEGIN
	DECLARE
		`exi` INT DEFAULT 
		(
			SELECT
				`id_Genero`
			FROM
				`Genero` AS g
			WHERE
				`_Genero` = g.`Tipo`
		) ; 
	DECLARE
		`aux` INT DEFAULT 
		(
			SELECT
				COUNT( `id_Genero` ) + 1
			FROM
				`Genero`
		) ;
	IF (`exi` IS NULL) 
		THEN
			INSERT INTO `Genero`
			VALUES
			(
				`aux`,
				`_Genero`
			) ;
	END	IF ;
END ;

$$ delimiter ;


DROP PROCEDURE IF EXISTS `insert_Persona`;

Delimiter $$

CREATE PROCEDURE `insert_Persona` 
(
	`Fecha_Nacimiento` DATE,
	`Identificacion` NUMERIC ( 12 ),
	`Nombre1` VARCHAR ( 70 ),
	`Nombre2` VARCHAR ( 70 ),
	`Apellido1` VARCHAR ( 70 ),
	`Apellido2` VARCHAR ( 70 ),
	`Telefono` VARCHAR ( 10 ),
	`fk_genero` INT
)
BEGIN
	DECLARE
		`exist` INT DEFAULT 
		(
			SELECT
				`id_Persona`
			FROM
				`Persona` AS p
			WHERE
				`Identificacion` = p.`Identificacion`
		) ; 
	DECLARE
		`foranea` INT DEFAULT 
		(
			SELECT
				`id_Genero`
			FROM
				`Genero` AS g
			WHERE
				`fk_genero`= g.`id_Genero`
		) ;
	DECLARE
		`id` INT DEFAULT 
		(
			SELECT
				COUNT( `id_Persona` ) + 1
			FROM
				`Persona`
		) ; 
	DECLARE
		`maxgenero` INT DEFAULT 
		(
			SELECT
				MAX( `id_Genero` )
			FROM
				`Genero`
		) ;
	IF ( `exist` IS NULL )
	AND ( `foranea` IS NOT NULL )
	AND ( (YEAR ( now() ) - YEAR ( `Fecha_Nacimiento` ) ) BETWEEN 18	AND 117	)
	AND ( LENGTH( `Identificacion` ) >= 6 AND `Identificacion` >= 100000)
	AND ( LENGTH( `Apellido1` ) >= 4)
	AND ( `fk_genero` BETWEEN 1 AND `maxgenero` ) 
		THEN
			INSERT INTO `Persona`
			VALUES
			(
				`id`,
				`Fecha_Nacimiento`,
				`Identificacion`,
				`Nombre1`,
				`Nombre2`,
				`Apellido1`,
				`Apellido2`,
				`Telefono`,
				1,
				`fk_genero`
			) ;
	END	IF ;
END ;
$$ delimiter ;


DROP PROCEDURE IF EXISTS `insert_Usuario`;

delimiter $$

CREATE PROCEDURE `insert_Usuario` 
(
	`Email` VARCHAR ( 320 ),
	`contraseña` VARCHAR ( 300 ),
	`fk_Persona` INT
)
BEGIN
	DECLARE
		`id` INT DEFAULT 
		(
			SELECT
				COUNT( `id_usuario` ) + 1
			FROM
				`Usuario`
		) ;
	DECLARE
		`exist` INT DEFAULT 
		(
			SELECT
				`id_Usuario`
			FROM
				`Usuario` AS u
			WHERE
				`Email` = u.`Email`
		) ;
	 DECLARE
		`foranea` INT DEFAULT 
		(
			SELECT
				`id_Persona`
			FROM
				`Persona`
			WHERE
				`fk_Persona` = `id_Persona`
		) ;
	IF exist IS NULL
	AND `foranea` IS NOT NULL
	AND ( LENGTH( `contraseña` ) BETWEEN 4	AND 45)
	AND ( `fk_Persona` > 0)
	AND ( LENGTH( `Email` ) BETWEEN 10 AND 320 ) 
		THEN
			INSERT INTO `Usuario`
			VALUES
			(
				`id`,
				`Email`,
				PASSWORD( `contraseña` ),
				CURDATE(),
				1,
				`fk_Persona`,
				1
			) ;
	END	IF ;
END ;

$$ delimiter ;


DROP PROCEDURE IF EXISTS `insert_User_admin`;

Delimiter $$

CREATE PROCEDURE `insert_User_admin`
(
	`Email` VARCHAR ( 320 ),
	`contraseña` VARCHAR ( 300 ),
	`fk_Persona` INT
)
BEGIN
DECLARE
		`id` INT DEFAULT 
		(
			SELECT
				COUNT( `id_usuario` ) + 1
			FROM
				`Usuario`
		) ;
	DECLARE
		`exist` INT DEFAULT 
		(
			SELECT
				`id_Usuario`
			FROM
				`Usuario` AS u
			WHERE
				`Email` = u.`Email`
		) ;
	 DECLARE
		`foranea` INT DEFAULT 
		(
			SELECT
				`id_Persona`
			FROM
				`Persona`
			WHERE
				`fk_Persona` = `id_Persona`
		) ;
	IF ( `exist` IS NULL)
	AND ( `foranea` IS NOT NULL)
	AND ( LENGTH( `contraseña` ) BETWEEN 4	AND 45)
	AND ( `fk_Persona` > 0)
	AND ( LENGTH( `Email` ) BETWEEN 10 AND 320) 
		THEN
			INSERT INTO `Usuario`
			VALUES
			(
				`id`,
				`Email`,
				PASSWORD( `contraseña` ),
				CURDATE(),
				1,
				`fk_Persona`,
				2
			) ;
	END	IF ;
END;

$$ Delimiter 


DROP PROCEDURE IF EXISTS `insert_Rol`;

Delimiter $$

CREATE PROCEDURE `insert_Rol` 
(
	`Nombre` VARCHAR ( 70 )
)
BEGIN
	DECLARE
		`exi` INT DEFAULT 
		(
			SELECT
				`id_Rol`
			FROM
				`Rol` AS r
			WHERE
				`Nombre` = r.`Nombre`
		) ; 
	DECLARE
		`id` INT DEFAULT 
		(
			SELECT
				COUNT( `id_Rol` ) + 1
			FROM
				`Rol`
		) ;

	IF ( `exi` IS NULL)
	AND ( LENGTH( `Nombre` ) >= 4) 
		THEN
			INSERT INTO `Rol`
			VALUES
			(
				`id`,
				`Nombre`,
				1
			) ;
	END IF;
END ;
$$ Delimiter;


DROP PROCEDURE IF EXISTS `insert_Vistas`;

Delimiter $$

CREATE PROCEDURE `insert_Vistas` 
(
	`Url` VARCHAR ( 400 ),
	`Titulo` VARCHAR ( 70 ),
	`Fabicon` VARCHAR ( 70 )
)
BEGIN
	DECLARE
		`id` INT DEFAULT 
		(
			SELECT
				COUNT( `id_Vista` ) + 1
			FROM
				`Vistas`
		) ; 
	DECLARE
		`exist` INT DEFAULT 
		(
			SELECT
				`id_Vista`
			FROM
				`Vistas` AS v
			WHERE
				v.`Titulo` = `Titulo`
		) ;
	IF ( `exist` IS NULL)
	AND ( LENGTH( `Titulo`) BETWEEN 4 AND 70)
		THEN
			INSERT INTO `Vistas`
			VALUES
			(
				`id`,
				`Url`,
				`Titulo`,
				`Fabicon`,
				1
			) ;
	END	IF ;
END ;
$$ Delimiter ;


DROP PROCEDURE IF EXISTS `insert_VistasYRoles`;

Delimiter $$ 

CREATE PROCEDURE `insert_VistasYRoles`
(
	`fk_SubVista` INT,
	`fk_Rol` INT
)
BEGIN
	DECLARE
		`fk_v` INT DEFAULT
		(
			SELECT
				`id_SubVista`
			FROM 
				`Sub_Vistas` AS v 
			WHERE
				`fk_SubVista` = v.`id_SubVista`
		);
	DECLARE
		`fk_r` INT DEFAULT
		(
			SELECT
				`id_Rol`
			FROM 
				`Rol` AS r
			WHERE
				r.`id_Rol` = `fk_Rol`
		);
	IF ( `fk_v` IS NOT NULL)
	AND ( `fk_r` IS NOT NULL)
	AND ( `fk_v` > 0)
	AND ( `fk_r` > 0)
		THEN
			INSERT INTO `Vistas_Roles` 
			VALUES
			(
				1,
				`fk_SubVista`,
				`fk_Rol`
			);
	END IF;
END ;
$$ Delimiter ;


#SubVistas
DROP PROCEDURE IF EXISTS `insert_SubVistas`;

Delimiter $$

CREATE PROCEDURE `insert_SubVistas` 
(
	`Url` VARCHAR( 400 ),
	`Titulo` VARCHAR( 70 ), 
	`fk_vistas` INT
)
BEGIN
	DECLARE
		`id` INT DEFAULT 
		(
			SELECT
				COUNT( `id_SubVista` ) + 1
			FROM
				`Sub_Vistas`
		) ; 
	DECLARE
		`exist` INT DEFAULT 
		(
			SELECT
				`id_SubVista`
			FROM
				`Sub_Vistas` AS v
			WHERE
				v.`Titulo` = `Titulo`
		) ;
	DECLARE 
		`fk_v` INT DEFAULT 
		(
			SELECT 
				`id_Vista`
			FROM
				`Vistas` AS v
			WHERE 
				`fk_vistas` = v.`id_Vista`
		);
	IF ( `exist` IS NULL )
	AND( `fk_v` IS NOT NULL)
	AND ( LENGTH( `Titulo` ) >= 4) 
		THEN
			INSERT INTO `Sub_Vistas`
			VALUES
			(
				`id`,
				`Url`,
				`Titulo`,
				`fk_vistas`,
				1
			) ;
	END	IF ;
END ;
$$ Delimiter ;

#Login
DROP PROCEDURE IF EXISTS `logintemp`;

Delimiter $$

CREATE PROCEDURE `logintemp`
(
	`Email` VARCHAR( 320 ),
	`contra` varchar( 300 )
)
BEGIN
	SELECT 
		p.`Nombre1`, 
		p.`Apellido1`, 
		u.`Email` 
	FROM 
		`Persona` AS p 
	INNER JOIN 
		`Usuario` AS u 
	ON 
		p.`id_Persona` = u.`fk_Persona` 
	WHERE
	(
		u.`Email` = `Email` 
		AND 
		u.PASSWORD = PASSWORD( `contra` )
	);  

END;

$$ Delimiter;