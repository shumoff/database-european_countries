--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    capital character varying(100) NOT NULL,
    population integer NOT NULL,
    territory_sq_km real NOT NULL,
    region_id integer NOT NULL,
    CONSTRAINT countries_population_check CHECK ((population > 0)),
    CONSTRAINT countries_territory_sq_km_check CHECK ((territory_sq_km > (0)::double precision))
);


ALTER TABLE countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: country_associations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE country_associations (
    country_id integer NOT NULL,
    association_id integer NOT NULL
);


ALTER TABLE country_associations OWNER TO postgres;

--
-- Name: country_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE country_languages (
    country_id integer NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE country_languages OWNER TO postgres;

--
-- Name: country_religions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE country_religions (
    country_id integer NOT NULL,
    religion_id integer NOT NULL
);


ALTER TABLE country_religions OWNER TO postgres;

--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE languages (
    lid integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE languages OWNER TO postgres;

--
-- Name: languages_lid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE languages_lid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_lid_seq OWNER TO postgres;

--
-- Name: languages_lid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE languages_lid_seq OWNED BY languages.lid;


--
-- Name: major_international_associations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE major_international_associations (
    aid integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(100) NOT NULL,
    chairman character varying(100),
    headquarters_city character varying(100),
    year_of_foundation integer NOT NULL,
    CONSTRAINT major_international_associations_year_of_foundation_check CHECK ((year_of_foundation > 0))
);


ALTER TABLE major_international_associations OWNER TO postgres;

--
-- Name: major_international_associations_aid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE major_international_associations_aid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE major_international_associations_aid_seq OWNER TO postgres;

--
-- Name: major_international_associations_aid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE major_international_associations_aid_seq OWNED BY major_international_associations.aid;


--
-- Name: political_parties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE political_parties (
    pid integer NOT NULL,
    country_id integer NOT NULL,
    name character varying(100),
    leader character varying(100) NOT NULL,
    political_position character varying(100),
    year_of_foundation integer,
    CONSTRAINT political_parties_year_of_foundation_check CHECK ((year_of_foundation > 0))
);


ALTER TABLE political_parties OWNER TO postgres;

--
-- Name: political_parties_pid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE political_parties_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE political_parties_pid_seq OWNER TO postgres;

--
-- Name: political_parties_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE political_parties_pid_seq OWNED BY political_parties.pid;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE regions (
    rid integer NOT NULL,
    name character varying(100) NOT NULL,
    economical_leader integer NOT NULL
);


ALTER TABLE regions OWNER TO postgres;

--
-- Name: regions_rid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE regions_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE regions_rid_seq OWNER TO postgres;

--
-- Name: regions_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE regions_rid_seq OWNED BY regions.rid;


--
-- Name: religions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE religions (
    rel_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE religions OWNER TO postgres;

--
-- Name: religions_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE religions_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE religions_rel_id_seq OWNER TO postgres;

--
-- Name: religions_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE religions_rel_id_seq OWNED BY religions.rel_id;


--
-- Name: rulers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rulers (
    ruler_id integer NOT NULL,
    country_id integer NOT NULL,
    name character varying(100) NOT NULL,
    beginning_of_government integer NOT NULL,
    end_of_government integer,
    CONSTRAINT rulers_beginning_of_government_check CHECK ((beginning_of_government > 0)),
    CONSTRAINT valid_years_of_government CHECK ((end_of_government > beginning_of_government))
);


ALTER TABLE rulers OWNER TO postgres;

--
-- Name: rulers_ruler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rulers_ruler_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rulers_ruler_id_seq OWNER TO postgres;

--
-- Name: rulers_ruler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rulers_ruler_id_seq OWNED BY rulers.ruler_id;


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: languages lid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY languages ALTER COLUMN lid SET DEFAULT nextval('languages_lid_seq'::regclass);


--
-- Name: major_international_associations aid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY major_international_associations ALTER COLUMN aid SET DEFAULT nextval('major_international_associations_aid_seq'::regclass);


--
-- Name: political_parties pid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY political_parties ALTER COLUMN pid SET DEFAULT nextval('political_parties_pid_seq'::regclass);


--
-- Name: regions rid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY regions ALTER COLUMN rid SET DEFAULT nextval('regions_rid_seq'::regclass);


--
-- Name: religions rel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY religions ALTER COLUMN rel_id SET DEFAULT nextval('religions_rel_id_seq'::regclass);


--
-- Name: rulers ruler_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rulers ALTER COLUMN ruler_id SET DEFAULT nextval('rulers_ruler_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY countries (id, name, capital, population, territory_sq_km, region_id) FROM stdin;
1	Albania	Tirana	3020209	28748	3
2	Andorra	Andorra la Vella	85458	468	3
3	Armenia	Yerevan	3060631	29743	2
4	Austria	Vienna	8032926	83871	4
5	Azerbaijan	Baku	9686210	86600	2
6	Belarus	Minsk	9505200	207600	2
7	Belgium	Brussels	11358952	30528	4
8	Bosnia and Herzegovina	Sarajevo	3871643	51197	3
9	Bulgaria	Sofia	7101859	110993.602	2
10	Croatia	Zagreb	4470534	56594	2
11	Cyprus	Nicosia	1172458	9251	3
12	Czech Republic	Prague	10538275	78867	2
13	Denmark	Copenhagen	5693085	43094	1
14	Estonia	Tallinn	1257921	45228	1
15	Finland	Helsinki	5268799	338145	1
16	France	Paris	66259012	643427	4
17	Georgia	Tbilisi	4935880	69700	2
18	Germany	Berlin	82175684	357021	4
19	Greece	Athens	10816286	131957	3
20	Hungary	Budapest	9919128	93028	2
21	Iceland	Reykjavik	317351	103000	1
22	Ireland	Dublin	4832765	70273	4
23	Italy	Rome	61680122	301340	3
24	Kazakhstan	Astana	17948816	2724900	2
25	Kosovo	Pristina	1883018	10887	2
26	Latvia	Riga	2165165	64589	1
27	Liechtenstein	Vaduz	37313	160	4
28	Lithuania	Vilnius	2943472	65300	1
29	Luxembourg	Luxembourg	520672	2586	4
30	Macedonia	Skopje	2091719	25713	3
31	Malta	Valetta	412655	316	3
32	Moldova	Kishinev	3583288	33851	2
33	Monaco	Monaco	30508	2	4
34	Montenegro	Podgorica	650036	13812	3
35	Netherlands	Amsterdam	16877351	41543	4
36	Norway	Oslo	5147792	323802	1
37	Poland	Warsaw	38346279	312685	2
38	Portugal	Lisbon	10427301	92090	3
39	Romania	Bucharest	21729871	238391	2
40	Russia	Moscow	146267288	17098242	2
41	San Marino	San Marino	32742	61	3
42	Serbia	Belgrade	7209764	88361	3
43	Slovakia	Bratislava	5443583	49035	2
44	Slovenia	Ljubljana	1988292	20273	3
45	Spain	Madrid	47737941	505370	3
46	Sweden	Stockholm	9723809	450295	1
47	Switzerland	Bern	8061516	41277	4
48	Turkey	Ankara	79814871	783562	3
49	Ukraine	Kiev	44281413	603550	2
50	United Kingdom	London	63395574	243809	4
51	Vatican City	Vatican City	842	0.439999998	3
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('countries_id_seq', 51, true);


--
-- Data for Name: country_associations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY country_associations (country_id, association_id) FROM stdin;
1	1
2	1
4	1
5	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
4	2
7	2
9	2
20	2
19	2
18	2
13	2
22	2
23	2
45	2
11	2
26	2
31	2
28	2
29	2
35	2
37	2
38	2
39	2
16	2
15	2
10	2
12	2
46	2
43	2
44	2
14	2
3	3
5	3
24	3
32	3
40	3
6	3
1	4
7	4
9	4
51	4
18	4
20	4
19	4
13	4
21	4
23	4
45	4
26	4
28	4
29	4
35	4
36	4
37	4
38	4
39	4
43	4
44	4
48	4
16	4
10	4
12	4
34	4
14	4
4	5
5	5
1	5
2	5
3	5
6	5
7	5
9	5
8	5
50	5
51	5
20	5
18	5
19	5
17	5
13	5
22	5
21	5
45	5
23	5
24	5
11	5
26	5
28	5
27	5
29	5
30	5
31	5
32	5
33	5
35	5
36	5
37	5
38	5
40	5
39	5
41	5
42	5
43	5
44	5
48	5
49	5
15	5
16	5
10	5
34	5
12	5
47	5
46	5
14	5
13	6
15	6
21	6
36	6
46	6
1	7
8	7
30	7
32	7
34	7
42	7
7	8
35	8
29	8
32	9
17	9
49	9
5	9
3	10
6	10
24	10
40	10
32	10
14	11
26	11
28	11
13	12
14	12
15	12
18	12
21	12
26	12
28	12
36	12
37	12
40	12
46	12
40	13
6	13
1	14
2	14
3	14
4	14
51	14
6	14
7	14
9	14
8	14
20	14
18	14
19	14
17	14
13	14
22	14
21	14
45	14
23	14
24	14
11	14
25	14
26	14
28	14
27	14
29	14
30	14
31	14
32	14
35	14
36	14
37	14
38	14
40	14
39	14
41	14
42	14
43	14
44	14
48	14
49	14
15	14
16	14
10	14
34	14
12	14
47	14
46	14
14	14
\.


--
-- Data for Name: country_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY country_languages (country_id, language_id) FROM stdin;
1	1
2	8
2	39
2	14
2	33
3	2
3	18
3	35
4	17
5	3
5	2
5	16
5	35
6	4
6	35
7	11
7	14
7	17
8	5
8	7
8	36
9	6
10	7
11	18
11	28
12	9
13	10
14	13
14	35
15	15
15	40
16	14
17	16
18	17
19	18
20	19
21	20
22	21
22	12
23	22
24	23
24	35
25	1
25	36
26	29
26	35
27	17
28	31
28	35
28	32
29	31
29	14
29	17
30	24
30	1
30	28
30	34
30	36
31	25
31	12
32	34
32	41
33	14
33	22
34	26
34	36
34	5
34	1
34	7
35	11
35	12
36	27
37	32
37	17
37	35
37	41
37	4
38	33
39	34
39	35
39	32
39	37
39	28
39	41
39	1
39	2
39	6
39	9
39	7
39	17
39	18
39	22
39	24
39	19
40	35
40	41
41	22
42	36
42	19
42	34
43	37
43	19
44	38
45	39
45	8
46	40
47	14
47	17
47	22
48	28
49	41
49	35
50	12
50	21
51	22
\.


--
-- Data for Name: country_religions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY country_religions (country_id, religion_id) FROM stdin;
1	8
1	4
1	1
2	2
3	7
4	2
4	8
4	4
5	8
6	4
6	1
7	2
7	1
8	8
8	4
8	2
9	4
9	8
10	2
10	4
11	4
11	8
12	1
12	2
13	9
13	1
14	4
14	6
14	1
15	6
15	1
15	4
16	2
16	1
17	4
17	8
18	3
18	1
19	4
20	2
20	1
21	6
22	2
22	1
23	2
23	1
24	8
24	4
25	8
26	6
26	2
26	4
26	1
27	2
27	3
27	8
28	2
28	1
29	2
29	1
30	4
30	8
31	2
32	4
33	2
33	1
34	4
35	1
35	2
35	3
36	10
37	2
38	2
38	1
39	4
40	4
40	1
41	2
42	4
43	2
43	3
43	1
44	2
44	1
45	2
45	1
46	11
47	2
47	1
48	8
49	4
50	5
50	1
50	2
51	2
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY languages (lid, name) FROM stdin;
1	Albanian
2	Armenian
3	Azerbaijani
4	Belarusian
5	Bosnian
6	Bulgarian
7	Croatian
8	Catalan
9	Czech
10	Danish
11	Dutch
12	English
13	Estonian
14	French
15	Finnish
16	Georgian
17	German
18	Greek
19	Hungarian
20	Icelandic
21	Irish
22	Italian
23	Kazakh
24	Macedonian
25	Maltese
26	Montenegrin
27	Norwegian
28	Turkish
29	Latvian
30	Lithuanian
31	Luxembourgish
32	Polish
33	Portuguese
34	Romanian
35	Russian
36	Serbian
37	Slovak
38	Slovene
39	Spanish
40	Swedish
41	Ukranian
\.


--
-- Name: languages_lid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('languages_lid_seq', 41, true);


--
-- Data for Name: major_international_associations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY major_international_associations (aid, name, type, chairman, headquarters_city, year_of_foundation) FROM stdin;
1	Council of Europe	intergovernmental organization	Thorbjorn Jagland	Strasbourg	1949
2	European Union	politico-economic union	Donald Tusk	Brussels	1993
3	Commonwealth of Independent States	confederation	Sergei Lebedev	Minsk	1991
4	North Atlantic Treaty Organisation	military alliance	Jens Stoltenberg	Brussels	1949
5	Organization for Security and Co-operation in Europe	intergovernmental organization	Thomas Greminger	Vienna	1995
6	Nordic Council	intergovernmental organization	Britt Olsson	Copenhagen	1952
7	Central European Free Trade Agreement	trade agreement	Renata Vitez	Cracow	1992
8	Benelux	politico-economic union	\N	Brussels	1948
9	GUAM	economic union	Altai Efendiev	Kiev	2001
10	Eurasian Economic Union	economic union	Tigran Sargsyan	Moscow	2015
11	Baltic Assembly	intergovernmental organization	Dr. Marika Laizane-Jurkane	Riga	1991
12	Council of the Baltic Sea States	intergovernmental organization	Maira Mora	Stockholm	1992
13	Union State	supranational union	Alexander Lukashenko	Moscow	2014
14	Union of European Footbal Associations	sportive	Aleksander Ceferin	Nyon	1954
\.


--
-- Name: major_international_associations_aid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('major_international_associations_aid_seq', 14, true);


--
-- Data for Name: political_parties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY political_parties (pid, country_id, name, leader, political_position, year_of_foundation) FROM stdin;
1	1	Socialist Party of Albania	Edi Rama	centre-left	1991
2	2	Democrats for Andorra	Antoni Marti	centre-right	2011
3	3	Republican Party of Armenia	Serzh Sargsyan	right-wing	1990
4	4	Social Democratic Party of Austria	Christian Kern	centre-left	1945
5	5	New Azerbaijan Party	Ilham Aliyev	right-wing	1992
6	6	Communist Party of Belarus	Igor Karpenko	left-wing	1996
7	7	New Flemish Alliance	Bart De Wever	centre-right	2001
8	8	Party of Democratic Action	Bakir Izetbegovic	centre-right	1990
9	9	GERB	Boyko Borisov	centre-right	2006
10	10	Croatian Democratic Union	Andrej Plenkovic	centre-right	1989
11	11	Democratic Rally	Averof Neofytou	centre-right	1976
12	12	Czech Social Democratic Party	Lubomir Zaoralek	centre-left	1878
13	13	Social Democrats	Mette Frederiksen	centre-left	1871
14	14	Estonian Reform Party	Hanno Pevkur	centre-right	1994
15	15	Centre Party	Juha Sipila	centre	1906
16	16	En Marche!	Catherine Barbaroux	centre	2016
17	17	Georgian Dream	Giorgi Kvirikashvili	centre-right	2012
18	18	CDU/CSU	Angela Merkel	centre-right	1945
19	19	New Democracy	Kyriakos Mitsotakis	centre-right	1974
20	20	Hungarian Civic Alliance	Viktor Orban	centre-right	1988
21	21	Independence Party	Bjarni Benediktsson	centre-right	1929
22	22	Fine Gael	Leo Varadkar	centre-right	1933
23	23	Democratic Party	Matteo Renzi	centre-left	2007
24	24	Nur Otan	Nursultan Nazarbayev	centre	2006
25	25	Democratic party of Kosovo	Kadri Veseli	centre-right	1999
26	26	Social Democratic Party "Harmony"	Nils Usakovs	centre-left	2009
27	27	Progressive Citizens Party	Thomas Banzer	right-wing	1918
28	28	Homeland	Gabrielius Landsbergis	centre-right	1993
29	29	Christian Social People Party	Marc Spautz	centre-right	1944
30	30	VMRO-DPMNE	Nikola Gruevski	right-wing	1990
31	31	Labour Party	Joseph Muscat	centre-left	1920
32	32	Party of Socialists of the Republic of Moldova	Zinaida Greceanii	left-wing	1997
33	33	Horizon Monaco	Laurent Nouvion	right-wing	2012
34	34	Coalition for a European Montenegro	Milo Dikanovic	centre-left	1998
35	35	People Party for Freedom and Democracy	Mark Rutte	centre-right	1948
36	36	Labour Party	Jonas Gahr Store	centre-left	1887
37	37	Law and Justice	Jaroslaw  Kaczynski	right-wing	2001
38	38	Portugal Ahead	Pedro Passos Coelho	centre-right	2014
39	39	Social Democratic Party	Liviu Dragnea	centre-left	2001
40	40	United Russia	Dmitry Medvedev	centre-right	2001
41	41	Sammarinese Christian Democratic Party	Marco Gatti	centre	1948
42	42	Serbian Progressive Party	Aleksandar Vucic	centre-right	2008
43	43	Direction-Social Democracy	Robert Fico	centre-left	1999
44	44	Positive Slovenia	Zoran Jankovic	centre-left	2011
45	45	People Party	Mariano Rajoy	centre-right	1989
46	46	Swedish Social Democratic Party	Stefan Lofven	centre-left	1889
47	47	Swiss People Party	Albert Rosti	right-wing	1971
48	48	Justice and Development Party	Recep Tayyip Erdogan	right-wing	2001
49	49	Petro Poroshenko Bloc "Solidarity"	Vitali Klitschko	centre-right	2014
50	50	Conservative Party	Theresa May	centre-right	1834
51	51	\N	Pope Francis	\N	\N
\.


--
-- Name: political_parties_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('political_parties_pid_seq', 51, true);


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY regions (rid, name, economical_leader) FROM stdin;
1	Northern Europe	46
2	Eastern Europe	40
3	Southern Europe	23
4	Western Europe	18
\.


--
-- Name: regions_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('regions_rid_seq', 4, true);


--
-- Data for Name: religions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY religions (rel_id, name) FROM stdin;
1	Atheism
2	Catholicism
3	Protestantism
4	Orthodoxy
5	Anglican Church
6	Lutheran Church
7	Armenian Church
8	Islam
9	Church of Denmark
10	Church of Norway
11	Church of Sweden
\.


--
-- Name: religions_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('religions_rel_id_seq', 11, true);


--
-- Data for Name: rulers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rulers (ruler_id, country_id, name, beginning_of_government, end_of_government) FROM stdin;
1	1	Edi Rama	2013	\N
2	2	Antoni Marti	2015	\N
3	3	Serzh Sargsyan	2008	\N
4	4	Christian Kern	2016	\N
5	5	Ilham Aliyev	2003	\N
6	6	Alexander Lukashenko	1994	\N
7	7	Charles Michel	2014	\N
8	8	Denis Zvizdic	2015	\N
9	9	Boyko Borisov	2017	\N
10	10	Andrej Plenkovic	2016	\N
11	11	Nicos Anastasiades	2013	\N
12	12	Bohuslav Sobotka	2014	\N
13	13	Lars Rasmussen	2015	\N
14	14	Juri Ratas	2016	\N
15	15	Juha Sipila	2015	\N
16	16	Emmanuel Macron	2017	\N
17	17	Giorgi Margvelashvili	2013	\N
18	18	Angela Merkel	2005	\N
19	19	Alexis Tsipras	2015	\N
20	20	Viktor Orban	2010	\N
21	21	Bjarni Benediktsson	2017	\N
22	22	Leo Varadkar	2011	\N
23	23	Paolo Gentiloni	2016	\N
24	24	Nursultan Nazarbayev	1991	\N
25	25	Ramush Haradinaj	2017	\N
26	26	Maris Kucinskis	2016	\N
27	27	Adrian Hasler	2013	\N
28	28	Dalia Grybauskaite	2009	\N
29	29	Xavier Bettel	2013	\N
30	30	Zoran Zaev	2017	\N
31	31	Joseph Muscat	2013	\N
32	32	Pavel Filip	2016	\N
33	33	Serge Telle	2016	\N
34	34	Dusko Markovic	2016	\N
35	35	Mark Rutte	2010	\N
36	36	Erna Solberg	2013	\N
37	37	Andrzej Duda	2015	\N
38	38	Marcelo de Sousa	2016	\N
39	39	Klaus Iohannis	2014	\N
40	40	Vladimir Putin	2012	\N
41	41	Enrico Carattoni	2017	\N
42	42	Ana Brnabic	2017	\N
43	43	Robert Fico	2012	\N
44	44	Miro Cerar	2014	\N
45	45	Mariano Rajoy	2011	\N
46	46	Stefan Lofven	2014	\N
47	47	Walter Thurnherr	2016	\N
48	48	Recep Tayyip Erdogan	2014	\N
49	49	Petro Poroshenko	2014	\N
50	50	Theresa May	2016	\N
51	51	Pope Francis	2013	\N
\.


--
-- Name: rulers_ruler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rulers_ruler_id_seq', 51, true);


--
-- Name: countries countries_capital_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_capital_key UNIQUE (capital);


--
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: country_associations country_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY country_associations
    ADD CONSTRAINT country_associations_pkey PRIMARY KEY (country_id, association_id);


--
-- Name: country_languages country_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY country_languages
    ADD CONSTRAINT country_languages_pkey PRIMARY KEY (country_id, language_id);


--
-- Name: country_religions country_religions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY country_religions
    ADD CONSTRAINT country_religions_pkey PRIMARY KEY (country_id, religion_id);


--
-- Name: languages languages_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_name_key UNIQUE (name);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (lid);


--
-- Name: major_international_associations major_international_associations_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY major_international_associations
    ADD CONSTRAINT major_international_associations_name_key UNIQUE (name);


--
-- Name: major_international_associations major_international_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY major_international_associations
    ADD CONSTRAINT major_international_associations_pkey PRIMARY KEY (aid);


--
-- Name: political_parties political_parties_name_leader_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY political_parties
    ADD CONSTRAINT political_parties_name_leader_key UNIQUE (name, leader);


--
-- Name: political_parties political_parties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY political_parties
    ADD CONSTRAINT political_parties_pkey PRIMARY KEY (pid);


--
-- Name: regions regions_economical_leader_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_economical_leader_key UNIQUE (economical_leader);


--
-- Name: regions regions_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_name_key UNIQUE (name);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (rid);


--
-- Name: religions religions_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY religions
    ADD CONSTRAINT religions_name_key UNIQUE (name);


--
-- Name: religions religions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY religions
    ADD CONSTRAINT religions_pkey PRIMARY KEY (rel_id);


--
-- Name: rulers rulers_name_beginning_of_government_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rulers
    ADD CONSTRAINT rulers_name_beginning_of_government_key UNIQUE (name, beginning_of_government);


--
-- Name: rulers rulers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rulers
    ADD CONSTRAINT rulers_pkey PRIMARY KEY (ruler_id);


--
-- Name: countries countries_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_region_id_fkey FOREIGN KEY (region_id) REFERENCES regions(rid);


--
-- Name: country_associations country_associations_association_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY country_associations
    ADD CONSTRAINT country_associations_association_id_fkey FOREIGN KEY (association_id) REFERENCES major_international_associations(aid);


--
-- Name: country_associations country_associations_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY country_associations
    ADD CONSTRAINT country_associations_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: country_languages country_languages_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY country_languages
    ADD CONSTRAINT country_languages_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: country_languages country_languages_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY country_languages
    ADD CONSTRAINT country_languages_language_id_fkey FOREIGN KEY (language_id) REFERENCES languages(lid);


--
-- Name: country_religions country_religions_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY country_religions
    ADD CONSTRAINT country_religions_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: country_religions country_religions_religion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY country_religions
    ADD CONSTRAINT country_religions_religion_id_fkey FOREIGN KEY (religion_id) REFERENCES religions(rel_id);


--
-- Name: political_parties political_parties_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY political_parties
    ADD CONSTRAINT political_parties_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: regions regions_economical_leader_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_economical_leader_fkey FOREIGN KEY (economical_leader) REFERENCES countries(id);


--
-- Name: rulers rulers_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rulers
    ADD CONSTRAINT rulers_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- PostgreSQL database dump complete
--

