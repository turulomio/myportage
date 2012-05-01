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

--
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categorias (
    id_categorias integer NOT NULL,
    categoria text NOT NULL
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- Name: categorias_id_categorias_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categorias_id_categorias_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_id_categorias_seq OWNER TO postgres;

--
-- Name: categorias_id_categorias_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categorias_id_categorias_seq OWNED BY categorias.id_categorias;


--
-- Name: cds; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cds (
    id_cds integer NOT NULL,
    titulo text,
    comentario text,
    zaragoza boolean DEFAULT false,
    fecha date DEFAULT now(),
    original boolean DEFAULT false,
    trabajo boolean DEFAULT false
);


ALTER TABLE public.cds OWNER TO postgres;

--
-- Name: comentarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comentarios (
    id_comentarios integer NOT NULL,
    id_peliculas integer,
    valoracion double precision,
    comentario text,
    fecha date,
    hora time without time zone,
    id_personas bigint
);


ALTER TABLE public.comentarios OWNER TO postgres;

--
-- Name: comentarios_id_comentarios_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comentarios_id_comentarios_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentarios_id_comentarios_seq OWNER TO postgres;

--
-- Name: comentarios_id_comentarios_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comentarios_id_comentarios_seq OWNED BY comentarios.id_comentarios;


--
-- Name: formatos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE formatos (
    id_formatos integer DEFAULT nextval(('"formatos_id_formatos_seq"'::text)::regclass) NOT NULL,
    formato text
);


ALTER TABLE public.formatos OWNER TO postgres;

--
-- Name: formatos_id_formatos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE formatos_id_formatos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formatos_id_formatos_seq OWNER TO postgres;

--
-- Name: fotos_id_fotos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fotos_id_fotos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fotos_id_fotos_seq OWNER TO postgres;

--
-- Name: indiceprogramas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE indiceprogramas (
    id_indiceprogramas integer NOT NULL,
    indiceprograma text NOT NULL,
    ma_indiceprogramas integer NOT NULL
);


ALTER TABLE public.indiceprogramas OWNER TO postgres;

--
-- Name: indiceprogramas_id_indiceprogramas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE indiceprogramas_id_indiceprogramas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indiceprogramas_id_indiceprogramas_seq OWNER TO postgres;

--
-- Name: indiceprogramas_id_indiceprogramas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE indiceprogramas_id_indiceprogramas_seq OWNED BY indiceprogramas.id_indiceprogramas;


--
-- Name: pelicates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pelicates (
    id_pelicates integer NOT NULL,
    lu_peliculas integer NOT NULL,
    lu_categorias integer NOT NULL
);


ALTER TABLE public.pelicates OWNER TO postgres;

--
-- Name: pelicates_id_pelicates_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pelicates_id_pelicates_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pelicates_id_pelicates_seq OWNER TO postgres;

--
-- Name: pelicates_id_pelicates_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pelicates_id_pelicates_seq OWNED BY pelicates.id_pelicates;


--
-- Name: peliculas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

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

--
-- Name: peliculasaconseguir; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE peliculasaconseguir (
    id_peliculasaconseguir integer NOT NULL,
    pelicula text,
    comentario text,
    fecha date DEFAULT now()
);


ALTER TABLE public.peliculasaconseguir OWNER TO postgres;

--
-- Name: peliculasaconseguir_id_peliculasaconseguir_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE peliculasaconseguir_id_peliculasaconseguir_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.peliculasaconseguir_id_peliculasaconseguir_seq OWNER TO postgres;

--
-- Name: peliculasaconseguir_id_peliculasaconseguir_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE peliculasaconseguir_id_peliculasaconseguir_seq OWNED BY peliculasaconseguir.id_peliculasaconseguir;


--
-- Name: pelipersos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pelipersos (
    id_pelipersos integer NOT NULL,
    lu_peliculas integer NOT NULL,
    lu_personas integer NOT NULL,
    fechavisionado date
);


ALTER TABLE public.pelipersos OWNER TO postgres;

--
-- Name: pelipersos_id_pelipersos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pelipersos_id_pelipersos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pelipersos_id_pelipersos_seq OWNER TO postgres;

--
-- Name: pelipersos_id_pelipersos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pelipersos_id_pelipersos_seq OWNED BY pelipersos.id_pelipersos;


--
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personas (
    id_personas integer NOT NULL,
    persona text NOT NULL
);


ALTER TABLE public.personas OWNER TO postgres;

--
-- Name: personas_id_personas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personas_id_personas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_id_personas_seq OWNER TO postgres;

--
-- Name: personas_id_personas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personas_id_personas_seq OWNED BY personas.id_personas;


--
-- Name: pga_forms; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pga_forms (
    formname character varying(64),
    formsource text
);


ALTER TABLE public.pga_forms OWNER TO postgres;

--
-- Name: pga_layout; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pga_layout (
    tablename character varying(64),
    nrcols smallint,
    colnames text,
    colwidth text
);


ALTER TABLE public.pga_layout OWNER TO postgres;

--
-- Name: pga_queries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pga_queries (
    queryname character varying(64),
    querytype character(1),
    querycommand text,
    querytables text,
    querylinks text,
    queryresults text,
    querycomments text
);


ALTER TABLE public.pga_queries OWNER TO postgres;

--
-- Name: pga_reports; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pga_reports (
    reportname character varying(64),
    reportsource text,
    reportbody text,
    reportprocs text,
    reportoptions text
);


ALTER TABLE public.pga_reports OWNER TO postgres;

--
-- Name: pga_schema; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pga_schema (
    schemaname character varying(64),
    schematables text,
    schemalinks text
);


ALTER TABLE public.pga_schema OWNER TO postgres;

--
-- Name: pga_scripts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pga_scripts (
    scriptname character varying(64),
    scriptsource text
);


ALTER TABLE public.pga_scripts OWNER TO postgres;

--
-- Name: programas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE programas (
    id_programas integer DEFAULT nextval(('public.seq_programas'::text)::regclass) NOT NULL,
    grabadoviejo integer,
    primero text,
    segundo text,
    nombre text,
    archivo text,
    almacen text,
    id_cd integer,
    so text,
    comentario text,
    ma_indiceprogramas integer,
    fecha date,
    grabado boolean
);


ALTER TABLE public.programas OWNER TO postgres;

--
-- Name: seq_programas; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_programas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_programas OWNER TO postgres;

--
-- Name: sistemaoperativo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sistemaoperativo (
    "IdSO" integer NOT NULL,
    "SO" text
);


ALTER TABLE public.sistemaoperativo OWNER TO postgres;

--
-- Name: situaciones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE situaciones (
    id_situaciones integer NOT NULL,
    situacion text NOT NULL
);


ALTER TABLE public.situaciones OWNER TO postgres;

--
-- Name: situaciones_id_situaciones_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE situaciones_id_situaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.situaciones_id_situaciones_seq OWNER TO postgres;

--
-- Name: situaciones_id_situaciones_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE situaciones_id_situaciones_seq OWNED BY situaciones.id_situaciones;


--
-- Name: software; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE software (
    id_programas integer,
    fecha date,
    id_cd integer,
    primero text,
    segundo text,
    nombre text,
    almacen text,
    so text,
    comentario text
);


ALTER TABLE public.software OWNER TO postgres;

--
-- Name: viewcomentarios; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW viewcomentarios AS
    SELECT comentarios.id_comentarios, comentarios.id_peliculas, comentarios.valoracion, comentarios.comentario, comentarios.fecha, comentarios.hora, comentarios.id_personas, peliculas.titulo, personas.persona FROM comentarios, personas, peliculas WHERE ((comentarios.id_peliculas = peliculas.id_peliculas) AND (personas.id_personas = comentarios.id_personas));


ALTER TABLE public.viewcomentarios OWNER TO postgres;

--
-- Name: viewpeliculas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW viewpeliculas AS
    SELECT peliculas.id_cds, peliculas.fechagrabacion, peliculas.titulo FROM peliculas;


ALTER TABLE public.viewpeliculas OWNER TO postgres;

--
-- Name: id_categorias; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categorias ALTER COLUMN id_categorias SET DEFAULT nextval('categorias_id_categorias_seq'::regclass);


--
-- Name: id_comentarios; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentarios ALTER COLUMN id_comentarios SET DEFAULT nextval('comentarios_id_comentarios_seq'::regclass);


--
-- Name: id_indiceprogramas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY indiceprogramas ALTER COLUMN id_indiceprogramas SET DEFAULT nextval('indiceprogramas_id_indiceprogramas_seq'::regclass);


--
-- Name: id_pelicates; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pelicates ALTER COLUMN id_pelicates SET DEFAULT nextval('pelicates_id_pelicates_seq'::regclass);


--
-- Name: id_peliculasaconseguir; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peliculasaconseguir ALTER COLUMN id_peliculasaconseguir SET DEFAULT nextval('peliculasaconseguir_id_peliculasaconseguir_seq'::regclass);


--
-- Name: id_pelipersos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pelipersos ALTER COLUMN id_pelipersos SET DEFAULT nextval('pelipersos_id_pelipersos_seq'::regclass);


--
-- Name: id_personas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas ALTER COLUMN id_personas SET DEFAULT nextval('personas_id_personas_seq'::regclass);


--
-- Name: id_situaciones; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY situaciones ALTER COLUMN id_situaciones SET DEFAULT nextval('situaciones_id_situaciones_seq'::regclass);


--
-- Name: categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categorias);


