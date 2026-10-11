-- =========================
-- BIBLIOTECA
-- =========================
CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE categoria (
  id_categoria INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(255)
);

CREATE TABLE libro (
  id_libro INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(150) NOT NULL,
  anio_publicacion INT,
  cantidad_disponible INT DEFAULT 0,
  id_categoria INT,
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE estudiante (
  matricula VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  apellido VARCHAR(80) NOT NULL,
  curso VARCHAR(50),
  fecha_nacimiento DATE
);

CREATE TABLE bibliotecario (
  codigo INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(80) NOT NULL,
  apellido VARCHAR(80) NOT NULL,
  telefono VARCHAR(20)
);

CREATE TABLE prestamo (
  id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
  id_libro INT NOT NULL,
  matricula VARCHAR(20) NOT NULL,
  codigo_bibliotecario INT NOT NULL,
  fecha_prestamo DATE NOT NULL,
  fecha_devolucion DATE,
  estado_libro VARCHAR(50),
  FOREIGN KEY (id_libro) REFERENCES libro(id_libro),
  FOREIGN KEY (matricula) REFERENCES estudiante(matricula),
  FOREIGN KEY (codigo_bibliotecario) REFERENCES bibliotecario(codigo)
);
