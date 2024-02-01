use empresa;

DROP TABLE IF EXISTS departamentos,empleado,proyecto,habilidades,habilidades_proyecto;

CREATE TABLE empleado(
	id_empleado int PRIMARY KEY AUTO_INCREMENT,
    nombre VarChar(255) NOT NULL,
    fecha_inicio DATE NOT NULL,
    salario DECIMAL (10,2)
);

CREATE TABLE departamentos(
	id_departamento int PRIMARY KEY AUTO_INCREMENT,
    nombre VarChar(255) NOT NULL,
    numero int NOT NULL,
    ubicacion VarChar(255) NOT NULL,
    id_empleado int,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE proyecto(
	id_proyecto int PRIMARY KEY AUTO_INCREMENT,
    nombre VarChar(255) NOT NULL,
    fecha_inicio DATE NOT NULL,
    id_departamento int,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

CREATE TABLE habilidades(
	nombre_habilidad VarChar(255) UNIQUE
);

CREATE TABLE habilidades_proyecto(
	horas int ,
    nombre_habilidad VarChar(255) UNIQUE,
    id_proyecto int,
    id_empleado int,
    PRIMARY KEY (id_proyecto, id_empleado,nombre_habilidad),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (nombre_habilidad) REFERENCES habilidades(nombre_habilidad),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto)
    
);