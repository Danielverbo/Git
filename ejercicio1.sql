
DROP TABLES IF EXISTS Autor,Libro,CopiasLibros,Usuario,Prestamo;

CREATE TABLE Autor (
    AutorID INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);
CREATE TABLE Libro (
    LibroID INT PRIMARY KEY,
    Titulo VARCHAR(50) NOT NULL,
    AutorID INT,
    FOREIGN KEY (AutorID)
        REFERENCES Autor (AutorID)
);
CREATE TABLE CopiasLibros (
    CopiaID INT PRIMARY KEY,
    LibroID INT,
    UNIQUE (LibroID , CopiaID),
    FOREIGN KEY (LibroID)
        REFERENCES Libro (LibroID)
);
CREATE TABLE Usuario (
    Nombre VARCHAR(50) NOT NULL,
    Dirección VARCHAR(50) NOT NULL,
    Teléfono INT,
    UsuarioID INT PRIMARY KEY
);
CREATE TABLE Prestamo (
    PrestamoID INT PRIMARY KEY,
    UsuarioID INT,
    CopiaiD INT,
    Fecha_prestamo DATE,
    Fecha_devolución DATE,
    Devuelto BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (UsuarioID)
        REFERENCES Usuario (UsuarioID),
    FOREIGN KEY (CopiaID)
        REFERENCES CopiasLibros (CopiaID),
    CHECK (Devuelto IN (0 , 1))
);