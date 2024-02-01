use transmision;

DROP TABLES IF EXISTS pelicula,usuario,listas_reproduccion,calificaciones,genero,interacion;

CREATE TABLE pelicula(
	id_pelicula int PRIMARY KEY AUTO_INCREMENT,
    nombre VarChar(50) NOT NULL,
    año DATE NOT NULL,
    duracion int NOT NULL
);

CREATE TABLE usuario(
	id_usuario int PRIMARY KEY AUTO_INCREMENT,
    nombre VarChar(50) NOT NULL
);

CREATE TABLE listas_reproduccion(
	id_listas int PRIMARY KEY AUTO_INCREMENT,
    id_usuario int NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);
CREATE TABLE calificaciones(
	id_calificacion int PRIMARY KEY AUTO_INCREMENT,
    comentario VarChar(255) NOT NULL,
    calificacion int NOT NULL,
    id_usuario int NOT NULL,
    id_pelicula int NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE genero(
	id_genero int PRIMARY KEY AUTO_INCREMENT,
    nombre VarChar(50) NOT NULL
);

CREATE TABLE interacion(
	id_interacion int PRIMARY KEY AUTO_INCREMENT,
    nombre VarChar(50) NOT NULL,
    tipo VarChar(255),
    id_usuario int NOT NULL,
    id_pelicula int NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

