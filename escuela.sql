-- =========================
-- ESCUELA
-- =========================
CREATE DATABASE escuela;
USE escuela;

CREATE TABLE padre_tutor (
  id_padre_tutor INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(20),
  direccion VARCHAR(255),
  parentesco VARCHAR(50)
);

CREATE TABLE curso (
  id_curso INT PRIMARY KEY AUTO_INCREMENT,
  grado VARCHAR(20) NOT NULL,
  seccion VARCHAR(10),
  aula VARCHAR(20)
);

CREATE TABLE estudiante (
  id_estudiante INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(80) NOT NULL,
  apellido VARCHAR(80) NOT NULL,
  fecha_nacimiento DATE,
  id_padre_tutor INT,
  id_curso INT,
  FOREIGN KEY (id_padre_tutor) REFERENCES padre_tutor(id_padre_tutor),
  FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE asignatura (
  id_asignatura INT PRIMARY KEY AUTO_INCREMENT,
  nombre_asignatura VARCHAR(100) NOT NULL,
  creditos INT
);

CREATE TABLE docente (
  id_docente INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(80) NOT NULL,
  apellido VARCHAR(80) NOT NULL,
  telefono VARCHAR(20),
  especialidad VARCHAR(100)
);

-- Relación Asignatura - Curso (con su docente)
CREATE TABLE curso_asignatura (
  id_curso INT,
  id_asignatura INT,
  id_docente INT,
  PRIMARY KEY (id_curso, id_asignatura),
  FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
  FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura),
  FOREIGN KEY (id_docente) REFERENCES docente(id_docente)
);

CREATE TABLE calificacion (
  id_calificacion INT PRIMARY KEY AUTO_INCREMENT,
  id_estudiante INT NOT NULL,
  id_asignatura INT NOT NULL,
  periodo VARCHAR(20),
  nota_obtenida DECIMAL(5,2),
  FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
  FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura)
);
