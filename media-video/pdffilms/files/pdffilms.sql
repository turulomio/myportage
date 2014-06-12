--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: films; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE films (
    id_films integer DEFAULT nextval(('"films_seq"'::text)::regclass) NOT NULL,
    savedate date,
    name text,
    foto oid,
    id_dvd integer
);


ALTER TABLE public.films OWNER TO postgres;

--
-- Name: films_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE films_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.films_seq OWNER TO postgres;

--
-- Name: films_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_pk PRIMARY KEY (id_films);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