--
-- Name: formatos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY formatos
    ADD CONSTRAINT formatos_pkey PRIMARY KEY (id_formatos);


--
-- Name: pelicate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pelicates
    ADD CONSTRAINT pelicate_pkey PRIMARY KEY (id_pelicates);


--
-- Name: peliculas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY peliculas
    ADD CONSTRAINT peliculas_pkey PRIMARY KEY (id_peliculas);


--
-- Name: pelipersos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pelipersos
    ADD CONSTRAINT pelipersos_pkey PRIMARY KEY (id_pelipersos);


--
-- Name: personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id_personas);


--
-- Name: IdPrograma_programas_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "IdPrograma_programas_key" ON programas USING btree (id_programas);


--
-- Name: IdPrograma_programas_ukey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "IdPrograma_programas_ukey" ON programas USING btree (id_programas);


--
-- Name: categorias_id_categorias_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX categorias_id_categorias_key ON categorias USING btree (id_categorias);


--
-- Name: id_cds_cds_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX id_cds_cds_key ON cds USING btree (id_cds);


--
-- Name: id_cds_cds_ukey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX id_cds_cds_ukey ON cds USING btree (id_cds);


--
-- Name: id_peliculasaconseguir_peliculasaconseguir_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX id_peliculasaconseguir_peliculasaconseguir_key ON peliculasaconseguir USING btree (id_peliculasaconseguir);


