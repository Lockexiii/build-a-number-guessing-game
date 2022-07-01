--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    score integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (31, 36, 5);
INSERT INTO public.games VALUES (32, 36, 3);
INSERT INTO public.games VALUES (33, 36, 7);
INSERT INTO public.games VALUES (34, 36, 3);
INSERT INTO public.games VALUES (35, 36, 1);
INSERT INTO public.games VALUES (36, 36, 3);
INSERT INTO public.games VALUES (37, 36, 3);
INSERT INTO public.games VALUES (38, 37, 2);
INSERT INTO public.games VALUES (39, 38, 328);
INSERT INTO public.games VALUES (40, 38, 843);
INSERT INTO public.games VALUES (41, 39, 155);
INSERT INTO public.games VALUES (42, 39, 702);
INSERT INTO public.games VALUES (43, 38, 93);
INSERT INTO public.games VALUES (44, 38, 673);
INSERT INTO public.games VALUES (45, 38, 942);
INSERT INTO public.games VALUES (46, 36, 3);
INSERT INTO public.games VALUES (47, 36, 3);
INSERT INTO public.games VALUES (48, 40, 834);
INSERT INTO public.games VALUES (49, 40, 363);
INSERT INTO public.games VALUES (50, 41, 161);
INSERT INTO public.games VALUES (51, 41, 893);
INSERT INTO public.games VALUES (52, 40, 745);
INSERT INTO public.games VALUES (53, 40, 311);
INSERT INTO public.games VALUES (54, 40, 910);
INSERT INTO public.games VALUES (55, 42, 172);
INSERT INTO public.games VALUES (56, 42, 736);
INSERT INTO public.games VALUES (57, 43, 218);
INSERT INTO public.games VALUES (58, 43, 210);
INSERT INTO public.games VALUES (59, 42, 437);
INSERT INTO public.games VALUES (60, 42, 267);
INSERT INTO public.games VALUES (61, 42, 232);
INSERT INTO public.games VALUES (62, 44, 736);
INSERT INTO public.games VALUES (63, 44, 96);
INSERT INTO public.games VALUES (64, 45, 942);
INSERT INTO public.games VALUES (65, 45, 510);
INSERT INTO public.games VALUES (66, 44, 167);
INSERT INTO public.games VALUES (67, 44, 624);
INSERT INTO public.games VALUES (68, 44, 648);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (36, 'red');
INSERT INTO public.users VALUES (37, 'der');
INSERT INTO public.users VALUES (38, 'user_1656698115543');
INSERT INTO public.users VALUES (39, 'user_1656698115542');
INSERT INTO public.users VALUES (40, 'user_1656698708326');
INSERT INTO public.users VALUES (41, 'user_1656698708325');
INSERT INTO public.users VALUES (42, 'user_1656698723678');
INSERT INTO public.users VALUES (43, 'user_1656698723677');
INSERT INTO public.users VALUES (44, 'user_1656698780993');
INSERT INTO public.users VALUES (45, 'user_1656698780992');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 68, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 45, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

