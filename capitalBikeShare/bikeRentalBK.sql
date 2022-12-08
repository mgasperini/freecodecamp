--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

-- Started on 2022-11-29 16:56:36 CET

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

--
-- TOC entry 3018 (class 1262 OID 25876)
-- Name: bikerental; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE bikerental WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


\connect bikerental

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
-- TOC entry 202 (class 1259 OID 25877)
-- Name: bikes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bikes (
    id_bike integer NOT NULL,
    bike character varying(25) NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 25880)
-- Name: bikes_id_bike_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bikes_id_bike_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 203
-- Name: bikes_id_bike_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bikes_id_bike_seq OWNED BY public.bikes.id_bike;


--
-- TOC entry 204 (class 1259 OID 25882)
-- Name: memberships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.memberships (
    id_membership integer NOT NULL,
    name character varying(20) NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 25885)
-- Name: memberships_id_membership_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.memberships_id_membership_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 205
-- Name: memberships_id_membership_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.memberships_id_membership_seq OWNED BY public.memberships.id_membership;


--
-- TOC entry 206 (class 1259 OID 25887)
-- Name: rides; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rides (
    id_ride integer NOT NULL,
    start_ride timestamp without time zone DEFAULT now(),
    end_ride timestamp without time zone DEFAULT now(),
    id_station_start integer DEFAULT 0 NOT NULL,
    id_station_end integer DEFAULT 0 NOT NULL,
    member_type smallint NOT NULL,
    bike_number integer,
    ride_id_hash character varying(30) DEFAULT 0,
    rideable_type character varying(30) DEFAULT ''::character varying,
    start_lat numeric DEFAULT 0,
    start_lng numeric DEFAULT 0,
    end_lat numeric DEFAULT 0,
    end_lng numeric DEFAULT 0
);


--
-- TOC entry 207 (class 1259 OID 25903)
-- Name: rides_id_ride_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rides_id_ride_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 207
-- Name: rides_id_ride_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rides_id_ride_seq OWNED BY public.rides.id_ride;


--
-- TOC entry 208 (class 1259 OID 25905)
-- Name: stations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stations (
    name character varying(100) DEFAULT 0 NOT NULL,
    lat numeric DEFAULT 0,
    lng numeric DEFAULT 0,
    station_number integer,
    station_id integer NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 25914)
-- Name: stations_station_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stations_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 209
-- Name: stations_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stations_station_id_seq OWNED BY public.stations.station_id;


--
-- TOC entry 2852 (class 2604 OID 25916)
-- Name: bikes id_bike; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bikes ALTER COLUMN id_bike SET DEFAULT nextval('public.bikes_id_bike_seq'::regclass);


--
-- TOC entry 2853 (class 2604 OID 25917)
-- Name: memberships id_membership; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.memberships ALTER COLUMN id_membership SET DEFAULT nextval('public.memberships_id_membership_seq'::regclass);


--
-- TOC entry 2864 (class 2604 OID 25918)
-- Name: rides id_ride; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rides ALTER COLUMN id_ride SET DEFAULT nextval('public.rides_id_ride_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 25919)
-- Name: stations station_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stations ALTER COLUMN station_id SET DEFAULT nextval('public.stations_station_id_seq'::regclass);


--
-- TOC entry 2870 (class 2606 OID 25921)
-- Name: bikes bikes_bike_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bikes
    ADD CONSTRAINT bikes_bike_key UNIQUE (bike);


--
-- TOC entry 2872 (class 2606 OID 25923)
-- Name: bikes bikes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bikes
    ADD CONSTRAINT bikes_pkey PRIMARY KEY (id_bike);


--
-- TOC entry 2874 (class 2606 OID 25925)
-- Name: memberships memberships_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_name_key UNIQUE (name);


--
-- TOC entry 2876 (class 2606 OID 25927)
-- Name: memberships memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id_membership);


--
-- TOC entry 2878 (class 2606 OID 25929)
-- Name: rides rides_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rides
    ADD CONSTRAINT rides_pkey PRIMARY KEY (id_ride);


--
-- TOC entry 2880 (class 2606 OID 25954)
-- Name: stations set; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT set UNIQUE (station_number);


--
-- TOC entry 2882 (class 2606 OID 25931)
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (station_id);


--
-- TOC entry 2883 (class 2606 OID 25932)
-- Name: rides rides_bike_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rides
    ADD CONSTRAINT rides_bike_number_fkey FOREIGN KEY (bike_number) REFERENCES public.bikes(id_bike);


--
-- TOC entry 2886 (class 2606 OID 25960)
-- Name: rides rides_id_station_end_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rides
    ADD CONSTRAINT rides_id_station_end_fkey FOREIGN KEY (id_station_end) REFERENCES public.stations(station_number);


--
-- TOC entry 2885 (class 2606 OID 25955)
-- Name: rides rides_id_station_start_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rides
    ADD CONSTRAINT rides_id_station_start_fkey FOREIGN KEY (id_station_start) REFERENCES public.stations(station_number);


--
-- TOC entry 2884 (class 2606 OID 25947)
-- Name: rides rides_member_tipe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rides
    ADD CONSTRAINT rides_member_tipe_fkey FOREIGN KEY (member_type) REFERENCES public.memberships(id_membership);


-- Completed on 2022-11-29 16:56:58 CET

--
-- PostgreSQL database dump complete
--

