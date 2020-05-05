-- Database: transporte
-- DROP DATABASE transporte;
CREATE DATABASE transporte
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'es_PE.UTF-8'
    LC_CTYPE = 'es_PE.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;



-- Table: estacion
-- DROP TABLE estacion;
CREATE TABLE estacion
(
    id serial NOT NULL,
    nombre character varying(100),
    direccion character varying,
    CONSTRAINT estacion_pkey PRIMARY KEY (id)
);
ALTER TABLE estacion
    OWNER to postgres;

GRANT ALL ON TABLE estacion TO postgres;
GRANT INSERT, SELECT, UPDATE ON TABLE estacion TO usuario_consulta;


-- Table: tren
-- DROP TABLE tren;
CREATE TABLE tren
(
    id serial NOT NULL,
    modelo character varying(100),
    capacidad integer,
    CONSTRAINT tren_pkey PRIMARY KEY (id)
);
ALTER TABLE tren
    OWNER to postgres;

GRANT ALL ON TABLE tren TO postgres;
GRANT INSERT, SELECT, UPDATE ON TABLE tren TO usuario_consulta;


-- Table: pasajero
-- DROP TABLE pasajero;
CREATE TABLE pasajero
(
    id serial NOT NULL,
    nombre character varying(100),
    direccion_residencia character varying(200),
    fecha_nacimiento date,
    CONSTRAINT pasajero_pkey PRIMARY KEY (id)
);
ALTER TABLE pasajero
    OWNER to postgres;

GRANT ALL ON TABLE pasajero TO postgres;
GRANT INSERT, SELECT, UPDATE ON TABLE pasajero TO usuario_consulta;


-- Table: trayecto
-- DROP TABLE trayecto;
CREATE TABLE trayecto
(
    id serial NOT NULL,
    id_tren integer,
    id_estacion integer,
    CONSTRAINT trayecto_pkey PRIMARY KEY (id),
    CONSTRAINT trayecto_estacion_fkey FOREIGN KEY (id_estacion)
        REFERENCES estacion (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT trayecto_tren_fkey FOREIGN KEY (id_tren)
        REFERENCES tren (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
ALTER TABLE trayecto
    OWNER to postgres;

GRANT ALL ON TABLE trayecto TO postgres;
GRANT INSERT, SELECT, UPDATE ON TABLE trayecto TO usuario_consulta;


-- Table: viaje
-- DROP TABLE viaje;
CREATE TABLE viaje
(
    id serial NOT NULL,
    id_pasajero integer,
    id_trayecto integer,
    inicio date,
    fin date,
    CONSTRAINT viaje_pkey PRIMARY KEY (id),
    CONSTRAINT viaje_pasajero_fkey FOREIGN KEY (id_pasajero)
        REFERENCES pasajero (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT viaje_trayecto_fkey FOREIGN KEY (id_trayecto)
        REFERENCES trayecto (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
ALTER TABLE viaje
    OWNER to postgres;

GRANT ALL ON TABLE viaje TO postgres;
GRANT INSERT, SELECT, UPDATE ON TABLE viaje TO usuario_consulta;