use tienda;
DROP TABLES IF EXISTS clientes,pedido,producto,categoria,detalle_pedido;

CREATE TABLE clientes(
    clienteID int PRIMARY KEY AUTO_INCREMENT,
	nombre VarChar(50) NOT NULL,
    direccion VarChar(50) NOT NULL,
    correo VarChar(50) UNIQUE,
    pedidos int NOT NULL
);

CREATE TABLE pedido(
	pedidoID int PRIMARY KEY AUTO_INCREMENT,
	fecha DATETIME NOT NULL,
    cancelar BOOLEAN DEFAULT FALSE,
    clienteID int NOT NULL,
    FOREIGN KEY (clienteID) REFERENCES clientes(clienteID)
);

CREATE TABLE producto(
	productoID int PRIMARY KEY AUTO_INCREMENT,
	nombre VarChar(50) NOT NULL,
	precio DECIMAL(10,2) NOT NULL,
    cantidad int NOT NULL,
    categoriaID VarChar(50) NOT NULL,
    pedidoID int NOT NULL,
    FOREIGN KEY (pedidoID) REFERENCES pedido(pedidoID),
    FOREIGN KEY (categoriaID) REFERENCES categoria(categoriaID) ON DELETE CASCADE
);

CREATE TABLE categoria(
	categoriaID int PRIMARY KEY AUTO_INCREMENT,
	nombre VarChar(50) NOT NULL
);

CREATE TABLE detalle_pedido(
	id int PRIMARY KEY AUTO_INCREMENT,
	cantidad int NOT NULL,
    productoID int NOT NULL,
    pedidoID int NOT NULL,
    FOREIGN KEY(productoID) REFERENCES producto(productoID),
    FOREIGN KEY(pedidoID) REFERENCES pedido(pedidoID),
    UNIQUE(productoID,pedidoID)
);
