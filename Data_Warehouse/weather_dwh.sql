--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-10-19 19:27:55

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
-- TOC entry 218 (class 1259 OID 21646)
-- Name: current_weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_weather (
    current_id integer NOT NULL,
    dt bigint NOT NULL,
    uvi double precision NOT NULL,
    temp double precision NOT NULL,
    clouds integer NOT NULL,
    sunset bigint NOT NULL,
    sunrise bigint NOT NULL,
    humidity integer NOT NULL,
    pressure integer NOT NULL,
    wind_deg integer NOT NULL,
    dew_point double precision NOT NULL,
    wind_gust double precision NOT NULL,
    feels_like double precision NOT NULL,
    visibility integer NOT NULL,
    wind_speed double precision NOT NULL,
    weather_id integer NOT NULL,
    weather_icon character varying(50) NOT NULL,
    weather_main character varying(50) NOT NULL,
    weather_description text NOT NULL,
    fact_id integer
);


ALTER TABLE public.current_weather OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 21645)
-- Name: current_weather_current_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_weather_current_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.current_weather_current_id_seq OWNER TO postgres;

--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 217
-- Name: current_weather_current_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_weather_current_id_seq OWNED BY public.current_weather.current_id;


--
-- TOC entry 220 (class 1259 OID 21660)
-- Name: daily_weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.daily_weather (
    daily_id integer NOT NULL,
    dt bigint NOT NULL,
    pop double precision NOT NULL,
    uvi double precision NOT NULL,
    rain double precision,
    clouds integer NOT NULL,
    sunset bigint NOT NULL,
    moonset bigint NOT NULL,
    summary text NOT NULL,
    sunrise bigint NOT NULL,
    humidity integer NOT NULL,
    moonrise bigint NOT NULL,
    pressure integer NOT NULL,
    wind_deg integer NOT NULL,
    dew_point double precision NOT NULL,
    wind_gust double precision NOT NULL,
    moon_phase double precision NOT NULL,
    wind_speed double precision NOT NULL,
    temp_day double precision NOT NULL,
    temp_eve double precision NOT NULL,
    temp_max double precision NOT NULL,
    temp_min double precision NOT NULL,
    temp_morn double precision NOT NULL,
    temp_night double precision NOT NULL,
    feels_like_day double precision NOT NULL,
    feels_like_eve double precision NOT NULL,
    feels_like_morn double precision NOT NULL,
    feels_like_night double precision NOT NULL,
    weather_id integer NOT NULL,
    weather_icon character varying(50) NOT NULL,
    weather_main character varying(50) NOT NULL,
    weather_description text NOT NULL,
    fact_id integer
);


ALTER TABLE public.daily_weather OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 21659)
-- Name: daily_weather_daily_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.daily_weather_daily_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.daily_weather_daily_id_seq OWNER TO postgres;

--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 219
-- Name: daily_weather_daily_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.daily_weather_daily_id_seq OWNED BY public.daily_weather.daily_id;


--
-- TOC entry 216 (class 1259 OID 21639)
-- Name: fact_weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_weather (
    id integer NOT NULL,
    lat double precision NOT NULL,
    lon double precision NOT NULL
);


ALTER TABLE public.fact_weather OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 21638)
-- Name: fact_weather_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_weather_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fact_weather_id_seq OWNER TO postgres;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 215
-- Name: fact_weather_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_weather_id_seq OWNED BY public.fact_weather.id;


--
-- TOC entry 222 (class 1259 OID 21674)
-- Name: hourly_weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hourly_weather (
    hourly_id integer NOT NULL,
    dt bigint NOT NULL,
    pop double precision NOT NULL,
    uvi double precision NOT NULL,
    temp double precision NOT NULL,
    clouds integer NOT NULL,
    humidity integer NOT NULL,
    pressure integer NOT NULL,
    wind_deg integer NOT NULL,
    dew_point double precision NOT NULL,
    wind_gust double precision NOT NULL,
    feels_like double precision NOT NULL,
    visibility integer NOT NULL,
    wind_speed double precision NOT NULL,
    rain_1h double precision,
    weather_id integer NOT NULL,
    weather_icon character varying(50) NOT NULL,
    weather_main character varying(50) NOT NULL,
    weather_description text NOT NULL,
    fact_id integer
);


