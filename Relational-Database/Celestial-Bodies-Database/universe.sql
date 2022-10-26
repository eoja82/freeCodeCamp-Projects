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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_type character varying(60),
    diameter_earth_years integer,
    distance_from_earth_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer,
    orbit_earth_days numeric,
    diameter_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    has_moon boolean,
    has_life boolean,
    planet_type text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_description (
    planet_description_id integer NOT NULL,
    name character varying(2000) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet_description OWNER TO freecodecamp;

--
-- Name: planet_description_planet_desc_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_description_planet_desc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_description_planet_desc_id_seq OWNER TO freecodecamp;

--
-- Name: planet_description_planet_desc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_description_planet_desc_id_seq OWNED BY public.planet_description.planet_description_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer,
    star_type character varying(60),
    solar_radii integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_description planet_description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description ALTER COLUMN planet_description_id SET DEFAULT nextval('public.planet_description_planet_desc_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 'spiral barred', NULL, 28000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'elliptic galaxy', 220000, 2500000);
INSERT INTO public.galaxy VALUES (3, 'The Pinwheel Galaxy', 'spiral', 170000, 21000000);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', '', 60000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', '', 49000, NULL);
INSERT INTO public.galaxy VALUES (6, 'LMC', 'dwarf', NULL, 200000);
INSERT INTO public.galaxy VALUES (7, 'Circinus Galaxy', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, NULL, 3475);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.3189, 23);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 30.2976, 23458);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1.769, 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3.551181041, 3122);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7.15544296, 5262);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 16.7, 4821);
INSERT INTO public.moon VALUES (8, 'Titan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Oberon', 7, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Titania', 7, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Triton', 8, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Charon', 10, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Nix', 10, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Hydra', 10, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Kerberos', 10, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Stix', 10, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, false, 'Terrestrial Planet', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, false, 'Terrestrial Planet', 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 'Terrestrial Planet', 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, false, 'Terrestrial Planet', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, false, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', true, false, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', true, false, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', true, false, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (9, 'Ceres', true, false, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (10, 'Pluto', true, false, 'Dwarf Planet', 1);
INSERT INTO public.planet VALUES (11, 'Haumea', true, false, 'Dwarf Planet', 1);
INSERT INTO public.planet VALUES (12, 'Makemake', false, false, 'Dwarf Planet', 1);
INSERT INTO public.planet VALUES (13, 'Eris', true, false, 'Dwarf Planet', 1);


--
-- Data for Name: planet_description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_description VALUES (1, 'Earth is the third planet from the Sun and the fifth largest planet in the Solar System with the highest density. It is currently the only known location where life is present.', 3);
INSERT INTO public.planet_description VALUES (2, 'Mars is the fourth planet from the Sun and the second-smallest planet with a thin atmosphere, having the surface features reminiscent both of the impact craters of the Moon, and the valleys, deserts and polar ice caps of Earth. It is the most widely searched planet for life.', 4);
INSERT INTO public.planet_description VALUES (3, 'Mercury is the closest planet to the Sun but, perhaps surprisingly, it does not have the highest temperatures. It is the second densest planet of the Solar System, but also the smallest planet. The structure of Mercury makes it the most similar planet to Earth.', 1);
INSERT INTO public.planet_description VALUES (4, 'Venus is the second planet from the Sun and the sixth-largest. Together with Mercury, they are the only planets without a satellite, even though Mercury is closer to the sun, Venus is the hottest planet.', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Sun', 1, 'main-sequence', NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'main-sequence', NULL);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 'main-sequence', NULL);
INSERT INTO public.star VALUES (5, 'Delta Circini,', 7, 'blue star', NULL);
INSERT INTO public.star VALUES (6, 'V560 Carinae', 1, 'blue star', NULL);
INSERT INTO public.star VALUES (7, 'Theta1 Orionis C', 1, 'blue star', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_description_planet_desc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_description_planet_desc_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_description planet_description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description
    ADD CONSTRAINT planet_description_pkey PRIMARY KEY (planet_description_id);


--
-- Name: planet_description planet_description_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description
    ADD CONSTRAINT planet_description_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