--
-- Name: id_peliculasaconseguir_peliculasaconseguir_ukey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX id_peliculasaconseguir_peliculasaconseguir_ukey ON peliculasaconseguir USING btree (id_peliculasaconseguir);


--
-- Name: pelicate_id_pelicates_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pelicate_id_pelicates_key ON pelicates USING btree (id_pelicates);


--
-- Name: pelipersos_id_pelipersos_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pelipersos_id_pelipersos_key ON pelipersos USING btree (id_pelipersos);


--
-- Name: personas_id_personas_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX personas_id_personas_key ON personas USING btree (id_personas);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: pga_forms; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pga_forms FROM PUBLIC;
REVOKE ALL ON TABLE pga_forms FROM postgres;
GRANT ALL ON TABLE pga_forms TO postgres;
GRANT ALL ON TABLE pga_forms TO PUBLIC;


--
-- Name: pga_layout; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pga_layout FROM PUBLIC;
REVOKE ALL ON TABLE pga_layout FROM postgres;
GRANT ALL ON TABLE pga_layout TO postgres;
GRANT ALL ON TABLE pga_layout TO PUBLIC;


--
-- Name: pga_queries; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pga_queries FROM PUBLIC;
REVOKE ALL ON TABLE pga_queries FROM postgres;
GRANT ALL ON TABLE pga_queries TO postgres;
GRANT ALL ON TABLE pga_queries TO PUBLIC;


--
-- Name: pga_reports; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pga_reports FROM PUBLIC;
REVOKE ALL ON TABLE pga_reports FROM postgres;
GRANT ALL ON TABLE pga_reports TO postgres;
GRANT ALL ON TABLE pga_reports TO PUBLIC;


--
-- Name: pga_schema; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pga_schema FROM PUBLIC;
REVOKE ALL ON TABLE pga_schema FROM postgres;
GRANT ALL ON TABLE pga_schema TO postgres;
GRANT ALL ON TABLE pga_schema TO PUBLIC;


--
-- Name: pga_scripts; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pga_scripts FROM PUBLIC;
REVOKE ALL ON TABLE pga_scripts FROM postgres;
GRANT ALL ON TABLE pga_scripts TO postgres;
GRANT ALL ON TABLE pga_scripts TO PUBLIC;


--
-- PostgreSQL database dump complete
--