ALTER TABLE public.hourly_weather OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 21673)
-- Name: hourly_weather_hourly_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hourly_weather_hourly_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hourly_weather_hourly_id_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 221
-- Name: hourly_weather_hourly_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hourly_weather_hourly_id_seq OWNED BY public.hourly_weather.hourly_id;


--
-- TOC entry 224 (class 1259 OID 21688)
-- Name: minutely_weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.minutely_weather (
    minutely_id integer NOT NULL,
    dt bigint NOT NULL,
    precipitation integer NOT NULL,
    fact_id integer
);


ALTER TABLE public.minutely_weather OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 21687)
-- Name: minutely_weather_minutely_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.minutely_weather_minutely_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.minutely_weather_minutely_id_seq OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 223
-- Name: minutely_weather_minutely_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.minutely_weather_minutely_id_seq OWNED BY public.minutely_weather.minutely_id;


--
-- TOC entry 4709 (class 2604 OID 21649)
-- Name: current_weather current_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_weather ALTER COLUMN current_id SET DEFAULT nextval('public.current_weather_current_id_seq'::regclass);


--
-- TOC entry 4710 (class 2604 OID 21663)
-- Name: daily_weather daily_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_weather ALTER COLUMN daily_id SET DEFAULT nextval('public.daily_weather_daily_id_seq'::regclass);


