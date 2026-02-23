--
-- PostgreSQL database dump
--

\restrict XIgg8MdzTybOEtKPhyO6BsykYuZx8Sn2JgyF59gr0sAXtKjfLO2FupZvcrFhZpa

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: app
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO app;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: autor; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.autor (
    id integer NOT NULL,
    nome character varying(60)
);


ALTER TABLE public.autor OWNER TO app;

--
-- Name: autor_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.autor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.autor_id_seq OWNER TO app;

--
-- Name: autor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.autor_id_seq OWNED BY public.autor.id;


--
-- Name: emprestimo; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.emprestimo (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    data_emprestimo date DEFAULT CURRENT_DATE NOT NULL,
    data_prevista date NOT NULL,
    data_devolucao date,
    CONSTRAINT emprestimo_check CHECK ((data_prevista >= data_emprestimo)),
    CONSTRAINT emprestimo_check1 CHECK (((data_devolucao IS NULL) OR (data_devolucao >= data_emprestimo)))
);


ALTER TABLE public.emprestimo OWNER TO app;

--
-- Name: emprestimo_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.emprestimo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emprestimo_id_seq OWNER TO app;

--
-- Name: emprestimo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.emprestimo_id_seq OWNED BY public.emprestimo.id;


--
-- Name: emprestimo_item; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.emprestimo_item (
    emprestimo_id integer NOT NULL,
    livro_id integer NOT NULL,
    quantidade integer NOT NULL,
    CONSTRAINT emprestimo_item_quantidade_check CHECK ((quantidade > 0))
);


ALTER TABLE public.emprestimo_item OWNER TO app;

--
-- Name: livro; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.livro (
    id integer NOT NULL,
    titulo character varying(70) NOT NULL,
    isbn character varying(13) NOT NULL,
    ano integer,
    total_exemplares integer
);


ALTER TABLE public.livro OWNER TO app;

--
-- Name: livro_autor; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.livro_autor (
    livro_id integer NOT NULL,
    autor_id integer NOT NULL
);


ALTER TABLE public.livro_autor OWNER TO app;

--
-- Name: livro_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.livro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.livro_id_seq OWNER TO app;

--
-- Name: livro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.livro_id_seq OWNED BY public.livro.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(40) NOT NULL,
    email character varying(50) NOT NULL,
    telefone character varying(16),
    data_cadastro date DEFAULT CURRENT_DATE
);


ALTER TABLE public.usuario OWNER TO app;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO app;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: autor id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.autor ALTER COLUMN id SET DEFAULT nextval('public.autor_id_seq'::regclass);


--
-- Name: emprestimo id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.emprestimo ALTER COLUMN id SET DEFAULT nextval('public.emprestimo_id_seq'::regclass);


--
-- Name: livro id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.livro ALTER COLUMN id SET DEFAULT nextval('public.livro_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id);


--
-- Name: emprestimo_item emprestimo_item_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.emprestimo_item
    ADD CONSTRAINT emprestimo_item_pkey PRIMARY KEY (emprestimo_id, livro_id);


--
-- Name: emprestimo emprestimo_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.emprestimo
    ADD CONSTRAINT emprestimo_pkey PRIMARY KEY (id);


--
-- Name: livro_autor livro_autor_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.livro_autor
    ADD CONSTRAINT livro_autor_pkey PRIMARY KEY (livro_id, autor_id);


--
-- Name: livro livro_isbn_key; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_isbn_key UNIQUE (isbn);


--
-- Name: livro livro_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: emprestimo fk_emprestimo_usuario; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.emprestimo
    ADD CONSTRAINT fk_emprestimo_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE RESTRICT;


--
-- Name: emprestimo_item fk_item_emprestimo; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.emprestimo_item
    ADD CONSTRAINT fk_item_emprestimo FOREIGN KEY (emprestimo_id) REFERENCES public.emprestimo(id) ON DELETE CASCADE;


--
-- Name: emprestimo_item fk_item_livro; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.emprestimo_item
    ADD CONSTRAINT fk_item_livro FOREIGN KEY (livro_id) REFERENCES public.livro(id) ON DELETE RESTRICT;


--
-- Name: livro_autor fk_livro_autor_autor; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.livro_autor
    ADD CONSTRAINT fk_livro_autor_autor FOREIGN KEY (autor_id) REFERENCES public.autor(id) ON DELETE CASCADE;


--
-- Name: livro_autor fk_livro_autor_livro; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.livro_autor
    ADD CONSTRAINT fk_livro_autor_livro FOREIGN KEY (livro_id) REFERENCES public.livro(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict XIgg8MdzTybOEtKPhyO6BsykYuZx8Sn2JgyF59gr0sAXtKjfLO2FupZvcrFhZpa

