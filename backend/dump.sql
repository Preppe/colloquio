






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1
-- Dumped by pg_dump version 17.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: colloquio
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO colloquio;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: colloquio
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: colloquio
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: colloquio
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "colloquio" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1
-- Dumped by pg_dump version 17.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: colloquio; Type: DATABASE; Schema: -; Owner: colloquio
--

CREATE DATABASE colloquio WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE colloquio OWNER TO colloquio;

\connect colloquio

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activity; Type: TABLE; Schema: public; Owner: colloquio
--

CREATE TABLE public.activity (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    hours integer NOT NULL,
    date timestamp without time zone NOT NULL,
    "projectId" uuid,
    "employeeId" uuid
);


ALTER TABLE public.activity OWNER TO colloquio;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: colloquio
--

CREATE TABLE public.employee (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.employee OWNER TO colloquio;

--
-- Name: project; Type: TABLE; Schema: public; Owner: colloquio
--

CREATE TABLE public.project (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.project OWNER TO colloquio;

--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: colloquio
--

COPY public.activity (id, hours, date, "projectId", "employeeId") FROM stdin;
3ff17a2f-d41a-40ac-b41d-dd01dc9b87f4	5	2021-08-26 22:00:00	c0f1a137-5bf3-4e0c-914e-d3d34b6de808	b82ff7ff-5613-44cf-99fa-762d9ef747df
c7d831d1-83d3-4f39-a79b-c7ae33f6da90	3	2021-08-30 22:00:00	adc71477-d178-40b5-b59f-9075a497d330	8030c336-3c7e-4fa3-a907-7cc1dedc92b7
fe37f8f8-4fac-4397-8cc5-ff831703582f	3	2021-08-31 22:00:00	c0f1a137-5bf3-4e0c-914e-d3d34b6de808	b82ff7ff-5613-44cf-99fa-762d9ef747df
571707fd-d534-4d9d-adb8-9f6fb64e7e9f	3	2021-08-31 22:00:00	c0f1a137-5bf3-4e0c-914e-d3d34b6de808	327e1c40-aae1-4cb9-809f-3c83ed6cae09
a00bdeef-6d8e-4d9b-86c8-31fcdc61f572	2	2021-08-26 22:00:00	adc71477-d178-40b5-b59f-9075a497d330	b82ff7ff-5613-44cf-99fa-762d9ef747df
d8410f4d-a58d-4c7f-8bf3-e91b5c9731a9	4	2021-08-31 22:00:00	adc71477-d178-40b5-b59f-9075a497d330	8030c336-3c7e-4fa3-a907-7cc1dedc92b7
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: colloquio
--

COPY public.employee (id, name) FROM stdin;
b82ff7ff-5613-44cf-99fa-762d9ef747df	Mario
8030c336-3c7e-4fa3-a907-7cc1dedc92b7	Giovanni
327e1c40-aae1-4cb9-809f-3c83ed6cae09	Lucia
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: colloquio
--

COPY public.project (id, name) FROM stdin;
adc71477-d178-40b5-b59f-9075a497d330	Manhattan
c0f1a137-5bf3-4e0c-914e-d3d34b6de808	Mars Rover
\.


--
-- Name: activity PK_24625a1d6b1b089c8ae206fe467; Type: CONSTRAINT; Schema: public; Owner: colloquio
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT "PK_24625a1d6b1b089c8ae206fe467" PRIMARY KEY (id);


--
-- Name: employee PK_3c2bc72f03fd5abbbc5ac169498; Type: CONSTRAINT; Schema: public; Owner: colloquio
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT "PK_3c2bc72f03fd5abbbc5ac169498" PRIMARY KEY (id);


--
-- Name: project PK_4d68b1358bb5b766d3e78f32f57; Type: CONSTRAINT; Schema: public; Owner: colloquio
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT "PK_4d68b1358bb5b766d3e78f32f57" PRIMARY KEY (id);


--
-- Name: activity FK_5a898f44fa31ef7916f0c38b016; Type: FK CONSTRAINT; Schema: public; Owner: colloquio
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT "FK_5a898f44fa31ef7916f0c38b016" FOREIGN KEY ("projectId") REFERENCES public.project(id);


--
-- Name: activity FK_a6f74ae99d549932391f0f44609; Type: FK CONSTRAINT; Schema: public; Owner: colloquio
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT "FK_a6f74ae99d549932391f0f44609" FOREIGN KEY ("employeeId") REFERENCES public.employee(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1
-- Dumped by pg_dump version 17.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: colloquio
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO colloquio;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: colloquio
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

