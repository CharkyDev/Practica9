DROP DATABASE IF EXISTS universidad;
CREATE DATABASE universidad ;
USE universidad;

CREATE TABLE departamento (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE persona (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo CHAR(1) NOT NULL CHECK (sexo IN ('H', 'M')),
    tipo VARCHAR(10) NOT NULL CHECK (tipo IN ('profesor', 'alumno'))
);

CREATE TABLE profesor (
    id_profesor INT PRIMARY KEY,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES persona(id),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

CREATE TABLE grado (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE asignatura (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT NOT NULL,
    tipo VARCHAR(50) NOT NULL CHECK (tipo IN ('básica', 'obligatoria', 'optativa')),
    curso TINYINT NOT NULL,
    cuatrimestre TINYINT NOT NULL,
    id_profesor INT,
    id_grado INT NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY(id_grado) REFERENCES grado(id)
);

CREATE TABLE curso_escolar (
    id INT IDENTITY(1,1) PRIMARY KEY,
    anyo_inicio INT NOT NULL,
    anyo_fin INT NOT NULL
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    id_curso_escolar INT NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES persona(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);

-- Insertar datos en la tabla departamento
INSERT INTO departamento (nombre) VALUES 
('Informática'),
('Matemáticas'),
('Economía y Empresa'),
('Educación'),
('Agronomía'),
('Química y Física'),
('Filología'),
('Derecho'),
('Biología y Geología');

-- Insertar datos en la tabla persona
INSERT INTO persona (nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES 
('26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H', 'alumno'),
('89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992/08/08', 'H', 'alumno'),
('11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979/08/19', 'M', 'profesor'),
('17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H', 'alumno'),
('38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978/01/19', 'H', 'profesor'),
('04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998/01/28', 'H', 'alumno'),
('97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999/05/24', 'H', 'alumno'),
('79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977/08/21', 'M', 'profesor'),
('82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996/11/21', 'H', 'alumno'),
('61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977/05/19', 'M', 'profesor'),
('46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997/04/26', 'H', 'alumno'),
('85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor'),
('73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 'profesor'),
('82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Fuentecilla', NULL, '2000/05/20', 'H', 'alumno'),
('12453988Y', 'Isabel', 'Alva', 'Crist', 'Almería', 'C/ Alfareros', '644367812', '1998/01/22', 'M', 'alumno'),
('28477571M', 'Nerea', 'Hickle', 'Greenholt', 'Almería', 'C/ Corregidores', '630871243', '1973/06/06', 'M', 'profesor'),
('29559716Q', 'Carlos', 'Huel', 'Ledner', 'Almería', 'C/ Palma', '950132482', '2000/12/06', 'H', 'alumno'),
('81100116A', 'Marta', 'Mann', 'Herzog', 'Almería', 'C/ Profetas', '662732509', '1979/07/15', 'M', 'profesor'),
('16328232R', 'Noemi', 'McClure', 'Smith', 'Almería', 'C/ Estadio', NULL, '1999/10/06', 'M', 'alumno'),
('87527604M', 'Andrea', 'Lockman', 'Stamm', 'Almería', 'C/ Raigadas', '630645183', '2000/11/16', 'M', 'alumno'),
('41141987P', 'Andrés', 'Upton', 'Pacocha', 'Almería', 'C/ Periferico', '622165092', '1997/11/23', 'H', 'alumno'),
('16046398P', 'Cristian', 'Gerlach', 'Zieme', 'Almería', 'C/ Salvador', '643722761', '1997/08/28', 'H', 'alumno'),
('90278329S', 'Erik', 'Schowalter', 'Baumbach', 'Almería', 'C/ Oliveros', '617431298', '1977/02/16', 'H', 'profesor'),
('42187055E', 'Jesús', 'Champlin', 'Stroman', 'Almería', 'C/ Nilo', '677329863', '1998/03/30', 'H', 'alumno');

-- Insertar datos en la tabla profesor
INSERT INTO profesor (id_profesor, id_departamento) VALUES 
((SELECT id FROM persona WHERE nif = '11105554G'), 1),
((SELECT id FROM persona WHERE nif = '38223286T'), 2),
((SELECT id FROM persona WHERE nif = '79503962T'), 1),
((SELECT id FROM persona WHERE nif = '61142000L'), 5),
((SELECT id FROM persona WHERE nif = '85366986W'), 4),
((SELECT id FROM persona WHERE nif = '73571384L'), 2),
((SELECT id FROM persona WHERE nif = '28477571M'), 3),
((SELECT id FROM persona WHERE nif = '81100116A'), 9),
((SELECT id FROM persona WHERE nif = '90278329S'), 6);

INSERT INTO grado (nombre) VALUES 
('Grado en Matemáticas'),
('Grado en Biotecnología'),
('Grado en Física'),
('Grado en Derecho'),
('Grado en Ingeniería Informática'),
('Grado en Economía'),
('Grado en Educación Primaria'),
('Grado en Educación Infantil'),
('Grado en Filología Española'),
('Grado en Ingeniería Química');

-- Insertar datos en la tabla asignatura
INSERT INTO asignatura (nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES 
('Fundamentos de Matemáticas', 12.0, 'básica', 1, 1, (SELECT id FROM persona WHERE nif = '38223286T'), (SELECT id FROM grado WHERE nombre = 'Grado en Matemáticas')),
('Análisis Matemático I', 6.0, 'básica', 1, 1, (SELECT id FROM persona WHERE nif = '38223286T'), (SELECT id FROM grado WHERE nombre = 'Grado en Matemáticas')),
('Álgebra Lineal I', 6.0, 'básica', 1, 1, (SELECT id FROM persona WHERE nif = '38223286T'), (SELECT id FROM grado WHERE nombre = 'Grado en Matemáticas')),
('Inglés', 6.0, 'básica', 1, 2, NULL, (SELECT id FROM grado WHERE nombre = 'Grado en Matemáticas')),
('Análisis Matemático II', 6.0, 'obligatoria', 1, 2, (SELECT id FROM persona WHERE nif = '38223286T'), (SELECT id FROM grado WHERE nombre = 'Grado en Matemáticas')),
('Álgebra Lineal II', 6.0, 'obligatoria', 1, 2, (SELECT id FROM persona WHERE nif = '38223286T'), (SELECT id FROM grado WHERE nombre = 'Grado en Matemáticas')),
('Fundamentos de Física I', 6.0, 'básica', 1, 1, (SELECT id FROM persona WHERE nif = '38223286T'), (SELECT id FROM grado WHERE nombre = 'Grado en Matemáticas')),
('Fundamentos de Física II', 6.0, 'básica', 1, 2, (SELECT id FROM persona WHERE nif = '38223286T'), (SELECT id FROM grado WHERE nombre = 'Grado en Matemáticas')),
('Programación', 6.0, 'básica', 1, 2, (SELECT id FROM persona WHERE nif = '38223286T'), (SELECT id FROM grado WHERE nombre = 'Grado en Matemáticas')),
('Fundamentos de Matemáticas', 12.0, 'básica', 1, 1, (SELECT id FROM persona WHERE nif = '38223286T'), (SELECT id FROM grado WHERE nombre = 'Grado en Ingeniería Informática'));

-- Insertar datos en la tabla curso_escolar
INSERT INTO curso_escolar (anyo_inicio, anyo_fin) VALUES 
(2020, 2021),
(2021, 2022),
(2022, 2023),
(2023, 2024);


DELETE  FROM alumno_se_matricula_asignatura;
DELETE  FROM curso_escolar;
DELETE  FROM asignatura;
DELETE  FROM grado;
DELETE  FROM profesor;
DELETE  FROM persona;
DELETE  FROM departamento;

SELECT * FROM alumno_se_matricula_asignatura;
SELECT * FROM curso_escolar;
SELECT * FROM asignatura;
SELECT * FROM grado;
SELECT * FROM profesor;
SELECT * FROM persona;
SELECT * FROM departamento;

