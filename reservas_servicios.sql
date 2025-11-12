-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS reservas_servicios_db;
USE reservas_servicios_db;

-- ============================================
-- Tabla: CLIENTES
-- ============================================
CREATE TABLE CLIENTES (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(150),
    documento VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- Tabla: RESERVAS
-- ============================================
CREATE TABLE RESERVAS (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    tipo VARCHAR(50),
    estado VARCHAR(30),
    cantidad_personas INT,
    observaciones TEXT,
    CONSTRAINT fk_reserva_cliente FOREIGN KEY (id_cliente)
        REFERENCES CLIENTES(id_cliente)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ============================================
-- Tabla: SERVICIOS
-- ============================================
CREATE TABLE SERVICIOS (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio_base DECIMAL(10,2)
);

-- ============================================
-- Tabla: RESERVA_DE_SERVICIO
-- (Tabla intermedia N:M entre RESERVAS y SERVICIOS)
-- ============================================
CREATE TABLE RESERVA_DE_SERVICIO (
    id_reserva INT NOT NULL,
    id_servicio INT NOT NULL,
    cantidad INT DEFAULT 1,
    precio_unitario DECIMAL(10,2),
    PRIMARY KEY (id_reserva, id_servicio),
    CONSTRAINT fk_rs_reserva FOREIGN KEY (id_reserva)
        REFERENCES RESERVAS(id_reserva)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_rs_servicio FOREIGN KEY (id_servicio)
        REFERENCES SERVICIOS(id_servicio)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
