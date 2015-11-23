\connect todo

SET default_transaction_read_only = off;

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

--
-- Name: priority; Type: TYPE; Schema: public; Owner: ian
--

CREATE TYPE priority AS ENUM (
    'Top',
    'High',
    'Medium',
    'Low'
);


ALTER TYPE priority OWNER TO ian;

--
-- Name: context_id_seq; Type: SEQUENCE; Schema: public; Owner: ian
--

CREATE SEQUENCE context_id_seq
    START WITH 10
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE context_id_seq OWNER TO ian;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: context; Type: TABLE; Schema: public; Owner: tewdew; Tablespace: 
--

CREATE TABLE context (
    id bigint DEFAULT nextval('context_id_seq'::regclass) NOT NULL,
    name character varying(255)
);


ALTER TABLE context OWNER TO tewdew;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: tewdew
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO tewdew;

--
-- Name: project; Type: TABLE; Schema: public; Owner: tewdew; Tablespace: 
--

CREATE TABLE project (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE project OWNER TO tewdew;

--
-- Name: todo; Type: TABLE; Schema: public; Owner: tewdew; Tablespace: 
--

CREATE TABLE todo (
    id bigint NOT NULL,
    dueday integer,
    duemonth integer,
    dueyear integer,
    modified bigint NOT NULL,
    name character varying(255),
    status integer,
    context_id bigint,
    project_id bigint,
    priority integer,
    completeddate character varying(255),
    creationdate character varying(255) DEFAULT now(),
    duedate character varying(255),
    description character varying(255)
);


ALTER TABLE todo OWNER TO tewdew;

--
-- Data for Name: context; Type: TABLE DATA; Schema: public; Owner: tewdew
--

COPY context (id, name) FROM stdin;
10	Andrej-RIP
20	Android
30	Car maint
40	Eco
50	Entrepreneurial
60	Family
70	FOSS
80	Home
90	Java
100	Life
110	LT-936
120	LT-Teaching
130	OpenBSD
140	ORM-ACB
150	ORM-ScreenCast
160	Philosophy
170	Photography
180	Politics
190	Polity
200	Preps
210	Promoting ASM
220	Promoting Writing
230	Spanish
240	SpeakingEvents
250	SysAdmin
260	Writing
270	Woodworking
\.


--
-- Name: context_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ian
--

SELECT pg_catalog.setval('context_id_seq', 270, true);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: tewdew
--

SELECT pg_catalog.setval('hibernate_sequence', 101, true);


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: tewdew
--

COPY project (id, name) FROM stdin;
\.


--
-- Data for Name: todo; Type: TABLE DATA; Schema: public; Owner: tewdew
--

COPY todo (id, dueday, duemonth, dueyear, modified, name, status, context_id, project_id, priority, completeddate, creationdate, duedate, description) FROM stdin;
-1	\N	\N	\N	0	TEST DATABASE	2	130	\N	2	\N	\N	\N	\N
\.


--
-- Name: context_pkey; Type: CONSTRAINT; Schema: public; Owner: tewdew; Tablespace: 
--

ALTER TABLE ONLY context
    ADD CONSTRAINT context_pkey PRIMARY KEY (id);


--
-- Name: project_pkey; Type: CONSTRAINT; Schema: public; Owner: tewdew; Tablespace: 
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: fk_jqea9ca32oiyet82v2g20xhm; Type: FK CONSTRAINT; Schema: public; Owner: tewdew
--

ALTER TABLE ONLY todo
    ADD CONSTRAINT fk_jqea9ca32oiyet82v2g20xhm FOREIGN KEY (project_id) REFERENCES project(id);


--
-- Name: fk_kxygcbwbw3uin4gs4ncaoggi1; Type: FK CONSTRAINT; Schema: public; Owner: tewdew
--

ALTER TABLE ONLY todo
    ADD CONSTRAINT fk_kxygcbwbw3uin4gs4ncaoggi1 FOREIGN KEY (context_id) REFERENCES context(id);


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