--
-- TOC entry 4708 (class 2604 OID 21642)
-- Name: fact_weather id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_weather ALTER COLUMN id SET DEFAULT nextval('public.fact_weather_id_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 21677)
-- Name: hourly_weather hourly_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hourly_weather ALTER COLUMN hourly_id SET DEFAULT nextval('public.hourly_weather_hourly_id_seq'::regclass);


--
-- TOC entry 4712 (class 2604 OID 21691)
-- Name: minutely_weather minutely_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minutely_weather ALTER COLUMN minutely_id SET DEFAULT nextval('public.minutely_weather_minutely_id_seq'::regclass);


--
-- TOC entry 4873 (class 0 OID 21646)
-- Dependencies: 218
-- Data for Name: current_weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.current_weather (current_id, dt, uvi, temp, clouds, sunset, sunrise, humidity, pressure, wind_deg, dew_point, wind_gust, feels_like, visibility, wind_speed, weather_id, weather_icon, weather_main, weather_description, fact_id) FROM stdin;
1	1729188867	0	287.03	91	1729184582	1729146493	82	1013	218	284.01	6.6	286.61	10000	2.26	804	04n	Clouds	overcast clouds	1
\.


--
-- TOC entry 4875 (class 0 OID 21660)
-- Dependencies: 220
-- Data for Name: daily_weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.daily_weather (daily_id, dt, pop, uvi, rain, clouds, sunset, moonset, summary, sunrise, humidity, moonrise, pressure, wind_deg, dew_point, wind_gust, moon_phase, wind_speed, temp_day, temp_eve, temp_max, temp_min, temp_morn, temp_night, feels_like_day, feels_like_eve, feels_like_morn, feels_like_night, weather_id, weather_icon, weather_main, weather_description, fact_id) FROM stdin;
1	1729162800	1	1.59	2.12	76	1729184582	1729146060	There will be rain until morning, then partly cloudy	1729146493	65	1729183860	1011	216	283.13	9.86	0.5	3.85	289.68	287.38	290.39	286.3	288.48	286.3	289.09	286.92	288.55	285.94	501	10d	Rain	moderate rain	1
2	1729249200	0	1.81	NaN	3	1729270856	1729238100	Expect a day of partly cloudy with clear spells	1729232996	64	1729271280	1015	216	281.61	9.23	0.54	3.84	288.46	287.94	290.35	284.03	284.18	285.96	287.72	287.3	283.74	285.46	800	01d	Clear	clear sky	1
3	1729335600	1	0.25	5.73	100	1729357131	1729330200	Expect a day of partly cloudy with rain	1729319499	93	1729359120	1011	318	286.15	10	0.58	4.21	287.41	286.59	287.79	284.38	286.86	284.38	287.32	286.08	286.77	283.8	501	10d	Rain	moderate rain	1
4	1729422000	1	1.29	4.03	100	1729443407	1729422120	Expect a day of partly cloudy with rain	1729406003	88	1729447620	1011	190	284.45	18.04	0.62	7.57	286.51	289	289.06	283.75	284.74	288.23	286.2	289.15	284.17	288.17	501	10d	Rain	moderate rain	1
5	1729508400	1	1.1	1.37	76	1729529684	1729513320	Expect a day of partly cloudy with rain	1729492507	55	1729536960	1020	245	279.52	9.82	0.65	4.43	288.66	287.07	288.78	285.37	285.52	285.37	287.7	286.4	284.98	284.76	500	10d	Rain	light rain	1
6	1729594800	0	2	NaN	45	1729615962	1729603320	Expect a day of partly cloudy with clear spells	1729579011	59	1729627200	1026	235	279.5	9.76	0.69	3.69	287.49	286.29	288.39	282.59	282.59	285.29	286.52	285.62	281.93	284.7	802	03d	Clouds	scattered clouds	1
7	1729681200	0	2	NaN	33	1729702241	1729692240	There will be partly cloudy today	1729665516	68	1729718100	1028	195	282.98	9.02	0.72	3.21	289.03	286.47	289.03	284.06	284.06	285.81	288.45	286.02	283.77	285.17	802	03d	Clouds	scattered clouds	1
8	1729767600	0	2	NaN	6	1729788522	1729780320	There will be partly cloudy until morning, then clearing	1729752021	58	1729809180	1020	137	280.13	7.42	0.75	3.32	288.27	285.46	288.27	283.62	283.62	284.47	287.35	284.6	282.94	283.56	800	01d	Clear	clear sky	1
\.


--
-- TOC entry 4871 (class 0 OID 21639)
-- Dependencies: 216
-- Data for Name: fact_weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_weather (id, lat, lon) FROM stdin;
1	51.5074	-0.1278
\.


--
-- TOC entry 4877 (class 0 OID 21674)
-- Dependencies: 222
-- Data for Name: hourly_weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hourly_weather (hourly_id, dt, pop, uvi, temp, clouds, humidity, pressure, wind_deg, dew_point, wind_gust, feels_like, visibility, wind_speed, rain_1h, weather_id, weather_icon, weather_main, weather_description, fact_id) FROM stdin;
1	1729188000	0	0	287.03	91	82	1013	218	284.01	6.6	286.61	10000	2.26	NaN	804	04n	Clouds	overcast clouds	1
2	1729191600	0	0	287.15	93	81	1013	232	283.94	6.51	286.72	10000	2.19	NaN	804	04n	Clouds	overcast clouds	1
3	1729195200	0	0	287.06	95	83	1013	228	284.22	5.59	286.67	10000	1.95	NaN	804	04n	Clouds	overcast clouds	1
4	1729198800	0	0	286.71	94	85	1014	226	284.24	5.12	286.34	10000	1.97	NaN	804	04n	Clouds	overcast clouds	1
5	1729202400	0	0	286.3	88	87	1015	224	284.19	3.93	285.94	10000	1.56	NaN	804	04n	Clouds	overcast clouds	1
6	1729206000	0	0	285.79	78	89	1015	225	283.99	2.09	285.43	10000	1.41	NaN	803	04n	Clouds	broken clouds	1
7	1729209600	0	0	285.52	79	90	1015	253	283.89	3.57	285.16	10000	1.74	NaN	803	04n	Clouds	broken clouds	1
8	1729213200	0	0	285.17	1	91	1015	254	283.63	4.8	284.8	10000	1.75	NaN	800	01n	Clear	clear sky	1
9	1729216800	0	0	284.85	1	91	1015	239	283.34	2.14	284.45	10000	1.4	NaN	800	01n	Clear	clear sky	1
10	1729220400	0	0	284.54	1	92	1016	264	283.16	4.38	284.14	10000	1.72	NaN	800	01n	Clear	clear sky	1
11	1729224000	0	0	284.29	1	92	1016	245	283	2	283.86	10000	1.15	NaN	800	01n	Clear	clear sky	1
12	1729227600	0	0	284.18	13	92	1016	158	282.92	0.94	283.74	10000	1	NaN	801	02n	Clouds	few clouds	1
13	1729231200	0	0	284.03	29	93	1015	158	282.89	0.97	283.6	10000	1.03	NaN	802	03n	Clouds	scattered clouds	1
14	1729234800	0	0	284.03	9	93	1015	174	282.79	1.91	283.6	10000	1.37	NaN	800	01d	Clear	clear sky	1
15	1729238400	0	0.21	284.94	8	86	1016	236	282.68	3.79	284.42	10000	1.93	NaN	800	01d	Clear	clear sky	1
16	1729242000	0	0.6	286.21	6	78	1016	237	282.36	4.99	285.61	10000	2.61	NaN	800	01d	Clear	clear sky	1
17	1729245600	0	1.13	287.37	4	71	1016	244	282.08	4.85	286.7	10000	2.83	NaN	800	01d	Clear	clear sky	1
18	1729249200	0	1.6	288.46	3	64	1015	227	281.61	4.9	287.72	10000	2.85	NaN	800	01d	Clear	clear sky	1
19	1729252800	0	1.81	289.47	3	57	1014	228	280.94	4.6	288.65	10000	2.79	NaN	800	01d	Clear	clear sky	1
20	1729256400	0	1.61	290.1	4	55	1014	243	280.9	5.77	289.29	10000	3.82	NaN	800	01d	Clear	clear sky	1
21	1729260000	0	1.16	290.35	3	52	1013	225	280.42	5.29	289.48	10000	3.49	NaN	800	01d	Clear	clear sky	1
22	1729263600	0	0.62	290.06	4	53	1013	219	280.24	5.26	289.19	10000	3.75	NaN	800	01d	Clear	clear sky	1
23	1729267200	0	0.22	289.27	4	59	1013	217	281.38	6.04	288.48	10000	3.64	NaN	800	01d	Clear	clear sky	1
24	1729270800	0	0	287.94	10	70	1013	203	282.52	6.95	287.3	10000	3.62	NaN	800	01d	Clear	clear sky	1
25	1729274400	0	0	287	11	77	1013	216	283.1	8.65	286.45	10000	3.84	NaN	801	02n	Clouds	few clouds	1
26	1729278000	0	0	286.63	7	80	1013	216	283.18	9.23	286.12	10000	3.45	NaN	800	01n	Clear	clear sky	1
27	1729281600	0	0	286.38	56	81	1013	216	283.14	9.2	285.87	10000	3.29	NaN	803	04n	Clouds	broken clouds	1
28	1729285200	0	0	286.01	70	82	1012	203	282.99	9.02	285.49	10000	3.02	NaN	803	04n	Clouds	broken clouds	1
29	1729288800	0	0	285.96	78	83	1012	199	283.13	8.98	285.46	10000	2.96	NaN	803	04n	Clouds	broken clouds	1
30	1729292400	0	0	286.39	82	84	1011	197	283.68	9.32	285.96	10000	3.21	NaN	803	04n	Clouds	broken clouds	1
31	1729296000	0	0	286.63	85	87	1011	193	284.37	9.14	286.31	10000	3.63	NaN	804	04n	Clouds	overcast clouds	1
32	1729299600	0	0	286.79	100	87	1011	192	284.48	9.21	286.48	10000	3.81	NaN	804	04n	Clouds	overcast clouds	1
33	1729303200	0	0	286.84	100	87	1010	187	284.68	9.24	286.54	10000	3.67	NaN	804	04n	Clouds	overcast clouds	1
34	1729306800	0.6	0	286.62	100	91	1010	184	285.04	9.7	286.4	10000	3.63	0.34	500	10n	Rain	light rain	1
35	1729310400	1	0	286.6	100	94	1009	185	285.48	9.85	286.46	10000	3.48	0.63	500	10n	Rain	light rain	1
36	1729314000	1	0	286.86	100	95	1009	179	285.96	9.81	286.77	10000	3.34	0.56	500	10n	Rain	light rain	1
37	1729317600	1	0	287.16	100	94	1009	179	286.1	10	287.07	10000	3.57	0.25	500	10n	Rain	light rain	1
38	1729321200	1	0	287.25	100	93	1009	185	286.06	9.84	287.14	10000	3.5	0.2	500	10d	Rain	light rain	1
39	1729324800	1	0.03	287.32	100	92	1010	184	285.98	10	287.19	10000	3.58	0.32	500	10d	Rain	light rain	1
40	1729328400	1	0.09	287.38	100	92	1010	180	285.95	9.97	287.26	10000	3.62	0.22	500	10d	Rain	light rain	1
41	1729332000	1	0.17	287.44	100	91	1010	187	285.94	10	287.3	10000	3.59	0.11	500	10d	Rain	light rain	1
42	1729335600	1	0.23	287.41	100	93	1011	195	286.15	7.92	287.32	7803	3.29	0.66	500	10d	Rain	light rain	1
43	1729339200	1	0.25	286.93	100	94	1011	269	285.9	5.26	286.82	10000	2.25	2.07	501	10d	Rain	moderate rain	1
44	1729342800	0.63	0.2	286.26	99	87	1012	318	283.98	7.99	285.9	10000	4.21	0.37	500	10d	Rain	light rain	1
45	1729346400	0.59	0.16	286.92	99	79	1012	323	283.21	7.38	286.42	10000	3.23	NaN	804	04d	Clouds	overcast clouds	1
46	1729350000	0.48	0.08	287.79	92	74	1012	334	283.16	5.38	287.24	10000	2.74	NaN	804	04d	Clouds	overcast clouds	1
47	1729353600	0.38	0.02	287.51	74	76	1013	5	283.34	2.35	286.99	10000	1.39	NaN	803	04d	Clouds	broken clouds	1
48	1729357200	0.31	0	286.59	62	80	1014	269	283.11	0.94	286.08	10000	1.13	NaN	803	04n	Clouds	broken clouds	1
\.


--
-- TOC entry 4879 (class 0 OID 21688)
-- Dependencies: 224
-- Data for Name: minutely_weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.minutely_weather (minutely_id, dt, precipitation, fact_id) FROM stdin;
1	1729188900	0	1
2	1729188960	0	1
3	1729189020	0	1
4	1729189080	0	1
5	1729189140	0	1
6	1729189200	0	1
7	1729189260	0	1
8	1729189320	0	1
9	1729189380	0	1
10	1729189440	0	1
11	1729189500	0	1
12	1729189560	0	1
13	1729189620	0	1
14	1729189680	0	1
15	1729189740	0	1
16	1729189800	0	1
17	1729189860	0	1
18	1729189920	0	1
19	1729189980	0	1
20	1729190040	0	1
21	1729190100	0	1
22	1729190160	0	1
23	1729190220	0	1
24	1729190280	0	1
25	1729190340	0	1
26	1729190400	0	1
27	1729190460	0	1
28	1729190520	0	1
29	1729190580	0	1
30	1729190640	0	1
31	1729190700	0	1
32	1729190760	0	1
33	1729190820	0	1
34	1729190880	0	1
35	1729190940	0	1
36	1729191000	0	1
37	1729191060	0	1
38	1729191120	0	1
39	1729191180	0	1
40	1729191240	0	1
41	1729191300	0	1
42	1729191360	0	1
43	1729191420	0	1
44	1729191480	0	1
45	1729191540	0	1
46	1729191600	0	1
47	1729191660	0	1
48	1729191720	0	1
49	1729191780	0	1
50	1729191840	0	1
51	1729191900	0	1
52	1729191960	0	1
53	1729192020	0	1
54	1729192080	0	1
55	1729192140	0	1
56	1729192200	0	1
57	1729192260	0	1
58	1729192320	0	1
59	1729192380	0	1
60	1729192440	0	1
\.


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 217
-- Name: current_weather_current_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.current_weather_current_id_seq', 1, false);


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 219
-- Name: daily_weather_daily_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.daily_weather_daily_id_seq', 1, false);


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 215
-- Name: fact_weather_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_weather_id_seq', 1, false);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 221
-- Name: hourly_weather_hourly_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hourly_weather_hourly_id_seq', 1, false);


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 223
-- Name: minutely_weather_minutely_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.minutely_weather_minutely_id_seq', 1, false);


--
-- TOC entry 4716 (class 2606 OID 21653)
-- Name: current_weather current_weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_weather
    ADD CONSTRAINT current_weather_pkey PRIMARY KEY (current_id);


--
-- TOC entry 4718 (class 2606 OID 21667)
-- Name: daily_weather daily_weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_weather
    ADD CONSTRAINT daily_weather_pkey PRIMARY KEY (daily_id);


--
-- TOC entry 4714 (class 2606 OID 21644)
-- Name: fact_weather fact_weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_weather
    ADD CONSTRAINT fact_weather_pkey PRIMARY KEY (id);


--
-- TOC entry 4720 (class 2606 OID 21681)
-- Name: hourly_weather hourly_weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hourly_weather
    ADD CONSTRAINT hourly_weather_pkey PRIMARY KEY (hourly_id);


--
-- TOC entry 4722 (class 2606 OID 21693)
-- Name: minutely_weather minutely_weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minutely_weather
    ADD CONSTRAINT minutely_weather_pkey PRIMARY KEY (minutely_id);


--
-- TOC entry 4723 (class 2606 OID 21654)
-- Name: current_weather current_weather_fact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_weather
    ADD CONSTRAINT current_weather_fact_id_fkey FOREIGN KEY (fact_id) REFERENCES public.fact_weather(id) ON DELETE CASCADE;


--
-- TOC entry 4724 (class 2606 OID 21668)
-- Name: daily_weather daily_weather_fact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_weather
    ADD CONSTRAINT daily_weather_fact_id_fkey FOREIGN KEY (fact_id) REFERENCES public.fact_weather(id) ON DELETE CASCADE;


--
-- TOC entry 4725 (class 2606 OID 21682)
-- Name: hourly_weather hourly_weather_fact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hourly_weather
    ADD CONSTRAINT hourly_weather_fact_id_fkey FOREIGN KEY (fact_id) REFERENCES public.fact_weather(id) ON DELETE CASCADE;


--
-- TOC entry 4726 (class 2606 OID 21694)
-- Name: minutely_weather minutely_weather_fact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minutely_weather
    ADD CONSTRAINT minutely_weather_fact_id_fkey FOREIGN KEY (fact_id) REFERENCES public.fact_weather(id) ON DELETE CASCADE;


-- Completed on 2024-10-19 19:27:55

--
-- PostgreSQL database dump complete
--

