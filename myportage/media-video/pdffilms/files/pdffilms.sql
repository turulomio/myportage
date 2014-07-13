--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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


ALTER TABLE films OWNER TO postgres;

--
-- Name: films_duplicated; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW films_duplicated AS
 SELECT upper(films.name) AS upper,
    count(*) AS count
   FROM films
  GROUP BY upper(films.name)
 HAVING (count(*) > 1);


ALTER TABLE films_duplicated OWNER TO postgres;

--
-- Name: VIEW films_duplicated; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW films_duplicated IS 'Show films duplicated and count them';


--
-- Name: films_id_duplicated; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW films_id_duplicated AS
 SELECT films.id_dvd,
    upper(films.name) AS upper
   FROM films,
    ( SELECT upper(films_1.name) AS name,
            count(*) AS count
           FROM films films_1
          GROUP BY upper(films_1.name)
         HAVING (count(*) > 1)) k
  WHERE (upper(films.name) = upper(k.name));


ALTER TABLE films_id_duplicated OWNER TO postgres;

--
-- Name: VIEW films_id_duplicated; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW films_id_duplicated IS 'Shows films duplicated with id_dvd';


--
-- Name: films_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE films_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE films_seq OWNER TO postgres;

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

