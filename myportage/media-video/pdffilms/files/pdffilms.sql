--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;


CREATE TABLE peliculas (
    id_peliculas integer DEFAULT nextval(('"peliculas_id_peliculas_seq"'::text)::regclass) NOT NULL,
    fechagrabacion date,
    titulo text,
    lu_formatos integer DEFAULT 1,
    sonidook boolean,
    imagenok boolean,
    cds integer DEFAULT 1,
    comentario text,
    foto oid,
    tipofoto text DEFAULT 'jpg'::text,
    funciona boolean DEFAULT true,
    lu_situaciones integer,
    lu_ficheros integer,
    id_cds integer,
    foto100 oid
);


ALTER TABLE public.peliculas OWNER TO postgres;

--
-- Name: peliculas_id_peliculas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE peliculas_id_peliculas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.peliculas_id_peliculas_seq OWNER TO postgres;


ALTER TABLE ONLY peliculas
    ADD CONSTRAINT peliculas_pkey PRIMARY KEY (id_peliculas);


REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


