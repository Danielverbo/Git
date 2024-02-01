use ejercicio5;

DROP TABLES IF EXISTS proyectos,tareas,empleados,asignaciones;

CREATE TABLE proyectos(
	id_proyecto int PRIMARY KEY AUTO_INCREMENT,
    nombre VarChar(255) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

CREATE TABLE tareas (
	id_tareas int PRIMARY KEY AUTO_INCREMENT,
    nombre VarChar(255) NOT NULL,
    descripcion TEXT NOT NULL,
    id_proyecto int,
    FOREIGN KEY (id_proyecto) REFERENCES proyectos(id_proyecto)
);

CREATE TABLE empleados(
	id_empleados int PRIMARY KEY AUTO_INCREMENT,
    nombre VarChar(255) NOT NULL,
    cargo VarChar(100) NOT NULL,
    salario DECIMAL(10,2)
);

CREATE TABLE asignaciones (
	id_asignaciones int PRIMARY KEY AUTO_INCREMENT,
    horas_trabajadas int NOT NULL,
    fecha_asignacion DATE NOT NULL,
    id_tareas int,
    id_empleados int,
    FOREIGN KEY (id_tareas) REFERENCES tareas(id_tareas),
    FOREIGN KEY (id_empleados) REFERENCES empleados(id_empleados)
);
