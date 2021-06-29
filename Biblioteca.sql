-- Borrar datos anteriores

DROP DATABASE biblioteca;
-- Creamos la base de datos

CREATE DATABASE biblioteca;

-- Nos conectamos a la based de datos.

\c biblioteca;

-- Creamos las tablas

CREATE TABLE socios(
    rut VARCHAR(15),
    socio VARCHAR(50),
    direccion VARCHAR(50),
    telefono INT,
    PRIMARY KEY (rut));

CREATE TABLE libros(
    isbn VARCHAR(50),
    libro VARCHAR(50),
    pagina INT,
    diasprestamo INT,
    PRIMARY KEY (libro));
    FOREIGN KEY (isbn) REFERENCES autores(isbn));

CREATE TABLE autordesc(
    cod_autor VARCHAR(20),
    nombre_autor VARCHAR(20),
    apellido_autor VARCHAR(20),
    nacimiento INT,
    muerte INT,
    tipo_autor VARCHAR(20),
    PRIMARY KEY (cod_autor));

CREATE TABLE historial(
    socio VARCHAR(50),
    libro VARCHAR(50),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    rut VARCHAR(15));
    FOREIGN KEY (rut) REFERENCES socio(rut),
    FOREIGN KEY (libro) REFERENCES libros(libro));

CREATE TABLE autores(
    isbn VARCHAR(50), 
    cod_autor VARCHAR(20),
    PRIMARY KEY (isbn));
    FOREIGN KEY (cod_autor) REFERENCES autordesc(cod_autor));

-- -- Copiando la información a las tablas
-- prueba

\copy socios FROM 'socios.csv' csv header;
\copy libros FROM 'libros.csv' csv header;
\copy autordesc FROM 'autore_dec.csv' csv header;
\copy historial FROM 'historial.csv' csv header;
\copy autores FROM 'autores2.csv' csv header;

-- Revisando las tablas

--  SELECT * FROM socios;
--  SELECT * FROM libros;
--  SELECT * FROM autores;
--  SELECT * FROM historial;
--  SELECT * FROM autordesc;

--  Respondiendo las preguntas

 SELECT libro FROM libros WHERE pagina < 300;
SELECT nombre_autor, apellido_autor FROM autordesc WHERE nacimiento > 1970;
SELECT libro, COUNT(libro) AS total FROM historial GROUP BY libro ORDER BY total DESC LIMIT 1;