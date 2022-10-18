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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    frequency_in_years numeric NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    apparent_magnitude numeric,
    constellation character varying(20),
    distance_in_million_light_years integer
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
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mean_orbital_radius_in_mkm numeric,
    diameter_in_km numeric
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
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    weight_in_mtons numeric,
    distance_to_star_mkm numeric,
    has_moon boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    surface_temperature_in_kelvin integer,
    type character varying(20),
    has_planets boolean,
    constellation character varying(20)
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comets_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 75.3);
INSERT INTO public.comet VALUES (2, 'Schwassmann-1', 15);
INSERT INTO public.comet VALUES (3, 'Schwassmann-3', 5.36);
INSERT INTO public.comet VALUES (4, 'Swift-tuttle', 120);
INSERT INTO public.comet VALUES (5, 'Biela', 6.62);
INSERT INTO public.comet VALUES (6, 'Brorsen-Metcalf', 70.6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, '0402+379', 'Es una galaxia eliptica y radiogalaxia que se encuentra en la constelacion de Perseo.', 17.2, 'PERSEO', 750);
INSERT INTO public.galaxy VALUES (2, 'Andromeda I', 'Es una galaxia enana esferoidal, satelite de la galaxia andromeda (M31)', 13.6, 'Andromeda', 3);
INSERT INTO public.galaxy VALUES (3, 'Andromeda II', 'Es una galaxia esferoidal y fue descubierta por Sydney van der Bergh en 1970', 13.5, 'Andromeda', 2);
INSERT INTO public.galaxy VALUES (4, 'ARP 299', 'Es un grupo de galaxias, IC 694 es la galaxia principal y NGC3090 la secundaria', 11, 'Osa Mayor', 134);
INSERT INTO public.galaxy VALUES (5, 'M82', 'Es una galaxia irregular alargada y estrecha. Esta caracterizada por una elevada tasa de formacion estelar en su centro', 8.4, 'Osa Mayor', 12);
INSERT INTO public.galaxy VALUES (6, 'Messier 104', 'Es una galaxia lenticular y fue descubierta por Pierre Mechain en 1781', 8, 'Virgo', 30);
INSERT INTO public.galaxy VALUES (7, 'Via Lactea', 'Es una galaxia en espiral donde se encuentra el sistema solar y a la vez la tierra', NULL, NULL, 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 10, 'Pan', 133.6, 20);
INSERT INTO public.moon VALUES (2, 10, 'Dafne', 137, 6.5);
INSERT INTO public.moon VALUES (3, 10, 'Atlas', 137.67, 30.2);
INSERT INTO public.moon VALUES (4, 10, 'Prometeo', 139.35, 86.2);
INSERT INTO public.moon VALUES (5, 10, 'Pandora', 141.7, 81.4);
INSERT INTO public.moon VALUES (6, 10, 'Epimeteo', 151.42, 116.2);
INSERT INTO public.moon VALUES (7, 10, 'Jano', 151.47, 178);
INSERT INTO public.moon VALUES (8, 10, 'Egeon', 167.5, 0.5);
INSERT INTO public.moon VALUES (9, 10, 'Mimas', 185.54, 396.4);
INSERT INTO public.moon VALUES (10, 10, 'Metone', 194, 3);
INSERT INTO public.moon VALUES (11, 2, 'Luna', 384, 3476);
INSERT INTO public.moon VALUES (12, 3, 'Metis', 128, 43);
INSERT INTO public.moon VALUES (13, 3, 'Adrastea', 129, 16.4);
INSERT INTO public.moon VALUES (14, 3, 'Amaltea', 181.4, 167);
INSERT INTO public.moon VALUES (15, 3, 'Tebe', 221.9, 98.6);
INSERT INTO public.moon VALUES (16, 3, 'IO', 421.8, 3643);
INSERT INTO public.moon VALUES (17, 3, 'Europa', 671.1, 3122);
INSERT INTO public.moon VALUES (18, 3, 'Ganimides', 1070.4, 5262);
INSERT INTO public.moon VALUES (19, 3, 'Calisto', 1882.7, 4821);
INSERT INTO public.moon VALUES (20, 3, 'Temisto', 7284, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 4, 'Mercurio', 'Es el planeta mas cercano al Sol y el mas pequeño del sistema solar. Su periodo de rotacion es de 58.7 dias.', 330200000000000000, 82, false);
INSERT INTO public.planet VALUES (2, 4, 'Tierra', 'Es nuestro planeta. Se formo hace 4550 millones de años. ACtualmente el unico cuerpo celeste donde se conoce vida.', 5936000000000000000, 150, true);
INSERT INTO public.planet VALUES (3, 4, 'Jupiter', 'Es el planeta mas grande del sistema solar. Es un gigante gaseoso que forma parte de los planetas exteriores', 1899000000000000000000, 778, true);
INSERT INTO public.planet VALUES (5, 6, 'TRAPPIST-1c', 'Es un exoplaneta que habita un sistema formado por al menos 7 planetas. Fue descubierto en el año 2016.', 8230000000000000000, NULL, false);
INSERT INTO public.planet VALUES (6, 5, 'Wolf 1061c', 'Es un exoplaneta que habita un sistema formado por al menos 3 planetas. De ser un planeta habitado, sus formas de vida serian muy diferentes a las de la tierra debido a su alta gravedad', 25671000000000000000, NULL, false);
INSERT INTO public.planet VALUES (7, 3, 'Tau Ceti e', 'Es el segundo exoplaneta mas cercano a la tierra con potencial para albergar vida.', 25610000000000000000, 75, false);
INSERT INTO public.planet VALUES (8, 2, 'Gliese 832 c', 'Es un exoplaneta supertierra confiramdo. Descubierto por el metodo de velocidad radial', 32238000000000000000, 24.3, false);
INSERT INTO public.planet VALUES (9, 1, 'Kepler 438b', 'Es un exoplaneta confiramdo. Su descubrimiento fue estadisticamente confirmado en 2015.', 7580000000000000000, 24.72, false);
INSERT INTO public.planet VALUES (10, 4, 'Saturno', 'Es el unico planeta con un sistema de anillos visible desde la tierra', 568000000000000000000, 1420, true);
INSERT INTO public.planet VALUES (11, 4, 'Neptuno', 'Fue el primer planeta descubierto gracias a predicciones matematicas', 102400000000000000, 4498, true);
INSERT INTO public.planet VALUES (12, 4, 'Venus', 'Su orbita es una elipse con una excentricidad de menos de un 1%, lo que lo hace la mas circular del sistema solar.', 4869000000000000, 108, false);
INSERT INTO public.planet VALUES (13, 4, 'Marte', 'Es un planeta telurico con una atmosfera delgada de dioxido de carbono. Tiene similitud en su morfologia con la tierra y la luna.', 641850000000000, 228, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 7, 'Kepler 438', 'Tiene una masa de 0.54 masas solares. Tiene una luminosidad muy inferior a la de nuestro Sol.', 3748, 'Enana naranja', true, 'Lyra');
INSERT INTO public.star VALUES (2, 7, 'Gliese 832', 'Tiene una masa de 0.45 masas solares. Este tipo de estrellas presenta un gran dinamismo en uss primeros miles de millones de años.', 3620, 'Enana roja M1.5', true, 'Grus');
INSERT INTO public.star VALUES (3, 7, 'Tau Ceti', 'Tiene una masa similar a la del Sol. Es una estrella relativamente cercana.', 5380, 'G8 V', true, 'Cetus');
INSERT INTO public.star VALUES (4, 7, 'Sol', 'Es una estrella del tipo G y clase de luminosidad V. Es una esfera casi perfecta de plasma con un movimiento convectivo interno que genera un campo magnetico.', 5778, 'G V', true, NULL);
INSERT INTO public.star VALUES (5, 7, 'Gliese 628', 'Tiene una masa de 0.29 masas solares. Este tipo de estrellas al ser tan poco luminosas pasan desapercibidas si no se utiliza un telescopio para localizarlas.', 3342, 'Enana roja M3V', true, 'Ofiuco');
INSERT INTO public.star VALUES (6, 7, 'TRAPPIST-1', 'Tiene una masa de 0.08 masas solares. Este tamaño es similar al planeta Jupiter.', 2550, 'Enana roja M8V', true, 'Acuario');


--
-- Name: comets_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_name_key UNIQUE (name);


--
-- Name: comet comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comet_id);


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


