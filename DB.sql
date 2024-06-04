--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    brand_id integer NOT NULL,
    brand_name character varying(255) NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- Name: brands_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brands_brand_id_seq OWNER TO postgres;

--
-- Name: brands_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_brand_id_seq OWNED BY public.brands.brand_id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_category_id_seq OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    phone character varying(25),
    email character varying(255) NOT NULL,
    street character varying(255),
    city character varying(50),
    state character varying(25),
    zip_code character varying(5)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    order_id integer NOT NULL,
    item_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    list_price numeric(10,2) NOT NULL,
    discount numeric(4,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    order_status integer NOT NULL,
    order_date date NOT NULL,
    required_date date NOT NULL,
    shipped_date date,
    store_id integer NOT NULL,
    staff_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(255) NOT NULL,
    brand_id integer NOT NULL,
    category_id integer NOT NULL,
    model_year smallint NOT NULL,
    list_price numeric(10,2) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: staffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staffs (
    staff_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(25),
    active integer NOT NULL,
    store_id integer NOT NULL,
    manager_id integer
);


ALTER TABLE public.staffs OWNER TO postgres;

--
-- Name: staffs_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staffs_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.staffs_staff_id_seq OWNER TO postgres;

--
-- Name: staffs_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staffs_staff_id_seq OWNED BY public.staffs.staff_id;


--
-- Name: stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stocks (
    store_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer
);


ALTER TABLE public.stocks OWNER TO postgres;

--
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores (
    store_id integer NOT NULL,
    store_name character varying(255) NOT NULL,
    phone character varying(25),
    email character varying(255),
    street character varying(255),
    city character varying(255),
    state character varying(10),
    zip_code character varying(5)
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- Name: stores_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stores_store_id_seq OWNER TO postgres;

--
-- Name: stores_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_store_id_seq OWNED BY public.stores.store_id;


--
-- Name: brands brand_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN brand_id SET DEFAULT nextval('public.brands_brand_id_seq'::regclass);


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: staffs staff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffs ALTER COLUMN staff_id SET DEFAULT nextval('public.staffs_staff_id_seq'::regclass);


--
-- Name: stores store_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN store_id SET DEFAULT nextval('public.stores_store_id_seq'::regclass);


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (brand_id, brand_name) FROM stdin;
1	Electra
2	Haro
3	Heller
4	Pure Cycles
5	Ritchey
6	Strider
7	Sun Bicycles
8	Surly
9	Trek
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name) FROM stdin;
1	Children Bicycles
2	Comfort Bicycles
3	Cruisers Bicycles
4	Cyclocross Bicycles
5	Electric Bikes
6	Mountain Bikes
7	Road Bikes
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, first_name, last_name, phone, email, street, city, state, zip_code) FROM stdin;
1	Debra	Burks	\N	debra.burks@yahoo.com	9273 Thorne Ave. 	Orchard Park	NY	14127
2	Kasha	Todd	\N	kasha.todd@yahoo.com	910 Vine Street 	Campbell	CA	95008
3	Tameka	Fisher	\N	tameka.fisher@aol.com	769C Honey Creek St. 	Redondo Beach	CA	90278
4	Daryl	Spence	\N	daryl.spence@aol.com	988 Pearl Lane 	Uniondale	NY	11553
5	Charolette	Rice	(916) 381-6003	charolette.rice@msn.com	107 River Dr. 	Sacramento	CA	95820
6	Lyndsey	Bean	\N	lyndsey.bean@hotmail.com	769 West Road 	Fairport	NY	14450
7	Latasha	Hays	(716) 986-3359	latasha.hays@hotmail.com	7014 Manor Station Rd. 	Buffalo	NY	14215
8	Jacquline	Duncan	\N	jacquline.duncan@yahoo.com	15 Brown St. 	Jackson Heights	NY	11372
9	Genoveva	Baldwin	\N	genoveva.baldwin@msn.com	8550 Spruce Drive 	Port Washington	NY	11050
10	Pamelia	Newman	\N	pamelia.newman@gmail.com	476 Chestnut Ave. 	Monroe	NY	10950
11	Deshawn	Mendoza	\N	deshawn.mendoza@yahoo.com	8790 Cobblestone Street 	Monsey	NY	10952
12	Robby	Sykes	(516) 583-7761	robby.sykes@hotmail.com	486 Rock Maple Street 	Hempstead	NY	11550
13	Lashawn	Ortiz	\N	lashawn.ortiz@msn.com	27 Washington Rd. 	Longview	TX	75604
14	Garry	Espinoza	\N	garry.espinoza@hotmail.com	7858 Rockaway Court 	Forney	TX	75126
15	Linnie	Branch	\N	linnie.branch@gmail.com	314 South Columbia Ave. 	Plattsburgh	NY	12901
16	Emmitt	Sanchez	(212) 945-8823	emmitt.sanchez@hotmail.com	461 Squaw Creek Road 	New York	NY	10002
17	Caren	Stephens	\N	caren.stephens@msn.com	914 Brook St. 	Scarsdale	NY	10583
18	Georgetta	Hardin	\N	georgetta.hardin@aol.com	474 Chapel Dr. 	Canandaigua	NY	14424
19	Lizzette	Stein	\N	lizzette.stein@yahoo.com	19 Green Hill Lane 	Orchard Park	NY	14127
20	Aleta	Shepard	\N	aleta.shepard@aol.com	684 Howard St. 	Sugar Land	TX	77478
21	Tobie	Little	\N	tobie.little@gmail.com	10 Silver Spear Dr. 	Victoria	TX	77904
22	Adelle	Larsen	\N	adelle.larsen@gmail.com	683 West Kirkland Dr. 	East Northport	NY	11731
23	Kaylee	English	\N	kaylee.english@msn.com	8786 Fulton Rd. 	Hollis	NY	11423
24	Corene	Wall	\N	corene.wall@msn.com	9601 Ocean Rd. 	Atwater	CA	95301
25	Regenia	Vaughan	\N	regenia.vaughan@gmail.com	44 Stonybrook Street 	Mahopac	NY	10541
26	Theo	Reese	(562) 215-2907	theo.reese@gmail.com	8755 W. Wild Horse St. 	Long Beach	NY	11561
27	Santos	Valencia	\N	santos.valencia@yahoo.com	7479 Carpenter Street 	Sunnyside	NY	11104
28	Jeanice	Frost	\N	jeanice.frost@hotmail.com	76 Devon Lane 	Ossining	NY	10562
29	Syreeta	Hendricks	\N	syreeta.hendricks@msn.com	193 Spruce Road 	Mahopac	NY	10541
30	Jamaal	Albert	\N	jamaal.albert@gmail.com	853 Stonybrook Street 	Torrance	CA	90505
31	Williemae	Holloway	(510) 246-8375	williemae.holloway@msn.com	69 Cypress St. 	Oakland	CA	94603
32	Araceli	Golden	\N	araceli.golden@msn.com	12 Ridgeview Ave. 	Fullerton	CA	92831
33	Deloris	Burke	\N	deloris.burke@hotmail.com	895 Edgemont Drive 	Palos Verdes Peninsula	CA	90274
34	Brittney	Woodward	\N	brittney.woodward@aol.com	960 River St. 	East Northport	NY	11731
35	Guillermina	Noble	\N	guillermina.noble@msn.com	6 Del Monte Lane 	Baldwinsville	NY	13027
36	Bernita	Mcdaniel	\N	bernita.mcdaniel@hotmail.com	2 Peg Shop Ave. 	Liverpool	NY	13090
37	Melia	Brady	\N	melia.brady@gmail.com	907 Shirley Rd. 	Maspeth	NY	11378
38	Zelma	Browning	\N	zelma.browning@aol.com	296 Second Street 	Astoria	NY	11102
39	Janetta	Aguirre	(717) 670-2634	janetta.aguirre@aol.com	214 Second Court 	Lancaster	NY	14086
40	Ronna	Butler	\N	ronna.butler@gmail.com	9438 Plymouth Court 	Encino	CA	91316
41	Kathie	Freeman	\N	kathie.freeman@msn.com	667 Temple Dr. 	Queensbury	NY	12804
42	Tangela	Quinn	\N	tangela.quinn@aol.com	4 S. Purple Finch Road 	Richmond Hill	NY	11418
43	Mozelle	Carter	(281) 489-9656	mozelle.carter@aol.com	895 Chestnut Ave. 	Houston	TX	77016
44	Onita	Johns	\N	onita.johns@msn.com	32 Glen Creek Lane 	Elmont	NY	11003
45	Bennett	Armstrong	\N	bennett.armstrong@aol.com	688 Walnut Street 	Bethpage	NY	11714
46	Monika	Berg	\N	monika.berg@gmail.com	369 Vernon Dr. 	Encino	CA	91316
47	Bridgette	Guerra	\N	bridgette.guerra@hotmail.com	9982 Manor Drive 	San Lorenzo	CA	94580
48	Cesar	Jackson	\N	cesar.jackson@gmail.com	8068 N. Griffin Ave. 	Liverpool	NY	13090
49	Caroll	Hays	\N	caroll.hays@yahoo.com	9381 Wrangler St. 	Fairport	NY	14450
50	Cleotilde	Booth	\N	cleotilde.booth@gmail.com	17 Corona St. 	Sugar Land	TX	77478
51	Gertrud	Rhodes	\N	gertrud.rhodes@aol.com	9961 Meadowbrook Street 	Merrick	NY	11566
52	Tu	Ramirez	\N	tu.ramirez@hotmail.com	24 W. Courtland Street 	East Elmhurst	NY	11369
53	Saturnina	Garner	\N	saturnina.garner@gmail.com	8538 Fairground St. 	Glendora	CA	91740
54	Fran	Yang	\N	fran.yang@hotmail.com	440 Pearl St. 	Utica	NY	13501
55	Diana	Guerra	\N	diana.guerra@hotmail.com	45 Chapel Ave. 	Merrick	NY	11566
56	Lolita	Mosley	(281) 363-3309	lolita.mosley@hotmail.com	376 S. High Ridge St. 	Houston	TX	77016
57	Pamala	Henry	\N	pamala.henry@aol.com	197 Bridgeton Ave. 	Bronx	NY	10451
58	Damien	Dorsey	\N	damien.dorsey@yahoo.com	161 Old York Street 	Central Islip	NY	11722
59	Latasha	Stanley	\N	latasha.stanley@gmail.com	8068 Fordham Drive 	Rockville Centre	NY	11570
60	Neil	Mccall	\N	neil.mccall@gmail.com	7476 Oakland Dr. 	San Carlos	CA	94070
61	Elinore	Aguilar	\N	elinore.aguilar@msn.com	9766 Rockcrest Ave. 	San Angelo	TX	76901
62	Alica	Hunter	\N	alica.hunter@hotmail.com	8 San Juan Drive 	East Elmhurst	NY	11369
63	Tenisha	Lyons	\N	tenisha.lyons@aol.com	78 E. Rock Creek Street 	Amityville	NY	11701
64	Bobbie	Foster	\N	bobbie.foster@yahoo.com	988 Pineknoll Ave. 	Desoto	TX	75115
65	Kanesha	Vega	\N	kanesha.vega@gmail.com	771 E. Oxford Drive 	Rome	NY	13440
66	Lorrie	Becker	\N	lorrie.becker@yahoo.com	19 North Court 	Garland	TX	75043
67	Tommie	Melton	(916) 802-2952	tommie.melton@gmail.com	8 West Old York St. 	Sacramento	CA	95820
68	Jayne	Kirkland	\N	jayne.kirkland@hotmail.com	7800 Second Lane 	Rowlett	TX	75088
69	Katelin	Kennedy	\N	katelin.kennedy@gmail.com	286 Myrtle Lane 	Rocklin	CA	95677
70	Tomasa	Carson	\N	tomasa.carson@aol.com	10 Clark Avenue 	East Elmhurst	NY	11369
71	Takako	Casey	\N	takako.casey@aol.com	7548 Court Lane 	Bronx	NY	10451
72	Petronila	Norris	\N	petronila.norris@aol.com	72 South Marshall Lane 	South El Monte	CA	91733
73	Melanie	Hayes	\N	melanie.hayes@msn.com	5 N. Hall Dr. 	Liverpool	NY	13090
74	Georgeann	Waller	\N	georgeann.waller@yahoo.com	9797 Bald Hill Ave. 	North Tonawanda	NY	14120
75	Abby	Gamble	\N	abby.gamble@aol.com	60 Myers Dr. 	Amityville	NY	11701
76	Parker	Prince	\N	parker.prince@hotmail.com	21 Sulphur Springs Drive 	Port Jefferson Station	NY	11776
77	Keri	Bridges	\N	keri.bridges@gmail.com	8504 Brickell Ave. 	Richardson	TX	75080
78	Chi	Goff	\N	chi.goff@aol.com	3 W. Glen Ridge Avenue 	Palos Verdes Peninsula	CA	90274
79	Ashanti	Parks	\N	ashanti.parks@hotmail.com	846 N. Helen St. 	Baldwin	NY	11510
80	Sarai	Mckee	(716) 912-8110	sarai.mckee@msn.com	641 Glenwood Avenue 	Buffalo	NY	14215
81	Zina	Bonner	\N	zina.bonner@hotmail.com	9312 8th Street 	San Lorenzo	CA	94580
82	Lizzie	Joyner	\N	lizzie.joyner@msn.com	8541 Roberts St. 	Coachella	CA	92236
83	Tiesha	Daniel	\N	tiesha.daniel@yahoo.com	6 West Bohemia Lane 	Scarsdale	NY	10583
84	Armand	Whitehead	\N	armand.whitehead@hotmail.com	639 Harvey St. 	Lindenhurst	NY	11757
85	Teofila	Fischer	\N	teofila.fischer@aol.com	1 West Brickyard St. 	Huntington Station	NY	11746
86	Lissa	Vargas	\N	lissa.vargas@yahoo.com	517 Victoria Ave. 	Oswego	NY	13126
87	Yan	Mcgowan	\N	yan.mcgowan@msn.com	8960 Newport Ave. 	Duarte	CA	91010
88	Titus	Bullock	\N	titus.bullock@gmail.com	29 Oxford Avenue 	Hollis	NY	11423
89	Arvilla	Osborn	\N	arvilla.osborn@gmail.com	60 Acacia Lane 	Upland	CA	91784
90	Marjorie	Logan	\N	marjorie.logan@msn.com	95 Grandrose St. 	Franklin Square	NY	11010
91	Marvin	Mullins	(619) 635-2027	marvin.mullins@aol.com	7489 Redwood Drive 	San Diego	CA	92111
92	Tena	Cruz	\N	tena.cruz@yahoo.com	1 South St. 	Farmingdale	NY	11735
93	Corrina	Sawyer	(248) 370-1364	corrina.sawyer@yahoo.com	95 Briarwood Lane 	Troy	NY	12180
94	Sharyn	Hopkins	\N	sharyn.hopkins@hotmail.com	4 South Temple Ave. 	Baldwinsville	NY	13027
95	Letitia	Franco	\N	letitia.franco@aol.com	607 Lakeview Drive 	Saratoga Springs	NY	12866
96	Floretta	Higgins	\N	floretta.higgins@hotmail.com	870 Lilac Dr. 	Bayside	NY	11361
97	Louanne	Martin	\N	louanne.martin@hotmail.com	1 Campfire Ave. 	Yuba City	CA	95993
98	Violet	Valenzuela	\N	violet.valenzuela@msn.com	8668 Piper Street 	Plattsburgh	NY	12901
99	Carie	Kidd	\N	carie.kidd@yahoo.com	6 East Clinton Street 	Monroe	NY	10950
100	Kellie	Franco	\N	kellie.franco@yahoo.com	444 South Walnut Rd. 	Commack	NY	11725
101	Nichelle	Howell	\N	nichelle.howell@aol.com	7670 Forest St. 	Scarsdale	NY	10583
102	Marisol	Goodman	\N	marisol.goodman@gmail.com	864 East Cherry St. 	Canandaigua	NY	14424
103	Sylvie	Wilkerson	\N	sylvie.wilkerson@yahoo.com	750 Central Ave. 	Syosset	NY	11791
104	Katharina	Bates	\N	katharina.bates@gmail.com	54 South Greenview Drive 	Campbell	CA	95008
105	Marget	Hodge	\N	marget.hodge@msn.com	7199 Selby Lane 	Woodhaven	NY	11421
106	Raul	Melendez	\N	raul.melendez@hotmail.com	9772 Manhattan St. 	Elmhurst	NY	11373
107	Cecil	Hopper	\N	cecil.hopper@yahoo.com	471 Glenlake Ave. 	Central Islip	NY	11722
108	Shae	Hickman	\N	shae.hickman@hotmail.com	740 Pin Oak Street 	Floral Park	NY	11001
109	Monica	Sears	(408) 704-8863	monica.sears@aol.com	57 Glenholme St. 	San Jose	CA	95127
110	Ollie	Zimmerman	(657) 648-2863	ollie.zimmerman@yahoo.com	69 Wood Rd. 	Anaheim	CA	92806
111	Shila	White	\N	shila.white@msn.com	94 Lakeshore Street 	Orchard Park	NY	14127
112	Yuk	Vega	\N	yuk.vega@yahoo.com	413 Wood St. 	West Hempstead	NY	11552
113	Eliana	Silva	\N	eliana.silva@gmail.com	7119 Summer Rd. 	Farmingdale	NY	11735
114	Thalia	Horne	\N	thalia.horne@yahoo.com	9312 Harvard Street 	Amityville	NY	11701
115	Rey	Lindsay	\N	rey.lindsay@gmail.com	16 Philmont St. 	Monroe	NY	10950
116	Merlene	Vinson	\N	merlene.vinson@gmail.com	431 Vine Dr. 	Euless	TX	76039
117	Dacia	William	\N	dacia.william@msn.com	62 Cypress Drive 	Sugar Land	TX	77478
118	Le	Wood	\N	le.wood@yahoo.com	90 Primrose Dr. 	Pittsford	NY	14534
119	Thalia	Dillard	\N	thalia.dillard@yahoo.com	987 NE. Gates Street 	San Angelo	TX	76901
120	Luz	House	(559) 114-2580	luz.house@gmail.com	491 Railroad Street 	Fresno	CA	93706
121	Lucy	Woods	\N	lucy.woods@gmail.com	8437 West Rockaway St. 	Palos Verdes Peninsula	CA	90274
122	Shena	Carter	\N	shena.carter@yahoo.com	72 University Road 	Howard Beach	NY	11414
123	Robena	Hill	(361) 598-4414	robena.hill@hotmail.com	263 Cross St. 	Corpus Christi	TX	78418
124	Jeni	Booker	\N	jeni.booker@gmail.com	546 Railroad Dr. 	South El Monte	CA	91733
125	Herlinda	Stone	\N	herlinda.stone@msn.com	725 Gulf St. 	Canandaigua	NY	14424
126	Lavina	Dejesus	\N	lavina.dejesus@msn.com	59 E. Valley Avenue 	Newburgh	NY	12550
127	Erlinda	Nielsen	\N	erlinda.nielsen@aol.com	728 Oxford Lane 	Maspeth	NY	11378
128	Terrance	Lynn	\N	terrance.lynn@yahoo.com	91 East Buckingham Drive 	Plattsburgh	NY	12901
129	Walton	Dejesus	\N	walton.dejesus@yahoo.com	15 Washington Rd. 	Lockport	NY	14094
130	Wes	Stanton	(248) 247-5074	wes.stanton@msn.com	8662 Tunnel Street 	Troy	NY	12180
131	Tanesha	Hampton	\N	tanesha.hampton@hotmail.com	19 Belmont Ave. 	Syosset	NY	11791
132	Boyd	Irwin	\N	boyd.irwin@hotmail.com	221 Whitemarsh St. 	Hamburg	NY	14075
133	Delbert	Wilkins	\N	delbert.wilkins@aol.com	420 Greenview St. 	Coram	NY	11727
134	Brianna	Moss	(516) 156-8031	brianna.moss@msn.com	4 Longfellow St. 	Hempstead	NY	11550
135	Dorthey	Jackson	(281) 926-8010	dorthey.jackson@msn.com	9768 Brookside St. 	Houston	TX	77016
136	Sarita	Parks	\N	sarita.parks@msn.com	7809 Second Lane 	Forney	TX	75126
137	Shonta	Mercer	\N	shonta.mercer@aol.com	319 NE. La Sierra Avenue 	Massapequa	NY	11758
138	Jone	Bernard	(657) 536-5165	jone.bernard@hotmail.com	99 Longbranch Court 	Anaheim	CA	92806
139	Wanita	Davenport	\N	wanita.davenport@aol.com	525 Dogwood Ave. 	Spring Valley	NY	10977
140	Cleopatra	Tate	\N	cleopatra.tate@aol.com	97 N. Glenwood St. 	East Elmhurst	NY	11369
141	Ramiro	Byers	\N	ramiro.byers@gmail.com	16 Pleasant St. 	Saint Albans	NY	11412
142	Nicholas	Vazquez	\N	nicholas.vazquez@hotmail.com	9 Roosevelt Street 	West Hempstead	NY	11552
143	Janae	Doyle	\N	janae.doyle@gmail.com	760 Rose Ave. 	Jackson Heights	NY	11372
144	Hans	Price	\N	hans.price@hotmail.com	51 Glendale Road 	Port Chester	NY	10573
145	Miquel	Neal	\N	miquel.neal@hotmail.com	9564 Deerfield Lane 	Staten Island	NY	10301
146	Stefany	Potter	\N	stefany.potter@gmail.com	256 South Academy St. 	Saratoga Springs	NY	12866
147	Bernetta	Marquez	\N	bernetta.marquez@hotmail.com	626 E. Dunbar Street 	Smithtown	NY	11787
148	Julee	Woodard	\N	julee.woodard@yahoo.com	869 Summerhouse Dr. 	Richmond Hill	NY	11418
149	Meredith	Bryan	\N	meredith.bryan@hotmail.com	8935 E. Oxford St. 	Spring Valley	NY	10977
150	Weldon	Michael	\N	weldon.michael@hotmail.com	9952 Nut Swamp St. 	Huntington	NY	11743
151	Joesph	Delacruz	\N	joesph.delacruz@aol.com	184 Cypress Street 	Atwater	CA	95301
152	Katherina	Odom	\N	katherina.odom@yahoo.com	897 N. Oak Drive 	Plainview	NY	11803
153	Laraine	Robbins	\N	laraine.robbins@yahoo.com	8214 E. Pin Oak Lane 	San Angelo	TX	76901
154	Jenise	Preston	\N	jenise.preston@yahoo.com	9 Littleton Drive 	Helotes	TX	78023
155	Lory	Page	\N	lory.page@hotmail.com	58 Summerhouse Street 	Bay Shore	NY	11706
156	Charlyn	Cantrell	\N	charlyn.cantrell@yahoo.com	8756 Euclid St. 	West Islip	NY	11795
157	Carola	Rodriquez	\N	carola.rodriquez@hotmail.com	9433 Heritage Lane 	Banning	CA	92220
158	Alane	Kennedy	\N	alane.kennedy@yahoo.com	34 Green Lake Street 	Spring Valley	NY	10977
159	Regina	Burns	\N	regina.burns@aol.com	713 Buckingham St. 	Garland	TX	75043
160	Omer	Estrada	\N	omer.estrada@gmail.com	9 Honey Creek Street 	Rowlett	TX	75088
161	Crystle	Gilliam	\N	crystle.gilliam@yahoo.com	86 Edgewater Road 	Smithtown	NY	11787
162	Kam	Wilder	\N	kam.wilder@hotmail.com	500 West Clay Ave. 	Newburgh	NY	12550
163	Margert	Stevens	\N	margert.stevens@aol.com	502 North Poplar St. 	Rome	NY	13440
164	Tomika	Larson	\N	tomika.larson@yahoo.com	254 Canal St. 	Woodside	NY	11377
165	Jeromy	Burch	(408) 955-8238	jeromy.burch@msn.com	889 Mulberry Street 	San Jose	CA	95127
166	Lena	Mills	\N	lena.mills@yahoo.com	42 Homestead St. 	Woodhaven	NY	11421
167	Loreta	Johnston	\N	loreta.johnston@yahoo.com	39 Lafayette Dr. 	Spring Valley	NY	10977
168	Nettie	Mcdaniel	\N	nettie.mcdaniel@hotmail.com	7004 E. Wakehurst St. 	South Ozone Park	NY	11420
169	Karla	Kirk	\N	karla.kirk@yahoo.com	9718 Harvard Rd. 	Palos Verdes Peninsula	CA	90274
170	Regine	Gonzales	(805) 763-4045	regine.gonzales@gmail.com	798 Court Drive 	Oxnard	CA	93035
171	Miriam	Baker	\N	miriam.baker@hotmail.com	90 Studebaker St. 	Uniondale	NY	11553
172	Jeanie	Kirkland	\N	jeanie.kirkland@aol.com	7643 Old Theatre St. 	Santa Clara	CA	95050
173	Marquerite	Dawson	\N	marquerite.dawson@gmail.com	37 Hamilton Court 	Garland	TX	75043
174	Babara	Ochoa	\N	babara.ochoa@aol.com	872 Smith Store St. 	Scarsdale	NY	10583
175	Nova	Hess	\N	nova.hess@msn.com	773 South Lafayette St. 	Duarte	CA	91010
176	Carley	Reynolds	\N	carley.reynolds@gmail.com	2 Snake Hill Drive 	South El Monte	CA	91733
177	Carissa	Foreman	\N	carissa.foreman@msn.com	69C N. Ridge Rd. 	Maspeth	NY	11378
178	Genoveva	Tyler	(212) 152-6381	genoveva.tyler@gmail.com	8121 Windfall Ave. 	New York	NY	10002
179	Deane	Sears	\N	deane.sears@hotmail.com	3 Bradford Court 	Pittsford	NY	14534
180	Karey	Steele	\N	karey.steele@gmail.com	8879 Kent Lane 	Farmingdale	NY	11735
181	Olevia	Pitts	\N	olevia.pitts@gmail.com	39 Fieldstone Drive 	Redondo Beach	CA	90278
182	Jenniffer	Bullock	\N	jenniffer.bullock@msn.com	38 Oxford Avenue 	Bay Shore	NY	11706
183	Jeniffer	Ratliff	\N	jeniffer.ratliff@gmail.com	510 Rocky River Court 	Floral Park	NY	11001
184	Klara	Stanley	\N	klara.stanley@aol.com	603 Mechanic St. 	Webster	NY	14580
185	Morton	Lee	\N	morton.lee@yahoo.com	313 Ridge St. 	San Angelo	TX	76901
186	Ken	Charles	\N	ken.charles@msn.com	9124 W. Piper Lane 	Monsey	NY	10952
187	Hedwig	Paul	\N	hedwig.paul@msn.com	422 Manor Ave. 	Apple Valley	CA	92307
188	Sharla	Flynn	(805) 478-7724	sharla.flynn@hotmail.com	7 Brown Drive 	Oxnard	CA	93035
189	Damian	Dawson	\N	damian.dawson@hotmail.com	528 St Margarets Street 	Liverpool	NY	13090
190	Toya	Pratt	(562) 218-6405	toya.pratt@yahoo.com	485 San Pablo Drive 	Long Beach	NY	11561
191	Graciela	Barber	(805) 656-6987	graciela.barber@hotmail.com	1 E. Young St. 	Oxnard	CA	93035
192	Bong	Hebert	\N	bong.hebert@gmail.com	545 Brook St. 	Torrance	CA	90505
193	Ayanna	Rhodes	\N	ayanna.rhodes@msn.com	7425 Pheasant St. 	Hicksville	NY	11801
194	Dorine	Roberson	\N	dorine.roberson@msn.com	396 Meadowbrook Lane 	Santa Cruz	CA	95060
195	Addie	Hahn	\N	addie.hahn@hotmail.com	8165 Baker Ave. 	Franklin Square	NY	11010
196	Edythe	Valencia	\N	edythe.valencia@yahoo.com	9346 Wall St. 	North Tonawanda	NY	14120
197	Andy	O'neill	\N	andy.o'neill@msn.com	9544 Mulberry Drive 	Rego Park	NY	11374
198	Luis	Tyler	\N	luis.tyler@gmail.com	9568 Campfire Circle 	Amarillo	TX	79106
199	Clelia	Workman	\N	clelia.workman@yahoo.com	620 North Somerset St. 	New Windsor	NY	12553
200	Ashely	Holmes	\N	ashely.holmes@aol.com	45 High Ridge Ave. 	Farmingdale	NY	11735
201	Candis	Harding	\N	candis.harding@gmail.com	33 NW. Cambridge Ave. 	Ballston Spa	NY	12020
202	Marni	Bolton	(717) 670-6268	marni.bolton@msn.com	7469 Plymouth Ave. 	Lancaster	NY	14086
203	Minerva	Decker	(281) 271-6390	minerva.decker@yahoo.com	794 Greenrose Street 	Houston	TX	77016
204	Alpha	King	\N	alpha.king@hotmail.com	14 Henry Smith St. 	Rockville Centre	NY	11570
205	Harris	Pittman	\N	harris.pittman@yahoo.com	404 Cherry Hill Road 	Jamaica	NY	11432
206	Stephaine	Riddle	\N	stephaine.riddle@hotmail.com	199 Vermont Court 	Brooklyn	NY	11201
207	Michel	Blankenship	\N	michel.blankenship@msn.com	382 West Hill Dr. 	Forney	TX	75126
208	Denis	Logan	\N	denis.logan@msn.com	121 Rockcrest Street 	Ridgecrest	CA	93555
209	Jutta	Everett	\N	jutta.everett@gmail.com	27 Taylor Ave. 	Selden	NY	11784
210	Priscilla	Wilkins	(229) 322-2269	priscilla.wilkins@aol.com	653 Pawnee Rd. 	Albany	NY	12203
211	Gilma	Dejesus	\N	gilma.dejesus@yahoo.com	777 Thompson Ave. 	Scarsdale	NY	10583
212	Buford	Bridges	(248) 604-7346	buford.bridges@msn.com	239 Oak Valley Court 	Troy	NY	12180
213	Elenore	Hensley	\N	elenore.hensley@hotmail.com	7037 Aspen St. 	Hamburg	NY	14075
214	Ross	Pugh	\N	ross.pugh@msn.com	8598 Saxon St. 	North Tonawanda	NY	14120
215	Judith	Finley	\N	judith.finley@hotmail.com	474 West Bank Road 	Whitestone	NY	11357
216	Wai	Soto	\N	wai.soto@msn.com	30 Arch Drive 	Bethpage	NY	11714
217	Carline	Collier	(559) 810-6070	carline.collier@msn.com	28 Trenton Lane 	Fresno	CA	93706
218	Casey	Gill	\N	casey.gill@gmail.com	636 Prospect Avenue 	Port Washington	NY	11050
219	Darcie	Morgan	(442) 618-7068	darcie.morgan@aol.com	476 East Adams Ave. 	Oceanside	NY	11572
220	Lucio	Sherman	\N	lucio.sherman@gmail.com	842 Corona Ave. 	Smithtown	NY	11787
221	Clementine	Mooney	\N	clementine.mooney@yahoo.com	678 Charles Court 	Mcallen	TX	78501
222	Anya	Contreras	\N	anya.contreras@msn.com	38 Old Fairground St. 	East Northport	NY	11731
223	Scarlet	Yates	\N	scarlet.yates@hotmail.com	687 Shirley St. 	Patchogue	NY	11772
224	Moses	Pope	\N	moses.pope@yahoo.com	654 Theatre Street 	Lawndale	CA	90260
225	Barbera	Riggs	\N	barbera.riggs@aol.com	12 Gartner Drive 	Plainview	NY	11803
226	Kiana	Rivera	\N	kiana.rivera@gmail.com	9 Sheffield Dr. 	Richmond Hill	NY	11418
227	Danielle	Bond	\N	danielle.bond@msn.com	8589 Shub Farm Street 	Patchogue	NY	11772
228	Whitney	Estes	(631) 315-4020	whitney.estes@gmail.com	454 Bear Hill Street 	Brentwood	NY	11717
229	Molly	Langley	\N	molly.langley@aol.com	63 Bridgeton Street 	Holbrook	NY	11741
230	Chelsey	Hardin	\N	chelsey.hardin@hotmail.com	13 Brickyard Street 	Deer Park	NY	11729
231	Jenee	Rasmussen	(916) 219-1774	jenee.rasmussen@hotmail.com	19 George Lane 	Sacramento	CA	95820
232	Freddie	Mathis	\N	freddie.mathis@hotmail.com	31 Shady St. 	Euless	TX	76039
233	Mariana	Strong	\N	mariana.strong@msn.com	972 Dunbar Dr. 	Santa Clara	CA	95050
234	Winfred	Harris	\N	winfred.harris@msn.com	734 Glen Eagles St. 	East Meadow	NY	11554
235	Jeromy	Elliott	\N	jeromy.elliott@gmail.com	7112 Laurel Street 	Bay Shore	NY	11706
236	Verona	O'neill	\N	verona.o'neill@hotmail.com	8279 W. Sussex St. 	Selden	NY	11784
237	Elvera	Peck	\N	elvera.peck@yahoo.com	759 Lakewood Street 	Banning	CA	92220
238	Cindi	Larson	\N	cindi.larson@msn.com	896 Golden Star Rd. 	Howard Beach	NY	11414
239	Felice	Guzman	\N	felice.guzman@hotmail.com	7 Creekside Lane 	Canyon Country	CA	91387
240	Le	Deleon	\N	le.deleon@msn.com	58 Clark Court 	Banning	CA	92220
241	Manie	Sanchez	\N	manie.sanchez@hotmail.com	471 Illinois Ave. 	Queensbury	NY	12804
242	Rutha	Howell	\N	rutha.howell@gmail.com	9247 Jones Street 	Canyon Country	CA	91387
243	Natosha	Rowland	\N	natosha.rowland@aol.com	51 Elmwood St. 	Ballston Spa	NY	12020
244	Jessika	Bray	\N	jessika.bray@yahoo.com	37 East Greystone St. 	San Pablo	CA	94806
245	Delila	Hamilton	\N	delila.hamilton@yahoo.com	7451 East James Ave. 	Palos Verdes Peninsula	CA	90274
246	Dionne	Norris	\N	dionne.norris@yahoo.com	9993 Greenview Circle 	Niagara Falls	NY	14304
247	Muriel	Juarez	\N	muriel.juarez@gmail.com	8073 Cemetery Drive 	Palos Verdes Peninsula	CA	90274
248	Cecelia	Gill	\N	cecelia.gill@aol.com	372 Silver Spear Dr. 	Mcallen	TX	78501
249	Magda	Eaton	\N	magda.eaton@aol.com	860 Middle River Street 	Ossining	NY	10562
250	Ivonne	Yang	(915) 181-1950	ivonne.yang@gmail.com	7359 North Lake View St. 	El Paso	TX	79930
251	Kasie	Rodriquez	\N	kasie.rodriquez@aol.com	7 North Beech St. 	Ballston Spa	NY	12020
252	Eleni	Gordon	\N	eleni.gordon@hotmail.com	583 W. San Carlos Street 	Richmond Hill	NY	11418
253	Maurice	Norton	\N	maurice.norton@hotmail.com	32 Mayflower Dr. 	Atwater	CA	95301
254	Cristobal	Hutchinson	\N	cristobal.hutchinson@gmail.com	58 Washington Avenue 	Lawndale	CA	90260
255	Flossie	Holder	\N	flossie.holder@msn.com	8459 W. Newport Court 	Massapequa Park	NY	11762
256	Erma	Salinas	\N	erma.salinas@gmail.com	347 Sheffield St. 	Merrick	NY	11566
257	Earl	Stanley	\N	earl.stanley@gmail.com	569 Lake Lane 	Elmhurst	NY	11373
258	Maribel	William	\N	maribel.william@aol.com	65 Magnolia Ave. 	Torrance	CA	90505
259	Johnathan	Velazquez	\N	johnathan.velazquez@hotmail.com	9680 E. Somerset Street 	Pleasanton	CA	94566
260	Rodrick	Shelton	\N	rodrick.shelton@hotmail.com	7157 Addison Street 	Canyon Country	CA	91387
261	Ferne	Kline	\N	ferne.kline@hotmail.com	303 Shady St. 	Fullerton	CA	92831
262	Rubin	Decker	(716) 950-9835	rubin.decker@gmail.com	9875 Shady Ave. 	Buffalo	NY	14215
263	Dortha	Jarvis	(442) 919-8256	dortha.jarvis@yahoo.com	76 Prince Drive 	Oceanside	NY	11572
264	Mariela	Huffman	\N	mariela.huffman@gmail.com	531 Fieldstone Road 	Garden City	NY	11530
265	Mellisa	Farley	\N	mellisa.farley@yahoo.com	21 West Princess St. 	Central Islip	NY	11722
266	Myung	Hooper	\N	myung.hooper@gmail.com	951 Mill Road 	Elmont	NY	11003
267	Angelina	Lloyd	\N	angelina.lloyd@yahoo.com	9593 North Sherman Dr. 	Apple Valley	CA	92307
268	Trinity	Riddle	\N	trinity.riddle@aol.com	23 Oakland Lane 	Ballston Spa	NY	12020
269	Barton	Crosby	\N	barton.crosby@msn.com	896 Edgewater St. 	Bellmore	NY	11710
270	Claudio	Wise	\N	claudio.wise@hotmail.com	810 Oxford Ave. 	Kingston	NY	12401
271	Katheleen	Marks	\N	katheleen.marks@yahoo.com	69 North Tower St. 	Longview	TX	75604
272	Deja	Chaney	\N	deja.chaney@hotmail.com	52 Woodside Ave. 	Jamaica	NY	11432
273	Queenie	Vance	\N	queenie.vance@gmail.com	172 Arcadia Ave. 	Ozone Park	NY	11417
274	Josh	Shaw	\N	josh.shaw@gmail.com	212 North Leeton Ridge Street 	Hopewell Junction	NY	12533
275	Pinkie	Kirkland	\N	pinkie.kirkland@yahoo.com	18 Myers St. 	San Angelo	TX	76901
276	Lavette	Wright	\N	lavette.wright@msn.com	6 Windsor Street 	Ronkonkoma	NY	11779
277	Mark	Garrett	\N	mark.garrett@msn.com	285 Rosewood Dr. 	Monroe	NY	10950
278	Myesha	Burgess	\N	myesha.burgess@gmail.com	306 Trenton Rd. 	Campbell	CA	95008
279	Justina	Long	\N	justina.long@aol.com	39 Littleton Ave. 	South El Monte	CA	91733
280	Brenda	Tate	\N	brenda.tate@msn.com	36 Hilltop Street 	San Angelo	TX	76901
281	Rayna	Perry	\N	rayna.perry@hotmail.com	7238 Oakland St. 	Ozone Park	NY	11417
282	Randolph	Chase	\N	randolph.chase@yahoo.com	828 Bridle Ave. 	San Lorenzo	CA	94580
283	Jaimee	Day	\N	jaimee.day@aol.com	7534 Whitemarsh Ave. 	Poughkeepsie	NY	12601
284	Susann	Bass	\N	susann.bass@msn.com	21 Old Rock Maple Ave. 	Commack	NY	11725
285	Leola	Gould	\N	leola.gould@gmail.com	8 Kirkland St. 	Astoria	NY	11102
286	Virgil	Frost	\N	virgil.frost@gmail.com	9798 Beacon St. 	Levittown	NY	11756
287	Mireille	Puckett	(805) 961-9909	mireille.puckett@hotmail.com	378 Purple Finch Drive 	Oxnard	CA	93035
288	Keturah	Massey	\N	keturah.massey@msn.com	189 Arnold Drive 	Banning	CA	92220
289	Charmain	Webster	\N	charmain.webster@hotmail.com	36 East Stonybrook Rd. 	Richardson	TX	75080
290	Barry	Buckner	\N	barry.buckner@gmail.com	8779 High Noon Rd. 	Centereach	NY	11720
291	Boyce	Burks	\N	boyce.burks@gmail.com	879 Harvey Dr. 	Sunnyside	NY	11104
292	Monty	Frost	(516) 460-5396	monty.frost@aol.com	76 Foxrun Dr. 	Hempstead	NY	11550
293	Tiny	French	\N	tiny.french@hotmail.com	7163 Hall St. 	Plainview	NY	11803
294	Clementina	Sargent	\N	clementina.sargent@hotmail.com	9853 Catherine Road 	Rome	NY	13440
295	Danny	Kim	\N	danny.kim@msn.com	74 Essex Drive 	South Ozone Park	NY	11420
296	Sophia	Mcmillan	\N	sophia.mcmillan@msn.com	8541 S. Pleasant Street 	Uniondale	NY	11553
297	Christia	Carson	\N	christia.carson@gmail.com	220 Orchard Street 	Helotes	TX	78023
298	Jennie	Middleton	\N	jennie.middleton@gmail.com	95 High Noon Dr. 	Upland	CA	91784
299	Jame	Riggs	\N	jame.riggs@hotmail.com	9237 Hudson Drive 	Bay Shore	NY	11706
300	Rayford	Simon	\N	rayford.simon@msn.com	998 Whitemarsh Road 	Mountain View	CA	94043
301	Annett	Garrett	\N	annett.garrett@yahoo.com	19 Euclid Lane 	Scarsdale	NY	10583
302	Hayden	Cross	\N	hayden.cross@gmail.com	90 Pumpkin Hill St. 	Apple Valley	CA	92307
303	Rolanda	Larsen	\N	rolanda.larsen@yahoo.com	5 West University Court 	Woodhaven	NY	11421
304	Jayme	Zamora	\N	jayme.zamora@gmail.com	2 Ridge Lane 	Springfield Gardens	NY	11413
305	Hope	Cotton	\N	hope.cotton@aol.com	9092 Blue Spring Dr. 	Redondo Beach	CA	90278
306	Vikki	Erickson	\N	vikki.erickson@yahoo.com	24 Jones Street 	Kingston	NY	12401
307	Fransisca	Nicholson	\N	fransisca.nicholson@aol.com	945 Schoolhouse Street 	Glendora	CA	91740
308	Mazie	Fernandez	\N	mazie.fernandez@hotmail.com	583 Harvard Ave. 	Webster	NY	14580
309	Anderson	Martin	\N	anderson.martin@hotmail.com	9051 Hillside Dr. 	Canandaigua	NY	14424
310	Gilberto	Parsons	\N	gilberto.parsons@gmail.com	8115 North Edgewater Drive 	Middle Village	NY	11379
311	Charise	Burt	(559) 888-2229	charise.burt@aol.com	582 Creek St. 	Fresno	CA	93706
312	Cameron	Carroll	\N	cameron.carroll@yahoo.com	9133 South Halifax Ave. 	Longview	TX	75604
313	Melani	Jarvis	\N	melani.jarvis@hotmail.com	8 Tunnel St. 	Maspeth	NY	11378
314	Javier	Nichols	\N	javier.nichols@msn.com	8944 Marconi St. 	Rowlett	TX	75088
315	Justina	Jenkins	\N	justina.jenkins@yahoo.com	8236 Creek St. 	Baldwin	NY	11510
316	Hortencia	Graham	\N	hortencia.graham@aol.com	7764 Greenrose Street 	Euless	TX	76039
317	Christia	Wilkins	\N	christia.wilkins@msn.com	7062 Willow Court 	Woodside	NY	11377
318	Eliz	Whitney	\N	eliz.whitney@msn.com	523 Crescent Court 	Fullerton	CA	92831
319	Justin	Newton	\N	justin.newton@hotmail.com	93 Shore Rd. 	Apple Valley	CA	92307
320	Aron	Wiggins	(442) 497-3353	aron.wiggins@aol.com	6 Bradford St. 	Oceanside	NY	11572
321	Chere	Hardin	\N	chere.hardin@yahoo.com	763 Fulton Road 	Brooklyn	NY	11201
322	Merideth	Preston	\N	merideth.preston@yahoo.com	794 Rockaway St. 	Poughkeepsie	NY	12601
323	Jeniffer	Slater	\N	jeniffer.slater@aol.com	30 Old Orange Lane 	Schenectady	NY	12302
324	Laureen	Paul	\N	laureen.paul@yahoo.com	617 Squaw Creek Rd. 	Bellmore	NY	11710
325	Berna	Moore	\N	berna.moore@hotmail.com	7230 Lafayette Drive 	Bronx	NY	10451
326	Shiela	Calderon	\N	shiela.calderon@msn.com	844 Albany St. 	Rocklin	CA	95677
327	Sharie	Alvarez	(212) 211-7621	sharie.alvarez@msn.com	987 West Leatherwood Dr. 	New York	NY	10002
328	Bettie	Glover	\N	bettie.glover@gmail.com	9083 Addison Dr. 	Euless	TX	76039
329	Marilyn	Frank	\N	marilyn.frank@aol.com	8878 Branch Street 	Port Chester	NY	10573
330	Sheba	Knapp	\N	sheba.knapp@aol.com	86 Gates Street 	Woodside	NY	11377
331	Aleta	Mack	\N	aleta.mack@yahoo.com	8869 W. Edgemont Lane 	Bay Shore	NY	11706
332	Reena	Higgins	\N	reena.higgins@gmail.com	900 South Columbia Street 	Canyon Country	CA	91387
333	Ami	Mcmahon	\N	ami.mcmahon@aol.com	566 Hilldale Drive 	Sunnyside	NY	11104
334	Somer	Jordan	\N	somer.jordan@msn.com	7046 Helen Avenue 	Huntington Station	NY	11746
335	Scarlet	Reed	\N	scarlet.reed@hotmail.com	151 S. Myers Court 	Bronx	NY	10451
336	Trisha	Johnson	(717) 126-8787	trisha.johnson@msn.com	59 Wild Horse St. 	Lancaster	NY	14086
337	Majorie	Wyatt	\N	majorie.wyatt@yahoo.com	8507 Miller St. 	South Ozone Park	NY	11420
338	Abbey	Pugh	\N	abbey.pugh@gmail.com	26 Market Drive 	Forest Hills	NY	11375
339	Tamela	Harrell	\N	tamela.harrell@aol.com	7316 Cypress Rd. 	Central Islip	NY	11722
340	Yanira	Bradshaw	\N	yanira.bradshaw@gmail.com	7484 Ann Court 	Smithtown	NY	11787
341	Delana	Scott	\N	delana.scott@yahoo.com	7372 Ridgeview St. 	Mount Vernon	NY	10550
342	Cassondra	Pruitt	\N	cassondra.pruitt@aol.com	4 Alderwood Circle 	Merrick	NY	11566
343	Jesica	Fields	\N	jesica.fields@yahoo.com	318 Country Dr. 	Commack	NY	11725
344	Herta	Rollins	\N	herta.rollins@msn.com	287 1st Drive 	Mountain View	CA	94043
345	Mi	Gray	(229) 813-2130	mi.gray@aol.com	27 Roehampton Dr. 	Albany	NY	12203
346	Jacalyn	Barnett	\N	jacalyn.barnett@gmail.com	7537 Swanson Street 	Maspeth	NY	11378
347	Kanesha	Hudson	(510) 788-7298	kanesha.hudson@gmail.com	8293 Gartner Drive 	Oakland	CA	94603
348	Darren	Witt	\N	darren.witt@aol.com	916 Hillcrest Ave. 	Coachella	CA	92236
349	Mable	Pratt	\N	mable.pratt@gmail.com	254 SW. Temple Street 	Coachella	CA	92236
350	Christoper	Mccall	\N	christoper.mccall@msn.com	72 Summit St. 	Bay Shore	NY	11706
351	Margorie	Wynn	\N	margorie.wynn@gmail.com	707 Schoolhouse St. 	Monsey	NY	10952
352	Josef	Greer	\N	josef.greer@gmail.com	92 Summer Court 	Jamaica	NY	11432
353	Tisa	Whitney	\N	tisa.whitney@yahoo.com	549 Newbridge Dr. 	Monsey	NY	10952
354	Tonda	Armstrong	\N	tonda.armstrong@aol.com	19 Forest Rd. 	Sunnyside	NY	11104
355	Arvilla	Weiss	\N	arvilla.weiss@msn.com	477 Blue Spring St. 	Bay Shore	NY	11706
356	Vashti	Rosario	\N	vashti.rosario@yahoo.com	623 Johnson Circle 	Bronx	NY	10451
357	Sheri	Cole	(408) 658-2285	sheri.cole@aol.com	479 Chapel Court 	San Jose	CA	95127
358	Kandace	Giles	\N	kandace.giles@msn.com	30 NE. Walt Whitman Drive 	Wantagh	NY	11793
359	Angie	Powers	\N	angie.powers@aol.com	6 Rockland Dr. 	Pomona	CA	91768
360	Van	Peters	(281) 658-7772	van.peters@yahoo.com	45 Fifth Dr. 	Houston	TX	77016
361	Virgina	Berg	\N	virgina.berg@yahoo.com	804 South Purple Finch Drive 	Valley Stream	NY	11580
362	Olevia	Noel	\N	olevia.noel@yahoo.com	39 N. Rosewood Dr. 	Kingston	NY	12401
363	Kaci	Gallegos	\N	kaci.gallegos@gmail.com	8573 Halifax St. 	Ballston Spa	NY	12020
364	Bev	Chang	\N	bev.chang@yahoo.com	104 Rockville St. 	Ithaca	NY	14850
365	Rodger	Rojas	\N	rodger.rojas@yahoo.com	8442 Cooper Ave. 	Bayside	NY	11361
366	Lavonne	Anderson	\N	lavonne.anderson@aol.com	9420 Wintergreen Court 	Floral Park	NY	11001
367	Blanca	Hooper	\N	blanca.hooper@msn.com	340 Bald Hill St. 	Ozone Park	NY	11417
368	Alysha	Powers	\N	alysha.powers@msn.com	39 West Marshall Ave. 	Forest Hills	NY	11375
369	Mary	Singleton	\N	mary.singleton@hotmail.com	474 Amerige Ave. 	Woodside	NY	11377
370	Jina	Cooper	\N	jina.cooper@aol.com	8947 W. Lexington Rd. 	Howard Beach	NY	11414
371	Loni	Duncan	\N	loni.duncan@gmail.com	80 Saxton Lane 	Rosedale	NY	11422
372	Collene	Roman	\N	collene.roman@aol.com	30 North Argyle Dr. 	Wappingers Falls	NY	12590
373	Mariette	Trevino	\N	mariette.trevino@aol.com	4 Border Court 	Utica	NY	13501
374	Candelaria	Coffey	\N	candelaria.coffey@aol.com	45 Newport Lane 	Merrick	NY	11566
375	Yan	Trevino	\N	yan.trevino@gmail.com	796 Jefferson Rd. 	Uniondale	NY	11553
376	Elanor	Patrick	\N	elanor.patrick@aol.com	51 Howard Ave. 	Victoria	TX	77904
377	Klara	Mosley	\N	klara.mosley@gmail.com	518 Devon Court 	Port Chester	NY	10573
378	Rosalba	O'neal	\N	rosalba.o'neal@yahoo.com	7517 Pennsylvania St. 	Mount Vernon	NY	10550
379	Mina	Carrillo	\N	mina.carrillo@aol.com	8659 Trenton Lane 	Uniondale	NY	11553
380	Alesia	Horne	\N	alesia.horne@aol.com	9229 Amherst Lane 	Selden	NY	11784
381	Kristen	Alvarez	\N	kristen.alvarez@aol.com	9778 North River St. 	Bronx	NY	10451
382	Collin	Webster	\N	collin.webster@aol.com	475 Cottage Rd. 	Howard Beach	NY	11414
383	Ashlee	Pena	\N	ashlee.pena@aol.com	966 Highland St. 	Whitestone	NY	11357
384	Aimee	Merritt	\N	aimee.merritt@yahoo.com	537 East Meadowbrook St. 	Flushing	NY	11354
385	Rochelle	Ward	\N	rochelle.ward@yahoo.com	7855 La Sierra Street 	Glendora	CA	91740
386	Nelle	Beck	\N	nelle.beck@aol.com	8998 Wakehurst Drive 	Upland	CA	91784
387	Kaila	Walters	\N	kaila.walters@msn.com	57 Gates Drive 	Elmhurst	NY	11373
388	Aleta	Stone	\N	aleta.stone@aol.com	8 Elm Dr. 	Whitestone	NY	11357
389	Leif	Short	\N	leif.short@gmail.com	962 Carpenter Ave. 	San Angelo	TX	76901
390	Lorrie	Pollard	\N	lorrie.pollard@yahoo.com	7834 Shore Ave. 	Ronkonkoma	NY	11779
391	Vernita	Ball	\N	vernita.ball@gmail.com	126 Arnold Dr. 	Los Banos	CA	93635
392	Cyndi	Bush	\N	cyndi.bush@gmail.com	18 Smoky Hollow Drive 	Elmhurst	NY	11373
393	Gertrude	Terry	\N	gertrude.terry@hotmail.com	34 Airport Dr. 	Upland	CA	91784
394	Virgen	Clemons	\N	virgen.clemons@gmail.com	354 Cactus Drive 	South El Monte	CA	91733
395	Fairy	Robinson	\N	fairy.robinson@msn.com	8837 Joy Ridge St. 	Liverpool	NY	13090
396	Laverna	Hernandez	\N	laverna.hernandez@hotmail.com	34 South Longfellow St. 	Niagara Falls	NY	14304
397	Jeannie	Wilcox	\N	jeannie.wilcox@yahoo.com	7744 Miles Dr. 	Franklin Square	NY	11010
398	Suellen	Mercado	\N	suellen.mercado@yahoo.com	3 Taylor Drive 	Sunnyside	NY	11104
399	Bart	Hess	\N	bart.hess@aol.com	799 N. Maiden Street 	Kingston	NY	12401
400	Alfredo	Dodson	\N	alfredo.dodson@hotmail.com	8960 Glenholme Dr. 	Depew	NY	14043
401	Shaunda	Barnett	\N	shaunda.barnett@gmail.com	9366 San Carlos Lane 	Longview	TX	75604
402	Kerrie	Morton	\N	kerrie.morton@hotmail.com	8772 State St. 	Pittsford	NY	14534
403	Elouise	Fry	\N	elouise.fry@aol.com	49 Bohemia Street 	Canyon Country	CA	91387
404	Augustus	Steele	\N	augustus.steele@aol.com	7474 N. Orchard St. 	Ballston Spa	NY	12020
405	Greta	Page	\N	greta.page@hotmail.com	8316 Augusta Drive 	Commack	NY	11725
406	Kerrie	O'neill	\N	kerrie.o'neill@gmail.com	69 Wellington Ave. 	Shirley	NY	11967
407	Dannette	Guerrero	\N	dannette.guerrero@gmail.com	68 Carriage Street 	San Pablo	CA	94806
408	Edra	Fitzgerald	\N	edra.fitzgerald@msn.com	8892 Birchwood St. 	Central Islip	NY	11722
409	Jerome	Bolton	\N	jerome.bolton@msn.com	9921 Argyle Street 	Carmel	NY	10512
410	Conception	Slater	\N	conception.slater@gmail.com	5 Sunset Street 	Bellmore	NY	11710
411	Octavia	Case	(212) 171-1335	octavia.case@aol.com	40 Charles Road 	New York	NY	10002
412	Dexter	Roberts	\N	dexter.roberts@gmail.com	84 Thatcher Court 	Sunnyside	NY	11104
413	Ginette	Edwards	\N	ginette.edwards@hotmail.com	9262 NW. Center Ave. 	Baldwin	NY	11510
414	Romaine	Haley	\N	romaine.haley@aol.com	737 Edgefield Drive 	Ithaca	NY	14850
415	Gwendolyn	Miller	\N	gwendolyn.miller@msn.com	90 Fordham Ave. 	Harlingen	TX	78552
416	Luke	Fuller	(516) 363-2253	luke.fuller@hotmail.com	576 Cleveland Lane 	Hempstead	NY	11550
417	Zoraida	Patton	\N	zoraida.patton@aol.com	95 Grand Dr. 	Huntington Station	NY	11746
418	Georgeanna	Webster	(805) 885-8830	georgeanna.webster@msn.com	40 Creekside Circle 	Oxnard	CA	93035
419	Krystin	Marshall	\N	krystin.marshall@hotmail.com	10 Old Proctor Lane 	Poughkeepsie	NY	12601
420	Vince	Schneider	\N	vince.schneider@hotmail.com	473 Corona Ave. 	Merrick	NY	11566
421	Iola	Rasmussen	\N	iola.rasmussen@yahoo.com	283 N. Manor Station Dr. 	Monroe	NY	10950
422	Valery	Saunders	\N	valery.saunders@msn.com	42 Marlborough St. 	Victoria	TX	77904
423	Johna	Powers	\N	johna.powers@hotmail.com	379 Central Ave. 	Deer Park	NY	11729
424	Charleen	Hurst	\N	charleen.hurst@yahoo.com	87 Country Avenue 	Utica	NY	13501
425	Augustina	Joyner	\N	augustina.joyner@aol.com	7931 Honey Creek Court 	Mount Vernon	NY	10550
426	Daisy	Ward	\N	daisy.ward@msn.com	45 Silver Spear Ave. 	Pomona	CA	91768
427	Latonya	Dixon	\N	latonya.dixon@hotmail.com	9399 Evergreen Street 	Garland	TX	75043
428	Hipolito	Padilla	\N	hipolito.padilla@hotmail.com	311 E. Rose Avenue 	New Rochelle	NY	10801
429	Emmett	Casey	\N	emmett.casey@yahoo.com	893 Logan St. 	Valley Stream	NY	11580
430	Kandi	Mcneil	\N	kandi.mcneil@msn.com	402 Border Street 	Massapequa Park	NY	11762
431	Luciano	Marsh	\N	luciano.marsh@aol.com	7685 South Willow Drive 	Bellmore	NY	11710
432	Julius	Holt	\N	julius.holt@aol.com	386 Lower River Street 	East Meadow	NY	11554
433	Holly	Nieves	\N	holly.nieves@aol.com	60 Cleveland St. 	Longview	TX	75604
434	Douglass	Little	\N	douglass.little@hotmail.com	294 Harvey Drive 	Duarte	CA	91010
435	Izola	Hobbs	\N	izola.hobbs@gmail.com	685 Beacon Dr. 	Woodhaven	NY	11421
436	Honey	Camacho	\N	honey.camacho@gmail.com	934 2nd St. 	Bayside	NY	11361
437	Laureen	Barry	\N	laureen.barry@yahoo.com	909 Ridge St. 	Orchard Park	NY	14127
438	Katharine	Herrera	\N	katharine.herrera@hotmail.com	395 SE. Branch St. 	Queensbury	NY	12804
439	Sunshine	Rosario	\N	sunshine.rosario@aol.com	1 Chestnut Lane 	Jamaica	NY	11432
440	Yevette	Todd	\N	yevette.todd@aol.com	119 Lakewood Rd. 	Ballston Spa	NY	12020
441	Dorthea	Walker	\N	dorthea.walker@aol.com	11 Third St. 	Port Washington	NY	11050
442	Alane	Munoz	(914) 706-7576	alane.munoz@gmail.com	8 Strawberry Dr. 	Yonkers	NY	10701
443	Ayana	Keith	(805) 230-2101	ayana.keith@hotmail.com	182 Thorne Road 	Oxnard	CA	93035
444	Caridad	Compton	\N	caridad.compton@aol.com	9575 SW. Kingston Court 	San Lorenzo	CA	94580
445	Earline	Ballard	\N	earline.ballard@hotmail.com	939 Lyme Road 	Mount Vernon	NY	10550
446	Nathanael	Bradley	\N	nathanael.bradley@aol.com	58 Third St. 	Amsterdam	NY	12010
447	Chasidy	Tran	\N	chasidy.tran@msn.com	9286 Anderson Street 	Vista	CA	92083
448	Janella	Bright	(507) 616-2958	janella.bright@aol.com	7317 Tower Dr. 	Rochester	NY	14606
449	Josie	Schultz	\N	josie.schultz@hotmail.com	225 Mammoth Street 	Canyon Country	CA	91387
450	Ellsworth	Michael	\N	ellsworth.michael@yahoo.com	9982 White St. 	Carmel	NY	10512
451	Jennette	Wooten	\N	jennette.wooten@msn.com	8221 Bow Ridge Lane 	Rowlett	TX	75088
452	Cassandra	Nichols	\N	cassandra.nichols@yahoo.com	4 Glenwood Circle 	Hicksville	NY	11801
453	Courtney	Wyatt	\N	courtney.wyatt@gmail.com	369 Arrowhead St. 	Garden City	NY	11530
454	Terese	Palmer	\N	terese.palmer@hotmail.com	8 Sugar Drive 	Bay Shore	NY	11706
455	Sherita	Cherry	\N	sherita.cherry@gmail.com	9636 Old Cedarwood Street 	Liverpool	NY	13090
456	Serina	Hensley	\N	serina.hensley@yahoo.com	53 Proctor Drive 	Jamaica	NY	11432
457	Jeni	Farley	\N	jeni.farley@aol.com	4 Mill Lane 	Richmond Hill	NY	11418
458	Everett	Vega	\N	everett.vega@yahoo.com	7859 James Ave. 	Holbrook	NY	11741
459	Latosha	Dalton	(661) 529-4501	latosha.dalton@yahoo.com	59 E. Wintergreen Ave. 	Bakersfield	CA	93306
460	Romelia	Myers	\N	romelia.myers@msn.com	8630 Brook St. 	Garden City	NY	11530
461	Effie	Jenkins	(631) 477-1277	effie.jenkins@msn.com	75 South Glen Eagles Court 	Brentwood	NY	11717
462	Efren	Oliver	\N	efren.oliver@gmail.com	9343 1st Rd. 	Nanuet	NY	10954
463	Jerlene	Rios	\N	jerlene.rios@yahoo.com	32 Griffin St. 	Plainview	NY	11803
464	Bess	Mcbride	\N	bess.mcbride@yahoo.com	9832 Winchester St. 	Garden City	NY	11530
465	Birdie	Kramer	(248) 725-2174	birdie.kramer@hotmail.com	311 Newcastle Dr. 	Troy	NY	12180
466	Collen	Hayes	\N	collen.hayes@yahoo.com	117 Eagle St. 	Smithtown	NY	11787
467	Clare	Neal	\N	clare.neal@msn.com	8922 Shady Ave. 	Mahopac	NY	10541
468	Jeanett	Herman	\N	jeanett.herman@hotmail.com	839 East Arch Street 	Lindenhurst	NY	11757
469	Micki	Rutledge	\N	micki.rutledge@aol.com	9868 Marvon Street 	Richmond Hill	NY	11418
470	Loise	Walker	\N	loise.walker@aol.com	201 Glen Eagles St. 	Shirley	NY	11967
471	Burma	Summers	\N	burma.summers@yahoo.com	890 East Elmwood Street 	Freeport	NY	11520
472	Myron	Ruiz	\N	myron.ruiz@gmail.com	45 Shadow Brook Lane 	Amityville	NY	11701
473	Lashawna	Richardson	\N	lashawna.richardson@hotmail.com	9920 Purple Finch St. 	Baldwin	NY	11510
474	Lavern	Orr	\N	lavern.orr@hotmail.com	913 N. Young Street 	Webster	NY	14580
475	Alec	Peck	\N	alec.peck@hotmail.com	4 W. Belmont St. 	Victoria	TX	77904
476	Christopher	Richardson	\N	christopher.richardson@gmail.com	7846 Windfall Dr. 	Santa Cruz	CA	95060
477	Arminda	Weber	\N	arminda.weber@yahoo.com	6 Hill Field St. 	Bellmore	NY	11710
478	Emmett	Hahn	\N	emmett.hahn@hotmail.com	7727 6th St. 	Freeport	NY	11520
479	Gertha	Mejia	\N	gertha.mejia@yahoo.com	518 Orchard St. 	Flushing	NY	11354
480	Garland	Weaver	\N	garland.weaver@gmail.com	7161 Goldfield Court 	Amsterdam	NY	12010
481	Jayson	Rutledge	\N	jayson.rutledge@yahoo.com	8672 Coffee St. 	Lake Jackson	TX	77566
482	Narcisa	Knapp	\N	narcisa.knapp@aol.com	435 Dogwood Dr. 	Amarillo	TX	79106
483	Gayla	Sims	\N	gayla.sims@gmail.com	98 Hall Street 	Lindenhurst	NY	11757
484	Chelsey	Boyd	\N	chelsey.boyd@yahoo.com	9569 Birchpond Ave. 	Euless	TX	76039
485	Catherine	Miles	\N	catherine.miles@msn.com	7189 Elm Dr. 	East Elmhurst	NY	11369
486	Valeri	Marshall	\N	valeri.marshall@hotmail.com	494 East Brewery Dr. 	East Meadow	NY	11554
487	Grace	Madden	\N	grace.madden@gmail.com	606 East Rocky River St. 	San Pablo	CA	94806
488	Joaquin	Hawkins	(657) 557-1746	joaquin.hawkins@aol.com	3 Oklahoma Lane 	Anaheim	CA	92806
489	Kirstie	Vazquez	\N	kirstie.vazquez@gmail.com	8006 Rockland Ave. 	Saratoga Springs	NY	12866
490	Yu	Mcdonald	\N	yu.mcdonald@aol.com	784 Pheasant Rd. 	Ossining	NY	10562
491	Celestine	Jacobs	\N	celestine.jacobs@gmail.com	87 Hanover Rd. 	Massapequa	NY	11758
492	Justa	Thompson	\N	justa.thompson@aol.com	43 Manor Ave. 	Corona	NY	11368
493	Lise	Alvarado	\N	lise.alvarado@gmail.com	9816 Newcastle Dr. 	Hamburg	NY	14075
494	Pearl	Fox	\N	pearl.fox@yahoo.com	9415 Honey Creek Dr. 	Uniondale	NY	11553
495	Travis	Goodman	\N	travis.goodman@yahoo.com	65 Rockcrest Dr. 	Los Banos	CA	93635
496	Shu	Mays	\N	shu.mays@gmail.com	996 St Margarets Lane 	Astoria	NY	11102
497	Ezra	Fowler	\N	ezra.fowler@hotmail.com	16 Pearl St. 	Nanuet	NY	10954
498	Edda	Young	\N	edda.young@gmail.com	50 S. Airport Street 	North Tonawanda	NY	14120
499	Lidia	Ashley	\N	lidia.ashley@hotmail.com	8436 Meadow St. 	Baldwinsville	NY	13027
500	Moira	Lester	\N	moira.lester@msn.com	496 Greystone Court 	Jackson Heights	NY	11372
501	Tony	Hicks	(657) 260-6783	tony.hicks@gmail.com	226 Carriage Street 	Anaheim	CA	92806
502	Malinda	Baxter	\N	malinda.baxter@yahoo.com	7698 Briarwood Ave. 	Whitestone	NY	11357
503	Marlo	Jefferson	\N	marlo.jefferson@gmail.com	39 Trenton Rd. 	Niagara Falls	NY	14304
504	Tiana	Henderson	\N	tiana.henderson@aol.com	62 Orange St. 	Franklin Square	NY	11010
505	Wilda	Petersen	\N	wilda.petersen@aol.com	899 Helen St. 	Jamaica	NY	11432
506	Irving	Pitts	\N	irving.pitts@msn.com	346 College Court 	Torrance	CA	90505
507	Sheree	Pena	\N	sheree.pena@yahoo.com	822 Virginia Court 	Staten Island	NY	10301
508	Vance	Taylor	(717) 218-5607	vance.taylor@msn.com	8279 Military Dr. 	Lancaster	NY	14086
509	Terra	Pickett	\N	terra.pickett@aol.com	7822 Depot Avenue 	Amsterdam	NY	12010
510	Faustino	Delacruz	\N	faustino.delacruz@msn.com	88 West Greenview Street 	South Richmond Hill	NY	11419
511	Julienne	Moody	(682) 841-4643	julienne.moody@hotmail.com	35 South Oxford Rd. 	Fort Worth	TX	76110
512	Hee	Greer	\N	hee.greer@hotmail.com	41 North Garfield Ave. 	Selden	NY	11784
513	Whitney	Cash	\N	whitney.cash@gmail.com	8 Surrey Street 	Hamburg	NY	14075
514	Clarita	Curry	\N	clarita.curry@hotmail.com	661 Tanglewood Street 	Hollis	NY	11423
515	Reita	Dickson	\N	reita.dickson@hotmail.com	7506 Mechanic Dr. 	Scarsdale	NY	10583
516	Rosa	Kinney	\N	rosa.kinney@yahoo.com	330 Highland Drive 	Brooklyn	NY	11201
517	Buford	Gilbert	\N	buford.gilbert@yahoo.com	9 East Ketch Harbour Street 	Bellmore	NY	11710
518	Homer	Powers	\N	homer.powers@msn.com	8207 East El Dorado Ave. 	Palos Verdes Peninsula	CA	90274
519	Rudolf	Gilliam	\N	rudolf.gilliam@aol.com	17 Marlborough Circle 	Palos Verdes Peninsula	CA	90274
520	Andreas	Herman	\N	andreas.herman@msn.com	456 Rock Creek Street 	Mount Vernon	NY	10550
521	Max	Charles	\N	max.charles@gmail.com	695 St Paul Street 	Glen Cove	NY	11542
522	Tammera	Fischer	(510) 534-8845	tammera.fischer@hotmail.com	405 Olive St. 	Oakland	CA	94603
523	Joshua	Robertson	\N	joshua.robertson@gmail.com	81 Campfire Court 	Patchogue	NY	11772
524	Larraine	Horn	\N	larraine.horn@msn.com	368 South Summerhouse Dr. 	Utica	NY	13501
525	Andreas	Mayer	\N	andreas.mayer@hotmail.com	8577 Galvin Circle 	New Rochelle	NY	10801
526	Lazaro	Moran	\N	lazaro.moran@gmail.com	83 E. Buttonwood Street 	Sugar Land	TX	77478
527	Afton	Juarez	\N	afton.juarez@gmail.com	8330 Riverview Drive 	Coram	NY	11727
528	Angele	Schroeder	(845) 804-6312	angele.schroeder@yahoo.com	33 S. Shadow Brook Street 	New City	NY	10956
529	Ellena	Clements	\N	ellena.clements@aol.com	7918 Mulberry Street 	Santa Monica	CA	90403
530	Selene	Austin	\N	selene.austin@msn.com	9042 Linda Circle 	Duarte	CA	91010
531	Kimberely	Bowen	(248) 199-2582	kimberely.bowen@hotmail.com	88 Belmont Street 	Troy	NY	12180
532	Mia	Delgado	\N	mia.delgado@yahoo.com	850 Wakehurst Drive 	Coachella	CA	92236
533	Garret	Clay	(361) 687-9477	garret.clay@yahoo.com	9516 College Drive 	Corpus Christi	TX	78418
534	Alejandro	Haney	\N	alejandro.haney@msn.com	3 Griffin Street 	Wantagh	NY	11793
535	Inge	Olsen	(562) 719-5041	inge.olsen@msn.com	295 Iroquois Rd. 	Long Beach	NY	11561
536	Christiane	Bradford	\N	christiane.bradford@gmail.com	9043 Woodland Ave. 	Orchard Park	NY	14127
537	Carter	Bentley	\N	carter.bentley@yahoo.com	145 North Bridle Ave. 	Carmel	NY	10512
538	Sherie	Ayala	\N	sherie.ayala@msn.com	5 Beech Ave. 	South El Monte	CA	91733
539	Jamika	Acevedo	\N	jamika.acevedo@yahoo.com	8027 NW. Poplar St. 	Ozone Park	NY	11417
540	Shery	Randolph	\N	shery.randolph@hotmail.com	602 Laurel Street 	Ontario	CA	91762
541	Lanita	Burton	\N	lanita.burton@msn.com	8980 Aspen Avenue 	Coachella	CA	92236
542	Timothy	Byers	\N	timothy.byers@msn.com	8645 Devonshire Lane 	Ronkonkoma	NY	11779
543	Jasmin	Young	\N	jasmin.young@gmail.com	337 Beach Street 	Helotes	TX	78023
544	Catarina	Mendez	\N	catarina.mendez@hotmail.com	444 Hanover Court 	West Islip	NY	11795
545	Tajuana	Rollins	\N	tajuana.rollins@msn.com	724 N. Glen Creek Street 	Oswego	NY	13126
546	Thad	Castro	(631) 943-1407	thad.castro@msn.com	71 Surrey Ave. 	Brentwood	NY	11717
547	Tena	Huber	\N	tena.huber@gmail.com	185 East Littleton St. 	Newburgh	NY	12550
548	Dori	Alvarez	\N	dori.alvarez@msn.com	8208 Brandywine St. 	Kingston	NY	12401
549	Elmo	Arnold	(562) 841-9339	elmo.arnold@aol.com	7616 Lyme Rd. 	Long Beach	NY	11561
550	Felicidad	Golden	\N	felicidad.golden@yahoo.com	9712 Coffee Ave. 	Lockport	NY	14094
551	Jenine	Crane	(682) 183-6555	jenine.crane@msn.com	7381 Alderwood Drive 	Fort Worth	TX	76110
552	Lea	Key	\N	lea.key@yahoo.com	7 Ocean St. 	Banning	CA	92220
553	Rory	Cooper	\N	rory.cooper@gmail.com	459 West Street 	Rocklin	CA	95677
554	Hilde	Nieves	\N	hilde.nieves@gmail.com	9437 Fordham Lane 	Campbell	CA	95008
555	Marry	Benjamin	\N	marry.benjamin@yahoo.com	33 Amerige Street 	Forney	TX	75126
556	Vernell	Goff	\N	vernell.goff@msn.com	77 Cobblestone St. 	Monroe	NY	10950
557	Erlene	Cook	\N	erlene.cook@gmail.com	89 Blue Spring Street 	Mount Vernon	NY	10550
558	Carroll	Kelly	\N	carroll.kelly@yahoo.com	346 Grant Circle 	Monroe	NY	10950
559	Basilia	Thornton	(631) 592-9548	basilia.thornton@hotmail.com	9033 Pine Dr. 	Brentwood	NY	11717
560	Tricia	Daniels	\N	tricia.daniels@gmail.com	8628 Crescent Court 	Forney	TX	75126
561	Kandace	Hughes	\N	kandace.hughes@hotmail.com	482 Ryan Ave. 	San Lorenzo	CA	94580
562	Alejandro	Norman	\N	alejandro.norman@yahoo.com	8918 Marsh Lane 	Upland	CA	91784
563	Rodney	Odom	\N	rodney.odom@yahoo.com	7782 North Deerfield Lane 	Richmond Hill	NY	11418
564	Bettie	Pierce	\N	bettie.pierce@gmail.com	787 North Vernon Lane 	Farmingdale	NY	11735
565	Dagny	Owen	\N	dagny.owen@hotmail.com	8028 Thompson Drive 	San Angelo	TX	76901
566	Cinthia	Poole	\N	cinthia.poole@aol.com	7 Central Ave. 	Lake Jackson	TX	77566
567	Sheila	Travis	\N	sheila.travis@yahoo.com	9285 Front St. 	Longview	TX	75604
568	Arcelia	Vinson	\N	arcelia.vinson@gmail.com	40 Dogwood St. 	West Islip	NY	11795
569	Lucas	Estes	\N	lucas.estes@yahoo.com	99 Old Church St. 	Santa Monica	CA	90403
570	Marissa	Summers	\N	marissa.summers@msn.com	81 Carpenter St. 	Saint Albans	NY	11412
571	Kaley	Blanchard	\N	kaley.blanchard@msn.com	74 Evergreen Court 	Palos Verdes Peninsula	CA	90274
572	Wm	Pope	\N	wm.pope@msn.com	212 Marsh Court 	Auburn	NY	13021
573	Rubye	Mccall	(248) 764-3359	rubye.mccall@hotmail.com	71 Sherwood Dr. 	Troy	NY	12180
574	Adriene	Rivera	\N	adriene.rivera@hotmail.com	973 Yukon Avenue 	Encino	CA	91316
575	Laurence	Christian	\N	laurence.christian@gmail.com	2 Maple St. 	Jamaica	NY	11432
576	Shirely	Stanley	(915) 437-6113	shirely.stanley@gmail.com	73 White Avenue 	El Paso	TX	79930
577	Danille	Mcfarland	\N	danille.mcfarland@msn.com	14 Tailwater St. 	Rocklin	CA	95677
578	Salena	Day	\N	salena.day@msn.com	8067 Park Court 	San Lorenzo	CA	94580
579	Matilda	Larson	\N	matilda.larson@hotmail.com	336 Saxon Court 	Harlingen	TX	78552
580	Mellisa	Kim	(424) 151-6481	mellisa.kim@aol.com	17 Lyme Dr. 	Los Angeles	CA	90008
581	Vonda	Berger	\N	vonda.berger@yahoo.com	615 S. Proctor Ave. 	Santa Clara	CA	95050
582	Soledad	Moses	\N	soledad.moses@yahoo.com	85 Hickory Ave. 	Jackson Heights	NY	11372
583	Lashandra	Turner	(562) 327-9469	lashandra.turner@hotmail.com	11 Marlborough Rd. 	Long Beach	NY	11561
584	Lynne	Anderson	(915) 789-6666	lynne.anderson@msn.com	325 Inverness St. 	El Paso	TX	79930
585	Chasidy	Webster	\N	chasidy.webster@msn.com	8296 S. Lookout Lane 	Rocklin	CA	95677
586	Ulysses	Gaines	\N	ulysses.gaines@aol.com	22 Gregory Lane 	Monsey	NY	10952
587	Euna	Lopez	\N	euna.lopez@gmail.com	7979 South Mountainview Ave. 	Carmel	NY	10512
588	Cherelle	Key	\N	cherelle.key@msn.com	7739 Snake Hill Lane 	Valley Stream	NY	11580
589	Jeffry	Church	\N	jeffry.church@msn.com	426 Grandrose Ave. 	Pleasanton	CA	94566
590	Cyndi	Dyer	\N	cyndi.dyer@msn.com	313 West Argyle Ave. 	Baldwin	NY	11510
591	Danilo	Holmes	\N	danilo.holmes@gmail.com	657 Manor Station Dr. 	Hicksville	NY	11801
592	Joni	Lee	\N	joni.lee@gmail.com	8573 Proctor Street 	Centereach	NY	11720
593	Antony	Atkinson	\N	antony.atkinson@msn.com	680 East Birchwood Lane 	Smithtown	NY	11787
594	Deanne	Parsons	\N	deanne.parsons@aol.com	76 Amherst Drive 	Lindenhurst	NY	11757
595	Frederica	Rojas	\N	frederica.rojas@yahoo.com	7835 West Jockey Hollow Rd. 	Ithaca	NY	14850
596	Emelda	Dickerson	\N	emelda.dickerson@aol.com	7457 6th St. 	Hamburg	NY	14075
597	Rudolf	Moran	\N	rudolf.moran@gmail.com	5 Birchwood Rd. 	Maspeth	NY	11378
598	Benito	Hendrix	\N	benito.hendrix@gmail.com	676 S. Bowman Lane 	Depew	NY	14043
599	Jonell	Rivas	\N	jonell.rivas@msn.com	8415 East High Point St. 	Amarillo	TX	79106
600	Joi	Reeves	(619) 952-9613	joi.reeves@msn.com	9101 Williams Court 	San Diego	CA	92111
601	Leland	Mcdowell	\N	leland.mcdowell@gmail.com	8034 E. Washington Lane 	Encino	CA	91316
602	Delaine	Estes	\N	delaine.estes@yahoo.com	8916 Hartford Rd. 	Amarillo	TX	79106
603	Genevieve	Juarez	\N	genevieve.juarez@gmail.com	93 Goldfield Drive 	New Hyde Park	NY	11040
604	Kylee	Dickson	\N	kylee.dickson@gmail.com	7908 Sherwood Street 	Amityville	NY	11701
605	Renita	Henry	\N	renita.henry@msn.com	474 Woodland Ave. 	New Rochelle	NY	10801
606	Sarah	Kirkland	\N	sarah.kirkland@aol.com	42 N. Glendale Avenue 	Wappingers Falls	NY	12590
607	Paul	Lester	\N	paul.lester@gmail.com	275 Clay St. 	Vista	CA	92083
608	Taisha	Vang	\N	taisha.vang@yahoo.com	660 East Foster Lane 	Shirley	NY	11967
609	Eliana	Reese	\N	eliana.reese@hotmail.com	7079 NE. Cross Drive 	Woodhaven	NY	11421
610	Leonore	Dorsey	\N	leonore.dorsey@yahoo.com	8213 South Branch Avenue 	Jackson Heights	NY	11372
611	Ashleigh	Frank	\N	ashleigh.frank@gmail.com	9008 Plymouth Street 	Levittown	NY	11756
612	Gabriel	Wagner	\N	gabriel.wagner@msn.com	7921 Manhattan Ave. 	Ballston Spa	NY	12020
613	Margene	Eaton	\N	margene.eaton@yahoo.com	43 Sugar Street 	Wantagh	NY	11793
614	Toshia	Cardenas	\N	toshia.cardenas@gmail.com	878 Bayberry Street 	Amsterdam	NY	12010
615	Jamika	Blanchard	\N	jamika.blanchard@gmail.com	420 Cambridge Street 	Fresh Meadows	NY	11365
616	Shery	Acosta	\N	shery.acosta@yahoo.com	17 Canal Ave. 	Saratoga Springs	NY	12866
617	Jenna	Saunders	\N	jenna.saunders@aol.com	4 Young St. 	Yorktown Heights	NY	10598
618	Skye	Pope	\N	skye.pope@yahoo.com	121 S. Bay Meadows Ave. 	Richmond Hill	NY	11418
619	Ana	Palmer	(657) 323-8684	ana.palmer@yahoo.com	7 Buckingham St. 	Anaheim	CA	92806
620	Eric	Hardin	\N	eric.hardin@gmail.com	39 S. Parker Drive 	Jamaica	NY	11432
621	Basil	Ballard	\N	basil.ballard@yahoo.com	7477 Belmont Ave. 	San Lorenzo	CA	94580
622	Gabriel	Pitts	\N	gabriel.pitts@gmail.com	8462 Marshall Drive 	Clifton Park	NY	12065
623	Cayla	Johnson	\N	cayla.johnson@msn.com	7091 Rockaway Avenue 	Coram	NY	11727
624	Sharika	Colon	(562) 452-6136	sharika.colon@gmail.com	509 Henry Smith St. 	Long Beach	NY	11561
625	Donnetta	Henson	\N	donnetta.henson@hotmail.com	2 Tallwood Drive 	Webster	NY	14580
626	Leigh	Burke	\N	leigh.burke@hotmail.com	7651 Creek St. 	Schenectady	NY	12302
627	Deloris	Larson	\N	deloris.larson@aol.com	242 Branch Street 	Duarte	CA	91010
628	Ehtel	Cobb	\N	ehtel.cobb@hotmail.com	741 Rockville Drive 	Lockport	NY	14094
629	Evelina	Byrd	(716) 601-7704	evelina.byrd@msn.com	628 S. Church St. 	Buffalo	NY	14215
630	Zulema	Browning	\N	zulema.browning@gmail.com	12 NW. Lafayette St. 	Amsterdam	NY	12010
631	Tressa	Weiss	\N	tressa.weiss@msn.com	52 Wild Rose Avenue 	Ossining	NY	10562
632	Yvette	Rogers	\N	yvette.rogers@aol.com	3 SE. Oklahoma Drive 	Franklin Square	NY	11010
633	Kiara	Deleon	(657) 378-8011	kiara.deleon@gmail.com	164 Addison Drive 	Anaheim	CA	92806
634	Taylor	Cole	\N	taylor.cole@gmail.com	9408 Holly Lane 	Carmel	NY	10512
635	Myrtie	James	\N	myrtie.james@yahoo.com	566 North Livingston Ave. 	Merrick	NY	11566
636	Ashton	Lott	\N	ashton.lott@hotmail.com	609 Windfall Lane 	Floral Park	NY	11001
637	Kara	Higgins	\N	kara.higgins@aol.com	758 Jennings Street 	Ossining	NY	10562
638	Tomeka	Higgins	\N	tomeka.higgins@msn.com	591 W. Corona St. 	Poughkeepsie	NY	12601
639	Ronald	Parsons	\N	ronald.parsons@msn.com	268 Pin Oak Rd. 	Maspeth	NY	11378
640	Allison	Nolan	(845) 276-5729	allison.nolan@gmail.com	7421 Victoria St. 	New City	NY	10956
641	Derrick	Marks	\N	derrick.marks@yahoo.com	7247 East Prairie Lane 	Glendora	CA	91740
642	Yang	Roth	\N	yang.roth@aol.com	234 E. Shub Farm Ave. 	Webster	NY	14580
643	Melba	Wilkinson	\N	melba.wilkinson@gmail.com	255 Harvard Dr. 	Floral Park	NY	11001
644	Valentin	Mclaughlin	\N	valentin.mclaughlin@hotmail.com	56 Squaw Creek Street 	Lindenhurst	NY	11757
645	Lewis	Garner	(631) 871-2512	lewis.garner@gmail.com	9550 East Greenrose St. 	Brentwood	NY	11717
646	Ann	Heath	\N	ann.heath@msn.com	413 East St. 	South El Monte	CA	91733
647	Janelle	Maldonado	\N	janelle.maldonado@gmail.com	34 Mammoth Street 	Richmond Hill	NY	11418
648	Catrice	Hicks	\N	catrice.hicks@yahoo.com	403 Inverness Street 	San Pablo	CA	94806
649	Eli	Contreras	\N	eli.contreras@hotmail.com	35 Highland Ave. 	Ronkonkoma	NY	11779
650	Rita	Bailey	\N	rita.bailey@hotmail.com	69 Glenwood Street 	Ossining	NY	10562
651	Laure	Pena	\N	laure.pena@yahoo.com	9849 West Elmwood St. 	Wappingers Falls	NY	12590
652	Tilda	Melton	(248) 767-4165	tilda.melton@msn.com	237 Elmwood Drive 	Troy	NY	12180
653	Florencio	Davenport	\N	florencio.davenport@yahoo.com	8759 Brookside Ave. 	Jamestown	NY	14701
654	Eun	Harris	(619) 378-2432	eun.harris@gmail.com	623 Jones St. 	San Diego	CA	92111
655	Marylyn	Browning	\N	marylyn.browning@msn.com	915 Lakeshore Street 	Scarsdale	NY	10583
656	Romana	Barnes	\N	romana.barnes@yahoo.com	9776 Shipley Rd. 	Floral Park	NY	11001
657	Sam	Lester	\N	sam.lester@gmail.com	563 South Beacon Lane 	Baldwin	NY	11510
658	Nicki	Larson	\N	nicki.larson@yahoo.com	8317 West Leatherwood Dr. 	Monsey	NY	10952
659	Antonetta	Rocha	\N	antonetta.rocha@yahoo.com	9858 Newcastle St. 	Port Chester	NY	10573
660	Shara	Pope	\N	shara.pope@msn.com	194 Amherst Dr. 	Ridgecrest	CA	93555
661	Trena	Hudson	\N	trena.hudson@hotmail.com	135 Grand Ave. 	Monroe	NY	10950
662	Loraine	Sykes	\N	loraine.sykes@yahoo.com	9239 Windsor Ave. 	Scarsdale	NY	10583
663	Alissa	Hood	\N	alissa.hood@gmail.com	8032 Maple Drive 	New Windsor	NY	12553
664	Augustus	Schmidt	\N	augustus.schmidt@msn.com	624 Jones Dr. 	Corona	NY	11368
665	Stacie	Sims	(510) 194-5117	stacie.sims@hotmail.com	47 Orange Ave. 	Oakland	CA	94603
666	Brittni	Green	\N	brittni.green@msn.com	842 El Dorado Lane 	Floral Park	NY	11001
667	Etsuko	Garrison	\N	etsuko.garrison@yahoo.com	1 Arrowhead Street 	Richmond Hill	NY	11418
668	Calandra	Stanton	\N	calandra.stanton@aol.com	36 Livingston Dr. 	Lake Jackson	TX	77566
669	Willis	Randolph	\N	willis.randolph@yahoo.com	332 Constitution St. 	Harlingen	TX	78552
670	Shawnda	Glover	\N	shawnda.glover@gmail.com	138 Belmont Ave. 	Liverpool	NY	13090
671	Jennette	Baker	\N	jennette.baker@gmail.com	798 Marvon St. 	Banning	CA	92220
672	Elma	Molina	\N	elma.molina@msn.com	8565 Devon Ave. 	New Rochelle	NY	10801
673	Adam	Henderson	\N	adam.henderson@hotmail.com	167 James St. 	Los Banos	CA	93635
674	Ira	Moore	\N	ira.moore@gmail.com	1 Pineknoll Court 	Saratoga Springs	NY	12866
675	Kermit	Bowman	(915) 996-5952	kermit.bowman@gmail.com	3 Airport Street 	El Paso	TX	79930
676	Gayle	Wilkinson	\N	gayle.wilkinson@yahoo.com	4 Riverside Ave. 	Lindenhurst	NY	11757
677	Launa	Hull	\N	launa.hull@yahoo.com	936 Grove Street 	Helotes	TX	78023
678	Myron	Johns	\N	myron.johns@msn.com	5 N. Woodsman Rd. 	Whitestone	NY	11357
679	Tuan	Wolfe	\N	tuan.wolfe@aol.com	7641 Oak Meadow Dr. 	West Babylon	NY	11704
680	Mathilda	Pennington	(845) 407-9524	mathilda.pennington@gmail.com	14 S. Argyle Ave. 	New City	NY	10956
681	Reatha	Perez	\N	reatha.perez@aol.com	9917 1st St. 	Holbrook	NY	11741
682	Arnita	Thomas	\N	arnita.thomas@gmail.com	154 2nd St. 	Orchard Park	NY	14127
683	Amparo	Burks	\N	amparo.burks@aol.com	7781 Augusta St. 	Merrick	NY	11566
684	Jenny	Bell	\N	jenny.bell@hotmail.com	38 Crescent St. 	Niagara Falls	NY	14304
685	Laverne	Craft	\N	laverne.craft@aol.com	829 N. Pierce Street 	Forest Hills	NY	11375
686	Darcel	Harmon	\N	darcel.harmon@msn.com	966 Hickory Street 	Santa Clara	CA	95050
687	Cecilia	Camacho	\N	cecilia.camacho@yahoo.com	682 Mountainview Rd. 	Desoto	TX	75115
688	Pearlie	Cochran	\N	pearlie.cochran@msn.com	23 Homewood Rd. 	Campbell	CA	95008
689	Deirdre	Ryan	\N	deirdre.ryan@yahoo.com	83 Jefferson Lane 	Utica	NY	13501
690	Yevette	Elliott	\N	yevette.elliott@aol.com	182 Euclid Street 	Jackson Heights	NY	11372
691	Ladawn	Downs	(281) 165-2090	ladawn.downs@yahoo.com	7452 S. Airport Court 	Houston	TX	77016
692	Dorothea	Chang	\N	dorothea.chang@gmail.com	75 Oak Ave. 	Astoria	NY	11102
693	Merlin	Foreman	(516) 150-1321	merlin.foreman@msn.com	8198 North Rockaway St. 	Hempstead	NY	11550
694	Lanie	Dunn	\N	lanie.dunn@gmail.com	7583 Pilgrim Ave. 	North Tonawanda	NY	14120
695	Christoper	Gould	\N	christoper.gould@aol.com	8718 South Constitution St. 	Shirley	NY	11967
696	Norine	Huffman	\N	norine.huffman@aol.com	363 Dunbar Drive 	Encino	CA	91316
697	Alane	Mccarty	(619) 377-8586	alane.mccarty@hotmail.com	8254 Hilldale Street 	San Diego	CA	92111
698	Charleen	Joyner	\N	charleen.joyner@aol.com	735 N. John Dr. 	Corona	NY	11368
699	Zella	Fernandez	\N	zella.fernandez@yahoo.com	8 Marshall Dr. 	Rockville Centre	NY	11570
700	Collene	Knox	(361) 760-1523	collene.knox@msn.com	7 North Branch Lane 	Corpus Christi	TX	78418
701	Alysia	Nicholson	(805) 493-7311	alysia.nicholson@hotmail.com	868 Trusel St. 	Oxnard	CA	93035
702	Sharie	Whitaker	\N	sharie.whitaker@hotmail.com	7 Bayport Lane 	Merrick	NY	11566
703	Diana	Cobb	\N	diana.cobb@hotmail.com	558 Vale St. 	Fullerton	CA	92831
704	Morton	Barron	(661) 386-4884	morton.barron@msn.com	542 Circle Rd. 	Bakersfield	CA	93306
705	Camille	Harvey	\N	camille.harvey@hotmail.com	859 Beaver Ridge Ave. 	Huntington	NY	11743
706	Lolita	O'neill	\N	lolita.o'neill@aol.com	36 Prairie Dr. 	Massapequa Park	NY	11762
707	Terese	Briggs	\N	terese.briggs@msn.com	16 N. Oak Valley St. 	Woodside	NY	11377
708	Majorie	Glover	\N	majorie.glover@msn.com	4 Garden Ave. 	Apple Valley	CA	92307
709	Vinnie	Chan	\N	vinnie.chan@aol.com	8750 Surrey St. 	Forest Hills	NY	11375
710	Ezra	Silva	\N	ezra.silva@msn.com	8629 Catherine Rd. 	New Windsor	NY	12553
711	Jovita	Bishop	\N	jovita.bishop@aol.com	8123 Wild Horse St. 	Staten Island	NY	10301
712	Kecia	Olsen	\N	kecia.olsen@msn.com	8389 Central St. 	Santa Cruz	CA	95060
713	Ilona	Spears	\N	ilona.spears@gmail.com	984 Canterbury Lane 	Port Jefferson Station	NY	11776
714	Senaida	Thompson	\N	senaida.thompson@msn.com	578 Golf Drive 	Bronx	NY	10451
715	Larae	Carney	\N	larae.carney@msn.com	9322 Glen Ridge Dr. 	Sunnyside	NY	11104
716	Sebrina	Hart	\N	sebrina.hart@yahoo.com	7679 Pacific St. 	Coram	NY	11727
717	Kristofer	Craig	\N	kristofer.craig@yahoo.com	6 Delaware Lane 	Plainview	NY	11803
718	Luciana	Mcgee	\N	luciana.mcgee@msn.com	8002 Cross St. 	Selden	NY	11784
719	Nicki	Fry	\N	nicki.fry@hotmail.com	950 Snake Hill Lane 	Endicott	NY	13760
720	Devin	Shaffer	(507) 557-2191	devin.shaffer@gmail.com	382 Third Ave. 	Rochester	NY	14606
721	Erlinda	Osborne	\N	erlinda.osborne@yahoo.com	148 Elm St. 	West Islip	NY	11795
722	Camila	Carroll	(210) 436-8676	camila.carroll@yahoo.com	72 Shub Farm Avenue 	San Antonio	TX	78213
723	Vicki	Wiggins	\N	vicki.wiggins@hotmail.com	71 Broad Ave. 	Wappingers Falls	NY	12590
724	Lois	Steele	\N	lois.steele@yahoo.com	7501 South Marlborough Street 	Ossining	NY	10562
725	Carola	Mcpherson	\N	carola.mcpherson@hotmail.com	578 Shirley Dr. 	Rego Park	NY	11374
726	Rochell	Cantrell	\N	rochell.cantrell@yahoo.com	437 Water Dr. 	Port Jefferson Station	NY	11776
727	Kasha	Sullivan	\N	kasha.sullivan@hotmail.com	48 Foster Rd. 	Scarsdale	NY	10583
728	Viva	Dawson	\N	viva.dawson@yahoo.com	446 Princess Ave. 	Orchard Park	NY	14127
729	Hue	Dalton	\N	hue.dalton@hotmail.com	7940 Oakwood Street 	Apple Valley	CA	92307
730	Andria	Rivers	\N	andria.rivers@aol.com	183 Ohio Ave. 	Amarillo	TX	79106
731	Hilary	Savage	(805) 753-6881	hilary.savage@yahoo.com	696 Howard Court 	Oxnard	CA	93035
732	Lavona	Austin	\N	lavona.austin@yahoo.com	926 South Euclid St. 	Utica	NY	13501
733	Doreatha	Ford	\N	doreatha.ford@yahoo.com	9413 Ryan Ave. 	Huntington	NY	11743
734	Alina	Mcleod	\N	alina.mcleod@msn.com	20 Winchester Street 	Patchogue	NY	11772
735	Aide	Franco	\N	aide.franco@msn.com	8017 Lake Forest St. 	Atwater	CA	95301
736	Genny	Hensley	\N	genny.hensley@yahoo.com	8849 Marconi Ave. 	Redondo Beach	CA	90278
737	Melita	Dominguez	\N	melita.dominguez@msn.com	9903 Santa Clara Lane 	Auburn	NY	13021
738	Fannie	Jenkins	(805) 774-5696	fannie.jenkins@msn.com	7858 E. Pawnee Dr. 	Oxnard	CA	93035
739	Bobbi	Banks	\N	bobbi.banks@yahoo.com	396 Wagon Rd. 	Bayside	NY	11361
740	Gwenn	Melton	\N	gwenn.melton@yahoo.com	9545 Wakehurst Drive 	Centereach	NY	11720
741	Laci	Castro	\N	laci.castro@hotmail.com	130 Birchpond Street 	Saint Albans	NY	11412
742	Evelina	Manning	\N	evelina.manning@aol.com	7515 Spring St. 	Mount Vernon	NY	10550
743	Tania	Swanson	\N	tania.swanson@yahoo.com	8646 Glen Eagles Ave. 	Longview	TX	75604
744	Laurel	Schultz	\N	laurel.schultz@hotmail.com	812 E. 1st Lane 	Mount Vernon	NY	10550
745	Carolyne	Conley	\N	carolyne.conley@gmail.com	431 Lees Creek Drive 	Floral Park	NY	11001
746	Eldridge	Greer	\N	eldridge.greer@aol.com	131 E. Madison St. 	Central Islip	NY	11722
747	Margret	Barnett	\N	margret.barnett@gmail.com	7509 Depot Rd. 	Forney	TX	75126
748	Oliva	Blackwell	\N	oliva.blackwell@hotmail.com	54 Ramblewood St. 	Elmhurst	NY	11373
749	Oralia	Farley	\N	oralia.farley@hotmail.com	747B E. Coffee Street 	Upland	CA	91784
750	Romaine	Salazar	\N	romaine.salazar@yahoo.com	7700 Wentworth Rd. 	Monsey	NY	10952
751	Hermila	Mckay	\N	hermila.mckay@yahoo.com	23 Garfield Dr. 	Coachella	CA	92236
752	Lloyd	Miranda	\N	lloyd.miranda@hotmail.com	9098 Jennings St. 	Encino	CA	91316
753	Mandi	Gibbs	\N	mandi.gibbs@gmail.com	80 Sycamore Drive 	East Elmhurst	NY	11369
754	Hue	May	\N	hue.may@aol.com	19 S. Lawrence Dr. 	Valley Stream	NY	11580
755	Tomika	Wilder	\N	tomika.wilder@aol.com	142 South Ocean St. 	New Hyde Park	NY	11040
756	Graig	Roth	\N	graig.roth@aol.com	7516 Wrangler Street 	West Babylon	NY	11704
757	Lamar	Greer	\N	lamar.greer@gmail.com	7909 Golden Star Ave. 	Levittown	NY	11756
758	Raymonde	Garcia	\N	raymonde.garcia@aol.com	55 NE. North St. 	Queensbury	NY	12804
759	Cira	Downs	(510) 788-4456	cira.downs@gmail.com	672 Sussex Ave. 	Oakland	CA	94603
760	Marisa	Chambers	\N	marisa.chambers@msn.com	15 E. Rock Creek Ave. 	Amityville	NY	11701
761	Rod	Hatfield	\N	rod.hatfield@hotmail.com	7090 Bridge Dr. 	Ronkonkoma	NY	11779
762	Quyen	Houston	\N	quyen.houston@gmail.com	7758 Homewood Dr. 	Central Islip	NY	11722
763	Han	Schneider	\N	han.schneider@gmail.com	40 Holly Street 	Elmhurst	NY	11373
764	Terrell	Mathis	\N	terrell.mathis@aol.com	9320 Center Ave. 	Selden	NY	11784
765	Spring	Hayes	\N	spring.hayes@hotmail.com	8591 Wentworth St. 	Ossining	NY	10562
766	Lecia	Hancock	\N	lecia.hancock@hotmail.com	9167 Pineknoll St. 	Schenectady	NY	12302
767	Twana	Arnold	(657) 988-1904	twana.arnold@msn.com	47 North Fairground Lane 	Anaheim	CA	92806
768	Yvone	Yates	\N	yvone.yates@gmail.com	9269 Blue Spring Ave. 	San Pablo	CA	94806
769	Agatha	Melton	\N	agatha.melton@yahoo.com	89 East Illinois Street 	Springfield Gardens	NY	11413
770	Lavonda	Stephenson	\N	lavonda.stephenson@gmail.com	37 Birchwood Dr. 	Bay Shore	NY	11706
771	Agnes	Sims	(716) 780-9901	agnes.sims@aol.com	170 Queen Lane 	Buffalo	NY	14215
772	Latricia	Lindsey	\N	latricia.lindsey@hotmail.com	288 Campfire Dr. 	Yorktown Heights	NY	10598
773	Yolando	Wade	\N	yolando.wade@hotmail.com	310 Wilson Ave. 	Massapequa	NY	11758
774	Nenita	Mooney	\N	nenita.mooney@hotmail.com	10 W. Bishop Street 	Lawndale	CA	90260
775	Kermit	Hyde	\N	kermit.hyde@hotmail.com	87 SE. Carson St. 	Patchogue	NY	11772
776	Angelique	Merrill	\N	angelique.merrill@gmail.com	8490 West High Noon Ave. 	South El Monte	CA	91733
777	Ilda	Roberson	\N	ilda.roberson@aol.com	8853 Lake St. 	Kingston	NY	12401
778	Corrinne	Garrison	\N	corrinne.garrison@yahoo.com	81 East Glenwood Ave. 	Victoria	TX	77904
779	Major	Merrill	\N	major.merrill@aol.com	78 Thatcher Court 	Astoria	NY	11102
780	Ouida	Gregory	\N	ouida.gregory@aol.com	7984 8th Street 	Merrick	NY	11566
781	Tajuana	Riddle	\N	tajuana.riddle@hotmail.com	24 St Margarets Ave. 	Bayside	NY	11361
782	Ricki	Bullock	\N	ricki.bullock@hotmail.com	79 Pennington Rd. 	Woodside	NY	11377
783	Celestine	Kent	(717) 890-4260	celestine.kent@aol.com	697 Fordham Street 	Lancaster	NY	14086
784	Debbra	Jacobson	\N	debbra.jacobson@yahoo.com	8316 West Bedford Ave. 	Ballston Spa	NY	12020
785	Kandis	Mills	\N	kandis.mills@hotmail.com	64 Beechwood Drive 	Hamburg	NY	14075
786	Wallace	Lane	\N	wallace.lane@aol.com	901 Liberty St. 	South Richmond Hill	NY	11419
787	Malisa	Mitchell	\N	malisa.mitchell@msn.com	87 Ridgewood Court 	Mount Vernon	NY	10550
788	Lilliam	Nolan	\N	lilliam.nolan@msn.com	8976 Berkshire Court 	Copperas Cove	TX	76522
789	Tad	Gardner	\N	tad.gardner@hotmail.com	9745 E. Wilson St. 	Niagara Falls	NY	14304
790	Petronila	Gallegos	\N	petronila.gallegos@gmail.com	8053 Aspen St. 	Howard Beach	NY	11414
791	Yun	Nelson	\N	yun.nelson@hotmail.com	529 Durham Street 	Ballston Spa	NY	12020
792	Edgar	Horn	\N	edgar.horn@aol.com	7270 W. Cherry Hill Lane 	West Babylon	NY	11704
793	Chantay	Maynard	\N	chantay.maynard@gmail.com	7483 1st Ave. 	Elmhurst	NY	11373
794	Donette	Mccarthy	\N	donette.mccarthy@yahoo.com	500 NW. Maiden Dr. 	Redondo Beach	CA	90278
795	Mariam	Miranda	\N	mariam.miranda@aol.com	18 East Washington Avenue 	Franklin Square	NY	11010
796	Rosalie	Coffey	\N	rosalie.coffey@gmail.com	789 Amerige Dr. 	Upland	CA	91784
797	Cathey	Lamb	\N	cathey.lamb@msn.com	9621 Ryan Drive 	Bayside	NY	11361
798	Alyse	Jacobson	\N	alyse.jacobson@yahoo.com	10 West Devon Lane 	Massapequa Park	NY	11762
799	India	Barron	\N	india.barron@msn.com	834 W. Pleasant Rd. 	Huntington	NY	11743
800	Cris	Dunn	\N	cris.dunn@yahoo.com	1 Pawnee Street 	Pittsford	NY	14534
801	Ophelia	Rodgers	\N	ophelia.rodgers@gmail.com	133 Joy Ridge Drive 	Hopewell Junction	NY	12533
802	Barrett	Sanders	\N	barrett.sanders@aol.com	32 Hawthorne St. 	Longview	TX	75604
803	Bernardina	Cooper	\N	bernardina.cooper@msn.com	223 Glen Creek Ave. 	Whitestone	NY	11357
804	Douglas	Richards	\N	douglas.richards@hotmail.com	221 Arcadia Lane 	Valley Stream	NY	11580
805	Phillis	Fowler	\N	phillis.fowler@aol.com	8976 N. Hall Street 	Clifton Park	NY	12065
806	Reyes	Merritt	\N	reyes.merritt@yahoo.com	48 Lexington Rd. 	Staten Island	NY	10301
807	Nathalie	Knowles	\N	nathalie.knowles@aol.com	4 Cactus Street 	West Islip	NY	11795
808	Vallie	Dixon	\N	vallie.dixon@yahoo.com	85 E. Ann Drive 	Rowlett	TX	75088
809	Elnora	Simpson	\N	elnora.simpson@yahoo.com	7157 Shore Ave. 	Bellmore	NY	11710
810	Ivelisse	Nixon	(281) 941-4933	ivelisse.nixon@aol.com	782 Boston Ave. 	Houston	TX	77016
811	Shanti	Johnston	\N	shanti.johnston@gmail.com	722 Alderwood Drive 	Staten Island	NY	10301
812	Martha	Burgess	\N	martha.burgess@msn.com	9631 St Margarets Lane 	Woodhaven	NY	11421
813	Neville	Mcclain	\N	neville.mcclain@yahoo.com	781 Buttonwood Ave. 	West Hempstead	NY	11552
814	Ghislaine	Compton	\N	ghislaine.compton@aol.com	8930 Princess St. 	Lindenhurst	NY	11757
815	Leanna	Manning	\N	leanna.manning@yahoo.com	39 E. Stillwater Ave. 	Hicksville	NY	11801
816	Marshall	Johnson	\N	marshall.johnson@yahoo.com	44 Greenview St. 	Vista	CA	92083
817	Zelda	Pratt	(717) 428-4018	zelda.pratt@gmail.com	74 Trusel Drive 	Lancaster	NY	14086
818	Joel	Wynn	(619) 210-6032	joel.wynn@aol.com	7 North Oak Ave. 	San Diego	CA	92111
819	Yahaira	Robertson	\N	yahaira.robertson@yahoo.com	142 Roehampton Dr. 	Endicott	NY	13760
820	Sandy	Mills	\N	sandy.mills@gmail.com	333 Olive Ave. 	Schenectady	NY	12302
821	Cassidy	Clark	\N	cassidy.clark@hotmail.com	9879 Old Kingston Road 	Astoria	NY	11102
822	Kristy	Watkins	\N	kristy.watkins@gmail.com	977 South Brook Ave. 	Howard Beach	NY	11414
823	Tina	Bush	\N	tina.bush@aol.com	8038 Bellevue Street 	Maspeth	NY	11378
824	Veronika	Rollins	\N	veronika.rollins@yahoo.com	94 Arnold Ave. 	Webster	NY	14580
825	Kristel	Byrd	\N	kristel.byrd@hotmail.com	9967 Piper Street 	Hicksville	NY	11801
826	Shay	Stephenson	\N	shay.stephenson@aol.com	9569 4th Lane 	Smithtown	NY	11787
827	George	Pickett	\N	george.pickett@msn.com	691 Rocky River St. 	Sunnyside	NY	11104
828	Renato	Morton	\N	renato.morton@msn.com	8526 Sherwood Street 	Mount Vernon	NY	10550
829	Marcy	Rodriguez	\N	marcy.rodriguez@gmail.com	97 Trusel Drive 	Lockport	NY	14094
830	Edmund	Gaines	\N	edmund.gaines@gmail.com	8643 Gartner St. 	Copperas Cove	TX	76522
831	Lory	Berg	\N	lory.berg@aol.com	64 Vine Drive 	Oswego	NY	13126
832	Pamala	Fowler	\N	pamala.fowler@gmail.com	399 Leatherwood St. 	Ballston Spa	NY	12020
833	Leone	Emerson	\N	leone.emerson@msn.com	460 Smith Store Ave. 	Whitestone	NY	11357
834	Brain	Skinner	\N	brain.skinner@hotmail.com	8676 Ketch Harbour Ave. 	Euless	TX	76039
835	Roseanne	Maynard	\N	roseanne.maynard@yahoo.com	219 Old Paris Hill Dr. 	Euless	TX	76039
836	Corinna	Adams	\N	corinna.adams@msn.com	38 Trenton Court 	Rosedale	NY	11422
837	Kellye	Campbell	\N	kellye.campbell@gmail.com	75 Marsh St. 	Baldwinsville	NY	13027
838	Erna	Sloan	\N	erna.sloan@aol.com	9449 Fifth Avenue 	Howard Beach	NY	11414
839	Carolann	Russell	\N	carolann.russell@hotmail.com	9308 Selby Ave. 	Glen Cove	NY	11542
840	Gilbert	Calhoun	\N	gilbert.calhoun@msn.com	7339 Summer Drive 	East Elmhurst	NY	11369
841	Manie	Maxwell	\N	manie.maxwell@gmail.com	85 Brickell Ave. 	Ronkonkoma	NY	11779
842	Giselle	Robles	\N	giselle.robles@hotmail.com	9747 N. El Dorado Dr. 	San Angelo	TX	76901
843	Tessie	Farmer	\N	tessie.farmer@msn.com	870 Cottage Ave. 	Plattsburgh	NY	12901
844	Felica	Munoz	\N	felica.munoz@aol.com	24 West Rockwell Dr. 	South Ozone Park	NY	11420
845	Kathyrn	Bush	\N	kathyrn.bush@gmail.com	90 Devon St. 	Bronx	NY	10451
846	Sylvester	Chan	\N	sylvester.chan@hotmail.com	659 Arcadia Street 	Rocklin	CA	95677
847	Lizette	Ellison	\N	lizette.ellison@hotmail.com	865 Sunbeam Street 	Port Washington	NY	11050
848	Ernestina	Skinner	\N	ernestina.skinner@hotmail.com	52 Spring Drive 	Elmhurst	NY	11373
849	Phyllis	Hill	\N	phyllis.hill@yahoo.com	576 Devon Ave. 	Syosset	NY	11791
850	Stephanie	Browning	\N	stephanie.browning@yahoo.com	9156 Lantern St. 	Rowlett	TX	75088
851	Arlena	Buckner	\N	arlena.buckner@hotmail.com	629 Locust Ave. 	New Hyde Park	NY	11040
852	Lezlie	Thompson	\N	lezlie.thompson@yahoo.com	73 Vernon St. 	Freeport	NY	11520
853	Brittney	Rojas	\N	brittney.rojas@aol.com	2 E. Overlook Ave. 	Kingston	NY	12401
854	Phylis	Adkins	(212) 325-9145	phylis.adkins@msn.com	7781 James Ave. 	New York	NY	10002
855	Lean	Stark	\N	lean.stark@msn.com	215 Old Pumpkin Hill St. 	Upland	CA	91784
856	Lara	Guy	\N	lara.guy@aol.com	9809 E. Walnut Drive 	Ronkonkoma	NY	11779
857	Inga	Koch	\N	inga.koch@msn.com	8445 South New Court 	New Windsor	NY	12553
858	Klara	Kim	\N	klara.kim@gmail.com	9660 Sherman Lane 	Rome	NY	13440
859	Julianne	Shannon	\N	julianne.shannon@hotmail.com	28 Applegate Street 	Sugar Land	TX	77478
860	Loni	Mullen	\N	loni.mullen@msn.com	55 Thompson Avenue 	South Ozone Park	NY	11420
861	Olympia	Figueroa	\N	olympia.figueroa@hotmail.com	587 Surrey St. 	Hopewell Junction	NY	12533
862	Mellie	Puckett	\N	mellie.puckett@yahoo.com	64 Van Dyke St. 	Fresh Meadows	NY	11365
863	Shonta	Preston	\N	shonta.preston@msn.com	74 Division St. 	Utica	NY	13501
864	Lore	Sykes	(716) 382-5169	lore.sykes@aol.com	7050 Beach Drive 	Buffalo	NY	14215
865	Julia	Joyner	\N	julia.joyner@msn.com	2 Valley View Dr. 	Astoria	NY	11102
866	Lynwood	Jackson	\N	lynwood.jackson@aol.com	9449 Linda Street 	Longview	TX	75604
867	Rosalva	Hamilton	\N	rosalva.hamilton@aol.com	9883 Cedar Dr. 	Campbell	CA	95008
868	Domingo	Casey	(408) 761-9212	domingo.casey@msn.com	8665 Cypress Street 	San Jose	CA	95127
869	Rodrigo	Durham	\N	rodrigo.durham@aol.com	82 Old Church Road 	Richmond Hill	NY	11418
870	Dwain	Carlson	\N	dwain.carlson@gmail.com	951 North Trusel Ave. 	Smithtown	NY	11787
871	Erlinda	Humphrey	\N	erlinda.humphrey@hotmail.com	532 South Victoria St. 	New Windsor	NY	12553
872	Silas	Tate	(361) 219-2149	silas.tate@yahoo.com	9754 53rd Court 	Corpus Christi	TX	78418
873	Patience	Clayton	\N	patience.clayton@hotmail.com	68 Chestnut Dr. 	Niagara Falls	NY	14304
874	Mila	Good	\N	mila.good@yahoo.com	812 East Longbranch Ave. 	Plattsburgh	NY	12901
875	Tanesha	Sawyer	\N	tanesha.sawyer@aol.com	9B Kingston Lane 	Rosedale	NY	11422
876	Onita	Macdonald	\N	onita.macdonald@yahoo.com	94 Wood St. 	Glen Cove	NY	11542
877	Janine	Manning	\N	janine.manning@gmail.com	9118B Campfire St. 	Howard Beach	NY	11414
878	Melodie	Melton	\N	melodie.melton@yahoo.com	12 S. 8th Road 	Smithtown	NY	11787
879	Ethelyn	Ray	\N	ethelyn.ray@yahoo.com	80 South Sutor Lane 	Garden City	NY	11530
880	Phebe	Turner	\N	phebe.turner@aol.com	4 West York Street 	Sunnyside	NY	11104
881	Chloe	Patel	\N	chloe.patel@yahoo.com	407 Homewood Street 	Santa Monica	CA	90403
882	Hilda	Harvey	\N	hilda.harvey@gmail.com	9808 W. Cleveland Ave. 	Ballston Spa	NY	12020
883	Gilberte	Duke	(915) 903-7860	gilberte.duke@gmail.com	12 Birchwood Dr. 	El Paso	TX	79930
884	Willian	Hardin	\N	willian.hardin@msn.com	836 West Street 	Oswego	NY	13126
885	Janna	Hayden	\N	janna.hayden@msn.com	32 Hilldale Street 	Longview	TX	75604
886	Letisha	May	\N	letisha.may@yahoo.com	9965 Princeton Lane 	North Tonawanda	NY	14120
887	Graig	Cannon	\N	graig.cannon@gmail.com	36 Oklahoma Ave. 	Syosset	NY	11791
888	Coleen	Navarro	\N	coleen.navarro@aol.com	990 Broad Rd. 	Webster	NY	14580
889	Lucilla	Williams	\N	lucilla.williams@hotmail.com	42 Cedar Street 	San Carlos	CA	94070
890	Rosanne	George	\N	rosanne.george@yahoo.com	38 Pleasant St. 	Ossining	NY	10562
891	Ashlie	Parrish	\N	ashlie.parrish@hotmail.com	48 Mill Drive 	Monsey	NY	10952
892	Alissa	Craft	\N	alissa.craft@hotmail.com	249 Maple Street 	Ossining	NY	10562
893	Letty	Cobb	\N	letty.cobb@msn.com	8652 Wellington Street 	Depew	NY	14043
894	Nathaniel	Richard	\N	nathaniel.richard@gmail.com	3 Nicolls Lane 	New Windsor	NY	12553
895	Elaina	Key	\N	elaina.key@msn.com	1 Main St. 	Plainview	NY	11803
896	Stefani	Gamble	(845) 724-2996	stefani.gamble@aol.com	9119 W. Victoria St. 	New City	NY	10956
897	Bettyann	Acosta	(717) 746-6658	bettyann.acosta@gmail.com	7949 Chapel St. 	Lancaster	NY	14086
898	Crysta	Velez	(281) 529-3469	crysta.velez@yahoo.com	64 South Front Street 	Houston	TX	77016
899	Carisa	Carpenter	\N	carisa.carpenter@hotmail.com	551 Belmont Lane 	Victoria	TX	77904
900	Jule	Davenport	\N	jule.davenport@aol.com	19 River St. 	San Carlos	CA	94070
901	Lonna	Franks	\N	lonna.franks@yahoo.com	667 Brickyard Street 	Ontario	CA	91762
902	Elease	Dejesus	\N	elease.dejesus@gmail.com	7800 Magnolia Street 	Oswego	NY	13126
903	Maira	Long	\N	maira.long@msn.com	7587 Bear Hill Street 	Hicksville	NY	11801
904	Jana	Thomas	(408) 624-8137	jana.thomas@yahoo.com	283 E. Spring Dr. 	San Jose	CA	95127
905	Hae	Ramirez	\N	hae.ramirez@hotmail.com	9367 Lake Street 	Baldwinsville	NY	13027
906	Erik	Leblanc	\N	erik.leblanc@aol.com	7 East Nut Swamp Street 	Sugar Land	TX	77478
907	Daina	Sampson	\N	daina.sampson@msn.com	556 Wellington St. 	Longview	TX	75604
908	Delmar	Wise	\N	delmar.wise@yahoo.com	8355 Kingston Avenue 	Lockport	NY	14094
909	Alita	Salinas	\N	alita.salinas@hotmail.com	8550 Bear Hill Ave. 	Uniondale	NY	11553
910	Elenore	William	\N	elenore.william@msn.com	23 Rockland St. 	Mcallen	TX	78501
911	Nikita	Roy	\N	nikita.roy@aol.com	9703 N. Snake Hill St. 	Pittsford	NY	14534
912	Inocencia	Key	\N	inocencia.key@hotmail.com	36 Wild Rose Ave. 	Massapequa Park	NY	11762
913	Liliana	Kerr	\N	liliana.kerr@yahoo.com	3 Cherry Drive 	Desoto	TX	75115
914	Hortencia	O'neil	\N	hortencia.o'neil@hotmail.com	1 Gulf Rd. 	Rockville Centre	NY	11570
915	Beryl	Bennett	(916) 422-6956	beryl.bennett@aol.com	9563 Edgemont St. 	Sacramento	CA	95820
916	Alishia	Elliott	\N	alishia.elliott@aol.com	8905 Courtland Ave. 	Mount Vernon	NY	10550
917	Vernia	Madden	(248) 206-3697	vernia.madden@aol.com	5 Iroquois Street 	Troy	NY	12180
918	Kristel	Bullock	\N	kristel.bullock@yahoo.com	7292 Armstrong Drive 	Smithtown	NY	11787
919	Ruthanne	Hoover	\N	ruthanne.hoover@aol.com	835 Paris Hill Road 	Torrance	CA	90505
920	James	Robles	\N	james.robles@aol.com	9 Chapel Lane 	North Tonawanda	NY	14120
921	Evelin	Vargas	\N	evelin.vargas@msn.com	7049 Pin Oak Ave. 	Webster	NY	14580
922	Elvia	Cardenas	\N	elvia.cardenas@hotmail.com	8 Paris Hill St. 	Massapequa	NY	11758
923	Randee	Pitts	\N	randee.pitts@msn.com	7371B Essex Street 	Canyon Country	CA	91387
924	Lea	Irwin	\N	lea.irwin@gmail.com	845 Adams Lane 	New Windsor	NY	12553
925	Bryce	Monroe	\N	bryce.monroe@aol.com	52 Cooper Lane 	Kingston	NY	12401
926	Katina	Mcintosh	(661) 464-1523	katina.mcintosh@yahoo.com	263 Swanson Dr. 	Bakersfield	CA	93306
927	Guillermo	Hart	(212) 652-7198	guillermo.hart@hotmail.com	81 Indian Summer Drive 	New York	NY	10002
928	Joann	Barber	\N	joann.barber@gmail.com	8945 Courtland Street 	Santa Monica	CA	90403
929	Thurman	Ellis	\N	thurman.ellis@gmail.com	20 Augusta Road 	Pleasanton	CA	94566
930	Delana	Wagner	\N	delana.wagner@aol.com	8499 Mill Pond Road 	Clifton Park	NY	12065
931	Porter	Bass	\N	porter.bass@hotmail.com	370 North Alderwood Dr. 	San Angelo	TX	76901
932	Yvonne	Bean	\N	yvonne.bean@yahoo.com	20 W. Marsh Ave. 	Wappingers Falls	NY	12590
933	Lurline	Rivers	\N	lurline.rivers@msn.com	69 Pine Street 	Howard Beach	NY	11414
934	Ocie	Slater	\N	ocie.slater@msn.com	7799 W. Bohemia Dr. 	Hamburg	NY	14075
935	Genevie	Miles	\N	genevie.miles@aol.com	45 West Sulphur Springs Ave. 	Monroe	NY	10950
936	Sherilyn	Wilcox	\N	sherilyn.wilcox@gmail.com	905 North Buckingham Lane 	Ossining	NY	10562
937	Aida	Koch	\N	aida.koch@gmail.com	9778 3rd Drive 	West Hempstead	NY	11552
938	Emory	O'connor	(507) 606-2192	emory.o'connor@gmail.com	34 Foxrun Street 	Rochester	NY	14606
939	Maximina	Hutchinson	(361) 164-3098	maximina.hutchinson@hotmail.com	53 Stillwater Avenue 	Corpus Christi	TX	78418
940	Marina	Hinton	\N	marina.hinton@yahoo.com	7440 North Oxford St. 	Encino	CA	91316
941	Danyell	Dickerson	\N	danyell.dickerson@msn.com	8306 Fieldstone Dr. 	Central Islip	NY	11722
942	Davis	Long	(717) 653-1755	davis.long@msn.com	929 Elmwood Dr. 	Lancaster	NY	14086
943	Lynn	Mcmahon	\N	lynn.mcmahon@msn.com	9 Surrey St. 	Scarsdale	NY	10583
944	Tonja	Henderson	\N	tonja.henderson@aol.com	82 Alton St. 	Scarsdale	NY	10583
945	Krissy	Ochoa	\N	krissy.ochoa@msn.com	80 Queen Ave. 	Port Washington	NY	11050
946	Angella	Bridges	\N	angella.bridges@yahoo.com	8708 Sycamore St. 	Pittsford	NY	14534
947	Angele	Castro	\N	angele.castro@yahoo.com	15 Acacia Drive 	Palos Verdes Peninsula	CA	90274
948	Siobhan	Lang	\N	siobhan.lang@gmail.com	3 Monroe Lane 	Levittown	NY	11756
949	Venessa	Frost	\N	venessa.frost@msn.com	621 West School Rd. 	Scarsdale	NY	10583
950	Verna	Solis	(507) 115-1633	verna.solis@yahoo.com	7 Lincoln Lane 	Rochester	NY	14606
951	Steve	Bender	\N	steve.bender@gmail.com	908 N. Pennington Dr. 	Scarsdale	NY	10583
952	Aileen	Marquez	\N	aileen.marquez@msn.com	8899 Newbridge Street 	Torrance	CA	90505
953	Kattie	Stevenson	\N	kattie.stevenson@aol.com	52 Carson Street 	Helotes	TX	78023
954	Hassan	Nash	\N	hassan.nash@yahoo.com	8105 University Lane 	Hicksville	NY	11801
955	Delfina	Gilliam	\N	delfina.gilliam@hotmail.com	9463 Bayberry Rd. 	West Babylon	NY	11704
956	Venus	Hewitt	\N	venus.hewitt@msn.com	9835 Old Cemetery Lane 	Farmingdale	NY	11735
957	Stephen	Vega	(657) 288-3778	stephen.vega@msn.com	5 Briarwood St. 	Anaheim	CA	92806
958	Ciera	Koch	\N	ciera.koch@gmail.com	881 Lawrence Drive 	Euless	TX	76039
959	Christel	Barber	(916) 679-3547	christel.barber@hotmail.com	320 Briarwood Lane 	Sacramento	CA	95820
960	Arline	Lawson	(516) 792-3395	arline.lawson@gmail.com	48 Whitemarsh Lane 	Hempstead	NY	11550
961	Iva	Wilcox	\N	iva.wilcox@aol.com	452 South Mayflower Drive 	Kingston	NY	12401
962	Maple	Griffin	\N	maple.griffin@gmail.com	20 Glendale Drive 	Copperas Cove	TX	76522
963	Anisha	Lang	\N	anisha.lang@aol.com	265 Peachtree St. 	Rome	NY	13440
964	Brent	Calderon	(361) 981-8725	brent.calderon@aol.com	3 Thomas St. 	Corpus Christi	TX	78418
965	Margit	Osborn	\N	margit.osborn@yahoo.com	909 Gulf Drive 	Plainview	NY	11803
966	Novella	Patel	\N	novella.patel@gmail.com	500 Livingston Street 	Glen Cove	NY	11542
967	Laurette	Hebert	\N	laurette.hebert@msn.com	18 South Constitution Court 	Canandaigua	NY	14424
968	Jonna	Brown	\N	jonna.brown@aol.com	1 Spring Drive 	Mahopac	NY	10541
969	Jennell	Solis	(507) 421-7354	jennell.solis@hotmail.com	194 2nd Rd. 	Rochester	NY	14606
970	Ruth	Horton	\N	ruth.horton@gmail.com	488 Mulberry Ave. 	Hollis	NY	11423
971	Samual	Warner	(631) 151-4988	samual.warner@gmail.com	8735 Thatcher Dr. 	Brentwood	NY	11717
972	Damian	Mills	(562) 924-3079	damian.mills@yahoo.com	7747 Elm Dr. 	Long Beach	NY	11561
973	Margaretta	Clayton	\N	margaretta.clayton@yahoo.com	524 San Pablo Ave. 	Ridgecrest	CA	93555
974	Marcell	Barrett	\N	marcell.barrett@gmail.com	266 Elm Drive 	Astoria	NY	11102
975	Annis	Sanchez	(424) 352-6275	annis.sanchez@aol.com	4 Edgewater Road 	Los Angeles	CA	90008
976	Ayanna	Cherry	\N	ayanna.cherry@yahoo.com	8829 Galvin Rd. 	Smithtown	NY	11787
977	Barton	Cox	\N	barton.cox@yahoo.com	8220 Creekside Street 	Amityville	NY	11701
978	Diana	Reyes	\N	diana.reyes@msn.com	7415 Annadale St. 	Bronx	NY	10451
979	Ingeborg	Ellison	\N	ingeborg.ellison@yahoo.com	360 Trusel St. 	Ithaca	NY	14850
980	Carter	Booth	\N	carter.booth@msn.com	82 Beech Drive 	Port Chester	NY	10573
981	Christel	Cardenas	(562) 342-8083	christel.cardenas@aol.com	428 S. Swanson Drive 	Long Beach	NY	11561
982	Orval	Hunter	\N	orval.hunter@aol.com	35 Wagon Drive 	San Angelo	TX	76901
983	Marguerite	Berger	\N	marguerite.berger@aol.com	875 Arch Lane 	Fullerton	CA	92831
984	Ivette	Warren	\N	ivette.warren@gmail.com	8408 Thomas Street 	Franklin Square	NY	11010
985	Milagros	Weber	\N	milagros.weber@hotmail.com	7591 Glendale Ave. 	Harlingen	TX	78552
986	Marcel	Lindsay	\N	marcel.lindsay@hotmail.com	249 Peninsula St. 	Ossining	NY	10562
987	Louis	Powell	\N	louis.powell@aol.com	368 Sugar Rd. 	Staten Island	NY	10301
988	Vanda	Holmes	\N	vanda.holmes@aol.com	9835 Wild Rose Drive 	Syosset	NY	11791
989	Loreen	Byers	\N	loreen.byers@yahoo.com	83 S. Rockledge Circle 	South Ozone Park	NY	11420
990	Casimira	Chapman	\N	casimira.chapman@yahoo.com	67 Snake Hill St. 	Monroe	NY	10950
991	Brigida	Larson	\N	brigida.larson@hotmail.com	8789 Sycamore Lane 	Canyon Country	CA	91387
992	Chere	Alston	\N	chere.alston@gmail.com	16 Lower River Street 	Patchogue	NY	11772
993	Giovanna	Jefferson	\N	giovanna.jefferson@gmail.com	9394 Riverside St. 	Ridgecrest	CA	93555
994	Demarcus	Reese	\N	demarcus.reese@gmail.com	8087 Armstrong Dr. 	Yorktown Heights	NY	10598
995	Amina	Salazar	\N	amina.salazar@aol.com	944 Wellington Street 	Canandaigua	NY	14424
996	Serafina	Clemons	\N	serafina.clemons@gmail.com	851 Brown Ave. 	Shirley	NY	11967
997	Trinidad	Mcclain	\N	trinidad.mcclain@msn.com	98 Tunnel Drive 	Baldwin	NY	11510
998	Heather	Chaney	\N	heather.chaney@yahoo.com	4 Morris Dr. 	Jamestown	NY	14701
999	Latoya	Johns	\N	latoya.johns@hotmail.com	7914 W. Woodsman St. 	Ballston Spa	NY	12020
1000	Shiloh	Reeves	\N	shiloh.reeves@msn.com	818 Kirkland Lane 	West Babylon	NY	11704
1001	Lee	Roman	(631) 913-6967	lee.roman@gmail.com	4 Canal Ave. 	Brentwood	NY	11717
1002	Cami	Williamson	\N	cami.williamson@hotmail.com	9511A Windsor Drive 	Massapequa	NY	11758
1003	Sharell	Ross	\N	sharell.ross@msn.com	7830 Devonshire Ave. 	Vista	CA	92083
1004	Jerald	Blackwell	\N	jerald.blackwell@hotmail.com	8364 South Wakehurst Ave. 	East Elmhurst	NY	11369
1005	Ruthanne	Franco	\N	ruthanne.franco@yahoo.com	61 Applegate St. 	Astoria	NY	11102
1006	Marjory	Leonard	\N	marjory.leonard@msn.com	800 Greystone Lane 	Apple Valley	CA	92307
1007	Jimmy	Russell	\N	jimmy.russell@hotmail.com	33 Iroquois Ave. 	Howard Beach	NY	11414
1008	Berneice	Pollard	\N	berneice.pollard@hotmail.com	607 Bohemia Street 	Forney	TX	75126
1009	Deangelo	Cooley	\N	deangelo.cooley@aol.com	3 NE. Edgewood Rd. 	Rosedale	NY	11422
1010	Katia	Henry	\N	katia.henry@msn.com	69 E. Columbia Ave. 	Bethpage	NY	11714
1011	Sebrina	Gross	\N	sebrina.gross@yahoo.com	993 Glendale Drive 	Garland	TX	75043
1012	Josephine	Dale	\N	josephine.dale@aol.com	8214 West Drive 	Baldwinsville	NY	13027
1013	Alma	Peck	\N	alma.peck@aol.com	298 South Bay Meadows Drive 	Corona	NY	11368
1014	Ling	Newman	\N	ling.newman@msn.com	832 Spring Road 	South Richmond Hill	NY	11419
1015	Nichelle	Rosario	\N	nichelle.rosario@hotmail.com	709 Dunbar Ave. 	Garden City	NY	11530
1016	Shenna	Benton	(212) 578-2912	shenna.benton@msn.com	57 Shadow Brook Road 	New York	NY	10002
1017	Philip	Bryan	(510) 533-4262	philip.bryan@hotmail.com	914 Devonshire Court 	Oakland	CA	94603
1018	Carita	Salinas	\N	carita.salinas@yahoo.com	90 Griffin Street 	Maspeth	NY	11378
1019	Janie	Herrera	\N	janie.herrera@gmail.com	652 Westport Street 	Elmhurst	NY	11373
1020	Lorraine	Marks	\N	lorraine.marks@msn.com	160 North Pearl Street 	San Carlos	CA	94070
1021	Nicolas	Carlson	\N	nicolas.carlson@yahoo.com	7899 Spruce Street 	Saint Albans	NY	11412
1022	Hye	Mercer	\N	hye.mercer@gmail.com	9681 Redwood St. 	Mahopac	NY	10541
1023	Adena	Blake	\N	adena.blake@hotmail.com	684 Westport Drive 	Ballston Spa	NY	12020
1024	Coleman	Boyd	(915) 607-6336	coleman.boyd@yahoo.com	9740 Bay Meadows Drive 	El Paso	TX	79930
1025	Daphine	Willis	\N	daphine.willis@msn.com	152 Shady St. 	Farmingdale	NY	11735
1026	Jenine	Dawson	\N	jenine.dawson@msn.com	17 Park Street 	Endicott	NY	13760
1027	Shanita	Wiley	\N	shanita.wiley@yahoo.com	121 Bridge Lane 	Saint Albans	NY	11412
1028	Shanna	Bonner	\N	shanna.bonner@msn.com	386 Lafayette Road 	Canandaigua	NY	14424
1029	Ping	Quinn	\N	ping.quinn@gmail.com	9051 Hanover Dr. 	Rowlett	TX	75088
1030	Saran	Moses	\N	saran.moses@yahoo.com	94 Hall Dr. 	Brooklyn	NY	11201
1031	Tonja	Bean	\N	tonja.bean@aol.com	9 Middle River St. 	Fairport	NY	14450
1032	Vernon	Knowles	\N	vernon.knowles@yahoo.com	5 Olive Lane 	Huntington Station	NY	11746
1033	Jeannette	Skinner	\N	jeannette.skinner@yahoo.com	8886 High Point Drive 	Forest Hills	NY	11375
1034	Rico	Salas	\N	rico.salas@msn.com	8041 Walt Whitman St. 	Centereach	NY	11720
1035	Tangela	Hurley	\N	tangela.hurley@msn.com	49 North Cross St. 	Campbell	CA	95008
1036	Randee	Lester	\N	randee.lester@gmail.com	81 Bear Hill Street 	Centereach	NY	11720
1037	Ashanti	Hammond	\N	ashanti.hammond@msn.com	9202 W. Lyme Ave. 	Nanuet	NY	10954
1038	Garry	Juarez	\N	garry.juarez@hotmail.com	670 Nut Swamp Drive 	Forest Hills	NY	11375
1039	Bee	Baker	\N	bee.baker@aol.com	307 E. Magnolia St. 	Liverpool	NY	13090
1040	Shantae	Hammond	\N	shantae.hammond@hotmail.com	526 Harvard Drive 	Victoria	TX	77904
1041	Bettye	Espinoza	\N	bettye.espinoza@yahoo.com	76 Rockwell Street 	Oswego	NY	13126
1042	Larissa	Hays	\N	larissa.hays@aol.com	66 2nd Drive 	Elmont	NY	11003
1043	Diane	Jones	\N	diane.jones@gmail.com	859 Prince St. 	Fresh Meadows	NY	11365
1044	Zenia	Bruce	\N	zenia.bruce@aol.com	349 James Road 	Rosedale	NY	11422
1045	Pasquale	Hogan	\N	pasquale.hogan@aol.com	403 Bank St. 	Vista	CA	92083
1046	Dane	Mcdaniel	\N	dane.mcdaniel@hotmail.com	891 Court Ave. 	Canandaigua	NY	14424
1047	Jamaal	Baker	\N	jamaal.baker@hotmail.com	186 Big Rock Cove Ave. 	Elmhurst	NY	11373
1048	Ji	Burt	\N	ji.burt@hotmail.com	40 S. Roberts Street 	Apple Valley	CA	92307
1049	Marcelino	Mcbride	\N	marcelino.mcbride@hotmail.com	29 Oxford Ave. 	Clifton Park	NY	12065
1050	Rozella	Fitzgerald	\N	rozella.fitzgerald@yahoo.com	7795 Myers Ave. 	Shirley	NY	11967
1051	Tonisha	Fowler	\N	tonisha.fowler@msn.com	9270 Valley View Lane 	Huntington Station	NY	11746
1052	Zora	Ford	(916) 192-3196	zora.ford@gmail.com	7416 La Sierra Dr. 	Sacramento	CA	95820
1053	Parthenia	Figueroa	\N	parthenia.figueroa@msn.com	550 Theatre Dr. 	Mahopac	NY	10541
1054	Arielle	Levine	\N	arielle.levine@yahoo.com	7100 High Ridge St. 	Garland	TX	75043
1055	Hildegarde	Christensen	\N	hildegarde.christensen@hotmail.com	488 East Mill Pond Ave. 	Maspeth	NY	11378
1056	Rebbecca	Espinoza	\N	rebbecca.espinoza@hotmail.com	8266 Valley Farms Road 	Mount Vernon	NY	10550
1057	Conchita	Boone	\N	conchita.boone@gmail.com	814 Birchpond Lane 	Mount Vernon	NY	10550
1058	Aisha	Woods	\N	aisha.woods@gmail.com	9292 Bear Hill Ave. 	Webster	NY	14580
1059	Season	Harvey	\N	season.harvey@yahoo.com	388 Arnold Court 	East Northport	NY	11731
1060	Tommie	Cooley	(717) 634-4113	tommie.cooley@yahoo.com	92 Hickory St. 	Lancaster	NY	14086
1061	Alanna	Barry	\N	alanna.barry@yahoo.com	33 Laurel Avenue 	Euless	TX	76039
1062	Jerri	Guthrie	\N	jerri.guthrie@msn.com	95 Sugar Dr. 	Carmel	NY	10512
1063	Tammy	Austin	\N	tammy.austin@yahoo.com	182 Stillwater Ave. 	Lake Jackson	TX	77566
1064	Patsy	Russo	\N	patsy.russo@gmail.com	8438 Fairway Avenue 	Rowlett	TX	75088
1065	Desiree	Branch	\N	desiree.branch@msn.com	67 Bayport Drive 	San Lorenzo	CA	94580
1066	Raeann	Duncan	(657) 256-2008	raeann.duncan@aol.com	126 Edgewood St. 	Anaheim	CA	92806
1067	Lillia	Gillespie	\N	lillia.gillespie@hotmail.com	382 Cardinal Dr. 	Rego Park	NY	11374
1068	Doris	Kaufman	\N	doris.kaufman@gmail.com	69 Fairground Dr. 	Duarte	CA	91010
1069	Rodolfo	Buck	\N	rodolfo.buck@gmail.com	8359 Brewery Street 	Shirley	NY	11967
1070	Olimpia	Mays	\N	olimpia.mays@aol.com	42 Nichols Lane 	Oakland Gardens	NY	11364
1071	Shemeka	Lyons	\N	shemeka.lyons@msn.com	97 South Jockey Hollow St. 	Pomona	CA	91768
1072	Maryalice	Henry	\N	maryalice.henry@msn.com	85 Prince Street 	Richardson	TX	75080
1073	Leeanne	Cross	\N	leeanne.cross@yahoo.com	424 Newcastle Road 	Bayside	NY	11361
1074	Lanelle	Guerra	\N	lanelle.guerra@yahoo.com	989 Wrangler St. 	Floral Park	NY	11001
1075	Dann	Huff	\N	dann.huff@gmail.com	475 S. Rockville St. 	Huntington Station	NY	11746
1076	Sherise	Mercer	\N	sherise.mercer@gmail.com	9401 Catherine Dr. 	Vista	CA	92083
1077	Heather	Perry	\N	heather.perry@gmail.com	982 Durham Street 	Sunnyside	NY	11104
1078	Theresia	Barron	\N	theresia.barron@aol.com	951 Wild Rose Street 	Forest Hills	NY	11375
1079	Cindi	Ellis	\N	cindi.ellis@yahoo.com	6 Cypress Lane 	Floral Park	NY	11001
1080	Mirella	Duffy	\N	mirella.duffy@yahoo.com	43 University Ave. 	Longview	TX	75604
1081	Carson	Macias	\N	carson.macias@gmail.com	7 Pennington St. 	New Rochelle	NY	10801
1082	Divina	Madden	(562) 264-3998	divina.madden@gmail.com	7314 Armstrong St. 	Long Beach	NY	11561
1083	Cher	Alston	\N	cher.alston@msn.com	38 Wild Horse Road 	Wantagh	NY	11793
1084	Regine	Odom	\N	regine.odom@msn.com	684 N. Mayfield Ave. 	Franklin Square	NY	11010
1085	Adam	Thornton	\N	adam.thornton@hotmail.com	755 East Henry Lane 	Central Islip	NY	11722
1086	Cori	Schwartz	\N	cori.schwartz@msn.com	43 Lancaster Lane 	Jamaica	NY	11432
1087	Willow	Gardner	\N	willow.gardner@gmail.com	57 S. Lakewood Dr. 	Pleasanton	CA	94566
1088	Jane	Henderson	\N	jane.henderson@hotmail.com	46 Carson Drive 	Apple Valley	CA	92307
1089	Chere	Mcfadden	\N	chere.mcfadden@yahoo.com	695 San Pablo Drive 	Orchard Park	NY	14127
1090	Ira	Erickson	\N	ira.erickson@aol.com	6 Lake Forest St. 	Port Jefferson Station	NY	11776
1091	Risa	Gallagher	\N	risa.gallagher@yahoo.com	8281 Edgefield Drive 	Rocklin	CA	95677
1092	Lavinia	Cotton	\N	lavinia.cotton@yahoo.com	7485 Bridle Street 	East Northport	NY	11731
1093	Alejandrina	Hodges	\N	alejandrina.hodges@msn.com	7598 Shadow Brook St. 	Deer Park	NY	11729
1094	Keitha	Black	\N	keitha.black@yahoo.com	7670 Hilldale Ave. 	Lindenhurst	NY	11757
1095	Corene	Swanson	\N	corene.swanson@aol.com	597 Lakeshore Lane 	Rego Park	NY	11374
1096	Tonda	Webb	\N	tonda.webb@yahoo.com	53 SW. Edgemont Rd. 	Baldwinsville	NY	13027
1097	Collen	Dennis	\N	collen.dennis@gmail.com	284 E. Mill Street 	San Pablo	CA	94806
1098	Treasa	Dickerson	\N	treasa.dickerson@hotmail.com	70 W. Creekside Road 	Rockville Centre	NY	11570
1099	Jewell	Reyes	\N	jewell.reyes@hotmail.com	8711 Glen Creek Drive 	Jackson Heights	NY	11372
1100	Penny	Acevedo	\N	penny.acevedo@yahoo.com	318 Mulberry Drive 	Ballston Spa	NY	12020
1101	Louise	Flowers	\N	louise.flowers@yahoo.com	28 N. Gregory Court 	Depew	NY	14043
1102	Henrietta	Wagner	(682) 143-2224	henrietta.wagner@hotmail.com	54 Brickyard St. 	Fort Worth	TX	76110
1103	Ardelia	Cooley	\N	ardelia.cooley@aol.com	59 Henry Smith St. 	Canyon Country	CA	91387
1104	Khalilah	Robertson	\N	khalilah.robertson@aol.com	22 Longbranch Rd. 	Spring Valley	NY	10977
1105	Armando	Black	\N	armando.black@gmail.com	8611 N. Poor House St. 	Richardson	TX	75080
1106	Jerri	Henry	\N	jerri.henry@msn.com	141 N. Purple Finch Avenue 	Spring Valley	NY	10977
1107	Lynda	Newman	\N	lynda.newman@msn.com	44 SW. Thomas Ave. 	Saratoga Springs	NY	12866
1108	Bao	Wade	\N	bao.wade@gmail.com	7587 Church St. 	Desoto	TX	75115
1109	Gussie	Harding	\N	gussie.harding@gmail.com	41 Edgefield Avenue 	Deer Park	NY	11729
1110	Shirely	Cantrell	\N	shirely.cantrell@aol.com	6 Kent Street 	West Hempstead	NY	11552
1111	Caroline	Jenkins	\N	caroline.jenkins@msn.com	86 River Lane 	Richardson	TX	75080
1112	Hollis	Rasmussen	\N	hollis.rasmussen@yahoo.com	8949 S. Gates Road 	Massapequa	NY	11758
1113	Kendra	Harrington	\N	kendra.harrington@yahoo.com	768 Cooper Street 	Jamestown	NY	14701
1114	Douglass	Blankenship	(229) 891-2087	douglass.blankenship@hotmail.com	409 W. Rock Maple Lane 	Albany	NY	12203
1115	Lina	Meadows	\N	lina.meadows@aol.com	7020 Ashley Rd. 	Glen Cove	NY	11542
1116	Patria	Harper	\N	patria.harper@msn.com	90 Arlington St. 	Astoria	NY	11102
1117	Jeffrey	Hill	\N	jeffrey.hill@gmail.com	2 Shub Farm St. 	Rosedale	NY	11422
1118	Ja	Dillard	\N	ja.dillard@yahoo.com	25 Orchard St. 	Canyon Country	CA	91387
1119	Tora	Dunlap	\N	tora.dunlap@hotmail.com	9903 North Halifax Ave. 	Monsey	NY	10952
1120	Karole	Alvarez	\N	karole.alvarez@gmail.com	69 Woodland St. 	East Northport	NY	11731
1121	Shasta	Combs	\N	shasta.combs@yahoo.com	726 James Dr. 	Yorktown Heights	NY	10598
1122	Cicely	Deleon	\N	cicely.deleon@yahoo.com	751 Newbridge Ave. 	Massapequa Park	NY	11762
1123	Raphael	O'neil	\N	raphael.o'neil@aol.com	762 East Lantern Dr. 	Fairport	NY	14450
1124	Hubert	Reilly	\N	hubert.reilly@hotmail.com	9004 N. Lake Rd. 	Amityville	NY	11701
1125	Caleb	England	\N	caleb.england@gmail.com	649 Marvon St. 	Pleasanton	CA	94566
1126	Elmira	Levy	\N	elmira.levy@gmail.com	6 Columbia Dr. 	Spring Valley	NY	10977
1127	Waldo	Hart	\N	waldo.hart@yahoo.com	9782 Pineknoll Lane 	Queensbury	NY	12804
1128	Bea	Kane	\N	bea.kane@aol.com	398 Green Lake Ave. 	Mahopac	NY	10541
1129	Gilberto	Sanders	\N	gilberto.sanders@hotmail.com	186 Roehampton Ave. 	Woodside	NY	11377
1130	Benny	Bender	\N	benny.bender@aol.com	520 W. Hamilton St. 	Elmont	NY	11003
1131	Desmond	Rose	\N	desmond.rose@hotmail.com	9956 Lexington Rd. 	Mount Vernon	NY	10550
1132	Parthenia	Holman	\N	parthenia.holman@gmail.com	17 Orange Court 	Ithaca	NY	14850
1133	Dung	King	\N	dung.king@aol.com	523 Prairie St. 	West Islip	NY	11795
1134	Sherril	Alvarado	\N	sherril.alvarado@hotmail.com	9434 Cypress Court 	Desoto	TX	75115
1135	Alisia	Albert	\N	alisia.albert@gmail.com	9490 Coffee St. 	Garland	TX	75043
1136	Kallie	Best	(507) 997-4112	kallie.best@aol.com	9842 Fairview St. 	Rochester	NY	14606
1137	Dottie	Roberts	\N	dottie.roberts@aol.com	8252 Theatre St. 	Port Washington	NY	11050
1138	Hubert	Stone	\N	hubert.stone@hotmail.com	203 Penn St. 	Ridgecrest	CA	93555
1139	Gabriella	Jones	\N	gabriella.jones@hotmail.com	9100 Gates Ave. 	Mount Vernon	NY	10550
1140	Penney	Hall	\N	penney.hall@msn.com	8306 Jockey Hollow Street 	Liverpool	NY	13090
1141	Mallie	Osborn	\N	mallie.osborn@gmail.com	9022 Bridgeton St. 	Newburgh	NY	12550
1142	Britteny	Schroeder	\N	britteny.schroeder@aol.com	855 Bohemia Dr. 	Pittsford	NY	14534
1143	Sommer	Hopkins	\N	sommer.hopkins@gmail.com	827 Laurel Ave. 	Tonawanda	NY	14150
1144	Jewel	Sparks	\N	jewel.sparks@aol.com	12 Vine Road 	Oakland Gardens	NY	11364
1145	Deandrea	Vega	(914) 818-7312	deandrea.vega@gmail.com	613 Mill Pond St. 	Yonkers	NY	10701
1146	Charlsie	Carson	\N	charlsie.carson@hotmail.com	3 South Grant Avenue 	Saint Albans	NY	11412
1147	Kandace	Ayers	\N	kandace.ayers@gmail.com	9005 Lookout Lane 	Santa Monica	CA	90403
1148	Lenore	Valdez	\N	lenore.valdez@msn.com	829 Birchpond Street 	Spring Valley	NY	10977
1149	Drucilla	Gilliam	\N	drucilla.gilliam@hotmail.com	8257 E. Westminster Ave. 	Santa Clara	CA	95050
1150	Keturah	Reid	(361) 394-2024	keturah.reid@yahoo.com	747 SE. Beech Ave. 	Corpus Christi	TX	78418
1151	Herminia	Reyes	\N	herminia.reyes@gmail.com	782 Stonybrook Street 	Centereach	NY	11720
1152	Tuyet	Rosa	\N	tuyet.rosa@aol.com	9038 Golden Star Street 	South El Monte	CA	91733
1153	Ara	Vazquez	\N	ara.vazquez@msn.com	343 2nd Court 	San Carlos	CA	94070
1154	Barry	Albert	\N	barry.albert@gmail.com	13 Grand St. 	Auburn	NY	13021
1155	Verdell	Joyner	\N	verdell.joyner@aol.com	9191 Sierra St. 	Far Rockaway	NY	11691
1156	Han	Wade	\N	han.wade@hotmail.com	587 Sulphur Springs St. 	Howard Beach	NY	11414
1157	Anton	Barton	(716) 472-3707	anton.barton@msn.com	7284 East Indian Spring Rd. 	Buffalo	NY	14215
1158	Vito	Pickett	\N	vito.pickett@hotmail.com	93 High Point Street 	Canandaigua	NY	14424
1159	Charlene	Norris	\N	charlene.norris@msn.com	972 South Sierra Drive 	Syosset	NY	11791
1160	Efren	Whitfield	\N	efren.whitfield@gmail.com	139 Union Rd. 	Euless	TX	76039
1161	Santa	Larson	\N	santa.larson@gmail.com	5 Bellevue Dr. 	Valley Stream	NY	11580
1162	Carmelina	Sellers	\N	carmelina.sellers@hotmail.com	12 Race St. 	Ithaca	NY	14850
1163	Carmela	Hays	\N	carmela.hays@aol.com	149 Pennington Ave. 	Lawndale	CA	90260
1164	Patrina	Tanner	\N	patrina.tanner@gmail.com	7136 Selby Road 	Scarsdale	NY	10583
1165	Rikki	Morrow	(682) 936-1482	rikki.morrow@hotmail.com	7096 Plumb Branch Road 	Fort Worth	TX	76110
1166	Junita	Reese	\N	junita.reese@gmail.com	8773 North Walt Whitman Court 	Bay Shore	NY	11706
1167	Ryan	Carter	\N	ryan.carter@yahoo.com	8684 Studebaker Road 	Nanuet	NY	10954
1168	Almeta	Benjamin	\N	almeta.benjamin@aol.com	8456 Oakwood St. 	Sunnyside	NY	11104
1169	Beatris	Joyner	\N	beatris.joyner@gmail.com	7463 Gonzales Rd. 	Spring Valley	NY	10977
1170	Mechelle	Chan	\N	mechelle.chan@gmail.com	458 Overlook Street 	Richmond Hill	NY	11418
1171	Earlean	Pena	\N	earlean.pena@yahoo.com	7698 Fulton St. 	Rome	NY	13440
1172	Katherin	Clark	\N	katherin.clark@yahoo.com	996 Iroquois Street 	Pittsford	NY	14534
1173	Chanel	May	\N	chanel.may@msn.com	806 Saxton Court 	Garden City	NY	11530
1174	Aaron	Knapp	(914) 402-4335	aaron.knapp@yahoo.com	807 Grandrose Ave. 	Yonkers	NY	10701
1175	Sindy	Anderson	\N	sindy.anderson@gmail.com	543 Halifax Ave. 	Pomona	CA	91768
1176	Sheree	Blanchard	\N	sheree.blanchard@gmail.com	41 Glenwood Ave. 	Queensbury	NY	12804
1177	Charlesetta	Soto	\N	charlesetta.soto@yahoo.com	25 South Colonial Drive 	Poughkeepsie	NY	12601
1178	Wendie	Nash	(805) 389-2549	wendie.nash@hotmail.com	9 South Road 	Oxnard	CA	93035
1179	Vernetta	Banks	\N	vernetta.banks@aol.com	7633 Albany St. 	Brooklyn	NY	11201
1180	Myrtle	Gardner	\N	myrtle.gardner@aol.com	303 Creekside Street 	Farmingdale	NY	11735
1181	Agustina	Lawrence	\N	agustina.lawrence@yahoo.com	9347 Delaware Ave. 	Brooklyn	NY	11201
1182	Trinidad	Chapman	\N	trinidad.chapman@aol.com	7371 Glen Eagles Street 	Ronkonkoma	NY	11779
1183	Kim	Clark	\N	kim.clark@msn.com	19 Liberty St. 	Merrick	NY	11566
1184	Annabelle	Hebert	\N	annabelle.hebert@aol.com	9745 Nicolls Lane 	Spring Valley	NY	10977
1185	Corine	Stuart	\N	corine.stuart@msn.com	5 Penn Street 	Clifton Park	NY	12065
1186	Kiesha	Bond	\N	kiesha.bond@aol.com	29 Marvon St. 	San Carlos	CA	94070
1187	Kenyetta	Mason	\N	kenyetta.mason@msn.com	98 Poplar Ave. 	Flushing	NY	11354
1188	Marcene	Curtis	(914) 361-6045	marcene.curtis@msn.com	7699 Illinois Lane 	Yonkers	NY	10701
1189	Sheila	Goodman	\N	sheila.goodman@msn.com	9586 Chestnut St. 	Uniondale	NY	11553
1190	Romeo	Steele	\N	romeo.steele@msn.com	162 Crescent Lane 	Port Jefferson Station	NY	11776
1191	Tam	Fisher	(507) 351-9375	tam.fisher@aol.com	8000 Woodsman Lane 	Rochester	NY	14606
1192	Gena	Owens	\N	gena.owens@gmail.com	43 Buckingham St. 	Desoto	TX	75115
1193	Phebe	Soto	\N	phebe.soto@hotmail.com	9239 Leatherwood Rd. 	South Ozone Park	NY	11420
1194	Leticia	Snyder	\N	leticia.snyder@yahoo.com	173 Lyme Dr. 	Pittsford	NY	14534
1195	Chantell	Bridges	(716) 941-6072	chantell.bridges@yahoo.com	8478 N. Wrangler Dr. 	Buffalo	NY	14215
1196	Ileana	Holt	\N	ileana.holt@msn.com	817 Adams St. 	Patchogue	NY	11772
1197	Nakisha	Clay	\N	nakisha.clay@gmail.com	8996 Beechwood Ave. 	Port Washington	NY	11050
1198	Cheryll	Snyder	\N	cheryll.snyder@yahoo.com	77 E. Liberty St. 	Brooklyn	NY	11201
1199	Consuela	Collier	\N	consuela.collier@msn.com	338 S. Holly Avenue 	North Tonawanda	NY	14120
1200	Aubrey	Durham	\N	aubrey.durham@aol.com	14 Foster Ave. 	Port Washington	NY	11050
1201	Nita	Guy	\N	nita.guy@hotmail.com	75 Academy Street 	Port Chester	NY	10573
1202	Carmina	Emerson	\N	carmina.emerson@hotmail.com	7137 Monroe Road 	Banning	CA	92220
1203	Georgeann	Rojas	\N	georgeann.rojas@msn.com	691 Devon Ave. 	Desoto	TX	75115
1204	Leslie	Higgins	\N	leslie.higgins@hotmail.com	805 Logan Ave. 	Saratoga Springs	NY	12866
1205	Emmaline	Huber	\N	emmaline.huber@gmail.com	7975 Harrison Rd. 	Mount Vernon	NY	10550
1206	Mercy	Brown	\N	mercy.brown@msn.com	8207 Central Street 	Hollis	NY	11423
1207	Jenell	Crosby	(631) 544-4772	jenell.crosby@hotmail.com	507 Fulton Street 	Brentwood	NY	11717
1208	Leila	Barr	\N	leila.barr@yahoo.com	120 Fremont Rd. 	Carmel	NY	10512
1209	Deandrea	Cox	\N	deandrea.cox@msn.com	617 Sycamore Street 	Huntington	NY	11743
1210	Shawnna	Frank	\N	shawnna.frank@hotmail.com	17 NW. Cottage Lane 	Woodside	NY	11377
1211	Brenton	Whitaker	\N	brenton.whitaker@gmail.com	25 Elmwood Rd. 	Niagara Falls	NY	14304
1212	Jaqueline	Cummings	\N	jaqueline.cummings@hotmail.com	478 Wrangler St. 	Huntington Station	NY	11746
1213	Yang	Giles	\N	yang.giles@gmail.com	25 Bridle Lane 	San Angelo	TX	76901
1214	Brigid	Sharp	\N	brigid.sharp@hotmail.com	495 Sleepy Hollow Court 	Santa Clara	CA	95050
1215	Karl	Stephens	\N	karl.stephens@gmail.com	208 Thatcher Rd. 	Rockville Centre	NY	11570
1216	Elvina	Gates	\N	elvina.gates@hotmail.com	112 Smith St. 	Pleasanton	CA	94566
1217	Carlie	Terrell	(914) 517-8036	carlie.terrell@yahoo.com	7437 Snake Hill Road 	Yonkers	NY	10701
1218	Donovan	Cantrell	(510) 624-3824	donovan.cantrell@msn.com	601 Winchester Dr. 	Oakland	CA	94603
1219	Alden	Atkinson	\N	alden.atkinson@gmail.com	46 Valley St. 	Shirley	NY	11967
1220	Carissa	Cross	\N	carissa.cross@yahoo.com	9335 West Main Dr. 	Huntington Station	NY	11746
1221	Joy	Underwood	\N	joy.underwood@gmail.com	7297 Armstrong Dr. 	Apple Valley	CA	92307
1222	Geraldine	O'donnell	\N	geraldine.o'donnell@hotmail.com	8241 Lookout Rd. 	Flushing	NY	11354
1223	Bronwyn	Vargas	\N	bronwyn.vargas@msn.com	35 James Street 	New Windsor	NY	12553
1224	Abram	Copeland	\N	abram.copeland@gmail.com	9782 Indian Spring Lane 	Harlingen	TX	78552
1225	Mellisa	Griffin	\N	mellisa.griffin@msn.com	49 Alton Circle 	Los Banos	CA	93635
1226	Qiana	Jackson	\N	qiana.jackson@gmail.com	56 Galvin Street 	East Northport	NY	11731
1227	Magali	Dixon	(248) 279-5331	magali.dixon@msn.com	815 Del Monte Court 	Troy	NY	12180
1228	Zulema	Clemons	(510) 565-8496	zulema.clemons@aol.com	75 W. Howard St. 	Oakland	CA	94603
1229	Carina	Lynch	\N	carina.lynch@gmail.com	64 Jennings Road 	Wappingers Falls	NY	12590
1230	Jesus	Burch	\N	jesus.burch@hotmail.com	7024 Squaw Creek Street 	Desoto	TX	75115
1231	Selene	Vega	\N	selene.vega@gmail.com	11 Sierra St. 	Campbell	CA	95008
1232	Jong	Guthrie	\N	jong.guthrie@hotmail.com	889 Leatherwood Drive 	Bethpage	NY	11714
1233	Lise	Hebert	\N	lise.hebert@gmail.com	140 East Broad Lane 	Vista	CA	92083
1234	Joshua	Berg	\N	joshua.berg@hotmail.com	16 East St. 	Ossining	NY	10562
1235	Georgina	Gonzales	\N	georgina.gonzales@yahoo.com	307 Chapel St. 	Endicott	NY	13760
1236	Rudolph	Velez	\N	rudolph.velez@yahoo.com	9397 Pleasant Drive 	Mount Vernon	NY	10550
1237	Luke	Kramer	\N	luke.kramer@hotmail.com	7955 Delaware Drive 	Bethpage	NY	11714
1238	Edgar	Quinn	\N	edgar.quinn@aol.com	556 Dogwood Ave. 	Harlingen	TX	78552
1239	Tara	Maynard	\N	tara.maynard@hotmail.com	9375 Fordham Street 	Lindenhurst	NY	11757
1240	Bella	Perez	\N	bella.perez@msn.com	43 Green Lake Street 	Duarte	CA	91010
1241	Nathaniel	Davidson	\N	nathaniel.davidson@hotmail.com	7476 Henry Smith Street 	Rome	NY	13440
1242	Chauncey	Donaldson	\N	chauncey.donaldson@aol.com	7412 Golf Ave. 	Franklin Square	NY	11010
1243	Heide	Reed	\N	heide.reed@yahoo.com	9174 Coffee Drive 	Floral Park	NY	11001
1244	Trang	Hardin	\N	trang.hardin@yahoo.com	9255 Myers Drive 	Depew	NY	14043
1245	Gabriela	Warren	(562) 986-2247	gabriela.warren@aol.com	9947 Brewery Ave. 	Long Beach	NY	11561
1246	Dale	Rasmussen	\N	dale.rasmussen@aol.com	8590 Adams Street 	Kingston	NY	12401
1247	Tammie	Cherry	\N	tammie.cherry@hotmail.com	791 Wakehurst Dr. 	Massapequa	NY	11758
1248	Bethany	Herring	\N	bethany.herring@yahoo.com	7563 High Point Street 	Port Jefferson Station	NY	11776
1249	Barbra	Dickerson	\N	barbra.dickerson@gmail.com	8424 E. Rockcrest Dr. 	Ridgecrest	CA	93555
1250	Neoma	Daugherty	\N	neoma.daugherty@gmail.com	80 Spring Street 	Mount Vernon	NY	10550
1251	Nanette	Roman	\N	nanette.roman@yahoo.com	8254 North Riverview Street 	Glendora	CA	91740
1252	Adriene	Rollins	\N	adriene.rollins@msn.com	55 Cambridge Street 	Plainview	NY	11803
1253	Susannah	Fields	\N	susannah.fields@hotmail.com	17 Railroad Street 	Far Rockaway	NY	11691
1254	Dung	Reid	\N	dung.reid@msn.com	468 West Washington Ave. 	Canyon Country	CA	91387
1255	Ben	Stone	\N	ben.stone@gmail.com	8855 University St. 	Ithaca	NY	14850
1256	Nubia	Anderson	\N	nubia.anderson@aol.com	584 NW. Hilldale Drive 	Ronkonkoma	NY	11779
1257	Rosamaria	Meyer	\N	rosamaria.meyer@yahoo.com	446 Elizabeth St. 	Webster	NY	14580
1258	Todd	Waters	\N	todd.waters@yahoo.com	92 Cedar Swamp Street 	Bay Shore	NY	11706
1259	Kimbery	Nieves	\N	kimbery.nieves@msn.com	768 Roehampton St. 	San Carlos	CA	94070
1260	Phuong	Wolf	\N	phuong.wolf@yahoo.com	7765 N. Annadale Dr. 	Schenectady	NY	12302
1261	Adelaida	Hancock	\N	adelaida.hancock@aol.com	669 S. Gartner Street 	San Pablo	CA	94806
1262	Brianne	Hays	\N	brianne.hays@gmail.com	88 Tailwater Ave. 	San Pablo	CA	94806
1263	Rufina	Chandler	\N	rufina.chandler@aol.com	7985 Alderwood Street 	New Hyde Park	NY	11040
1264	Devin	Velazquez	(631) 254-8497	devin.velazquez@aol.com	61 Redwood St. 	Brentwood	NY	11717
1265	Bonita	Marshall	\N	bonita.marshall@msn.com	48 Bald Hill Drive 	Endicott	NY	13760
1266	Myrl	Gay	\N	myrl.gay@hotmail.com	8708 Taylor Lane 	Garland	TX	75043
1267	Earline	Gordon	\N	earline.gordon@gmail.com	81 Railroad Drive 	Ronkonkoma	NY	11779
1268	Sung	Chambers	\N	sung.chambers@gmail.com	369 N. Virginia Street 	Kingston	NY	12401
1269	Gustavo	Gamble	\N	gustavo.gamble@msn.com	8054 W. Meadowbrook Street 	Port Washington	NY	11050
1270	Ciera	Webb	\N	ciera.webb@yahoo.com	958 Anderson Ave. 	Orchard Park	NY	14127
1271	Roy	Chan	\N	roy.chan@hotmail.com	7578 Middle River St. 	Pomona	CA	91768
1272	Houston	Vasquez	\N	houston.vasquez@msn.com	845 Aspen Street 	Fullerton	CA	92831
1273	Cheree	Hale	\N	cheree.hale@yahoo.com	95 Lyme Avenue 	Oswego	NY	13126
1274	Odette	Moses	\N	odette.moses@gmail.com	899 Overlook Lane 	Newburgh	NY	12550
1275	Lenita	Bonner	\N	lenita.bonner@aol.com	7286 Swanson Drive 	Los Banos	CA	93635
1276	Shona	Mcmillan	\N	shona.mcmillan@msn.com	57 West Maple Dr. 	Apple Valley	CA	92307
1277	Piedad	Irwin	\N	piedad.irwin@hotmail.com	581 Garden St. 	Coram	NY	11727
1278	Loan	Graham	\N	loan.graham@yahoo.com	57 Glen Eagles St. 	Jackson Heights	NY	11372
1279	Stan	Saunders	\N	stan.saunders@yahoo.com	407 Essex Dr. 	Canandaigua	NY	14424
1280	Jackeline	Colon	\N	jackeline.colon@msn.com	9916 Cedarwood Drive 	Wappingers Falls	NY	12590
1281	Marlen	Dawson	\N	marlen.dawson@msn.com	67 Oak Valley Street 	Woodside	NY	11377
1282	Alexis	Mack	(845) 707-6088	alexis.mack@aol.com	7767 Sutor Ave. 	New City	NY	10956
1283	Mica	Barry	\N	mica.barry@yahoo.com	3 SE. Sugar St. 	Hopewell Junction	NY	12533
1284	Shanice	Spears	\N	shanice.spears@msn.com	5 Piper Ave. 	Brooklyn	NY	11201
1285	Garth	Huff	\N	garth.huff@yahoo.com	794 East University St. 	Glendora	CA	91740
1286	Dione	Pratt	\N	dione.pratt@msn.com	864 Winding Way St. 	Pleasanton	CA	94566
1287	Victor	Pittman	\N	victor.pittman@aol.com	9294 Devon Dr. 	Astoria	NY	11102
1288	Allie	Conley	\N	allie.conley@msn.com	96 High Point Road 	Lawndale	CA	90260
1289	Shanelle	Anderson	\N	shanelle.anderson@yahoo.com	646 Surrey Street 	Bethpage	NY	11714
1290	Minnie	Compton	\N	minnie.compton@gmail.com	185 Hudson Street 	South Richmond Hill	NY	11419
1291	Shiloh	Bates	\N	shiloh.bates@msn.com	15 Wellington Dr. 	Monsey	NY	10952
1292	Lakenya	Oliver	\N	lakenya.oliver@yahoo.com	82 Bayport Court 	San Lorenzo	CA	94580
1293	Sally	Kinney	\N	sally.kinney@msn.com	7565 High Dr. 	Floral Park	NY	11001
1294	Edith	Davenport	\N	edith.davenport@gmail.com	685 Alton Road 	Ontario	CA	91762
1295	Alline	Beasley	\N	alline.beasley@yahoo.com	8704 NE. Olive Ave. 	North Tonawanda	NY	14120
1296	Travis	Whitley	\N	travis.whitley@aol.com	60 Euclid Ave. 	Saint Albans	NY	11412
1297	Vanessa	West	\N	vanessa.west@gmail.com	34 Prairie Lane 	New Rochelle	NY	10801
1298	Trudy	Riddle	\N	trudy.riddle@aol.com	8943 Johnson Street 	Schenectady	NY	12302
1299	Shauna	Edwards	\N	shauna.edwards@msn.com	8 Dogwood Ave. 	Yorktown Heights	NY	10598
1300	Clorinda	Donovan	\N	clorinda.donovan@msn.com	9690 E. Morris Ave. 	Jamestown	NY	14701
1301	Raven	Curtis	\N	raven.curtis@aol.com	18 Summit Lane 	Lawndale	CA	90260
1302	Verda	Gilbert	\N	verda.gilbert@gmail.com	54 Hillcrest Drive 	East Northport	NY	11731
1303	Renay	Atkins	\N	renay.atkins@aol.com	7146 Leeton Ridge Ave. 	Woodside	NY	11377
1304	Tama	Berg	\N	tama.berg@hotmail.com	3 Cardinal Avenue 	Hollis	NY	11423
1305	Dalia	Carson	(507) 186-2004	dalia.carson@aol.com	7175 Galvin St. 	Rochester	NY	14606
1306	America	Swanson	\N	america.swanson@msn.com	83 South Arlington Lane 	Webster	NY	14580
1307	Cinda	Rocha	\N	cinda.rocha@hotmail.com	926 North Oklahoma Dr. 	Los Banos	CA	93635
1308	Shea	Howell	\N	shea.howell@msn.com	67 Arch Rd. 	South El Monte	CA	91733
1309	Kimberli	Cline	\N	kimberli.cline@yahoo.com	7115 Stonybrook Court 	Centereach	NY	11720
1310	Emanuel	Mckee	\N	emanuel.mckee@yahoo.com	9411 Lake Dr. 	Schenectady	NY	12302
1311	Whitley	Cannon	\N	whitley.cannon@msn.com	614 High Point Lane 	Coram	NY	11727
1312	Tereasa	Bird	\N	tereasa.bird@aol.com	7526 Vine Drive 	Ronkonkoma	NY	11779
1313	Dante	Grimes	\N	dante.grimes@yahoo.com	23 Shore St. 	Duarte	CA	91010
1314	Joeann	Garrison	\N	joeann.garrison@yahoo.com	1 Harrison St. 	Ontario	CA	91762
1315	Omega	Johnston	\N	omega.johnston@gmail.com	9935 Tarkiln Hill St. 	Canyon Country	CA	91387
1316	Conrad	Mueller	\N	conrad.mueller@yahoo.com	3 Myrtle St. 	Massapequa	NY	11758
1317	Glady	Wells	\N	glady.wells@gmail.com	627 Ramblewood Ave. 	Syosset	NY	11791
1318	Tisha	Petty	(210) 851-3122	tisha.petty@msn.com	9083 Lake View Ave. 	San Antonio	TX	78213
1319	Claris	Santiago	\N	claris.santiago@msn.com	763 Mountainview Dr. 	Newburgh	NY	12550
1320	Obdulia	Barber	\N	obdulia.barber@gmail.com	878 Lexington Rd. 	Newburgh	NY	12550
1321	Shantel	Gregory	\N	shantel.gregory@yahoo.com	7722 Second Lane 	West Islip	NY	11795
1322	Ai	Forbes	\N	ai.forbes@yahoo.com	254 Central St. 	Franklin Square	NY	11010
1323	Ebony	Cotton	\N	ebony.cotton@yahoo.com	8979 Miller St. 	West Babylon	NY	11704
1324	Arla	Ellis	\N	arla.ellis@yahoo.com	127 Crescent Ave. 	Utica	NY	13501
1325	Magdalena	Sherman	\N	magdalena.sherman@gmail.com	176 Sunbeam St. 	Oswego	NY	13126
1326	Tarra	Guerrero	\N	tarra.guerrero@aol.com	10 Baker St. 	Auburn	NY	13021
1327	Consuela	Romero	\N	consuela.romero@hotmail.com	54 Elm Court 	Monroe	NY	10950
1328	Cindie	Franklin	\N	cindie.franklin@yahoo.com	7249 Franklin St. 	Lawndale	CA	90260
1329	Sharyn	Brewer	\N	sharyn.brewer@aol.com	70 Columbia Ave. 	Hollis	NY	11423
1330	Karren	Stevenson	\N	karren.stevenson@aol.com	155 Old York St. 	San Carlos	CA	94070
1331	Divina	Reeves	\N	divina.reeves@hotmail.com	767 Bradford Dr. 	Newburgh	NY	12550
1332	Novella	Ross	\N	novella.ross@gmail.com	9418 Acacia Drive 	Glendora	CA	91740
1333	Omega	Huff	\N	omega.huff@aol.com	63 Devon St. 	Santa Monica	CA	90403
1334	Ashleigh	Finch	\N	ashleigh.finch@yahoo.com	82 Hudson Court 	Newburgh	NY	12550
1335	Corina	Lynch	\N	corina.lynch@msn.com	44 Sunbeam Dr. 	Rosedale	NY	11422
1336	Joe	Melton	\N	joe.melton@gmail.com	8998 Hartford Street 	New Windsor	NY	12553
1337	Bernetta	Summers	\N	bernetta.summers@aol.com	1 Young Ave. 	Longview	TX	75604
1338	Inez	Snider	\N	inez.snider@gmail.com	837 Catherine Lane 	Ronkonkoma	NY	11779
1339	Neida	King	(442) 778-1121	neida.king@aol.com	137 Bohemia St. 	Oceanside	NY	11572
1340	Tona	Velasquez	\N	tona.velasquez@msn.com	9166 Trout St. 	Whitestone	NY	11357
1341	Rozanne	Reyes	\N	rozanne.reyes@aol.com	11 W. Surrey Drive 	Garden City	NY	11530
1342	Lekisha	Pope	\N	lekisha.pope@msn.com	390 Livingston Avenue 	Freeport	NY	11520
1343	Jama	Rodriquez	\N	jama.rodriquez@msn.com	681 Smith Dr. 	Upland	CA	91784
1344	Eloisa	Tucker	\N	eloisa.tucker@hotmail.com	7268 Leatherwood Ave. 	Howard Beach	NY	11414
1345	Arie	Hunter	\N	arie.hunter@msn.com	66 Old State Rd. 	Flushing	NY	11354
1346	Sanora	Webster	(424) 464-7290	sanora.webster@msn.com	74 Beach St. 	Los Angeles	CA	90008
1347	Kate	Barber	\N	kate.barber@hotmail.com	46 W. Oak Valley Ave. 	Saratoga Springs	NY	12866
1348	Yvone	Guerrero	\N	yvone.guerrero@aol.com	8548 Jackson Ave. 	Merrick	NY	11566
1349	Kami	Rios	\N	kami.rios@yahoo.com	8400 8th Dr. 	Encino	CA	91316
1350	Annett	Rush	\N	annett.rush@hotmail.com	758 Fordham Lane 	Rosedale	NY	11422
1351	Carman	Hardy	\N	carman.hardy@yahoo.com	800 Whitemarsh St. 	Jamestown	NY	14701
1352	Dorothea	Miranda	\N	dorothea.miranda@aol.com	7882 Parker St. 	Upland	CA	91784
1353	Agatha	Daniels	\N	agatha.daniels@yahoo.com	125 Canal St. 	South El Monte	CA	91733
1354	Alexandria	Zamora	\N	alexandria.zamora@yahoo.com	95 Cherry Circle 	Schenectady	NY	12302
1355	Thad	Gilliam	\N	thad.gilliam@hotmail.com	8844 Gonzales Court 	Levittown	NY	11756
1356	Inger	Jennings	\N	inger.jennings@yahoo.com	38 NW. Shore Lane 	Patchogue	NY	11772
1357	Karren	Lamb	(559) 628-2239	karren.lamb@aol.com	35 N. Chapel St. 	Fresno	CA	93706
1358	Noble	Glover	\N	noble.glover@gmail.com	728 W. Rocky River Street 	Orchard Park	NY	14127
1359	Octavia	Donaldson	\N	octavia.donaldson@hotmail.com	8095 Wayne Ave. 	Levittown	NY	11756
1360	Latashia	Travis	\N	latashia.travis@yahoo.com	7877 King Rd. 	Upland	CA	91784
1361	Destiny	Goodman	\N	destiny.goodman@msn.com	29 Smoky Hollow St. 	Westbury	NY	11590
1362	Christiana	Gross	\N	christiana.gross@yahoo.com	645 North Richardson Road 	Orchard Park	NY	14127
1363	Nestor	Haynes	(281) 969-4579	nestor.haynes@msn.com	27 Nut Swamp Street 	Houston	TX	77016
1364	Grisel	Maynard	\N	grisel.maynard@msn.com	353 North Arch St. 	Ballston Spa	NY	12020
1365	Shenna	Espinoza	\N	shenna.espinoza@gmail.com	202 North George Street 	Queensbury	NY	12804
1366	Trena	Rogers	\N	trena.rogers@aol.com	502 Sherwood St. 	Campbell	CA	95008
1367	Lucile	Manning	\N	lucile.manning@yahoo.com	511 Livingston Lane 	Campbell	CA	95008
1368	Veronique	Fulton	\N	veronique.fulton@yahoo.com	81 Hilldale Ave. 	Ballston Spa	NY	12020
1369	Starr	Schneider	\N	starr.schneider@aol.com	77 Mulberry Street 	Shirley	NY	11967
1370	Rona	Rojas	(408) 611-3553	rona.rojas@gmail.com	815 Riverview St. 	San Jose	CA	95127
1371	Pandora	Estes	\N	pandora.estes@aol.com	228 Shadow Brook Drive 	New Hyde Park	NY	11040
1372	Renna	Williams	\N	renna.williams@hotmail.com	7398 SW. Glen Ridge Road 	South Ozone Park	NY	11420
1373	Lanora	Robbins	\N	lanora.robbins@hotmail.com	31 W. Maiden Lane 	West Babylon	NY	11704
1374	Juliane	Dillard	\N	juliane.dillard@aol.com	63 Birchwood Court 	Glendora	CA	91740
1375	Carlena	Salinas	\N	carlena.salinas@gmail.com	1 Wagon Street 	Jamaica	NY	11432
1376	Kimberley	Reynolds	\N	kimberley.reynolds@aol.com	8475 Homewood Street 	Port Washington	NY	11050
1377	Johana	Jacobson	(507) 407-9384	johana.jacobson@gmail.com	29 San Juan St. 	Rochester	NY	14606
1378	Enoch	Rosario	(559) 329-7615	enoch.rosario@hotmail.com	186 Arlington St. 	Fresno	CA	93706
1379	Dorine	Thornton	\N	dorine.thornton@gmail.com	8730 N. Atlantic Street 	Sunnyside	NY	11104
1380	Eliz	Lynch	\N	eliz.lynch@hotmail.com	717 West Deerfield Ave. 	Uniondale	NY	11553
1381	Mercedez	Brooks	\N	mercedez.brooks@hotmail.com	7483 Ann St. 	Duarte	CA	91010
1382	Wynona	Douglas	\N	wynona.douglas@msn.com	6 Country Ave. 	Harlingen	TX	78552
1383	Desire	Mcgowan	(661) 800-8091	desire.mcgowan@msn.com	942 North Ohio Road 	Bakersfield	CA	93306
1384	Elmo	Sweeney	\N	elmo.sweeney@yahoo.com	43 Arch Ave. 	San Carlos	CA	94070
1385	Kenton	Hughes	\N	kenton.hughes@gmail.com	632 Sleepy Hollow Drive 	Canandaigua	NY	14424
1386	Cesar	Wilkins	(619) 685-5786	cesar.wilkins@hotmail.com	7 Inverness St. 	San Diego	CA	92111
1387	Phylicia	Stout	\N	phylicia.stout@aol.com	8842 Littleton Lane 	Canandaigua	NY	14424
1388	Nanette	Harris	\N	nanette.harris@hotmail.com	26 Pin Oak Lane 	East Meadow	NY	11554
1389	Ulrike	Chan	\N	ulrike.chan@aol.com	7949 Lancaster St. 	Port Chester	NY	10573
1390	Genoveva	Lloyd	\N	genoveva.lloyd@aol.com	706 Devonshire St. 	Bayside	NY	11361
1391	Sheryl	Chase	\N	sheryl.chase@gmail.com	388 Cedar Avenue 	Floral Park	NY	11001
1392	Trista	Lambert	\N	trista.lambert@gmail.com	79 River Street 	Fairport	NY	14450
1393	Vivian	Deleon	\N	vivian.deleon@msn.com	9925 Hamilton Street 	Jamaica	NY	11432
1394	Genny	Fields	\N	genny.fields@msn.com	9145 San Juan Dr. 	Amityville	NY	11701
1395	Eliseo	Knight	\N	eliseo.knight@msn.com	693 Holly Street 	Woodhaven	NY	11421
1396	Delma	Bailey	(657) 454-8493	delma.bailey@gmail.com	9883 West King Lane 	Anaheim	CA	92806
1397	Dewayne	Herring	\N	dewayne.herring@aol.com	9015 Willow Lane 	Webster	NY	14580
1398	Nevada	Hood	\N	nevada.hood@aol.com	515 Bank Rd. 	Hopewell Junction	NY	12533
1399	Angelika	Perry	\N	angelika.perry@msn.com	7684 South Branch Drive 	Canandaigua	NY	14424
1400	Shayla	Hart	\N	shayla.hart@msn.com	9092 Aspen St. 	Woodhaven	NY	11421
1401	Willetta	Murphy	\N	willetta.murphy@msn.com	436 Devonshire Street 	East Elmhurst	NY	11369
1402	Sandee	Alvarado	\N	sandee.alvarado@aol.com	69 Bowman Street 	Depew	NY	14043
1403	Mila	Moody	(248) 234-5902	mila.moody@gmail.com	675 Williams St. 	Troy	NY	12180
1404	Loyce	Conway	\N	loyce.conway@aol.com	729 State Lane 	Central Islip	NY	11722
1405	Thanh	Figueroa	\N	thanh.figueroa@yahoo.com	6 Roberts Drive 	Mount Vernon	NY	10550
1406	Farrah	Orr	\N	farrah.orr@msn.com	8711 W. Ashley St. 	New Hyde Park	NY	11040
1407	Hugh	Craft	\N	hugh.craft@msn.com	8716 Homewood Court 	Centereach	NY	11720
1408	Eleanor	Mendez	\N	eleanor.mendez@yahoo.com	4 West St. 	Port Chester	NY	10573
1409	Lamar	Bush	(716) 294-7174	lamar.bush@msn.com	76 Lilac Drive 	Buffalo	NY	14215
1410	Lurlene	Finch	(914) 367-7691	lurlene.finch@msn.com	849 Magnolia St. 	Yonkers	NY	10701
1411	Shanda	Stevenson	\N	shanda.stevenson@yahoo.com	9547 N. Courtland St. 	Freeport	NY	11520
1412	Adrien	Hunter	\N	adrien.hunter@yahoo.com	720 Thompson Lane 	Rego Park	NY	11374
1413	Ophelia	Decker	\N	ophelia.decker@yahoo.com	69 Rockwell Court 	New Windsor	NY	12553
1414	Sonja	Walls	\N	sonja.walls@aol.com	30 Marshall Dr. 	Queensbury	NY	12804
1415	Harold	O'connor	\N	harold.o'connor@gmail.com	9530 Summerhouse Street 	Santa Cruz	CA	95060
1416	Miranda	Kennedy	\N	miranda.kennedy@gmail.com	726 East High St. 	Astoria	NY	11102
1417	Jasper	Castro	\N	jasper.castro@aol.com	977 SE. Railroad Road 	Forney	TX	75126
1418	Penni	Best	(657) 611-2991	penni.best@msn.com	875 Second Drive 	Anaheim	CA	92806
1419	Lurlene	Cotton	\N	lurlene.cotton@yahoo.com	8218 George St. 	Pleasanton	CA	94566
1420	Kelsey	Noble	\N	kelsey.noble@hotmail.com	36 Pearl Court 	Mount Vernon	NY	10550
1421	Edris	Barrett	\N	edris.barrett@hotmail.com	36 Pulaski Drive 	Plattsburgh	NY	12901
1422	Tempie	Jacobson	\N	tempie.jacobson@hotmail.com	136 Old Fairview St. 	Smithtown	NY	11787
1423	Dollie	Cervantes	(682) 362-7457	dollie.cervantes@aol.com	8828 Applegate Drive 	Fort Worth	TX	76110
1424	Lashunda	Cole	\N	lashunda.cole@hotmail.com	783 Baker St. 	Monsey	NY	10952
1425	Justina	Jenkins	\N	justina.jenkins@msn.com	345 SE. Green Lane 	Shirley	NY	11967
1426	Londa	Gould	(361) 206-5550	londa.gould@aol.com	9169 Beech Lane 	Corpus Christi	TX	78418
1427	Mikel	Wilkerson	\N	mikel.wilkerson@msn.com	9233 Clinton St. 	Atwater	CA	95301
1428	Carola	Johns	\N	carola.johns@msn.com	7077 Fordham Rd. 	Santa Cruz	CA	95060
1429	Lorrie	Justice	\N	lorrie.justice@gmail.com	8396 Brook Drive 	Pomona	CA	91768
1430	Tayna	Wade	(661) 858-1224	tayna.wade@hotmail.com	65 Smith Store Dr. 	Bakersfield	CA	93306
1431	Mark	Benton	\N	mark.benton@aol.com	83 Eagle St. 	East Elmhurst	NY	11369
1432	Zona	Cameron	\N	zona.cameron@aol.com	42 Bridle Court 	East Northport	NY	11731
1433	Nicola	Knight	\N	nicola.knight@aol.com	25 SE. Miles Lane 	Scarsdale	NY	10583
1434	Elana	Miles	\N	elana.miles@yahoo.com	7077 Euclid Ave. 	Liverpool	NY	13090
1435	Merrie	Fowler	\N	merrie.fowler@aol.com	532 Leatherwood Ave. 	Scarsdale	NY	10583
1436	Macie	Ayers	\N	macie.ayers@msn.com	8730 Longfellow St. 	Bellmore	NY	11710
1437	Son	Warner	\N	son.warner@hotmail.com	20 W. Rosewood Ave. 	Rockville Centre	NY	11570
1438	Lee	Dunn	(408) 807-6157	lee.dunn@aol.com	8626 Grand Ave. 	San Jose	CA	95127
1439	Florrie	Little	\N	florrie.little@yahoo.com	8330 Marsh St. 	New Rochelle	NY	10801
1440	Ernest	Rollins	\N	ernest.rollins@yahoo.com	4 West Ridge Dr. 	Oakland Gardens	NY	11364
1441	Jamaal	Morrison	\N	jamaal.morrison@msn.com	796 SE. Nut Swamp St. 	Staten Island	NY	10301
1442	Cassie	Cline	\N	cassie.cline@gmail.com	947 Lafayette Drive 	Brooklyn	NY	11201
1443	Lezlie	Lamb	\N	lezlie.lamb@gmail.com	401 Brandywine Street 	Central Islip	NY	11722
1444	Ivette	Estes	\N	ivette.estes@gmail.com	88 N. Canterbury Ave. 	Canandaigua	NY	14424
1445	Ester	Acevedo	\N	ester.acevedo@gmail.com	671 Miles Court 	San Lorenzo	CA	94580
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_id, item_id, product_id, quantity, list_price, discount) FROM stdin;
1	1	20	1	599.99	0.20
1	2	8	2	1799.99	0.07
1	3	10	2	1549.00	0.05
1	4	16	2	599.99	0.05
1	5	4	1	2899.99	0.20
2	1	20	1	599.99	0.07
2	2	16	2	599.99	0.05
3	1	3	1	999.99	0.05
3	2	20	1	599.99	0.05
4	1	2	2	749.99	0.10
5	1	10	2	1549.00	0.05
5	2	17	1	429.00	0.07
5	3	26	1	599.99	0.07
6	1	18	1	449.00	0.07
6	2	12	2	549.99	0.05
6	3	20	1	599.99	0.10
6	4	3	2	999.99	0.07
6	5	9	2	2999.99	0.07
7	1	15	1	529.99	0.07
7	2	3	1	999.99	0.10
7	3	17	2	429.00	0.10
8	1	22	1	269.99	0.05
8	2	20	2	599.99	0.07
9	1	7	2	3999.99	0.10
10	1	14	1	269.99	0.10
11	1	8	1	1799.99	0.05
11	2	22	2	269.99	0.10
11	3	16	2	599.99	0.20
12	1	4	2	2899.99	0.10
12	2	11	1	1680.99	0.05
13	1	13	1	269.99	0.10
13	2	17	2	429.00	0.05
13	3	20	2	599.99	0.10
13	4	16	2	599.99	0.05
14	1	6	1	469.99	0.07
15	1	12	2	549.99	0.07
15	2	8	1	1799.99	0.07
15	3	18	2	449.00	0.05
15	4	23	2	299.99	0.20
16	1	8	1	1799.99	0.20
16	2	21	1	269.99	0.05
16	3	13	2	269.99	0.07
16	4	14	1	269.99	0.07
17	1	8	1	1799.99	0.07
17	2	23	1	299.99	0.10
17	3	5	1	1320.99	0.10
17	4	20	2	599.99	0.20
18	1	2	2	749.99	0.20
18	2	22	1	269.99	0.05
18	3	7	1	3999.99	0.10
18	4	25	2	499.99	0.05
18	5	9	2	2999.99	0.10
19	1	10	1	1549.00	0.07
19	2	9	2	2999.99	0.20
20	1	9	1	2999.99	0.07
20	2	10	2	1549.00	0.07
21	1	14	1	269.99	0.05
21	2	17	1	429.00	0.10
21	3	10	1	1549.00	0.07
22	1	15	2	529.99	0.20
22	2	22	1	269.99	0.05
23	1	4	2	2899.99	0.05
23	2	23	2	299.99	0.10
23	3	13	1	269.99	0.20
24	1	3	2	999.99	0.10
24	2	18	2	449.00	0.07
25	1	23	2	299.99	0.20
25	2	10	2	1549.00	0.20
25	3	22	1	269.99	0.20
25	4	14	1	269.99	0.20
25	5	21	1	269.99	0.10
26	1	7	1	3999.99	0.05
26	2	2	1	749.99	0.20
26	3	12	1	549.99	0.20
26	4	21	2	269.99	0.07
27	1	5	1	1320.99	0.20
27	2	19	1	449.00	0.20
27	3	26	2	599.99	0.07
27	4	8	1	1799.99	0.07
28	1	5	1	1320.99	0.05
28	2	7	2	3999.99	0.20
28	3	14	2	269.99	0.10
28	4	6	1	469.99	0.05
29	1	24	2	549.99	0.05
29	2	6	1	469.99	0.20
29	3	21	2	269.99	0.10
29	4	8	1	1799.99	0.20
29	5	14	2	269.99	0.05
30	1	26	1	599.99	0.05
30	2	17	1	429.00	0.07
30	3	19	1	449.00	0.10
30	4	4	1	2899.99	0.10
30	5	7	2	3999.99	0.10
31	1	11	2	1680.99	0.05
31	2	9	2	2999.99	0.20
32	1	8	2	1799.99	0.07
32	2	12	2	549.99	0.07
32	3	25	2	499.99	0.10
33	1	23	2	299.99	0.07
33	2	7	1	3999.99	0.10
34	1	8	2	1799.99	0.07
34	2	10	2	1549.00	0.10
34	3	17	2	429.00	0.20
35	1	18	1	449.00	0.05
35	2	20	2	599.99	0.05
35	3	5	1	1320.99	0.20
35	4	21	2	269.99	0.07
35	5	22	1	269.99	0.07
36	1	9	1	2999.99	0.07
36	2	5	1	1320.99	0.05
36	3	3	2	999.99	0.20
37	1	16	2	599.99	0.05
38	1	7	2	3999.99	0.05
38	2	23	1	299.99	0.07
38	3	25	1	499.99	0.20
38	4	10	2	1549.00	0.10
38	5	24	1	549.99	0.07
39	1	22	2	269.99	0.20
39	2	16	2	599.99	0.20
39	3	3	2	999.99	0.05
39	4	15	1	529.99	0.10
40	1	17	1	429.00	0.20
40	2	8	2	1799.99	0.20
41	1	5	1	1320.99	0.10
41	2	19	2	449.00	0.20
41	3	26	2	599.99	0.20
42	1	19	1	449.00	0.05
43	1	13	2	269.99	0.10
43	2	12	2	549.99	0.05
44	1	7	1	3999.99	0.10
44	2	16	1	599.99	0.05
45	1	4	2	2899.99	0.20
45	2	22	1	269.99	0.07
45	3	21	2	269.99	0.05
46	1	17	1	429.00	0.10
47	1	6	1	469.99	0.05
47	2	15	1	529.99	0.10
47	3	25	2	499.99	0.07
47	4	13	1	269.99	0.20
48	1	11	1	1680.99	0.10
48	2	4	1	2899.99	0.20
48	3	5	2	1320.99	0.10
48	4	14	2	269.99	0.07
49	1	13	2	269.99	0.07
50	1	3	1	999.99	0.05
50	2	26	2	599.99	0.07
50	3	13	2	269.99	0.20
51	1	13	1	269.99	0.05
51	2	20	1	599.99	0.05
51	3	26	2	599.99	0.20
52	1	25	1	499.99	0.07
53	1	8	2	1799.99	0.20
53	2	23	2	299.99	0.05
53	3	14	2	269.99	0.20
53	4	25	2	499.99	0.10
54	1	26	2	599.99	0.20
54	2	3	1	999.99	0.20
55	1	21	1	269.99	0.05
55	2	25	2	499.99	0.20
55	3	15	2	529.99	0.20
56	1	20	2	599.99	0.07
57	1	23	2	299.99	0.10
57	2	19	2	449.00	0.20
57	3	13	1	269.99	0.07
58	1	14	2	269.99	0.05
58	2	18	1	449.00	0.07
58	3	23	1	299.99	0.10
59	1	21	1	269.99	0.05
59	2	2	1	749.99	0.10
59	3	17	2	429.00	0.10
60	1	14	2	269.99	0.05
60	2	4	1	2899.99	0.10
60	3	15	1	529.99	0.07
60	4	22	1	269.99	0.20
61	1	25	1	499.99	0.10
61	2	15	2	529.99	0.05
61	3	5	2	1320.99	0.20
62	1	14	1	269.99	0.07
62	2	8	2	1799.99	0.10
62	3	22	2	269.99	0.10
63	1	25	2	499.99	0.10
63	2	19	2	449.00	0.05
63	3	3	1	999.99	0.10
64	1	25	2	499.99	0.10
64	2	22	2	269.99	0.20
64	3	23	2	299.99	0.20
64	4	24	2	549.99	0.10
65	1	12	1	549.99	0.10
66	1	2	1	749.99	0.20
66	2	23	1	299.99	0.07
66	3	12	1	549.99	0.07
67	1	23	2	299.99	0.20
67	2	12	2	549.99	0.10
67	3	21	1	269.99	0.20
67	4	5	2	1320.99	0.10
67	5	19	1	449.00	0.20
68	1	13	2	269.99	0.07
68	2	17	1	429.00	0.10
69	1	22	2	269.99	0.10
69	2	5	1	1320.99	0.20
69	3	10	1	1549.00	0.05
70	1	3	2	999.99	0.05
70	2	18	1	449.00	0.20
70	3	20	1	599.99	0.05
71	1	26	2	599.99	0.05
71	2	24	1	549.99	0.20
71	3	18	1	449.00	0.10
72	1	17	2	429.00	0.07
72	2	12	1	549.99	0.05
72	3	13	2	269.99	0.10
73	1	22	1	269.99	0.07
73	2	26	2	599.99	0.05
73	3	3	2	999.99	0.07
73	4	25	1	499.99	0.07
73	5	23	2	299.99	0.20
74	1	16	2	599.99	0.05
74	2	6	1	469.99	0.07
75	1	3	1	999.99	0.10
75	2	7	2	3999.99	0.07
75	3	15	1	529.99	0.20
76	1	12	1	549.99	0.05
76	2	11	2	1680.99	0.10
76	3	5	1	1320.99	0.07
77	1	20	1	599.99	0.07
77	2	24	2	549.99	0.10
77	3	26	1	599.99	0.20
77	4	25	1	499.99	0.20
78	1	17	1	429.00	0.07
78	2	19	1	449.00	0.20
78	3	18	2	449.00	0.10
78	4	14	2	269.99	0.10
79	1	9	2	2999.99	0.10
79	2	17	2	429.00	0.05
79	3	6	1	469.99	0.10
79	4	25	2	499.99	0.07
80	1	26	1	599.99	0.10
80	2	24	1	549.99	0.10
80	3	17	1	429.00	0.20
81	1	10	2	1549.00	0.20
81	2	23	2	299.99	0.05
81	3	25	2	499.99	0.05
82	1	25	2	499.99	0.10
82	2	11	2	1680.99	0.20
83	1	20	1	599.99	0.20
83	2	3	2	999.99	0.05
84	1	23	2	299.99	0.07
84	2	15	2	529.99	0.07
85	1	4	2	2899.99	0.05
85	2	18	1	449.00	0.07
86	1	9	2	2999.99	0.10
86	2	23	2	299.99	0.07
86	3	21	2	269.99	0.20
86	4	15	1	529.99	0.10
87	1	20	2	599.99	0.20
87	2	23	2	299.99	0.10
88	1	10	1	1549.00	0.07
88	2	8	2	1799.99	0.10
88	3	7	1	3999.99	0.10
89	1	5	1	1320.99	0.05
89	2	6	2	469.99	0.10
90	1	3	1	999.99	0.10
90	2	6	1	469.99	0.07
91	1	11	1	1680.99	0.10
91	2	25	1	499.99	0.05
91	3	15	2	529.99	0.07
91	4	13	2	269.99	0.07
92	1	8	1	1799.99	0.10
93	1	22	2	269.99	0.07
93	2	17	1	429.00	0.05
93	3	21	1	269.99	0.10
93	4	2	1	749.99	0.20
93	5	10	2	1549.00	0.07
94	1	12	1	549.99	0.05
94	2	4	1	2899.99	0.20
94	3	11	1	1680.99	0.20
94	4	21	2	269.99	0.07
95	1	10	2	1549.00	0.20
95	2	19	1	449.00	0.10
95	3	8	2	1799.99	0.20
95	4	20	2	599.99	0.05
96	1	26	1	599.99	0.10
96	2	23	1	299.99	0.05
97	1	20	2	599.99	0.20
97	2	2	1	749.99	0.07
97	3	6	2	469.99	0.20
97	4	19	1	449.00	0.10
98	1	19	1	449.00	0.07
98	2	21	1	269.99	0.10
98	3	2	1	749.99	0.20
98	4	22	2	269.99	0.20
99	1	13	1	269.99	0.20
99	2	21	1	269.99	0.20
99	3	25	2	499.99	0.05
99	4	7	2	3999.99	0.07
99	5	23	2	299.99	0.20
100	1	12	2	549.99	0.05
100	2	11	2	1680.99	0.10
100	3	7	2	3999.99	0.20
100	4	16	2	599.99	0.20
100	5	24	2	549.99	0.10
101	1	12	2	549.99	0.20
102	1	15	1	529.99	0.05
102	2	22	1	269.99	0.07
103	1	17	1	429.00	0.07
103	2	3	1	999.99	0.05
103	3	18	1	449.00	0.20
103	4	15	2	529.99	0.10
103	5	9	2	2999.99	0.10
104	1	19	2	449.00	0.10
104	2	26	1	599.99	0.05
105	1	11	2	1680.99	0.20
105	2	3	1	999.99	0.05
105	3	9	1	2999.99	0.05
106	1	17	1	429.00	0.10
106	2	13	2	269.99	0.10
107	1	19	1	449.00	0.20
107	2	13	2	269.99	0.10
108	1	11	1	1680.99	0.10
108	2	22	2	269.99	0.07
108	3	16	2	599.99	0.05
109	1	22	2	269.99	0.10
109	2	6	1	469.99	0.07
110	1	14	1	269.99	0.10
111	1	14	1	269.99	0.10
111	2	12	2	549.99	0.07
112	1	23	2	299.99	0.20
112	2	25	2	499.99	0.07
112	3	24	2	549.99	0.05
112	4	5	1	1320.99	0.20
113	1	12	2	549.99	0.07
113	2	24	2	549.99	0.10
113	3	6	1	469.99	0.07
113	4	23	1	299.99	0.20
113	5	5	2	1320.99	0.20
114	1	12	1	549.99	0.05
114	2	2	1	749.99	0.07
114	3	13	2	269.99	0.10
115	1	22	1	269.99	0.20
115	2	19	1	449.00	0.10
116	1	26	1	599.99	0.05
117	1	22	2	269.99	0.20
117	2	26	1	599.99	0.05
117	3	14	1	269.99	0.20
117	4	19	1	449.00	0.05
118	1	18	1	449.00	0.07
118	2	4	1	2899.99	0.07
118	3	6	1	469.99	0.07
118	4	3	2	999.99	0.10
118	5	23	2	299.99	0.07
119	1	25	1	499.99	0.05
120	1	13	2	269.99	0.05
120	2	6	2	469.99	0.05
120	3	10	2	1549.00	0.05
120	4	17	1	429.00	0.05
120	5	16	2	599.99	0.20
121	1	5	1	1320.99	0.20
121	2	14	2	269.99	0.10
121	3	4	2	2899.99	0.10
121	4	24	2	549.99	0.07
121	5	2	2	749.99	0.05
122	1	16	1	599.99	0.10
123	1	12	2	549.99	0.10
124	1	16	1	599.99	0.05
124	2	4	1	2899.99	0.07
124	3	7	2	3999.99	0.05
125	1	17	1	429.00	0.10
126	1	9	2	2999.99	0.05
127	1	17	1	429.00	0.07
127	2	20	1	599.99	0.10
127	3	4	2	2899.99	0.07
128	1	24	2	549.99	0.10
128	2	16	2	599.99	0.10
128	3	4	2	2899.99	0.20
128	4	3	2	999.99	0.20
129	1	18	1	449.00	0.10
129	2	9	1	2999.99	0.10
130	1	26	1	599.99	0.05
130	2	5	2	1320.99	0.07
131	1	22	2	269.99	0.20
131	2	4	2	2899.99	0.07
131	3	24	2	549.99	0.10
132	1	2	2	749.99	0.05
132	2	20	1	599.99	0.05
132	3	9	1	2999.99	0.10
133	1	13	2	269.99	0.05
133	2	22	1	269.99	0.20
134	1	19	2	449.00	0.10
134	2	2	2	749.99	0.07
134	3	18	2	449.00	0.07
135	1	5	2	1320.99	0.05
135	2	18	2	449.00	0.05
135	3	25	1	499.99	0.20
135	4	2	1	749.99	0.05
136	1	7	2	3999.99	0.20
136	2	3	2	999.99	0.05
137	1	23	1	299.99	0.07
137	2	22	1	269.99	0.10
138	1	16	2	599.99	0.10
138	2	6	1	469.99	0.20
139	1	19	2	449.00	0.07
139	2	3	1	999.99	0.07
140	1	15	1	529.99	0.20
140	2	21	1	269.99	0.20
140	3	12	2	549.99	0.20
140	4	3	1	999.99	0.05
141	1	18	1	449.00	0.20
142	1	16	2	599.99	0.10
142	2	11	2	1680.99	0.10
142	3	19	1	449.00	0.07
143	1	6	1	469.99	0.20
144	1	8	2	1799.99	0.05
145	1	11	1	1680.99	0.20
145	2	9	2	2999.99	0.10
146	1	3	2	999.99	0.20
146	2	12	1	549.99	0.10
146	3	20	2	599.99	0.10
146	4	6	2	469.99	0.05
146	5	2	1	749.99	0.07
147	1	26	2	599.99	0.20
148	1	14	1	269.99	0.05
149	1	12	2	549.99	0.07
149	2	21	2	269.99	0.07
150	1	7	1	3999.99	0.10
150	2	3	1	999.99	0.20
150	3	17	1	429.00	0.07
150	4	25	2	499.99	0.07
151	1	17	1	429.00	0.10
151	2	26	1	599.99	0.10
152	1	6	2	469.99	0.20
152	2	22	2	269.99	0.20
152	3	16	2	599.99	0.07
153	1	16	1	599.99	0.07
153	2	8	1	1799.99	0.07
153	3	15	2	529.99	0.05
154	1	12	1	549.99	0.10
155	1	8	1	1799.99	0.10
156	1	18	2	449.00	0.20
156	2	17	2	429.00	0.05
156	3	6	1	469.99	0.07
157	1	4	1	2899.99	0.10
157	2	7	2	3999.99	0.07
158	1	24	1	549.99	0.10
159	1	13	1	269.99	0.20
160	1	21	1	269.99	0.07
160	2	15	2	529.99	0.07
160	3	18	2	449.00	0.10
160	4	11	1	1680.99	0.05
161	1	24	2	549.99	0.07
161	2	22	1	269.99	0.05
161	3	7	2	3999.99	0.05
162	1	18	1	449.00	0.07
162	2	21	2	269.99	0.07
162	3	3	2	999.99	0.10
163	1	12	1	549.99	0.10
163	2	18	1	449.00	0.20
164	1	4	2	2899.99	0.05
164	2	10	2	1549.00	0.05
164	3	14	1	269.99	0.10
165	1	4	2	2899.99	0.05
165	2	23	1	299.99	0.20
165	3	2	1	749.99	0.05
166	1	10	2	1549.00	0.10
166	2	11	1	1680.99	0.20
167	1	12	1	549.99	0.05
167	2	10	1	1549.00	0.20
167	3	13	2	269.99	0.05
167	4	7	2	3999.99	0.05
168	1	6	1	469.99	0.10
168	2	11	2	1680.99	0.07
168	3	12	2	549.99	0.07
168	4	22	2	269.99	0.20
169	1	20	2	599.99	0.10
169	2	5	1	1320.99	0.05
169	3	10	1	1549.00	0.20
169	4	11	1	1680.99	0.20
169	5	14	2	269.99	0.05
170	1	12	2	549.99	0.10
170	2	24	1	549.99	0.05
170	3	7	1	3999.99	0.20
170	4	18	2	449.00	0.05
171	1	8	1	1799.99	0.05
172	1	23	1	299.99	0.07
172	2	16	1	599.99	0.20
173	1	14	1	269.99	0.05
173	2	16	1	599.99	0.20
173	3	20	2	599.99	0.05
174	1	22	2	269.99	0.20
174	2	19	2	449.00	0.10
175	1	5	1	1320.99	0.10
175	2	2	2	749.99	0.20
175	3	21	2	269.99	0.10
175	4	19	1	449.00	0.07
176	1	2	2	749.99	0.07
176	2	11	2	1680.99	0.20
176	3	16	2	599.99	0.05
177	1	20	2	599.99	0.10
178	1	10	2	1549.00	0.20
178	2	12	1	549.99	0.05
178	3	3	1	999.99	0.10
178	4	18	1	449.00	0.07
179	1	13	2	269.99	0.05
179	2	26	1	599.99	0.10
179	3	18	1	449.00	0.20
179	4	12	2	549.99	0.20
179	5	20	2	599.99	0.10
180	1	16	1	599.99	0.07
181	1	10	1	1549.00	0.05
181	2	11	1	1680.99	0.10
181	3	15	2	529.99	0.20
181	4	24	2	549.99	0.05
182	1	25	2	499.99	0.05
182	2	24	2	549.99	0.07
183	1	11	2	1680.99	0.20
183	2	12	2	549.99	0.05
183	3	19	1	449.00	0.07
183	4	17	1	429.00	0.07
184	1	4	1	2899.99	0.20
184	2	5	1	1320.99	0.10
184	3	14	1	269.99	0.10
185	1	20	1	599.99	0.10
185	2	8	1	1799.99	0.05
186	1	4	1	2899.99	0.10
186	2	6	1	469.99	0.10
187	1	5	1	1320.99	0.05
188	1	7	2	3999.99	0.07
189	1	16	2	599.99	0.20
190	1	24	1	549.99	0.05
190	2	15	1	529.99	0.20
190	3	3	2	999.99	0.20
191	1	25	1	499.99	0.05
191	2	12	2	549.99	0.20
191	3	3	1	999.99	0.07
191	4	8	2	1799.99	0.05
191	5	23	1	299.99	0.05
192	1	8	2	1799.99	0.10
192	2	25	1	499.99	0.07
192	3	2	1	749.99	0.05
192	4	24	2	549.99	0.07
192	5	10	2	1549.00	0.20
193	1	12	2	549.99	0.10
194	1	21	2	269.99	0.20
195	1	18	1	449.00	0.20
195	2	14	1	269.99	0.05
195	3	5	2	1320.99	0.20
195	4	4	2	2899.99	0.20
195	5	21	2	269.99	0.10
196	1	6	1	469.99	0.05
196	2	3	2	999.99	0.07
196	3	10	2	1549.00	0.07
196	4	12	1	549.99	0.07
196	5	20	1	599.99	0.10
197	1	4	2	2899.99	0.20
197	2	2	2	749.99	0.07
198	1	6	2	469.99	0.05
198	2	20	2	599.99	0.07
198	3	8	2	1799.99	0.20
198	4	13	2	269.99	0.05
198	5	17	1	429.00	0.05
199	1	25	2	499.99	0.05
199	2	18	2	449.00	0.07
199	3	4	1	2899.99	0.20
200	1	23	2	299.99	0.05
200	2	22	2	269.99	0.07
201	1	24	1	549.99	0.05
201	2	7	1	3999.99	0.20
201	3	14	2	269.99	0.10
201	4	17	1	429.00	0.05
202	1	8	1	1799.99	0.07
202	2	17	1	429.00	0.05
202	3	15	2	529.99	0.05
202	4	25	2	499.99	0.05
203	1	26	1	599.99	0.05
203	2	3	2	999.99	0.10
203	3	17	2	429.00	0.20
203	4	19	2	449.00	0.07
204	1	6	2	469.99	0.07
204	2	17	2	429.00	0.10
205	1	22	2	269.99	0.05
205	2	24	2	549.99	0.10
206	1	25	1	499.99	0.05
206	2	20	1	599.99	0.20
207	1	12	2	549.99	0.20
207	2	5	1	1320.99	0.05
207	3	11	2	1680.99	0.07
207	4	7	2	3999.99	0.10
208	1	6	2	469.99	0.05
208	2	4	2	2899.99	0.07
208	3	3	1	999.99	0.05
208	4	12	1	549.99	0.20
208	5	10	2	1549.00	0.05
209	1	13	1	269.99	0.10
210	1	14	1	269.99	0.07
210	2	13	2	269.99	0.20
211	1	10	1	1549.00	0.07
211	2	2	2	749.99	0.07
212	1	16	2	599.99	0.07
212	2	12	2	549.99	0.20
212	3	19	1	449.00	0.10
212	4	7	1	3999.99	0.20
213	1	13	1	269.99	0.10
214	1	21	1	269.99	0.10
215	1	19	1	449.00	0.07
215	2	12	2	549.99	0.10
216	1	22	2	269.99	0.10
216	2	16	2	599.99	0.05
217	1	18	1	449.00	0.10
217	2	10	2	1549.00	0.10
217	3	17	1	429.00	0.07
218	1	2	2	749.99	0.10
218	2	13	1	269.99	0.07
218	3	12	1	549.99	0.05
219	1	26	1	599.99	0.05
219	2	5	1	1320.99	0.20
220	1	6	2	469.99	0.05
220	2	25	1	499.99	0.07
220	3	22	2	269.99	0.10
220	4	3	2	999.99	0.20
221	1	11	2	1680.99	0.07
222	1	10	1	1549.00	0.10
222	2	2	2	749.99	0.10
223	1	7	2	3999.99	0.05
223	2	5	1	1320.99	0.20
223	3	21	2	269.99	0.10
223	4	20	1	599.99	0.05
223	5	15	1	529.99	0.05
224	1	6	1	469.99	0.07
224	2	11	2	1680.99	0.10
224	3	10	2	1549.00	0.20
224	4	25	1	499.99	0.05
225	1	21	1	269.99	0.10
225	2	9	1	2999.99	0.10
226	1	2	1	749.99	0.05
227	1	3	2	999.99	0.05
227	2	15	2	529.99	0.10
228	1	25	1	499.99	0.20
228	2	2	2	749.99	0.07
228	3	23	2	299.99	0.10
228	4	4	1	2899.99	0.20
228	5	22	1	269.99	0.05
229	1	25	2	499.99	0.20
229	2	5	2	1320.99	0.10
229	3	8	1	1799.99	0.20
230	1	11	2	1680.99	0.07
231	1	8	2	1799.99	0.07
231	2	14	2	269.99	0.20
231	3	5	2	1320.99	0.20
232	1	18	1	449.00	0.07
232	2	11	2	1680.99	0.05
232	3	26	2	599.99	0.07
232	4	8	2	1799.99	0.10
233	1	14	1	269.99	0.10
233	2	16	2	599.99	0.10
233	3	12	1	549.99	0.20
233	4	15	2	529.99	0.07
234	1	11	2	1680.99	0.20
234	2	17	2	429.00	0.05
234	3	12	1	549.99	0.10
234	4	7	1	3999.99	0.05
234	5	23	1	299.99	0.10
235	1	6	1	469.99	0.07
235	2	13	2	269.99	0.05
235	3	7	2	3999.99	0.05
236	1	3	2	999.99	0.07
236	2	2	2	749.99	0.10
236	3	4	2	2899.99	0.10
237	1	15	1	529.99	0.20
237	2	24	1	549.99	0.07
237	3	20	2	599.99	0.20
237	4	26	1	599.99	0.05
238	1	20	2	599.99	0.20
238	2	25	1	499.99	0.07
238	3	13	2	269.99	0.20
238	4	22	2	269.99	0.05
238	5	7	1	3999.99	0.07
239	1	16	2	599.99	0.10
239	2	21	2	269.99	0.05
239	3	18	1	449.00	0.07
239	4	4	2	2899.99	0.07
240	1	9	1	2999.99	0.07
240	2	8	1	1799.99	0.07
240	3	5	1	1320.99	0.07
240	4	18	2	449.00	0.07
241	1	7	1	3999.99	0.20
242	1	3	1	999.99	0.20
243	1	25	2	499.99	0.05
243	2	19	2	449.00	0.07
243	3	7	2	3999.99	0.05
244	1	19	1	449.00	0.07
244	2	25	1	499.99	0.20
244	3	22	1	269.99	0.10
245	1	10	2	1549.00	0.05
245	2	8	1	1799.99	0.10
246	1	17	2	429.00	0.20
247	1	25	1	499.99	0.07
247	2	3	1	999.99	0.20
248	1	13	1	269.99	0.10
248	2	26	2	599.99	0.10
248	3	17	1	429.00	0.10
248	4	9	1	2999.99	0.20
249	1	7	2	3999.99	0.05
249	2	18	2	449.00	0.05
249	3	22	1	269.99	0.10
250	1	17	2	429.00	0.05
250	2	11	2	1680.99	0.10
251	1	23	2	299.99	0.20
251	2	22	2	269.99	0.05
252	1	11	2	1680.99	0.10
252	2	4	1	2899.99	0.07
252	3	19	1	449.00	0.10
253	1	11	2	1680.99	0.07
254	1	6	2	469.99	0.07
254	2	3	1	999.99	0.05
254	3	12	1	549.99	0.05
255	1	5	2	1320.99	0.10
255	2	14	1	269.99	0.20
255	3	2	2	749.99	0.20
255	4	21	1	269.99	0.07
256	1	11	1	1680.99	0.10
256	2	21	1	269.99	0.05
257	1	8	2	1799.99	0.07
257	2	13	2	269.99	0.20
257	3	10	2	1549.00	0.10
257	4	15	1	529.99	0.10
258	1	8	2	1799.99	0.05
258	2	4	1	2899.99	0.07
258	3	19	1	449.00	0.07
258	4	18	1	449.00	0.05
259	1	26	1	599.99	0.05
259	2	6	2	469.99	0.10
259	3	2	2	749.99	0.20
259	4	4	1	2899.99	0.10
260	1	23	2	299.99	0.20
260	2	10	1	1549.00	0.20
260	3	24	2	549.99	0.20
261	1	16	2	599.99	0.05
261	2	14	1	269.99	0.10
261	3	17	2	429.00	0.10
262	1	2	1	749.99	0.07
262	2	9	2	2999.99	0.05
263	1	9	1	2999.99	0.07
263	2	3	1	999.99	0.20
263	3	2	2	749.99	0.05
264	1	10	1	1549.00	0.20
264	2	24	2	549.99	0.05
264	3	15	2	529.99	0.10
264	4	3	2	999.99	0.07
265	1	9	2	2999.99	0.20
266	1	6	2	469.99	0.07
266	2	19	1	449.00	0.20
266	3	25	1	499.99	0.05
267	1	22	2	269.99	0.20
267	2	23	2	299.99	0.10
267	3	24	1	549.99	0.10
267	4	7	2	3999.99	0.07
267	5	21	1	269.99	0.05
268	1	7	1	3999.99	0.05
268	2	6	2	469.99	0.20
268	3	9	1	2999.99	0.10
269	1	5	1	1320.99	0.07
269	2	23	2	299.99	0.07
269	3	18	1	449.00	0.05
269	4	3	1	999.99	0.05
270	1	25	2	499.99	0.20
270	2	15	1	529.99	0.10
271	1	11	2	1680.99	0.07
271	2	6	2	469.99	0.05
271	3	13	1	269.99	0.10
271	4	7	2	3999.99	0.10
272	1	2	2	749.99	0.07
272	2	11	1	1680.99	0.07
273	1	21	1	269.99	0.10
274	1	11	2	1680.99	0.05
274	2	25	2	499.99	0.10
274	3	9	2	2999.99	0.07
275	1	18	1	449.00	0.05
275	2	25	1	499.99	0.10
275	3	7	2	3999.99	0.05
276	1	3	2	999.99	0.20
276	2	17	1	429.00	0.05
276	3	9	2	2999.99	0.07
277	1	20	2	599.99	0.20
277	2	6	2	469.99	0.20
277	3	13	2	269.99	0.10
278	1	16	1	599.99	0.20
278	2	19	2	449.00	0.07
278	3	13	1	269.99	0.07
278	4	11	2	1680.99	0.07
279	1	25	1	499.99	0.07
280	1	25	1	499.99	0.07
280	2	26	2	599.99	0.07
280	3	13	1	269.99	0.07
281	1	22	1	269.99	0.07
281	2	14	2	269.99	0.10
281	3	7	2	3999.99	0.07
282	1	20	1	599.99	0.07
282	2	7	2	3999.99	0.07
282	3	3	2	999.99	0.05
282	4	16	2	599.99	0.07
283	1	9	1	2999.99	0.05
283	2	16	2	599.99	0.20
284	1	24	2	549.99	0.20
284	2	20	1	599.99	0.20
285	1	16	2	599.99	0.05
285	2	12	1	549.99	0.05
285	3	2	1	749.99	0.10
286	1	26	2	599.99	0.20
286	2	21	2	269.99	0.07
286	3	16	2	599.99	0.10
286	4	7	1	3999.99	0.10
287	1	5	1	1320.99	0.20
287	2	10	1	1549.00	0.05
287	3	2	1	749.99	0.05
287	4	20	1	599.99	0.05
288	1	4	1	2899.99	0.20
288	2	10	1	1549.00	0.10
288	3	7	2	3999.99	0.05
289	1	13	1	269.99	0.07
289	2	24	1	549.99	0.20
289	3	17	1	429.00	0.20
290	1	2	2	749.99	0.07
290	2	5	2	1320.99	0.07
290	3	21	1	269.99	0.10
291	1	6	2	469.99	0.05
291	2	21	2	269.99	0.07
292	1	18	2	449.00	0.10
292	2	4	1	2899.99	0.07
292	3	10	2	1549.00	0.05
293	1	19	2	449.00	0.05
293	2	6	1	469.99	0.20
294	1	18	1	449.00	0.20
294	2	14	1	269.99	0.20
294	3	7	2	3999.99	0.05
294	4	25	2	499.99	0.20
295	1	22	2	269.99	0.07
296	1	25	2	499.99	0.07
296	2	12	2	549.99	0.10
296	3	11	2	1680.99	0.10
296	4	9	1	2999.99	0.20
297	1	4	2	2899.99	0.20
298	1	23	1	299.99	0.20
298	2	6	2	469.99	0.05
298	3	22	1	269.99	0.20
298	4	9	1	2999.99	0.07
298	5	14	2	269.99	0.10
299	1	11	2	1680.99	0.05
299	2	10	2	1549.00	0.20
300	1	16	2	599.99	0.10
300	2	9	2	2999.99	0.10
300	3	10	1	1549.00	0.10
300	4	11	2	1680.99	0.20
301	1	6	1	469.99	0.05
301	2	22	1	269.99	0.10
302	1	24	2	549.99	0.20
302	2	18	2	449.00	0.07
302	3	2	2	749.99	0.20
303	1	8	2	1799.99	0.05
303	2	24	2	549.99	0.05
304	1	10	1	1549.00	0.05
304	2	7	2	3999.99	0.10
304	3	20	1	599.99	0.10
305	1	10	1	1549.00	0.07
305	2	6	1	469.99	0.10
305	3	3	2	999.99	0.20
306	1	10	1	1549.00	0.20
306	2	22	1	269.99	0.07
307	1	15	2	529.99	0.05
308	1	7	1	3999.99	0.10
308	2	18	2	449.00	0.20
308	3	14	1	269.99	0.20
309	1	3	1	999.99	0.05
309	2	12	1	549.99	0.05
310	1	7	2	3999.99	0.07
310	2	14	2	269.99	0.10
310	3	5	2	1320.99	0.20
310	4	8	1	1799.99	0.20
311	1	17	2	429.00	0.05
311	2	5	2	1320.99	0.20
312	1	24	2	549.99	0.05
312	2	14	2	269.99	0.07
312	3	16	2	599.99	0.05
313	1	4	1	2899.99	0.07
313	2	10	2	1549.00	0.07
314	1	5	1	1320.99	0.07
314	2	9	1	2999.99	0.05
314	3	22	2	269.99	0.20
314	4	7	2	3999.99	0.07
315	1	11	1	1680.99	0.20
315	2	9	1	2999.99	0.10
316	1	2	2	749.99	0.20
316	2	16	2	599.99	0.10
316	3	20	1	599.99	0.10
316	4	19	1	449.00	0.20
316	5	17	1	429.00	0.05
317	1	10	1	1549.00	0.20
317	2	22	1	269.99	0.05
317	3	15	1	529.99	0.05
317	4	13	2	269.99	0.20
318	1	13	2	269.99	0.10
318	2	25	2	499.99	0.20
318	3	9	1	2999.99	0.05
319	1	11	1	1680.99	0.07
319	2	21	1	269.99	0.20
319	3	15	2	529.99	0.10
319	4	23	1	299.99	0.05
320	1	2	1	749.99	0.10
321	1	4	2	2899.99	0.20
321	2	12	2	549.99	0.20
321	3	26	1	599.99	0.20
321	4	23	2	299.99	0.20
322	1	13	2	269.99	0.20
322	2	21	1	269.99	0.07
323	1	13	2	269.99	0.07
323	2	26	2	599.99	0.10
324	1	2	2	749.99	0.10
324	2	17	1	429.00	0.20
324	3	22	2	269.99	0.20
324	4	19	1	449.00	0.05
324	5	12	1	549.99	0.05
325	1	7	1	3999.99	0.05
325	2	12	1	549.99	0.20
325	3	6	2	469.99	0.20
326	1	12	1	549.99	0.10
326	2	23	1	299.99	0.07
327	1	12	2	549.99	0.07
327	2	13	1	269.99	0.07
327	3	4	1	2899.99	0.05
328	1	6	2	469.99	0.10
329	1	14	2	269.99	0.07
329	2	8	2	1799.99	0.05
329	3	23	1	299.99	0.20
329	4	17	1	429.00	0.07
329	5	26	2	599.99	0.05
330	1	21	2	269.99	0.05
331	1	17	2	429.00	0.10
332	1	18	2	449.00	0.05
333	1	18	2	449.00	0.07
333	2	8	2	1799.99	0.05
333	3	3	1	999.99	0.20
334	1	16	2	599.99	0.20
334	2	9	1	2999.99	0.05
334	3	3	2	999.99	0.05
335	1	6	1	469.99	0.10
335	2	2	2	749.99	0.10
335	3	21	1	269.99	0.07
336	1	4	1	2899.99	0.10
336	2	12	1	549.99	0.20
337	1	18	1	449.00	0.05
337	2	4	1	2899.99	0.05
338	1	6	2	469.99	0.07
338	2	10	1	1549.00	0.07
338	3	22	1	269.99	0.10
338	4	11	2	1680.99	0.07
338	5	9	1	2999.99	0.05
339	1	13	1	269.99	0.10
339	2	15	2	529.99	0.05
340	1	11	1	1680.99	0.05
340	2	24	1	549.99	0.05
340	3	13	2	269.99	0.10
340	4	12	2	549.99	0.07
340	5	10	2	1549.00	0.10
341	1	23	2	299.99	0.05
342	1	26	1	599.99	0.07
342	2	9	1	2999.99	0.20
342	3	16	2	599.99	0.10
343	1	20	2	599.99	0.20
343	2	25	1	499.99	0.05
343	3	5	2	1320.99	0.05
343	4	10	1	1549.00	0.10
344	1	22	1	269.99	0.05
344	2	18	2	449.00	0.07
344	3	14	1	269.99	0.20
345	1	18	2	449.00	0.10
345	2	24	2	549.99	0.07
346	1	13	1	269.99	0.07
346	2	23	1	299.99	0.20
346	3	21	1	269.99	0.10
346	4	15	1	529.99	0.05
346	5	18	2	449.00	0.05
347	1	23	1	299.99	0.07
348	1	5	2	1320.99	0.05
348	2	15	2	529.99	0.07
349	1	20	2	599.99	0.20
350	1	6	2	469.99	0.05
350	2	20	1	599.99	0.07
350	3	3	1	999.99	0.07
351	1	4	2	2899.99	0.05
351	2	24	2	549.99	0.10
351	3	20	1	599.99	0.20
351	4	22	2	269.99	0.07
352	1	11	1	1680.99	0.20
352	2	14	1	269.99	0.20
353	1	2	2	749.99	0.20
354	1	21	1	269.99	0.20
354	2	19	1	449.00	0.05
355	1	16	1	599.99	0.10
355	2	14	2	269.99	0.07
356	1	23	2	299.99	0.05
356	2	4	1	2899.99	0.05
356	3	13	1	269.99	0.05
357	1	17	2	429.00	0.05
357	2	21	2	269.99	0.07
357	3	24	1	549.99	0.07
357	4	9	1	2999.99	0.05
358	1	21	2	269.99	0.10
358	2	6	2	469.99	0.07
358	3	8	2	1799.99	0.05
358	4	18	2	449.00	0.10
359	1	15	2	529.99	0.07
359	2	9	2	2999.99	0.07
359	3	7	2	3999.99	0.20
360	1	26	1	599.99	0.05
360	2	7	2	3999.99	0.20
360	3	13	2	269.99	0.05
360	4	25	1	499.99	0.10
361	1	24	2	549.99	0.05
361	2	6	2	469.99	0.10
361	3	11	1	1680.99	0.10
362	1	2	1	749.99	0.07
363	1	21	2	269.99	0.10
363	2	14	1	269.99	0.07
363	3	15	1	529.99	0.10
363	4	20	1	599.99	0.20
364	1	25	2	499.99	0.05
365	1	24	2	549.99	0.07
366	1	21	1	269.99	0.10
366	2	4	1	2899.99	0.07
366	3	16	2	599.99	0.20
367	1	26	2	599.99	0.10
367	2	14	1	269.99	0.05
367	3	10	2	1549.00	0.05
368	1	5	1	1320.99	0.20
368	2	10	2	1549.00	0.20
368	3	21	2	269.99	0.10
368	4	19	1	449.00	0.05
369	1	10	2	1549.00	0.07
370	1	25	2	499.99	0.05
370	2	4	2	2899.99	0.10
371	1	14	1	269.99	0.20
371	2	12	1	549.99	0.20
372	1	11	1	1680.99	0.05
372	2	14	2	269.99	0.10
372	3	5	1	1320.99	0.10
373	1	8	2	1799.99	0.05
373	2	22	1	269.99	0.10
373	3	19	2	449.00	0.20
373	4	12	1	549.99	0.10
373	5	13	1	269.99	0.10
374	1	10	1	1549.00	0.10
374	2	7	1	3999.99	0.07
375	1	21	2	269.99	0.05
375	2	2	2	749.99	0.05
375	3	4	2	2899.99	0.07
375	4	12	2	549.99	0.05
376	1	2	2	749.99	0.07
376	2	23	2	299.99	0.10
377	1	8	1	1799.99	0.05
377	2	14	1	269.99	0.07
378	1	26	2	599.99	0.05
379	1	9	1	2999.99	0.07
379	2	16	1	599.99	0.20
380	1	16	1	599.99	0.05
380	2	11	2	1680.99	0.05
381	1	21	2	269.99	0.07
382	1	8	1	1799.99	0.10
382	2	9	1	2999.99	0.10
382	3	13	1	269.99	0.07
383	1	19	1	449.00	0.07
383	2	22	2	269.99	0.05
383	3	13	1	269.99	0.10
383	4	21	2	269.99	0.05
383	5	14	1	269.99	0.10
384	1	20	1	599.99	0.10
384	2	21	2	269.99	0.20
384	3	8	1	1799.99	0.05
384	4	15	1	529.99	0.10
384	5	4	1	2899.99	0.20
385	1	21	1	269.99	0.07
385	2	7	2	3999.99	0.20
385	3	26	2	599.99	0.05
386	1	8	1	1799.99	0.20
386	2	3	2	999.99	0.05
386	3	16	2	599.99	0.20
387	1	18	1	449.00	0.20
388	1	19	2	449.00	0.20
388	2	13	2	269.99	0.07
388	3	2	1	749.99	0.07
388	4	11	1	1680.99	0.10
389	1	2	1	749.99	0.07
389	2	15	2	529.99	0.07
389	3	10	2	1549.00	0.05
389	4	5	1	1320.99	0.05
389	5	9	1	2999.99	0.20
390	1	23	1	299.99	0.05
390	2	7	2	3999.99	0.07
390	3	9	1	2999.99	0.05
391	1	8	1	1799.99	0.07
391	2	5	2	1320.99	0.20
391	3	24	2	549.99	0.07
392	1	14	2	269.99	0.10
392	2	3	2	999.99	0.05
393	1	6	2	469.99	0.20
394	1	23	1	299.99	0.05
394	2	16	1	599.99	0.20
394	3	14	2	269.99	0.20
395	1	14	1	269.99	0.05
396	1	12	1	549.99	0.10
396	2	25	2	499.99	0.05
396	3	5	1	1320.99	0.20
397	1	7	1	3999.99	0.05
398	1	8	2	1799.99	0.05
398	2	18	2	449.00	0.05
398	3	25	1	499.99	0.20
398	4	17	1	429.00	0.05
399	1	25	1	499.99	0.05
399	2	11	2	1680.99	0.05
399	3	14	1	269.99	0.10
400	1	24	2	549.99	0.07
400	2	9	1	2999.99	0.20
400	3	3	2	999.99	0.20
401	1	23	1	299.99	0.20
401	2	10	2	1549.00	0.20
402	1	6	2	469.99	0.07
402	2	5	1	1320.99	0.07
402	3	26	1	599.99	0.05
403	1	12	2	549.99	0.10
403	2	7	2	3999.99	0.20
403	3	22	2	269.99	0.05
403	4	24	1	549.99	0.20
404	1	9	1	2999.99	0.07
404	2	25	2	499.99	0.05
404	3	16	2	599.99	0.20
405	1	3	2	999.99	0.20
405	2	10	2	1549.00	0.10
405	3	14	2	269.99	0.07
406	1	4	1	2899.99	0.20
407	1	20	1	599.99	0.20
407	2	5	1	1320.99	0.05
408	1	18	1	449.00	0.20
408	2	3	1	999.99	0.07
408	3	2	2	749.99	0.07
408	4	17	2	429.00	0.20
409	1	15	1	529.99	0.07
409	2	16	2	599.99	0.20
409	3	21	1	269.99	0.05
410	1	25	1	499.99	0.10
410	2	9	2	2999.99	0.05
410	3	24	2	549.99	0.10
411	1	2	1	749.99	0.07
411	2	26	2	599.99	0.05
412	1	7	1	3999.99	0.10
412	2	24	1	549.99	0.07
412	3	17	1	429.00	0.10
413	1	8	2	1799.99	0.05
413	2	25	1	499.99	0.10
413	3	9	1	2999.99	0.07
414	1	4	2	2899.99	0.10
415	1	3	1	999.99	0.07
415	2	23	2	299.99	0.20
415	3	5	1	1320.99	0.20
415	4	6	2	469.99	0.05
416	1	22	1	269.99	0.07
416	2	14	1	269.99	0.07
416	3	24	1	549.99	0.10
417	1	26	2	599.99	0.07
417	2	6	2	469.99	0.07
418	1	12	1	549.99	0.05
418	2	20	1	599.99	0.05
419	1	9	1	2999.99	0.05
420	1	17	2	429.00	0.20
420	2	15	2	529.99	0.10
420	3	3	2	999.99	0.05
421	1	6	2	469.99	0.07
421	2	3	2	999.99	0.20
421	3	20	2	599.99	0.20
421	4	4	1	2899.99	0.07
421	5	23	2	299.99	0.20
422	1	20	2	599.99	0.05
423	1	8	2	1799.99	0.05
423	2	17	1	429.00	0.20
423	3	23	2	299.99	0.07
423	4	2	1	749.99	0.20
424	1	22	1	269.99	0.10
424	2	6	1	469.99	0.05
425	1	6	1	469.99	0.10
425	2	21	2	269.99	0.07
425	3	19	1	449.00	0.05
426	1	10	1	1549.00	0.10
426	2	23	2	299.99	0.05
427	1	12	2	549.99	0.07
427	2	15	2	529.99	0.10
427	3	26	2	599.99	0.07
428	1	5	2	1320.99	0.20
428	2	14	1	269.99	0.20
429	1	11	1	1680.99	0.20
429	2	4	2	2899.99	0.10
429	3	5	2	1320.99	0.05
429	4	6	1	469.99	0.07
429	5	2	1	749.99	0.10
430	1	22	2	269.99	0.10
430	2	11	1	1680.99	0.07
430	3	4	2	2899.99	0.20
430	4	13	2	269.99	0.20
430	5	8	1	1799.99	0.20
431	1	14	2	269.99	0.20
431	2	6	1	469.99	0.10
431	3	18	1	449.00	0.20
431	4	13	2	269.99	0.07
431	5	19	1	449.00	0.07
432	1	10	2	1549.00	0.20
432	2	7	2	3999.99	0.05
433	1	6	1	469.99	0.10
433	2	10	1	1549.00	0.20
433	3	24	1	549.99	0.10
433	4	4	1	2899.99	0.20
434	1	21	1	269.99	0.05
434	2	20	1	599.99	0.10
434	3	9	1	2999.99	0.20
434	4	11	2	1680.99	0.07
434	5	18	2	449.00	0.05
435	1	22	1	269.99	0.05
435	2	9	1	2999.99	0.05
435	3	18	1	449.00	0.05
436	1	3	1	999.99	0.05
436	2	23	1	299.99	0.20
437	1	3	1	999.99	0.05
437	2	10	1	1549.00	0.05
437	3	8	2	1799.99	0.05
438	1	4	1	2899.99	0.07
438	2	22	1	269.99	0.10
438	3	8	2	1799.99	0.05
438	4	13	2	269.99	0.05
439	1	6	2	469.99	0.07
439	2	7	2	3999.99	0.05
440	1	19	2	449.00	0.07
440	2	4	2	2899.99	0.07
441	1	12	1	549.99	0.07
441	2	15	1	529.99	0.10
442	1	16	2	599.99	0.07
442	2	26	2	599.99	0.20
442	3	6	2	469.99	0.20
443	1	5	1	1320.99	0.05
443	2	26	1	599.99	0.20
444	1	22	1	269.99	0.07
444	2	15	2	529.99	0.07
444	3	20	2	599.99	0.05
444	4	16	1	599.99	0.10
444	5	10	2	1549.00	0.20
445	1	7	1	3999.99	0.20
445	2	16	1	599.99	0.07
445	3	23	1	299.99	0.20
446	1	22	1	269.99	0.20
446	2	16	2	599.99	0.07
447	1	4	2	2899.99	0.05
447	2	3	1	999.99	0.10
447	3	8	1	1799.99	0.07
448	1	13	2	269.99	0.05
448	2	6	2	469.99	0.05
449	1	17	2	429.00	0.05
449	2	2	1	749.99	0.05
449	3	7	2	3999.99	0.07
449	4	26	2	599.99	0.20
450	1	24	1	549.99	0.05
450	2	12	1	549.99	0.07
450	3	5	1	1320.99	0.10
451	1	14	2	269.99	0.05
452	1	11	1	1680.99	0.05
452	2	16	1	599.99	0.05
452	3	7	2	3999.99	0.10
452	4	8	1	1799.99	0.10
453	1	23	1	299.99	0.05
453	2	20	2	599.99	0.20
453	3	4	1	2899.99	0.20
454	1	25	2	499.99	0.07
454	2	13	2	269.99	0.05
454	3	24	2	549.99	0.10
455	1	9	1	2999.99	0.05
456	1	17	2	429.00	0.07
456	2	23	1	299.99	0.07
457	1	24	2	549.99	0.07
457	2	2	1	749.99	0.05
457	3	7	2	3999.99	0.10
457	4	17	1	429.00	0.20
458	1	2	1	749.99	0.20
458	2	21	2	269.99	0.07
458	3	11	1	1680.99	0.10
458	4	24	1	549.99	0.20
458	5	3	2	999.99	0.20
459	1	11	1	1680.99	0.20
460	1	19	1	449.00	0.05
460	2	18	2	449.00	0.07
460	3	4	1	2899.99	0.20
460	4	22	2	269.99	0.10
461	1	16	1	599.99	0.07
461	2	4	1	2899.99	0.20
461	3	8	2	1799.99	0.05
461	4	24	1	549.99	0.10
461	5	18	2	449.00	0.10
462	1	12	2	549.99	0.10
463	1	13	2	269.99	0.07
464	1	7	1	3999.99	0.10
465	1	6	2	469.99	0.10
465	2	25	2	499.99	0.10
466	1	19	2	449.00	0.20
466	2	6	1	469.99	0.20
466	3	7	2	3999.99	0.05
466	4	15	1	529.99	0.10
466	5	5	1	1320.99	0.10
467	1	19	1	449.00	0.07
467	2	10	1	1549.00	0.07
467	3	22	2	269.99	0.10
467	4	17	2	429.00	0.07
467	5	11	1	1680.99	0.10
468	1	19	1	449.00	0.10
468	2	9	2	2999.99	0.05
468	3	10	2	1549.00	0.05
468	4	25	1	499.99	0.10
469	1	8	2	1799.99	0.10
469	2	4	1	2899.99	0.07
469	3	15	2	529.99	0.20
470	1	18	1	449.00	0.05
470	2	13	1	269.99	0.05
470	3	8	2	1799.99	0.20
471	1	14	1	269.99	0.20
471	2	13	2	269.99	0.05
472	1	15	1	529.99	0.10
472	2	21	2	269.99	0.10
473	1	26	1	599.99	0.07
474	1	19	2	449.00	0.05
474	2	11	1	1680.99	0.20
475	1	17	2	429.00	0.07
475	2	26	2	599.99	0.20
475	3	25	1	499.99	0.20
476	1	22	2	269.99	0.07
476	2	4	2	2899.99	0.20
476	3	11	2	1680.99	0.07
476	4	20	2	599.99	0.05
477	1	6	1	469.99	0.10
477	2	10	1	1549.00	0.05
478	1	21	2	269.99	0.07
479	1	26	1	599.99	0.07
479	2	12	1	549.99	0.05
479	3	21	1	269.99	0.20
479	4	7	1	3999.99	0.05
479	5	10	1	1549.00	0.20
480	1	4	1	2899.99	0.05
480	2	15	1	529.99	0.05
480	3	23	2	299.99	0.07
481	1	13	2	269.99	0.20
481	2	16	2	599.99	0.07
481	3	9	2	2999.99	0.10
482	1	13	1	269.99	0.20
482	2	14	1	269.99	0.10
483	1	17	1	429.00	0.07
484	1	8	2	1799.99	0.10
484	2	24	1	549.99	0.05
484	3	9	2	2999.99	0.05
484	4	6	1	469.99	0.20
485	1	13	1	269.99	0.10
485	2	26	2	599.99	0.05
486	1	9	1	2999.99	0.07
486	2	23	2	299.99	0.05
487	1	6	1	469.99	0.20
488	1	13	2	269.99	0.07
488	2	23	2	299.99	0.05
488	3	22	1	269.99	0.05
489	1	8	2	1799.99	0.10
490	1	12	1	549.99	0.10
490	2	23	1	299.99	0.05
490	3	14	1	269.99	0.10
490	4	13	2	269.99	0.07
491	1	9	2	2999.99	0.20
491	2	21	2	269.99	0.05
491	3	15	2	529.99	0.05
492	1	6	1	469.99	0.10
492	2	22	2	269.99	0.10
492	3	26	1	599.99	0.05
493	1	15	1	529.99	0.05
493	2	18	2	449.00	0.05
493	3	26	1	599.99	0.05
494	1	23	1	299.99	0.10
495	1	22	1	269.99	0.20
495	2	9	1	2999.99	0.05
496	1	23	1	299.99	0.20
496	2	13	1	269.99	0.10
496	3	21	2	269.99	0.20
497	1	25	2	499.99	0.07
498	1	24	1	549.99	0.07
498	2	21	1	269.99	0.10
498	3	10	1	1549.00	0.07
499	1	11	1	1680.99	0.20
499	2	15	1	529.99	0.07
499	3	14	2	269.99	0.20
499	4	20	2	599.99	0.10
500	1	12	2	549.99	0.05
500	2	14	1	269.99	0.20
501	1	19	2	449.00	0.05
501	2	8	1	1799.99	0.07
501	3	14	1	269.99	0.10
501	4	23	2	299.99	0.07
502	1	13	1	269.99	0.05
503	1	13	2	269.99	0.07
503	2	10	1	1549.00	0.05
504	1	24	2	549.99	0.10
504	2	2	2	749.99	0.05
505	1	26	1	599.99	0.20
506	1	25	1	499.99	0.10
506	2	7	1	3999.99	0.07
507	1	11	2	1680.99	0.05
507	2	13	2	269.99	0.07
507	3	20	2	599.99	0.10
508	1	8	1	1799.99	0.05
508	2	2	2	749.99	0.05
508	3	10	2	1549.00	0.05
508	4	25	1	499.99	0.07
509	1	23	2	299.99	0.20
509	2	4	2	2899.99	0.05
510	1	17	1	429.00	0.10
511	1	22	2	269.99	0.05
511	2	13	1	269.99	0.10
512	1	21	1	269.99	0.07
513	1	7	1	3999.99	0.07
513	2	13	1	269.99	0.20
513	3	23	1	299.99	0.07
514	1	18	2	449.00	0.20
514	2	17	2	429.00	0.07
515	1	8	1	1799.99	0.07
515	2	5	1	1320.99	0.10
515	3	25	2	499.99	0.07
515	4	6	2	469.99	0.20
516	1	7	1	3999.99	0.05
516	2	5	2	1320.99	0.10
517	1	21	2	269.99	0.07
518	1	16	2	599.99	0.20
518	2	5	2	1320.99	0.05
518	3	25	2	499.99	0.05
518	4	15	2	529.99	0.20
518	5	11	2	1680.99	0.07
519	1	6	1	469.99	0.07
519	2	16	1	599.99	0.10
519	3	23	2	299.99	0.05
519	4	18	2	449.00	0.20
519	5	7	1	3999.99	0.05
520	1	26	1	599.99	0.10
520	2	24	1	549.99	0.20
520	3	10	1	1549.00	0.07
521	1	5	1	1320.99	0.20
521	2	14	1	269.99	0.20
522	1	4	2	2899.99	0.07
522	2	22	2	269.99	0.07
522	3	21	1	269.99	0.05
523	1	12	1	549.99	0.20
523	2	20	1	599.99	0.05
523	3	5	2	1320.99	0.10
523	4	16	2	599.99	0.07
524	1	11	1	1680.99	0.07
524	2	2	1	749.99	0.05
524	3	9	1	2999.99	0.20
524	4	3	2	999.99	0.07
524	5	26	1	599.99	0.05
525	1	9	2	2999.99	0.07
525	2	6	2	469.99	0.07
525	3	10	1	1549.00	0.10
526	1	3	2	999.99	0.10
526	2	8	1	1799.99	0.10
526	3	21	1	269.99	0.05
526	4	15	1	529.99	0.07
527	1	18	2	449.00	0.07
527	2	4	1	2899.99	0.20
527	3	19	1	449.00	0.10
527	4	9	2	2999.99	0.20
528	1	21	2	269.99	0.05
529	1	12	2	549.99	0.07
530	1	2	2	749.99	0.05
530	2	4	1	2899.99	0.07
530	3	6	2	469.99	0.20
531	1	6	1	469.99	0.20
531	2	12	2	549.99	0.20
531	3	25	1	499.99	0.07
532	1	17	2	429.00	0.07
532	2	16	2	599.99	0.20
532	3	12	1	549.99	0.10
533	1	4	1	2899.99	0.20
533	2	12	2	549.99	0.10
533	3	10	1	1549.00	0.20
533	4	25	1	499.99	0.05
534	1	21	2	269.99	0.05
534	2	9	2	2999.99	0.05
534	3	2	1	749.99	0.07
534	4	24	2	549.99	0.10
535	1	24	1	549.99	0.05
535	2	15	1	529.99	0.10
535	3	22	2	269.99	0.10
536	1	22	1	269.99	0.10
536	2	2	1	749.99	0.10
536	3	12	2	549.99	0.05
536	4	14	1	269.99	0.07
537	1	10	1	1549.00	0.05
537	2	26	1	599.99	0.05
537	3	17	2	429.00	0.10
537	4	25	2	499.99	0.20
538	1	2	2	749.99	0.20
539	1	9	2	2999.99	0.10
539	2	23	1	299.99	0.05
539	3	21	2	269.99	0.07
540	1	19	1	449.00	0.10
540	2	26	2	599.99	0.10
540	3	23	2	299.99	0.07
541	1	22	2	269.99	0.05
542	1	16	2	599.99	0.20
542	2	9	1	2999.99	0.10
542	3	20	1	599.99	0.10
542	4	19	2	449.00	0.20
543	1	25	1	499.99	0.20
543	2	18	1	449.00	0.20
543	3	26	2	599.99	0.05
544	1	12	1	549.99	0.05
544	2	17	1	429.00	0.10
544	3	21	1	269.99	0.05
545	1	25	2	499.99	0.20
545	2	6	1	469.99	0.07
545	3	24	1	549.99	0.20
545	4	20	2	599.99	0.07
546	1	17	2	429.00	0.05
546	2	8	1	1799.99	0.10
546	3	18	2	449.00	0.07
547	1	11	2	1680.99	0.05
547	2	9	1	2999.99	0.20
547	3	5	1	1320.99	0.10
548	1	8	1	1799.99	0.10
548	2	11	2	1680.99	0.07
549	1	15	1	529.99	0.07
549	2	16	1	599.99	0.05
549	3	3	1	999.99	0.07
549	4	7	1	3999.99	0.05
549	5	13	2	269.99	0.10
550	1	4	1	2899.99	0.05
551	1	16	1	599.99	0.05
551	2	26	1	599.99	0.07
551	3	11	2	1680.99	0.20
551	4	15	2	529.99	0.20
552	1	23	1	299.99	0.20
552	2	2	1	749.99	0.20
552	3	24	1	549.99	0.20
552	4	18	1	449.00	0.10
552	5	19	2	449.00	0.20
553	1	24	1	549.99	0.10
553	2	18	2	449.00	0.07
553	3	12	1	549.99	0.07
554	1	3	2	999.99	0.07
554	2	22	1	269.99	0.05
554	3	4	2	2899.99	0.20
555	1	8	1	1799.99	0.20
555	2	7	1	3999.99	0.10
555	3	20	2	599.99	0.07
556	1	16	1	599.99	0.10
556	2	4	2	2899.99	0.20
557	1	9	2	2999.99	0.10
557	2	10	1	1549.00	0.10
558	1	7	1	3999.99	0.07
558	2	16	1	599.99	0.07
558	3	9	1	2999.99	0.10
558	4	21	2	269.99	0.05
558	5	10	2	1549.00	0.07
559	1	15	2	529.99	0.10
559	2	6	1	469.99	0.10
559	3	7	2	3999.99	0.07
560	1	16	1	599.99	0.05
560	2	26	2	599.99	0.10
561	1	15	2	529.99	0.05
561	2	18	1	449.00	0.05
561	3	5	1	1320.99	0.05
561	4	17	2	429.00	0.07
562	1	25	2	499.99	0.07
562	2	26	1	599.99	0.05
563	1	6	2	469.99	0.10
563	2	19	1	449.00	0.05
563	3	13	2	269.99	0.10
564	1	4	1	2899.99	0.20
564	2	15	1	529.99	0.20
565	1	18	1	449.00	0.20
565	2	25	2	499.99	0.10
565	3	9	1	2999.99	0.05
565	4	17	1	429.00	0.10
566	1	24	2	549.99	0.07
566	2	7	2	3999.99	0.20
566	3	8	1	1799.99	0.10
566	4	21	2	269.99	0.20
567	1	9	1	2999.99	0.20
567	2	5	1	1320.99	0.07
568	1	5	1	1320.99	0.05
568	2	10	1	1549.00	0.05
569	1	16	1	599.99	0.05
569	2	24	2	549.99	0.10
570	1	18	1	449.00	0.07
570	2	24	2	549.99	0.10
570	3	3	2	999.99	0.20
570	4	11	1	1680.99	0.10
570	5	16	1	599.99	0.05
571	1	4	1	2899.99	0.05
571	2	9	1	2999.99	0.10
572	1	3	1	999.99	0.05
572	2	13	2	269.99	0.10
572	3	11	2	1680.99	0.20
573	1	2	1	749.99	0.20
574	1	26	1	599.99	0.05
574	2	13	2	269.99	0.10
574	3	12	2	549.99	0.10
574	4	23	2	299.99	0.10
574	5	11	2	1680.99	0.05
575	1	4	2	2899.99	0.07
575	2	12	1	549.99	0.20
576	1	9	1	2999.99	0.10
577	1	3	2	999.99	0.20
578	1	21	1	269.99	0.07
578	2	25	2	499.99	0.20
578	3	18	2	449.00	0.05
578	4	8	2	1799.99	0.20
579	1	7	2	3999.99	0.05
579	2	6	1	469.99	0.20
580	1	16	2	599.99	0.20
580	2	15	1	529.99	0.07
580	3	21	2	269.99	0.20
580	4	9	2	2999.99	0.07
580	5	19	1	449.00	0.20
581	1	8	2	1799.99	0.07
582	1	10	2	1549.00	0.20
582	2	17	2	429.00	0.07
583	1	15	2	529.99	0.20
584	1	19	1	449.00	0.07
584	2	23	1	299.99	0.07
584	3	15	1	529.99	0.10
584	4	22	1	269.99	0.05
584	5	8	2	1799.99	0.07
585	1	10	1	1549.00	0.20
585	2	18	2	449.00	0.20
585	3	15	1	529.99	0.05
585	4	12	2	549.99	0.07
586	1	11	2	1680.99	0.10
586	2	23	2	299.99	0.20
587	1	24	1	549.99	0.05
587	2	23	1	299.99	0.05
587	3	18	1	449.00	0.05
587	4	21	1	269.99	0.20
588	1	10	2	1549.00	0.07
588	2	23	1	299.99	0.20
589	1	15	2	529.99	0.05
590	1	2	2	749.99	0.10
590	2	20	1	599.99	0.07
590	3	8	2	1799.99	0.05
590	4	5	2	1320.99	0.10
590	5	24	1	549.99	0.10
591	1	16	2	599.99	0.05
591	2	25	2	499.99	0.05
591	3	2	2	749.99	0.10
592	1	21	2	269.99	0.10
592	2	16	1	599.99	0.05
592	3	18	2	449.00	0.07
593	1	3	2	999.99	0.10
593	2	25	1	499.99	0.07
594	1	26	1	599.99	0.10
594	2	21	2	269.99	0.05
595	1	4	1	2899.99	0.07
595	2	19	2	449.00	0.07
595	3	3	1	999.99	0.07
595	4	10	1	1549.00	0.07
595	5	26	2	599.99	0.05
596	1	5	1	1320.99	0.05
596	2	23	2	299.99	0.10
596	3	9	1	2999.99	0.05
597	1	17	2	429.00	0.20
597	2	8	1	1799.99	0.07
598	1	4	2	2899.99	0.05
598	2	16	2	599.99	0.07
598	3	14	1	269.99	0.10
599	1	9	2	2999.99	0.05
599	2	22	2	269.99	0.20
599	3	23	1	299.99	0.07
599	4	10	2	1549.00	0.10
600	1	26	2	599.99	0.07
600	2	4	1	2899.99	0.20
600	3	18	2	449.00	0.07
601	1	12	2	549.99	0.20
602	1	15	2	529.99	0.05
602	2	5	2	1320.99	0.07
603	1	12	1	549.99	0.07
603	2	4	1	2899.99	0.10
604	1	10	2	1549.00	0.07
604	2	9	2	2999.99	0.20
605	1	19	1	449.00	0.07
605	2	25	2	499.99	0.05
605	3	13	2	269.99	0.20
605	4	11	1	1680.99	0.20
606	1	6	2	469.99	0.20
606	2	18	2	449.00	0.05
607	1	11	2	1680.99	0.20
607	2	26	2	599.99	0.20
607	3	14	1	269.99	0.07
608	1	4	2	2899.99	0.20
608	2	7	2	3999.99	0.10
608	3	24	1	549.99	0.10
609	1	10	1	1549.00	0.07
609	2	7	1	3999.99	0.10
609	3	22	2	269.99	0.10
609	4	5	1	1320.99	0.10
610	1	26	1	599.99	0.10
610	2	24	1	549.99	0.07
610	3	18	2	449.00	0.07
610	4	3	1	999.99	0.07
610	5	8	1	1799.99	0.10
611	1	16	2	599.99	0.07
612	1	13	1	269.99	0.10
612	2	14	1	269.99	0.10
612	3	17	1	429.00	0.07
612	4	20	1	599.99	0.20
613	1	9	2	2999.99	0.10
613	2	18	2	449.00	0.05
613	3	12	1	549.99	0.07
614	1	18	1	449.00	0.10
614	2	21	1	269.99	0.05
615	1	11	1	1680.99	0.07
615	2	23	1	299.99	0.05
615	3	6	2	469.99	0.10
615	4	19	2	449.00	0.10
616	1	24	1	549.99	0.20
616	2	16	2	599.99	0.20
617	1	15	2	529.99	0.20
617	2	11	2	1680.99	0.07
618	1	17	2	429.00	0.10
618	2	11	1	1680.99	0.07
619	1	25	1	499.99	0.07
620	1	5	2	1320.99	0.20
621	1	17	2	429.00	0.07
622	1	9	2	2999.99	0.07
622	2	18	1	449.00	0.10
622	3	10	1	1549.00	0.20
622	4	25	1	499.99	0.07
623	1	8	1	1799.99	0.07
624	1	21	2	269.99	0.05
624	2	16	1	599.99	0.07
624	3	22	1	269.99	0.07
624	4	14	2	269.99	0.20
625	1	17	1	429.00	0.07
625	2	11	2	1680.99	0.20
625	3	26	1	599.99	0.07
625	4	23	2	299.99	0.10
626	1	15	1	529.99	0.20
627	1	19	1	449.00	0.07
627	2	9	2	2999.99	0.20
627	3	26	1	599.99	0.07
628	1	15	2	529.99	0.10
629	1	19	1	449.00	0.05
629	2	5	2	1320.99	0.05
629	3	23	2	299.99	0.10
629	4	14	2	269.99	0.05
629	5	6	2	469.99	0.10
630	1	5	1	1320.99	0.05
630	2	25	1	499.99	0.10
630	3	18	2	449.00	0.10
630	4	21	2	269.99	0.07
631	1	24	2	549.99	0.07
631	2	15	2	529.99	0.07
632	1	25	1	499.99	0.20
632	2	11	2	1680.99	0.10
632	3	15	1	529.99	0.07
632	4	6	1	469.99	0.05
632	5	22	2	269.99	0.10
633	1	12	2	549.99	0.05
633	2	13	2	269.99	0.20
633	3	5	2	1320.99	0.20
633	4	10	2	1549.00	0.20
634	1	4	2	2899.99	0.05
634	2	12	1	549.99	0.10
635	1	4	1	2899.99	0.05
636	1	85	2	329.99	0.20
637	1	9	1	2999.99	0.10
637	2	106	2	449.99	0.10
638	1	103	1	551.99	0.05
638	2	56	1	5499.99	0.20
638	3	53	2	749.99	0.05
639	1	15	1	529.99	0.07
639	2	73	1	749.99	0.05
639	3	72	1	619.99	0.05
639	4	61	2	4999.99	0.10
640	1	106	2	449.99	0.05
640	2	32	1	469.99	0.07
640	3	30	1	999.99	0.07
640	4	76	2	299.99	0.07
640	5	109	2	416.99	0.20
641	1	15	1	529.99	0.05
641	2	62	1	3499.99	0.20
641	3	64	1	489.99	0.20
642	1	68	2	449.99	0.07
643	1	53	1	749.99	0.05
644	1	9	1	2999.99	0.07
645	1	99	1	299.99	0.07
645	2	42	2	2299.99	0.05
645	3	6	1	469.99	0.05
645	4	47	2	5299.99	0.07
645	5	21	2	269.99	0.07
646	1	15	2	529.99	0.20
646	2	4	1	2899.99	0.07
646	3	95	1	299.99	0.05
646	4	12	1	549.99	0.20
647	1	25	2	499.99	0.07
647	2	13	1	269.99	0.10
648	1	24	1	549.99	0.07
649	1	97	2	349.99	0.10
649	2	90	1	209.99	0.07
649	3	11	2	1680.99	0.10
649	4	78	1	647.99	0.05
650	1	3	1	999.99	0.20
651	1	79	1	402.99	0.10
651	2	85	1	329.99	0.05
651	3	102	2	489.99	0.05
651	4	94	2	249.99	0.05
652	1	102	1	489.99	0.10
652	2	62	2	3499.99	0.20
652	3	67	2	250.99	0.20
652	4	23	1	299.99	0.10
652	5	74	1	439.99	0.05
653	1	6	1	469.99	0.07
653	2	43	1	5299.99	0.10
653	3	2	2	749.99	0.10
653	4	80	1	761.99	0.20
653	5	88	2	189.99	0.07
654	1	9	1	2999.99	0.10
654	2	95	1	299.99	0.10
654	3	110	2	470.99	0.07
654	4	97	2	349.99	0.07
655	1	67	1	250.99	0.10
656	1	83	1	149.99	0.10
656	2	22	1	269.99	0.07
656	3	33	2	469.99	0.05
657	1	52	1	875.99	0.05
657	2	54	2	3199.99	0.05
658	1	49	2	3499.99	0.20
658	2	29	1	999.99	0.05
658	3	9	1	2999.99	0.05
659	1	42	2	2299.99	0.05
659	2	39	2	1499.99	0.07
659	3	70	1	659.99	0.05
659	4	61	2	4999.99	0.07
660	1	30	1	999.99	0.20
660	2	59	2	2599.99	0.07
660	3	47	2	5299.99	0.05
660	4	29	2	999.99	0.20
661	1	63	2	3499.99	0.07
661	2	22	2	269.99	0.05
662	1	55	2	2699.99	0.10
662	2	95	2	299.99	0.20
662	3	102	2	489.99	0.07
662	4	22	1	269.99	0.07
662	5	106	2	449.99	0.07
663	1	41	2	1469.99	0.05
663	2	17	2	429.00	0.20
663	3	94	1	249.99	0.05
663	4	71	1	416.99	0.07
663	5	106	1	449.99	0.20
664	1	52	2	875.99	0.07
664	2	5	1	1320.99	0.07
664	3	50	1	5999.99	0.20
664	4	101	2	339.99	0.20
664	5	47	1	5299.99	0.07
665	1	58	1	4999.99	0.07
665	2	42	2	2299.99	0.20
665	3	25	2	499.99	0.05
666	1	98	2	489.99	0.20
666	2	39	1	1499.99	0.05
667	1	79	1	402.99	0.20
667	2	84	1	109.99	0.10
667	3	3	1	999.99	0.20
667	4	99	1	299.99	0.10
667	5	85	1	329.99	0.05
668	1	48	2	1499.99	0.05
668	2	19	2	449.00	0.10
669	1	16	2	599.99	0.07
669	2	72	1	619.99	0.07
670	1	108	1	449.99	0.10
670	2	28	1	2499.99	0.07
670	3	104	2	481.99	0.20
670	4	45	2	869.99	0.05
671	1	30	1	999.99	0.05
671	2	69	1	416.99	0.05
671	3	55	1	2699.99	0.20
671	4	4	1	2899.99	0.07
671	5	109	2	416.99	0.07
672	1	51	2	6499.99	0.07
672	2	96	2	349.99	0.20
672	3	48	2	1499.99	0.07
673	1	66	1	250.99	0.20
673	2	38	1	549.99	0.20
673	3	5	1	1320.99	0.07
673	4	13	1	269.99	0.10
674	1	26	2	599.99	0.20
675	1	17	1	429.00	0.05
675	2	89	2	209.99	0.05
675	3	19	1	449.00	0.07
675	4	32	1	469.99	0.20
676	1	70	1	659.99	0.20
676	2	104	2	481.99	0.07
676	3	24	1	549.99	0.10
676	4	29	1	999.99	0.20
677	1	75	1	599.99	0.07
677	2	7	2	3999.99	0.07
677	3	105	2	533.99	0.07
677	4	91	2	349.99	0.05
677	5	54	2	3199.99	0.10
678	1	52	2	875.99	0.05
678	2	37	2	379.99	0.07
679	1	15	2	529.99	0.20
679	2	83	2	149.99	0.05
680	1	81	2	1099.99	0.05
680	2	7	1	3999.99	0.20
680	3	50	1	5999.99	0.07
681	1	82	1	659.99	0.05
681	2	63	1	3499.99	0.07
681	3	61	1	4999.99	0.20
681	4	6	2	469.99	0.05
681	5	30	1	999.99	0.07
682	1	39	1	1499.99	0.20
682	2	60	2	1559.99	0.20
682	3	99	1	299.99	0.20
683	1	2	2	749.99	0.10
684	1	56	1	5499.99	0.07
684	2	33	1	469.99	0.10
685	1	59	1	2599.99	0.05
685	2	48	2	1499.99	0.05
685	3	107	1	416.99	0.05
685	4	98	2	489.99	0.20
685	5	56	2	5499.99	0.05
686	1	16	1	599.99	0.20
686	2	30	1	999.99	0.10
686	3	88	2	189.99	0.20
686	4	19	2	449.00	0.20
686	5	104	1	481.99	0.20
687	1	48	2	1499.99	0.05
687	2	95	1	299.99	0.07
687	3	5	2	1320.99	0.20
687	4	83	1	149.99	0.07
688	1	8	1	1799.99	0.10
688	2	88	1	189.99	0.05
689	1	33	2	469.99	0.10
690	1	84	1	109.99	0.20
690	2	11	2	1680.99	0.07
690	3	85	1	329.99	0.05
690	4	109	2	416.99	0.20
691	1	23	2	299.99	0.05
691	2	5	2	1320.99	0.10
691	3	55	2	2699.99	0.20
691	4	20	1	599.99	0.20
692	1	59	1	2599.99	0.20
692	2	75	1	599.99	0.07
692	3	15	2	529.99	0.07
692	4	56	2	5499.99	0.10
693	1	104	2	481.99	0.20
693	2	13	1	269.99	0.20
693	3	5	2	1320.99	0.05
693	4	31	1	1632.99	0.07
694	1	48	1	1499.99	0.20
694	2	39	1	1499.99	0.05
694	3	55	2	2699.99	0.10
694	4	103	2	551.99	0.20
694	5	45	2	869.99	0.10
695	1	82	2	659.99	0.10
695	2	57	2	1999.99	0.20
696	1	88	2	189.99	0.07
696	2	7	1	3999.99	0.10
696	3	45	1	869.99	0.07
697	1	5	2	1320.99	0.05
698	1	96	1	349.99	0.07
698	2	12	1	549.99	0.07
698	3	40	2	4999.99	0.05
699	1	106	2	449.99	0.10
699	2	48	1	1499.99	0.07
699	3	31	1	1632.99	0.20
699	4	24	2	549.99	0.10
699	5	82	2	659.99	0.20
700	1	7	2	3999.99	0.05
700	2	63	1	3499.99	0.20
701	1	84	1	109.99	0.05
702	1	25	2	499.99	0.05
702	2	104	1	481.99	0.10
702	3	3	2	999.99	0.07
703	1	45	2	869.99	0.20
703	2	66	2	250.99	0.05
703	3	72	1	619.99	0.20
703	4	4	2	2899.99	0.20
704	1	10	2	1549.00	0.05
704	2	62	1	3499.99	0.20
704	3	100	2	489.99	0.07
705	1	61	1	4999.99	0.10
706	1	27	1	999.99	0.10
706	2	23	2	299.99	0.05
706	3	60	1	1559.99	0.20
707	1	106	2	449.99	0.05
707	2	100	1	489.99	0.07
707	3	11	2	1680.99	0.10
707	4	26	2	599.99	0.10
708	1	6	1	469.99	0.07
708	2	47	1	5299.99	0.10
708	3	34	2	469.99	0.20
709	1	55	2	2699.99	0.05
709	2	101	2	339.99	0.07
709	3	48	1	1499.99	0.07
710	1	42	1	2299.99	0.05
710	2	60	2	1559.99	0.20
710	3	39	2	1499.99	0.20
710	4	57	1	1999.99	0.20
710	5	28	1	2499.99	0.05
711	1	5	2	1320.99	0.05
711	2	95	2	299.99	0.20
711	3	72	2	619.99	0.05
712	1	44	2	539.99	0.20
712	2	74	2	439.99	0.10
712	3	35	1	832.99	0.20
712	4	76	1	299.99	0.20
712	5	4	2	2899.99	0.05
713	1	93	2	209.99	0.20
713	2	97	2	349.99	0.10
713	3	53	1	749.99	0.07
713	4	108	2	449.99	0.07
714	1	92	2	209.99	0.20
715	1	61	2	4999.99	0.10
715	2	50	1	5999.99	0.20
716	1	111	2	470.99	0.10
716	2	93	2	209.99	0.07
716	3	79	1	402.99	0.10
716	4	4	2	2899.99	0.05
717	1	56	2	5499.99	0.05
717	2	93	1	209.99	0.20
718	1	92	2	209.99	0.07
718	2	40	2	4999.99	0.07
718	3	64	2	489.99	0.10
719	1	100	1	489.99	0.20
720	1	111	1	470.99	0.07
720	2	6	1	469.99	0.10
721	1	45	2	869.99	0.07
721	2	102	1	489.99	0.10
721	3	73	2	749.99	0.05
721	4	33	1	469.99	0.20
722	1	22	2	269.99	0.07
722	2	3	1	999.99	0.05
722	3	104	2	481.99	0.10
723	1	24	2	549.99	0.07
723	2	16	1	599.99	0.05
723	3	108	1	449.99	0.07
724	1	23	1	299.99	0.05
724	2	75	1	599.99	0.20
724	3	102	1	489.99	0.05
724	4	55	1	2699.99	0.20
725	1	90	1	209.99	0.10
725	2	91	1	349.99	0.05
725	3	77	2	799.99	0.07
725	4	62	2	3499.99	0.10
726	1	64	1	489.99	0.20
727	1	78	1	647.99	0.07
727	2	82	2	659.99	0.05
728	1	70	1	659.99	0.05
728	2	56	1	5499.99	0.10
728	3	91	1	349.99	0.10
728	4	58	1	4999.99	0.07
729	1	101	2	339.99	0.10
730	1	59	2	2599.99	0.05
730	2	79	1	402.99	0.10
730	3	96	2	349.99	0.07
730	4	13	1	269.99	0.10
731	1	91	1	349.99	0.05
731	2	49	1	3499.99	0.20
731	3	67	2	250.99	0.20
731	4	29	1	999.99	0.20
732	1	47	1	5299.99	0.07
732	2	4	2	2899.99	0.07
733	1	84	1	109.99	0.05
733	2	55	1	2699.99	0.20
733	3	102	2	489.99	0.10
734	1	26	1	599.99	0.20
734	2	3	1	999.99	0.05
734	3	84	2	109.99	0.20
734	4	65	2	346.99	0.10
735	1	71	2	416.99	0.10
735	2	10	2	1549.00	0.07
736	1	56	2	5499.99	0.05
736	2	17	1	429.00	0.10
736	3	62	2	3499.99	0.20
737	1	52	1	875.99	0.05
737	2	19	2	449.00	0.07
737	3	77	2	799.99	0.07
737	4	34	1	469.99	0.20
738	1	82	2	659.99	0.07
738	2	38	2	549.99	0.20
738	3	25	1	499.99	0.10
738	4	63	1	3499.99	0.07
739	1	3	1	999.99	0.20
740	1	81	1	1099.99	0.05
740	2	94	2	249.99	0.20
740	3	11	1	1680.99	0.20
740	4	19	1	449.00	0.20
740	5	12	2	549.99	0.07
741	1	58	1	4999.99	0.05
741	2	76	1	299.99	0.07
741	3	21	2	269.99	0.07
741	4	56	2	5499.99	0.05
742	1	107	2	416.99	0.05
742	2	45	1	869.99	0.07
743	1	80	1	761.99	0.05
744	1	33	2	469.99	0.20
745	1	95	2	299.99	0.05
745	2	22	2	269.99	0.20
745	3	78	1	647.99	0.10
746	1	99	1	299.99	0.10
747	1	110	1	470.99	0.07
747	2	86	1	149.99	0.20
747	3	33	2	469.99	0.10
747	4	81	1	1099.99	0.07
748	1	16	2	599.99	0.10
748	2	83	2	149.99	0.05
748	3	41	1	1469.99	0.07
748	4	35	2	832.99	0.20
749	1	9	1	2999.99	0.20
749	2	28	1	2499.99	0.05
749	3	79	1	402.99	0.20
749	4	24	1	549.99	0.05
749	5	40	1	4999.99	0.07
750	1	72	1	619.99	0.05
750	2	78	2	647.99	0.10
751	1	45	2	869.99	0.05
752	1	12	2	549.99	0.05
752	2	31	2	1632.99	0.05
753	1	105	2	533.99	0.07
753	2	7	2	3999.99	0.20
753	3	36	2	832.99	0.10
753	4	95	1	299.99	0.07
753	5	66	1	250.99	0.20
754	1	74	2	439.99	0.07
754	2	12	2	549.99	0.07
754	3	3	1	999.99	0.05
754	4	67	2	250.99	0.05
754	5	7	1	3999.99	0.20
755	1	80	2	761.99	0.07
755	2	43	2	5299.99	0.05
755	3	57	2	1999.99	0.10
756	1	64	1	489.99	0.10
756	2	17	2	429.00	0.05
757	1	95	1	299.99	0.10
758	1	22	2	269.99	0.07
758	2	99	1	299.99	0.10
758	3	27	1	999.99	0.07
758	4	65	2	346.99	0.07
758	5	109	1	416.99	0.20
759	1	93	2	209.99	0.05
759	2	78	1	647.99	0.07
760	1	21	2	269.99	0.07
760	2	29	2	999.99	0.07
761	1	43	1	5299.99	0.07
761	2	52	2	875.99	0.20
762	1	102	2	489.99	0.05
763	1	90	1	209.99	0.07
763	2	103	1	551.99	0.10
764	1	55	1	2699.99	0.07
764	2	95	2	299.99	0.05
764	3	81	2	1099.99	0.07
765	1	28	2	2499.99	0.20
765	2	12	1	549.99	0.07
765	3	25	1	499.99	0.20
765	4	53	1	749.99	0.20
765	5	65	1	346.99	0.05
766	1	111	1	470.99	0.20
767	1	63	1	3499.99	0.10
767	2	29	1	999.99	0.07
767	3	41	2	1469.99	0.05
767	4	77	2	799.99	0.05
768	1	31	1	1632.99	0.20
768	2	76	1	299.99	0.20
769	1	8	1	1799.99	0.10
769	2	6	2	469.99	0.05
769	3	36	2	832.99	0.07
770	1	110	1	470.99	0.05
770	2	42	1	2299.99	0.20
770	3	103	1	551.99	0.20
770	4	11	2	1680.99	0.05
771	1	13	2	269.99	0.20
771	2	88	1	189.99	0.20
772	1	103	1	551.99	0.07
773	1	92	1	209.99	0.10
773	2	14	1	269.99	0.05
773	3	17	2	429.00	0.20
773	4	33	2	469.99	0.07
774	1	65	1	346.99	0.05
774	2	36	2	832.99	0.05
774	3	20	1	599.99	0.20
774	4	73	1	749.99	0.05
774	5	58	2	4999.99	0.10
775	1	39	1	1499.99	0.07
776	1	28	1	2499.99	0.20
776	2	42	2	2299.99	0.20
776	3	71	1	416.99	0.10
776	4	35	1	832.99	0.10
777	1	5	1	1320.99	0.20
777	2	7	2	3999.99	0.20
777	3	2	1	749.99	0.20
778	1	64	1	489.99	0.10
778	2	85	1	329.99	0.05
779	1	101	1	339.99	0.05
779	2	90	2	209.99	0.20
779	3	47	1	5299.99	0.20
779	4	8	1	1799.99	0.20
779	5	85	1	329.99	0.20
780	1	32	1	469.99	0.10
781	1	109	2	416.99	0.05
781	2	7	2	3999.99	0.20
781	3	57	2	1999.99	0.10
782	1	20	2	599.99	0.07
782	2	57	1	1999.99	0.07
782	3	99	1	299.99	0.07
782	4	16	2	599.99	0.20
783	1	92	1	209.99	0.20
783	2	22	2	269.99	0.05
783	3	94	1	249.99	0.05
783	4	29	1	999.99	0.10
784	1	22	1	269.99	0.07
784	2	72	2	619.99	0.10
784	3	16	1	599.99	0.20
785	1	59	2	2599.99	0.20
785	2	40	1	4999.99	0.07
785	3	25	1	499.99	0.07
786	1	80	1	761.99	0.05
787	1	51	2	6499.99	0.07
787	2	66	2	250.99	0.10
788	1	48	1	1499.99	0.20
788	2	19	1	449.00	0.10
788	3	13	1	269.99	0.05
789	1	100	2	489.99	0.20
789	2	93	2	209.99	0.07
790	1	62	2	3499.99	0.07
790	2	91	1	349.99	0.10
791	1	54	1	3199.99	0.20
791	2	25	2	499.99	0.07
792	1	16	2	599.99	0.20
792	2	39	1	1499.99	0.20
792	3	56	1	5499.99	0.20
792	4	30	1	999.99	0.05
792	5	2	1	749.99	0.20
793	1	60	1	1559.99	0.05
793	2	95	2	299.99	0.05
793	3	75	2	599.99	0.05
794	1	41	2	1469.99	0.05
794	2	68	1	449.99	0.20
794	3	17	1	429.00	0.07
794	4	28	1	2499.99	0.10
795	1	95	2	299.99	0.05
795	2	99	2	299.99	0.05
796	1	6	2	469.99	0.20
797	1	11	1	1680.99	0.07
797	2	69	1	416.99	0.05
797	3	74	1	439.99	0.10
797	4	54	2	3199.99	0.05
797	5	62	2	3499.99	0.10
798	1	23	1	299.99	0.10
798	2	90	1	209.99	0.05
798	3	91	2	349.99	0.07
798	4	42	1	2299.99	0.20
798	5	26	2	599.99	0.05
799	1	5	2	1320.99	0.10
799	2	34	2	469.99	0.05
799	3	29	2	999.99	0.07
799	4	63	1	3499.99	0.10
799	5	58	2	4999.99	0.07
800	1	65	2	346.99	0.10
800	2	54	1	3199.99	0.07
800	3	6	2	469.99	0.05
800	4	52	1	875.99	0.10
800	5	95	2	299.99	0.05
801	1	101	1	339.99	0.07
802	1	30	1	999.99	0.05
802	2	36	2	832.99	0.20
802	3	40	1	4999.99	0.10
802	4	28	1	2499.99	0.05
803	1	111	1	470.99	0.07
803	2	52	2	875.99	0.05
803	3	102	1	489.99	0.07
803	4	83	2	149.99	0.05
804	1	89	2	209.99	0.20
804	2	53	1	749.99	0.07
804	3	50	2	5999.99	0.05
805	1	24	1	549.99	0.05
805	2	33	2	469.99	0.20
805	3	62	2	3499.99	0.20
805	4	32	1	469.99	0.07
805	5	6	2	469.99	0.05
806	1	93	2	209.99	0.10
806	2	97	1	349.99	0.20
806	3	77	2	799.99	0.10
806	4	82	2	659.99	0.20
806	5	91	2	349.99	0.07
807	1	21	2	269.99	0.20
807	2	6	1	469.99	0.07
807	3	3	2	999.99	0.07
807	4	9	2	2999.99	0.20
807	5	16	1	599.99	0.20
808	1	96	2	349.99	0.05
808	2	18	1	449.00	0.05
808	3	85	1	329.99	0.05
808	4	19	2	449.00	0.05
809	1	78	1	647.99	0.10
809	2	26	1	599.99	0.20
809	3	92	2	209.99	0.10
810	1	103	2	551.99	0.05
810	2	100	1	489.99	0.20
810	3	56	1	5499.99	0.05
810	4	22	1	269.99	0.20
811	1	45	2	869.99	0.07
811	2	54	1	3199.99	0.20
811	3	70	1	659.99	0.07
811	4	66	1	250.99	0.10
812	1	76	2	299.99	0.10
812	2	40	1	4999.99	0.20
813	1	96	2	349.99	0.10
813	2	85	2	329.99	0.20
813	3	33	2	469.99	0.20
813	4	26	2	599.99	0.07
813	5	71	2	416.99	0.05
814	1	69	2	416.99	0.10
814	2	100	1	489.99	0.10
814	3	65	1	346.99	0.20
814	4	83	2	149.99	0.05
815	1	105	2	533.99	0.20
815	2	102	2	489.99	0.20
815	3	87	2	189.99	0.10
815	4	23	1	299.99	0.07
816	1	75	2	599.99	0.10
816	2	64	2	489.99	0.20
817	1	85	1	329.99	0.05
817	2	105	2	533.99	0.07
817	3	48	2	1499.99	0.05
818	1	103	1	551.99	0.05
818	2	44	2	539.99	0.07
818	3	19	2	449.00	0.05
818	4	48	2	1499.99	0.05
819	1	94	1	249.99	0.20
820	1	107	1	416.99	0.05
821	1	102	1	489.99	0.07
821	2	70	2	659.99	0.20
821	3	6	1	469.99	0.20
821	4	107	1	416.99	0.05
822	1	53	1	749.99	0.05
822	2	72	1	619.99	0.20
823	1	56	2	5499.99	0.07
823	2	86	2	149.99	0.20
823	3	81	1	1099.99	0.20
824	1	92	2	209.99	0.10
825	1	19	1	449.00	0.10
825	2	30	2	999.99	0.20
826	1	45	2	869.99	0.20
826	2	36	1	832.99	0.10
827	1	43	1	5299.99	0.05
827	2	41	1	1469.99	0.20
827	3	28	1	2499.99	0.20
827	4	108	1	449.99	0.20
828	1	25	2	499.99	0.20
828	2	24	1	549.99	0.20
828	3	55	2	2699.99	0.07
829	1	103	1	551.99	0.20
829	2	105	2	533.99	0.10
830	1	85	2	329.99	0.20
830	2	100	2	489.99	0.07
830	3	96	2	349.99	0.20
831	1	67	1	250.99	0.20
831	2	11	1	1680.99	0.20
831	3	68	1	449.99	0.10
832	1	54	1	3199.99	0.05
832	2	45	1	869.99	0.20
832	3	27	1	999.99	0.07
832	4	16	2	599.99	0.10
833	1	20	2	599.99	0.05
834	1	54	1	3199.99	0.07
834	2	21	1	269.99	0.05
834	3	78	1	647.99	0.20
835	1	65	2	346.99	0.07
835	2	82	1	659.99	0.20
835	3	2	1	749.99	0.05
836	1	108	2	449.99	0.20
837	1	51	1	6499.99	0.05
837	2	97	1	349.99	0.10
837	3	87	2	189.99	0.20
838	1	28	1	2499.99	0.10
838	2	10	1	1549.00	0.10
838	3	100	2	489.99	0.05
838	4	65	2	346.99	0.07
839	1	55	1	2699.99	0.07
839	2	85	1	329.99	0.10
839	3	58	2	4999.99	0.05
840	1	27	1	999.99	0.07
840	2	43	1	5299.99	0.07
840	3	106	2	449.99	0.20
841	1	22	2	269.99	0.10
841	2	9	1	2999.99	0.20
841	3	11	1	1680.99	0.20
841	4	90	2	209.99	0.07
841	5	100	1	489.99	0.10
842	1	81	2	1099.99	0.07
842	2	42	1	2299.99	0.10
843	1	72	1	619.99	0.10
843	2	75	2	599.99	0.10
843	3	81	1	1099.99	0.10
843	4	23	2	299.99	0.07
844	1	79	2	402.99	0.07
844	2	12	1	549.99	0.10
844	3	83	2	149.99	0.20
844	4	48	1	1499.99	0.20
844	5	63	2	3499.99	0.05
845	1	16	2	599.99	0.20
845	2	75	1	599.99	0.20
845	3	26	2	599.99	0.05
845	4	73	2	749.99	0.20
845	5	88	1	189.99	0.05
846	1	46	2	1409.99	0.05
846	2	47	1	5299.99	0.07
846	3	71	1	416.99	0.10
846	4	72	2	619.99	0.05
846	5	103	2	551.99	0.07
847	1	61	2	4999.99	0.05
848	1	93	1	209.99	0.07
848	2	100	2	489.99	0.20
848	3	88	2	189.99	0.20
848	4	41	2	1469.99	0.07
849	1	109	1	416.99	0.20
850	1	101	2	339.99	0.07
850	2	5	2	1320.99	0.07
850	3	37	1	379.99	0.07
851	1	30	1	999.99	0.20
851	2	93	1	209.99	0.05
852	1	46	2	1409.99	0.07
853	1	99	1	299.99	0.05
853	2	58	2	4999.99	0.20
853	3	42	2	2299.99	0.20
853	4	45	1	869.99	0.20
853	5	6	1	469.99	0.05
854	1	87	1	189.99	0.10
855	1	18	1	449.00	0.10
855	2	93	2	209.99	0.20
855	3	89	1	209.99	0.20
856	1	38	2	549.99	0.05
857	1	29	1	999.99	0.20
858	1	45	2	869.99	0.20
858	2	5	1	1320.99	0.20
858	3	14	1	269.99	0.07
858	4	73	2	749.99	0.07
859	1	38	2	549.99	0.07
859	2	13	1	269.99	0.10
859	3	14	2	269.99	0.10
859	4	71	2	416.99	0.10
859	5	36	2	832.99	0.10
860	1	6	1	469.99	0.05
860	2	24	2	549.99	0.20
860	3	25	1	499.99	0.20
860	4	58	2	4999.99	0.07
860	5	95	2	299.99	0.05
861	1	14	2	269.99	0.07
861	2	62	1	3499.99	0.20
862	1	85	1	329.99	0.05
862	2	99	1	299.99	0.20
862	3	49	2	3499.99	0.07
863	1	93	2	209.99	0.10
864	1	37	1	379.99	0.10
864	2	65	2	346.99	0.05
864	3	13	1	269.99	0.20
865	1	109	2	416.99	0.10
865	2	34	1	469.99	0.05
866	1	88	1	189.99	0.20
866	2	67	2	250.99	0.07
866	3	80	1	761.99	0.07
866	4	13	2	269.99	0.07
867	1	101	1	339.99	0.05
868	1	46	1	1409.99	0.07
869	1	7	1	3999.99	0.20
869	2	106	2	449.99	0.05
869	3	33	1	469.99	0.05
869	4	55	2	2699.99	0.05
869	5	65	2	346.99	0.20
870	1	63	1	3499.99	0.07
871	1	106	1	449.99	0.20
871	2	38	1	549.99	0.10
871	3	30	2	999.99	0.20
871	4	107	2	416.99	0.05
872	1	62	2	3499.99	0.07
872	2	53	1	749.99	0.10
873	1	32	2	469.99	0.10
874	1	56	1	5499.99	0.05
874	2	27	2	999.99	0.05
874	3	73	1	749.99	0.10
874	4	77	2	799.99	0.07
875	1	5	2	1320.99	0.10
875	2	15	2	529.99	0.05
875	3	14	1	269.99	0.07
875	4	111	1	470.99	0.20
876	1	17	2	429.00	0.20
876	2	66	2	250.99	0.20
876	3	96	1	349.99	0.07
876	4	107	2	416.99	0.05
877	1	73	1	749.99	0.07
877	2	103	1	551.99	0.10
878	1	103	1	551.99	0.20
878	2	13	1	269.99	0.10
878	3	6	2	469.99	0.20
878	4	18	2	449.00	0.05
879	1	100	2	489.99	0.20
879	2	2	2	749.99	0.07
879	3	83	2	149.99	0.20
879	4	82	1	659.99	0.07
880	1	28	2	2499.99	0.20
880	2	95	1	299.99	0.10
880	3	5	1	1320.99	0.07
880	4	26	1	599.99	0.10
880	5	66	1	250.99	0.20
881	1	98	1	489.99	0.07
881	2	50	1	5999.99	0.20
881	3	64	2	489.99	0.05
881	4	67	1	250.99	0.10
882	1	63	2	3499.99	0.07
882	2	108	2	449.99	0.20
882	3	57	2	1999.99	0.07
883	1	44	1	539.99	0.05
883	2	5	2	1320.99	0.05
884	1	49	2	3499.99	0.05
884	2	69	2	416.99	0.07
884	3	46	2	1409.99	0.20
884	4	10	1	1549.00	0.10
884	5	21	2	269.99	0.05
885	1	106	1	449.99	0.07
885	2	43	1	5299.99	0.10
886	1	47	1	5299.99	0.05
886	2	30	1	999.99	0.05
887	1	50	2	5999.99	0.05
887	2	70	1	659.99	0.10
888	1	33	2	469.99	0.10
888	2	26	2	599.99	0.20
889	1	12	2	549.99	0.10
890	1	16	2	599.99	0.10
890	2	105	2	533.99	0.10
890	3	52	1	875.99	0.05
890	4	67	1	250.99	0.10
890	5	65	2	346.99	0.10
891	1	107	2	416.99	0.10
891	2	32	1	469.99	0.05
891	3	35	2	832.99	0.10
891	4	50	1	5999.99	0.10
892	1	36	1	832.99	0.10
892	2	9	2	2999.99	0.20
892	3	50	2	5999.99	0.07
892	4	88	1	189.99	0.05
893	1	67	2	250.99	0.05
893	2	45	1	869.99	0.07
894	1	101	2	339.99	0.20
895	1	106	1	449.99	0.07
896	1	91	2	349.99	0.05
896	2	10	1	1549.00	0.05
897	1	105	1	533.99	0.05
897	2	96	1	349.99	0.05
898	1	45	2	869.99	0.20
898	2	16	1	599.99	0.07
898	3	57	2	1999.99	0.20
898	4	69	2	416.99	0.07
899	1	59	2	2599.99	0.10
899	2	17	1	429.00	0.10
899	3	6	1	469.99	0.20
900	1	26	2	599.99	0.05
900	2	108	1	449.99	0.07
900	3	89	1	209.99	0.20
900	4	61	2	4999.99	0.05
900	5	28	2	2499.99	0.07
901	1	50	1	5999.99	0.20
901	2	43	1	5299.99	0.07
902	1	38	2	549.99	0.07
902	2	92	1	209.99	0.07
902	3	12	1	549.99	0.20
902	4	76	2	299.99	0.05
903	1	31	2	1632.99	0.07
903	2	48	2	1499.99	0.05
904	1	36	2	832.99	0.10
904	2	51	2	6499.99	0.07
904	3	92	2	209.99	0.20
904	4	13	1	269.99	0.20
905	1	67	1	250.99	0.10
905	2	62	2	3499.99	0.05
905	3	42	2	2299.99	0.20
905	4	20	1	599.99	0.20
906	1	23	2	299.99	0.20
906	2	28	2	2499.99	0.07
906	3	46	1	1409.99	0.05
906	4	102	2	489.99	0.10
906	5	22	2	269.99	0.20
907	1	84	2	109.99	0.07
907	2	65	1	346.99	0.07
908	1	41	1	1469.99	0.20
908	2	94	1	249.99	0.10
908	3	102	2	489.99	0.10
909	1	5	1	1320.99	0.20
910	1	23	1	299.99	0.10
911	1	66	2	250.99	0.05
911	2	106	1	449.99	0.05
911	3	91	2	349.99	0.05
911	4	49	1	3499.99	0.20
912	1	22	2	269.99	0.20
912	2	71	2	416.99	0.05
912	3	101	1	339.99	0.05
912	4	2	2	749.99	0.20
913	1	90	2	209.99	0.10
913	2	24	2	549.99	0.05
914	1	38	1	549.99	0.07
914	2	20	2	599.99	0.20
914	3	106	1	449.99	0.05
914	4	46	1	1409.99	0.10
915	1	64	1	489.99	0.05
915	2	48	1	1499.99	0.07
915	3	42	1	2299.99	0.20
915	4	2	1	749.99	0.07
916	1	92	1	209.99	0.20
917	1	41	1	1469.99	0.07
918	1	91	1	349.99	0.20
918	2	31	1	1632.99	0.10
918	3	4	2	2899.99	0.07
919	1	7	1	3999.99	0.07
919	2	44	1	539.99	0.10
920	1	76	1	299.99	0.05
920	2	39	2	1499.99	0.07
920	3	78	1	647.99	0.05
920	4	80	2	761.99	0.07
921	1	77	1	799.99	0.20
921	2	75	2	599.99	0.07
921	3	48	1	1499.99	0.10
922	1	68	1	449.99	0.20
922	2	73	1	749.99	0.20
922	3	86	1	149.99	0.10
923	1	74	2	439.99	0.05
923	2	6	1	469.99	0.10
924	1	97	2	349.99	0.20
924	2	36	1	832.99	0.20
925	1	97	1	349.99	0.07
925	2	62	2	3499.99	0.20
926	1	37	2	379.99	0.20
927	1	74	2	439.99	0.10
927	2	16	2	599.99	0.20
927	3	50	1	5999.99	0.10
927	4	3	1	999.99	0.10
927	5	43	1	5299.99	0.07
928	1	71	2	416.99	0.05
928	2	83	1	149.99	0.20
929	1	82	1	659.99	0.20
929	2	63	2	3499.99	0.10
929	3	24	1	549.99	0.05
930	1	56	2	5499.99	0.07
930	2	82	1	659.99	0.07
930	3	60	1	1559.99	0.10
930	4	65	2	346.99	0.05
930	5	51	2	6499.99	0.10
931	1	49	2	3499.99	0.07
931	2	76	1	299.99	0.20
932	1	74	1	439.99	0.05
933	1	77	1	799.99	0.07
933	2	21	1	269.99	0.20
933	3	75	2	599.99	0.05
934	1	35	2	832.99	0.05
934	2	48	1	1499.99	0.05
934	3	18	1	449.00	0.10
934	4	61	1	4999.99	0.07
934	5	56	2	5499.99	0.20
935	1	65	2	346.99	0.20
935	2	76	2	299.99	0.07
935	3	6	1	469.99	0.07
935	4	38	1	549.99	0.07
936	1	70	1	659.99	0.10
936	2	44	1	539.99	0.07
937	1	108	2	449.99	0.10
937	2	51	2	6499.99	0.07
937	3	58	2	4999.99	0.07
937	4	28	2	2499.99	0.07
937	5	66	1	250.99	0.20
938	1	4	1	2899.99	0.05
938	2	13	1	269.99	0.05
939	1	5	1	1320.99	0.10
939	2	107	2	416.99	0.20
940	1	75	2	599.99	0.20
941	1	25	1	499.99	0.10
941	2	102	2	489.99	0.05
941	3	11	2	1680.99	0.07
942	1	98	2	489.99	0.05
942	2	110	2	470.99	0.10
942	3	35	2	832.99	0.07
942	4	103	1	551.99	0.05
942	5	100	1	489.99	0.05
943	1	25	1	499.99	0.20
943	2	82	1	659.99	0.20
944	1	29	2	999.99	0.07
944	2	16	2	599.99	0.10
944	3	70	2	659.99	0.20
944	4	85	2	329.99	0.20
944	5	69	2	416.99	0.07
945	1	105	1	533.99	0.05
945	2	94	2	249.99	0.20
945	3	34	2	469.99	0.05
945	4	44	2	539.99	0.10
945	5	50	2	5999.99	0.05
946	1	7	1	3999.99	0.10
946	2	85	2	329.99	0.20
946	3	62	1	3499.99	0.05
946	4	22	2	269.99	0.20
946	5	56	2	5499.99	0.07
947	1	32	1	469.99	0.05
947	2	42	2	2299.99	0.07
947	3	44	1	539.99	0.07
948	1	23	2	299.99	0.20
948	2	20	2	599.99	0.10
948	3	101	1	339.99	0.20
948	4	92	2	209.99	0.20
948	5	72	2	619.99	0.20
949	1	9	2	2999.99	0.10
949	2	55	2	2699.99	0.05
950	1	56	1	5499.99	0.05
951	1	59	1	2599.99	0.10
951	2	43	2	5299.99	0.10
951	3	62	2	3499.99	0.20
952	1	20	2	599.99	0.07
952	2	57	1	1999.99	0.05
953	1	23	2	299.99	0.07
954	1	4	2	2899.99	0.10
955	1	43	1	5299.99	0.10
955	2	31	2	1632.99	0.07
955	3	96	1	349.99	0.05
955	4	63	1	3499.99	0.20
955	5	88	1	189.99	0.05
956	1	76	2	299.99	0.10
956	2	23	1	299.99	0.20
956	3	73	2	749.99	0.10
956	4	13	2	269.99	0.20
956	5	79	2	402.99	0.10
957	1	108	2	449.99	0.05
957	2	14	2	269.99	0.07
957	3	70	2	659.99	0.05
957	4	66	1	250.99	0.07
957	5	111	1	470.99	0.05
958	1	51	1	6499.99	0.10
958	2	76	1	299.99	0.20
959	1	15	1	529.99	0.20
959	2	72	1	619.99	0.10
959	3	41	1	1469.99	0.05
959	4	65	1	346.99	0.07
960	1	73	2	749.99	0.05
960	2	52	1	875.99	0.10
960	3	48	2	1499.99	0.05
960	4	83	2	149.99	0.10
961	1	105	1	533.99	0.10
961	2	47	2	5299.99	0.20
961	3	65	2	346.99	0.07
962	1	65	2	346.99	0.07
962	2	64	2	489.99	0.07
963	1	4	1	2899.99	0.07
964	1	90	1	209.99	0.20
964	2	74	1	439.99	0.20
965	1	90	2	209.99	0.10
966	1	88	1	189.99	0.05
966	2	73	1	749.99	0.07
967	1	66	1	250.99	0.20
967	2	77	2	799.99	0.05
967	3	87	1	189.99	0.10
967	4	103	1	551.99	0.20
968	1	87	1	189.99	0.20
968	2	61	2	4999.99	0.05
968	3	10	2	1549.00	0.05
969	1	74	1	439.99	0.20
969	2	36	1	832.99	0.10
970	1	85	1	329.99	0.10
970	2	48	2	1499.99	0.10
970	3	54	2	3199.99	0.10
970	4	68	1	449.99	0.10
971	1	70	2	659.99	0.05
971	2	65	2	346.99	0.07
971	3	8	2	1799.99	0.05
971	4	12	2	549.99	0.07
971	5	38	1	549.99	0.20
972	1	100	1	489.99	0.20
972	2	63	1	3499.99	0.07
973	1	4	2	2899.99	0.10
973	2	28	2	2499.99	0.10
973	3	47	2	5299.99	0.05
973	4	71	1	416.99	0.07
974	1	33	2	469.99	0.10
974	2	22	2	269.99	0.20
975	1	110	2	470.99	0.20
976	1	26	2	599.99	0.10
976	2	39	1	1499.99	0.07
977	1	52	2	875.99	0.10
977	2	69	2	416.99	0.05
977	3	27	1	999.99	0.05
977	4	80	2	761.99	0.05
978	1	106	2	449.99	0.05
978	2	25	2	499.99	0.20
978	3	108	2	449.99	0.05
979	1	55	1	2699.99	0.05
979	2	71	2	416.99	0.20
979	3	12	2	549.99	0.10
979	4	52	1	875.99	0.20
980	1	49	2	3499.99	0.20
980	2	9	1	2999.99	0.10
980	3	64	1	489.99	0.10
981	1	35	1	832.99	0.10
981	2	95	2	299.99	0.05
981	3	21	2	269.99	0.07
981	4	36	2	832.99	0.10
981	5	61	1	4999.99	0.07
982	1	22	2	269.99	0.10
982	2	110	1	470.99	0.07
982	3	52	1	875.99	0.07
982	4	40	2	4999.99	0.05
983	1	63	1	3499.99	0.10
983	2	20	2	599.99	0.20
983	3	68	1	449.99	0.07
983	4	81	2	1099.99	0.07
983	5	88	1	189.99	0.05
984	1	68	1	449.99	0.20
984	2	81	2	1099.99	0.20
984	3	12	1	549.99	0.10
984	4	111	1	470.99	0.20
985	1	5	2	1320.99	0.07
985	2	59	1	2599.99	0.20
985	3	78	2	647.99	0.05
986	1	87	1	189.99	0.10
986	2	78	1	647.99	0.05
986	3	26	2	599.99	0.07
987	1	51	2	6499.99	0.10
987	2	60	2	1559.99	0.20
987	3	80	1	761.99	0.07
988	1	35	1	832.99	0.20
988	2	38	1	549.99	0.07
988	3	12	2	549.99	0.07
989	1	99	1	299.99	0.05
989	2	27	1	999.99	0.10
989	3	70	1	659.99	0.10
989	4	84	2	109.99	0.07
989	5	5	1	1320.99	0.10
990	1	6	2	469.99	0.20
990	2	29	1	999.99	0.10
990	3	91	1	349.99	0.10
990	4	14	2	269.99	0.10
991	1	9	2	2999.99	0.20
991	2	79	1	402.99	0.20
991	3	34	1	469.99	0.20
992	1	45	1	869.99	0.07
992	2	102	1	489.99	0.10
992	3	20	1	599.99	0.20
992	4	101	2	339.99	0.20
992	5	7	1	3999.99	0.05
993	1	58	1	4999.99	0.20
993	2	36	2	832.99	0.10
993	3	10	2	1549.00	0.05
993	4	99	2	299.99	0.07
993	5	79	2	402.99	0.10
994	1	37	2	379.99	0.10
994	2	45	1	869.99	0.20
994	3	66	1	250.99	0.07
995	1	16	2	599.99	0.10
995	2	90	1	209.99	0.20
995	3	101	1	339.99	0.10
996	1	68	2	449.99	0.05
996	2	32	1	469.99	0.05
997	1	86	2	149.99	0.07
997	2	105	2	533.99	0.20
997	3	14	2	269.99	0.07
998	1	26	2	599.99	0.05
998	2	105	1	533.99	0.20
999	1	70	2	659.99	0.07
999	2	106	1	449.99	0.05
1000	1	65	2	346.99	0.05
1000	2	111	1	470.99	0.10
1000	3	19	2	449.00	0.07
1000	4	29	2	999.99	0.05
1001	1	72	1	619.99	0.05
1001	2	45	2	869.99	0.05
1001	3	58	1	4999.99	0.10
1001	4	111	1	470.99	0.07
1002	1	100	1	489.99	0.05
1002	2	83	1	149.99	0.10
1002	3	8	2	1799.99	0.10
1002	4	79	1	402.99	0.20
1003	1	34	2	469.99	0.05
1003	2	51	2	6499.99	0.05
1004	1	36	2	832.99	0.10
1005	1	14	2	269.99	0.20
1005	2	81	2	1099.99	0.10
1005	3	99	1	299.99	0.10
1006	1	20	1	599.99	0.07
1006	2	68	1	449.99	0.10
1006	3	56	2	5499.99	0.07
1006	4	65	1	346.99	0.10
1006	5	46	1	1409.99	0.10
1007	1	26	1	599.99	0.20
1007	2	11	1	1680.99	0.05
1007	3	85	2	329.99	0.10
1007	4	76	1	299.99	0.20
1007	5	106	2	449.99	0.10
1008	1	71	1	416.99	0.20
1008	2	2	1	749.99	0.10
1008	3	95	1	299.99	0.07
1009	1	95	2	299.99	0.07
1009	2	44	1	539.99	0.07
1010	1	109	2	416.99	0.10
1011	1	88	1	189.99	0.20
1011	2	99	2	299.99	0.20
1011	3	16	2	599.99	0.20
1011	4	68	2	449.99	0.05
1012	1	8	1	1799.99	0.07
1012	2	64	1	489.99	0.20
1013	1	60	2	1559.99	0.05
1014	1	97	1	349.99	0.20
1014	2	45	2	869.99	0.05
1014	3	81	2	1099.99	0.10
1014	4	59	1	2599.99	0.05
1015	1	6	2	469.99	0.10
1015	2	73	2	749.99	0.20
1015	3	101	2	339.99	0.10
1015	4	13	1	269.99	0.20
1016	1	76	2	299.99	0.07
1017	1	89	1	209.99	0.07
1017	2	82	2	659.99	0.20
1017	3	100	1	489.99	0.20
1017	4	18	2	449.00	0.20
1017	5	77	2	799.99	0.10
1018	1	76	2	299.99	0.07
1018	2	97	2	349.99	0.10
1018	3	91	1	349.99	0.20
1019	1	30	1	999.99	0.10
1019	2	52	1	875.99	0.20
1019	3	37	1	379.99	0.05
1019	4	93	2	209.99	0.20
1020	1	20	2	599.99	0.05
1020	2	69	2	416.99	0.05
1020	3	15	1	529.99	0.07
1020	4	57	2	1999.99	0.10
1020	5	40	2	4999.99	0.05
1021	1	49	2	3499.99	0.07
1021	2	23	2	299.99	0.07
1022	1	33	1	469.99	0.20
1022	2	46	1	1409.99	0.10
1022	3	65	1	346.99	0.07
1022	4	5	1	1320.99	0.07
1023	1	91	1	349.99	0.07
1023	2	43	2	5299.99	0.10
1024	1	104	1	481.99	0.20
1024	2	28	2	2499.99	0.05
1024	3	98	2	489.99	0.20
1024	4	96	2	349.99	0.10
1024	5	91	1	349.99	0.20
1025	1	89	1	209.99	0.07
1025	2	102	1	489.99	0.10
1025	3	39	1	1499.99	0.10
1025	4	15	1	529.99	0.05
1025	5	66	2	250.99	0.05
1026	1	7	2	3999.99	0.07
1027	1	95	2	299.99	0.10
1027	2	14	2	269.99	0.05
1028	1	111	2	470.99	0.10
1028	2	10	1	1549.00	0.20
1028	3	41	1	1469.99	0.20
1028	4	35	2	832.99	0.10
1028	5	108	1	449.99	0.20
1029	1	20	1	599.99	0.20
1029	2	55	1	2699.99	0.10
1029	3	40	1	4999.99	0.20
1029	4	68	2	449.99	0.10
1030	1	27	1	999.99	0.05
1030	2	10	2	1549.00	0.10
1030	3	72	1	619.99	0.10
1031	1	27	2	999.99	0.20
1031	2	108	2	449.99	0.20
1032	1	60	2	1559.99	0.10
1032	2	17	1	429.00	0.10
1033	1	26	1	599.99	0.07
1033	2	109	2	416.99	0.10
1033	3	27	2	999.99	0.07
1034	1	101	1	339.99	0.10
1034	2	8	2	1799.99	0.10
1034	3	11	2	1680.99	0.07
1034	4	21	1	269.99	0.05
1035	1	96	1	349.99	0.20
1036	1	55	2	2699.99	0.10
1036	2	76	1	299.99	0.07
1036	3	18	2	449.00	0.05
1036	4	65	2	346.99	0.20
1036	5	12	1	549.99	0.20
1037	1	74	2	439.99	0.07
1037	2	3	1	999.99	0.07
1037	3	65	2	346.99	0.20
1037	4	92	1	209.99	0.07
1037	5	84	2	109.99	0.05
1038	1	83	1	149.99	0.05
1038	2	9	1	2999.99	0.07
1039	1	18	2	449.00	0.20
1040	1	97	1	349.99	0.10
1040	2	28	2	2499.99	0.20
1040	3	64	1	489.99	0.07
1040	4	27	2	999.99	0.07
1040	5	8	2	1799.99	0.05
1041	1	89	1	209.99	0.10
1041	2	61	2	4999.99	0.07
1041	3	94	2	249.99	0.10
1042	1	23	1	299.99	0.10
1043	1	55	2	2699.99	0.10
1043	2	20	1	599.99	0.07
1044	1	97	2	349.99	0.10
1045	1	28	1	2499.99	0.05
1045	2	104	2	481.99	0.05
1046	1	60	1	1559.99	0.07
1046	2	79	1	402.99	0.07
1046	3	32	1	469.99	0.07
1046	4	41	2	1469.99	0.10
1046	5	17	2	429.00	0.05
1047	1	28	2	2499.99	0.10
1047	2	78	1	647.99	0.20
1047	3	35	1	832.99	0.05
1047	4	49	1	3499.99	0.05
1048	1	3	2	999.99	0.10
1048	2	37	1	379.99	0.10
1048	3	94	1	249.99	0.05
1049	1	9	1	2999.99	0.10
1049	2	36	2	832.99	0.05
1049	3	3	1	999.99	0.10
1049	4	26	1	599.99	0.07
1049	5	10	2	1549.00	0.05
1050	1	96	2	349.99	0.07
1050	2	99	2	299.99	0.10
1050	3	45	2	869.99	0.20
1050	4	14	2	269.99	0.20
1051	1	46	1	1409.99	0.20
1052	1	7	1	3999.99	0.05
1052	2	103	1	551.99	0.05
1052	3	26	2	599.99	0.07
1053	1	49	2	3499.99	0.05
1053	2	26	2	599.99	0.20
1053	3	23	2	299.99	0.20
1053	4	68	1	449.99	0.10
1053	5	73	2	749.99	0.05
1054	1	36	2	832.99	0.10
1054	2	16	1	599.99	0.05
1055	1	43	2	5299.99	0.07
1055	2	101	2	339.99	0.20
1055	3	12	2	549.99	0.10
1055	4	83	2	149.99	0.10
1055	5	60	1	1559.99	0.20
1056	1	3	1	999.99	0.05
1057	1	105	1	533.99	0.20
1057	2	97	1	349.99	0.05
1057	3	98	2	489.99	0.05
1058	1	43	1	5299.99	0.10
1058	2	29	2	999.99	0.05
1058	3	103	1	551.99	0.07
1059	1	46	2	1409.99	0.05
1059	2	7	1	3999.99	0.10
1059	3	13	1	269.99	0.07
1060	1	7	1	3999.99	0.07
1060	2	11	2	1680.99	0.07
1060	3	61	2	4999.99	0.10
1060	4	30	2	999.99	0.05
1061	1	14	1	269.99	0.07
1061	2	19	1	449.00	0.10
1062	1	13	1	269.99	0.05
1062	2	111	2	470.99	0.20
1062	3	5	1	1320.99	0.05
1062	4	12	1	549.99	0.20
1063	1	33	2	469.99	0.10
1063	2	100	2	489.99	0.07
1063	3	72	2	619.99	0.20
1064	1	18	1	449.00	0.07
1064	2	49	1	3499.99	0.10
1065	1	48	2	1499.99	0.07
1065	2	103	2	551.99	0.05
1065	3	63	1	3499.99	0.07
1066	1	15	2	529.99	0.05
1066	2	46	1	1409.99	0.10
1066	3	12	1	549.99	0.10
1067	1	74	2	439.99	0.07
1067	2	9	2	2999.99	0.20
1067	3	72	2	619.99	0.10
1067	4	6	2	469.99	0.20
1068	1	87	2	189.99	0.20
1068	2	82	1	659.99	0.20
1068	3	49	2	3499.99	0.20
1068	4	45	2	869.99	0.20
1069	1	109	1	416.99	0.07
1069	2	93	1	209.99	0.10
1070	1	110	1	470.99	0.20
1070	2	18	2	449.00	0.10
1070	3	94	1	249.99	0.05
1071	1	25	2	499.99	0.20
1072	1	83	1	149.99	0.20
1072	2	89	2	209.99	0.07
1072	3	36	2	832.99	0.07
1073	1	81	1	1099.99	0.20
1073	2	13	1	269.99	0.07
1073	3	20	1	599.99	0.20
1074	1	59	1	2599.99	0.10
1074	2	87	1	189.99	0.07
1074	3	89	2	209.99	0.10
1075	1	48	2	1499.99	0.10
1075	2	111	2	470.99	0.05
1076	1	95	1	299.99	0.10
1076	2	102	1	489.99	0.07
1076	3	73	2	749.99	0.07
1077	1	60	2	1559.99	0.05
1078	1	76	2	299.99	0.07
1078	2	60	2	1559.99	0.20
1078	3	15	1	529.99	0.07
1078	4	10	2	1549.00	0.10
1078	5	72	2	619.99	0.20
1079	1	70	2	659.99	0.07
1080	1	31	1	1632.99	0.20
1080	2	40	1	4999.99	0.10
1080	3	50	1	5999.99	0.05
1080	4	32	2	469.99	0.20
1080	5	86	1	149.99	0.05
1081	1	52	2	875.99	0.10
1082	1	29	2	999.99	0.20
1083	1	65	2	346.99	0.20
1083	2	77	2	799.99	0.10
1083	3	61	1	4999.99	0.07
1083	4	33	1	469.99	0.20
1084	1	30	1	999.99	0.05
1084	2	70	1	659.99	0.05
1084	3	98	2	489.99	0.20
1084	4	65	2	346.99	0.07
1084	5	60	1	1559.99	0.10
1085	1	66	2	250.99	0.20
1085	2	64	1	489.99	0.10
1085	3	74	1	439.99	0.10
1086	1	108	1	449.99	0.07
1086	2	67	1	250.99	0.10
1086	3	81	2	1099.99	0.05
1086	4	10	2	1549.00	0.07
1086	5	5	1	1320.99	0.20
1087	1	15	1	529.99	0.07
1087	2	102	2	489.99	0.07
1087	3	59	2	2599.99	0.10
1087	4	13	2	269.99	0.07
1087	5	109	2	416.99	0.20
1088	1	64	1	489.99	0.10
1088	2	30	1	999.99	0.10
1088	3	33	1	469.99	0.07
1088	4	36	2	832.99	0.20
1089	1	70	2	659.99	0.07
1089	2	30	2	999.99	0.05
1090	1	74	1	439.99	0.20
1091	1	97	1	349.99	0.05
1091	2	56	1	5499.99	0.10
1091	3	19	1	449.00	0.10
1092	1	34	1	469.99	0.05
1092	2	30	2	999.99	0.07
1092	3	2	2	749.99	0.10
1092	4	18	1	449.00	0.20
1093	1	45	2	869.99	0.07
1093	2	17	2	429.00	0.10
1093	3	90	2	209.99	0.10
1094	1	71	1	416.99	0.10
1094	2	11	1	1680.99	0.10
1094	3	24	1	549.99	0.10
1094	4	107	1	416.99	0.20
1095	1	78	2	647.99	0.05
1095	2	3	2	999.99	0.20
1095	3	15	2	529.99	0.10
1095	4	31	1	1632.99	0.20
1095	5	50	2	5999.99	0.05
1096	1	11	1	1680.99	0.10
1097	1	99	1	299.99	0.05
1097	2	106	2	449.99	0.07
1097	3	98	2	489.99	0.07
1097	4	19	1	449.00	0.20
1097	5	35	2	832.99	0.05
1098	1	88	1	189.99	0.10
1099	1	64	1	489.99	0.10
1099	2	13	2	269.99	0.05
1099	3	46	1	1409.99	0.07
1099	4	89	2	209.99	0.10
1100	1	12	1	549.99	0.05
1100	2	9	2	2999.99	0.10
1101	1	105	1	533.99	0.07
1101	2	51	1	6499.99	0.05
1102	1	91	1	349.99	0.07
1103	1	106	1	449.99	0.20
1103	2	46	2	1409.99	0.20
1104	1	17	1	429.00	0.10
1104	2	70	2	659.99	0.10
1104	3	43	1	5299.99	0.07
1104	4	80	1	761.99	0.07
1105	1	60	1	1559.99	0.05
1105	2	56	2	5499.99	0.20
1105	3	35	2	832.99	0.07
1106	1	96	1	349.99	0.10
1107	1	43	1	5299.99	0.20
1107	2	41	2	1469.99	0.20
1108	1	45	2	869.99	0.05
1108	2	100	1	489.99	0.07
1108	3	105	1	533.99	0.07
1109	1	72	2	619.99	0.10
1110	1	56	1	5499.99	0.10
1111	1	95	1	299.99	0.05
1111	2	66	2	250.99	0.10
1111	3	14	1	269.99	0.20
1111	4	24	1	549.99	0.07
1112	1	71	2	416.99	0.05
1112	2	42	1	2299.99	0.07
1112	3	5	2	1320.99	0.10
1112	4	87	2	189.99	0.07
1112	5	9	2	2999.99	0.10
1113	1	106	1	449.99	0.07
1114	1	52	1	875.99	0.20
1115	1	97	2	349.99	0.20
1115	2	50	2	5999.99	0.07
1115	3	91	2	349.99	0.07
1115	4	49	2	3499.99	0.10
1116	1	11	2	1680.99	0.07
1117	1	37	2	379.99	0.10
1117	2	91	1	349.99	0.20
1117	3	51	2	6499.99	0.10
1118	1	55	2	2699.99	0.20
1118	2	50	1	5999.99	0.07
1118	3	29	1	999.99	0.05
1118	4	47	2	5299.99	0.20
1119	1	93	2	209.99	0.10
1119	2	55	2	2699.99	0.05
1119	3	104	1	481.99	0.20
1120	1	92	2	209.99	0.07
1120	2	31	1	1632.99	0.07
1120	3	30	2	999.99	0.05
1120	4	93	1	209.99	0.07
1120	5	94	1	249.99	0.20
1121	1	11	2	1680.99	0.10
1121	2	110	2	470.99	0.05
1122	1	9	2	2999.99	0.07
1122	2	53	1	749.99	0.10
1122	3	49	2	3499.99	0.20
1122	4	41	2	1469.99	0.05
1122	5	72	1	619.99	0.10
1123	1	65	2	346.99	0.07
1123	2	61	2	4999.99	0.10
1124	1	7	2	3999.99	0.10
1124	2	6	1	469.99	0.10
1124	3	109	2	416.99	0.07
1124	4	45	2	869.99	0.05
1124	5	2	2	749.99	0.05
1125	1	16	2	599.99	0.05
1125	2	21	1	269.99	0.10
1125	3	81	2	1099.99	0.07
1125	4	24	1	549.99	0.07
1125	5	32	2	469.99	0.07
1126	1	33	2	469.99	0.10
1126	2	58	1	4999.99	0.20
1126	3	89	2	209.99	0.05
1127	1	23	2	299.99	0.10
1127	2	96	2	349.99	0.07
1127	3	37	1	379.99	0.20
1128	1	44	1	539.99	0.05
1128	2	10	1	1549.00	0.20
1128	3	65	2	346.99	0.05
1129	1	71	2	416.99	0.20
1129	2	56	1	5499.99	0.20
1129	3	61	2	4999.99	0.05
1130	1	54	2	3199.99	0.20
1131	1	60	2	1559.99	0.07
1131	2	103	2	551.99	0.05
1132	1	43	1	5299.99	0.05
1132	2	10	1	1549.00	0.10
1132	3	36	2	832.99	0.10
1132	4	16	1	599.99	0.05
1133	1	4	2	2899.99	0.05
1133	2	17	1	429.00	0.07
1133	3	90	2	209.99	0.20
1133	4	62	1	3499.99	0.20
1134	1	97	1	349.99	0.10
1134	2	36	1	832.99	0.10
1135	1	101	2	339.99	0.05
1135	2	51	1	6499.99	0.10
1136	1	105	1	533.99	0.10
1137	1	28	1	2499.99	0.20
1137	2	58	2	4999.99	0.20
1137	3	84	2	109.99	0.20
1137	4	69	2	416.99	0.07
1138	1	13	2	269.99	0.05
1138	2	105	2	533.99	0.05
1138	3	93	1	209.99	0.10
1139	1	106	2	449.99	0.05
1139	2	44	2	539.99	0.10
1139	3	69	1	416.99	0.05
1139	4	25	2	499.99	0.10
1139	5	7	1	3999.99	0.10
1140	1	39	2	1499.99	0.10
1140	2	71	2	416.99	0.07
1140	3	38	2	549.99	0.10
1140	4	40	2	4999.99	0.07
1141	1	8	1	1799.99	0.10
1142	1	20	2	599.99	0.07
1142	2	30	1	999.99	0.10
1142	3	109	2	416.99	0.05
1142	4	108	2	449.99	0.20
1142	5	100	2	489.99	0.05
1143	1	99	1	299.99	0.20
1143	2	48	1	1499.99	0.20
1143	3	69	2	416.99	0.10
1144	1	88	1	189.99	0.07
1145	1	105	2	533.99	0.07
1146	1	36	1	832.99	0.07
1146	2	64	1	489.99	0.20
1146	3	11	1	1680.99	0.20
1147	1	82	1	659.99	0.20
1147	2	39	2	1499.99	0.05
1148	1	82	1	659.99	0.07
1148	2	22	1	269.99	0.07
1148	3	77	2	799.99	0.05
1148	4	94	2	249.99	0.10
1149	1	98	2	489.99	0.07
1149	2	48	1	1499.99	0.05
1149	3	58	1	4999.99	0.05
1149	4	85	1	329.99	0.20
1149	5	94	1	249.99	0.10
1150	1	29	1	999.99	0.05
1150	2	91	1	349.99	0.05
1150	3	104	2	481.99	0.07
1150	4	21	2	269.99	0.10
1151	1	30	2	999.99	0.05
1152	1	58	1	4999.99	0.07
1152	2	91	2	349.99	0.20
1152	3	24	1	549.99	0.05
1153	1	103	1	551.99	0.10
1153	2	6	2	469.99	0.05
1154	1	17	1	429.00	0.20
1154	2	60	1	1559.99	0.07
1154	3	67	2	250.99	0.20
1155	1	68	2	449.99	0.05
1155	2	6	2	469.99	0.10
1155	3	35	1	832.99	0.07
1155	4	77	2	799.99	0.05
1156	1	111	2	470.99	0.05
1156	2	86	1	149.99	0.05
1157	1	20	1	599.99	0.10
1157	2	31	2	1632.99	0.10
1157	3	37	2	379.99	0.20
1157	4	41	1	1469.99	0.07
1158	1	95	2	299.99	0.10
1158	2	74	1	439.99	0.07
1159	1	12	2	549.99	0.10
1160	1	41	1	1469.99	0.10
1160	2	9	1	2999.99	0.20
1161	1	71	2	416.99	0.10
1161	2	38	1	549.99	0.07
1161	3	22	1	269.99	0.20
1161	4	29	2	999.99	0.10
1162	1	88	1	189.99	0.20
1162	2	40	2	4999.99	0.20
1162	3	86	1	149.99	0.10
1162	4	41	1	1469.99	0.05
1162	5	12	2	549.99	0.05
1163	1	63	2	3499.99	0.05
1163	2	53	2	749.99	0.10
1164	1	8	1	1799.99	0.20
1164	2	78	1	647.99	0.05
1164	3	103	2	551.99	0.05
1164	4	44	2	539.99	0.05
1165	1	65	2	346.99	0.07
1165	2	68	1	449.99	0.07
1166	1	103	2	551.99	0.07
1167	1	29	2	999.99	0.05
1167	2	81	2	1099.99	0.10
1167	3	68	1	449.99	0.07
1168	1	23	2	299.99	0.10
1168	2	82	1	659.99	0.20
1168	3	51	1	6499.99	0.07
1168	4	107	2	416.99	0.20
1168	5	15	2	529.99	0.05
1169	1	91	2	349.99	0.20
1169	2	51	1	6499.99	0.05
1169	3	58	2	4999.99	0.10
1169	4	81	2	1099.99	0.20
1170	1	15	1	529.99	0.10
1170	2	47	2	5299.99	0.05
1170	3	62	2	3499.99	0.10
1171	1	94	2	249.99	0.20
1171	2	92	2	209.99	0.07
1171	3	10	2	1549.00	0.07
1172	1	78	2	647.99	0.07
1172	2	104	1	481.99	0.20
1173	1	95	1	299.99	0.20
1173	2	17	1	429.00	0.07
1173	3	68	1	449.99	0.05
1173	4	103	2	551.99	0.20
1174	1	110	2	470.99	0.20
1174	2	6	1	469.99	0.07
1174	3	106	1	449.99	0.10
1175	1	58	2	4999.99	0.07
1175	2	65	1	346.99	0.20
1175	3	20	1	599.99	0.05
1175	4	3	1	999.99	0.05
1175	5	9	1	2999.99	0.05
1176	1	87	1	189.99	0.10
1177	1	62	2	3499.99	0.07
1177	2	74	1	439.99	0.10
1178	1	46	1	1409.99	0.07
1178	2	77	1	799.99	0.20
1178	3	108	1	449.99	0.05
1178	4	13	2	269.99	0.05
1179	1	93	2	209.99	0.05
1179	2	88	2	189.99	0.05
1179	3	33	2	469.99	0.20
1179	4	50	1	5999.99	0.07
1180	1	66	2	250.99	0.07
1181	1	98	1	489.99	0.10
1182	1	35	1	832.99	0.10
1182	2	49	2	3499.99	0.10
1183	1	63	1	3499.99	0.20
1183	2	80	2	761.99	0.20
1183	3	6	2	469.99	0.05
1184	1	16	2	599.99	0.05
1184	2	71	1	416.99	0.05
1185	1	19	2	449.00	0.07
1185	2	21	1	269.99	0.07
1185	3	63	2	3499.99	0.10
1185	4	80	1	761.99	0.20
1186	1	48	2	1499.99	0.10
1186	2	49	1	3499.99	0.07
1186	3	106	1	449.99	0.10
1186	4	27	1	999.99	0.20
1187	1	36	2	832.99	0.10
1187	2	79	1	402.99	0.07
1187	3	4	1	2899.99	0.10
1187	4	53	2	749.99	0.10
1188	1	66	2	250.99	0.10
1188	2	91	2	349.99	0.20
1188	3	87	2	189.99	0.10
1189	1	55	1	2699.99	0.07
1189	2	102	2	489.99	0.10
1189	3	40	2	4999.99	0.10
1190	1	71	1	416.99	0.07
1191	1	40	2	4999.99	0.10
1191	2	89	2	209.99	0.10
1191	3	100	1	489.99	0.07
1192	1	24	2	549.99	0.10
1192	2	88	2	189.99	0.07
1192	3	37	2	379.99	0.20
1193	1	83	2	149.99	0.05
1193	2	27	1	999.99	0.05
1194	1	71	1	416.99	0.05
1194	2	7	2	3999.99	0.07
1194	3	105	2	533.99	0.10
1194	4	84	1	109.99	0.05
1195	1	52	1	875.99	0.07
1196	1	53	1	749.99	0.07
1197	1	13	1	269.99	0.07
1197	2	108	2	449.99	0.05
1197	3	9	2	2999.99	0.05
1197	4	106	2	449.99	0.20
1198	1	105	1	533.99	0.05
1199	1	32	1	469.99	0.05
1199	2	94	2	249.99	0.07
1199	3	109	2	416.99	0.10
1200	1	42	2	2299.99	0.20
1201	1	95	1	299.99	0.07
1201	2	13	1	269.99	0.05
1201	3	26	1	599.99	0.20
1201	4	17	2	429.00	0.05
1201	5	19	2	449.00	0.20
1202	1	84	2	109.99	0.05
1203	1	6	2	469.99	0.07
1203	2	55	1	2699.99	0.05
1204	1	37	2	379.99	0.07
1205	1	105	2	533.99	0.20
1205	2	46	2	1409.99	0.20
1205	3	71	1	416.99	0.05
1205	4	79	2	402.99	0.07
1205	5	92	1	209.99	0.10
1206	1	73	1	749.99	0.07
1206	2	29	1	999.99	0.20
1207	1	104	1	481.99	0.05
1207	2	103	1	551.99	0.10
1207	3	23	1	299.99	0.07
1208	1	12	1	549.99	0.20
1208	2	65	2	346.99	0.07
1208	3	86	2	149.99	0.20
1208	4	13	2	269.99	0.10
1208	5	87	1	189.99	0.07
1209	1	89	1	209.99	0.07
1209	2	97	1	349.99	0.05
1210	1	26	1	599.99	0.10
1210	2	6	2	469.99	0.07
1210	3	78	2	647.99	0.05
1210	4	84	1	109.99	0.10
1210	5	35	2	832.99	0.05
1211	1	15	2	529.99	0.20
1211	2	59	1	2599.99	0.05
1211	3	92	1	209.99	0.20
1211	4	93	1	209.99	0.10
1211	5	108	2	449.99	0.20
1212	1	74	1	439.99	0.10
1212	2	37	2	379.99	0.07
1212	3	39	2	1499.99	0.05
1212	4	68	2	449.99	0.07
1213	1	64	2	489.99	0.07
1213	2	78	1	647.99	0.07
1213	3	102	2	489.99	0.10
1213	4	15	1	529.99	0.05
1214	1	9	2	2999.99	0.05
1214	2	7	1	3999.99	0.20
1214	3	22	1	269.99	0.05
1214	4	77	2	799.99	0.10
1214	5	67	2	250.99	0.20
1215	1	73	2	749.99	0.10
1215	2	10	2	1549.00	0.07
1216	1	64	2	489.99	0.10
1216	2	54	1	3199.99	0.05
1216	3	19	1	449.00	0.20
1216	4	110	2	470.99	0.07
1216	5	43	1	5299.99	0.10
1217	1	73	1	749.99	0.05
1217	2	106	2	449.99	0.05
1218	1	32	1	469.99	0.07
1218	2	102	2	489.99	0.05
1219	1	17	2	429.00	0.07
1219	2	62	2	3499.99	0.10
1219	3	40	2	4999.99	0.20
1220	1	47	2	5299.99	0.10
1220	2	49	1	3499.99	0.20
1220	3	85	2	329.99	0.20
1221	1	100	1	489.99	0.05
1221	2	81	2	1099.99	0.05
1221	3	42	2	2299.99	0.10
1221	4	38	2	549.99	0.10
1221	5	97	2	349.99	0.07
1222	1	97	1	349.99	0.20
1223	1	103	1	551.99	0.05
1224	1	62	1	3499.99	0.07
1224	2	51	1	6499.99	0.10
1224	3	108	1	449.99	0.05
1224	4	32	1	469.99	0.20
1225	1	81	1	1099.99	0.10
1225	2	59	2	2599.99	0.10
1225	3	6	2	469.99	0.10
1226	1	77	2	799.99	0.05
1226	2	101	1	339.99	0.20
1226	3	11	2	1680.99	0.07
1226	4	51	1	6499.99	0.07
1226	5	42	1	2299.99	0.10
1227	1	90	2	209.99	0.20
1227	2	44	1	539.99	0.07
1227	3	26	1	599.99	0.05
1227	4	8	1	1799.99	0.07
1227	5	42	2	2299.99	0.20
1228	1	92	1	209.99	0.20
1228	2	55	2	2699.99	0.20
1228	3	20	2	599.99	0.05
1229	1	36	2	832.99	0.07
1229	2	61	2	4999.99	0.10
1230	1	32	2	469.99	0.10
1230	2	38	2	549.99	0.07
1231	1	75	2	599.99	0.05
1231	2	70	1	659.99	0.07
1232	1	4	2	2899.99	0.07
1232	2	110	2	470.99	0.05
1232	3	6	2	469.99	0.20
1233	1	87	2	189.99	0.20
1233	2	61	2	4999.99	0.10
1233	3	55	1	2699.99	0.20
1234	1	56	2	5499.99	0.07
1234	2	71	2	416.99	0.07
1235	1	7	1	3999.99	0.10
1236	1	60	1	1559.99	0.07
1236	2	32	2	469.99	0.05
1236	3	91	1	349.99	0.10
1237	1	23	1	299.99	0.10
1237	2	87	2	189.99	0.10
1237	3	95	2	299.99	0.20
1237	4	55	2	2699.99	0.07
1237	5	25	1	499.99	0.07
1238	1	40	1	4999.99	0.10
1238	2	14	1	269.99	0.10
1238	3	99	2	299.99	0.20
1238	4	101	1	339.99	0.10
1239	1	15	2	529.99	0.20
1239	2	91	1	349.99	0.10
1239	3	34	2	469.99	0.10
1239	4	36	1	832.99	0.05
1240	1	107	2	416.99	0.10
1240	2	23	2	299.99	0.05
1240	3	15	2	529.99	0.20
1240	4	77	2	799.99	0.05
1240	5	57	1	1999.99	0.05
1241	1	74	1	439.99	0.05
1241	2	71	2	416.99	0.05
1242	1	94	1	249.99	0.05
1242	2	27	1	999.99	0.07
1242	3	10	1	1549.00	0.07
1242	4	70	1	659.99	0.20
1243	1	44	1	539.99	0.07
1244	1	45	1	869.99	0.20
1244	2	38	2	549.99	0.07
1244	3	33	1	469.99	0.07
1244	4	37	2	379.99	0.10
1245	1	13	1	269.99	0.10
1246	1	78	2	647.99	0.20
1246	2	46	1	1409.99	0.05
1246	3	45	2	869.99	0.07
1247	1	15	2	529.99	0.10
1247	2	28	2	2499.99	0.10
1247	3	26	1	599.99	0.05
1248	1	94	2	249.99	0.05
1248	2	33	2	469.99	0.10
1248	3	92	1	209.99	0.10
1248	4	12	1	549.99	0.05
1249	1	62	1	3499.99	0.05
1249	2	104	1	481.99	0.05
1249	3	61	1	4999.99	0.20
1250	1	78	2	647.99	0.05
1250	2	66	2	250.99	0.10
1250	3	20	2	599.99	0.05
1250	4	6	2	469.99	0.10
1251	1	40	2	4999.99	0.10
1251	2	56	1	5499.99	0.07
1251	3	7	1	3999.99	0.07
1252	1	79	1	402.99	0.20
1252	2	84	1	109.99	0.20
1252	3	57	2	1999.99	0.05
1253	1	25	2	499.99	0.10
1253	2	21	1	269.99	0.07
1253	3	88	1	189.99	0.20
1254	1	80	1	761.99	0.20
1254	2	91	1	349.99	0.20
1255	1	43	2	5299.99	0.20
1255	2	53	1	749.99	0.05
1255	3	14	2	269.99	0.20
1255	4	26	2	599.99	0.05
1255	5	82	1	659.99	0.05
1256	1	44	2	539.99	0.20
1256	2	100	1	489.99	0.10
1257	1	30	2	999.99	0.05
1257	2	61	1	4999.99	0.05
1257	3	17	2	429.00	0.10
1257	4	41	1	1469.99	0.05
1257	5	4	1	2899.99	0.10
1258	1	94	2	249.99	0.10
1258	2	99	2	299.99	0.05
1259	1	60	1	1559.99	0.10
1259	2	19	1	449.00	0.20
1260	1	8	1	1799.99	0.10
1260	2	66	1	250.99	0.10
1261	1	73	1	749.99	0.20
1261	2	88	2	189.99	0.20
1261	3	100	1	489.99	0.05
1261	4	42	1	2299.99	0.10
1262	1	37	1	379.99	0.07
1262	2	52	1	875.99	0.05
1262	3	43	2	5299.99	0.07
1262	4	77	1	799.99	0.07
1263	1	45	1	869.99	0.20
1263	2	62	1	3499.99	0.05
1263	3	19	2	449.00	0.10
1264	1	101	1	339.99	0.07
1264	2	77	2	799.99	0.07
1264	3	29	2	999.99	0.20
1264	4	52	1	875.99	0.05
1265	1	41	2	1469.99	0.10
1265	2	72	2	619.99	0.07
1266	1	90	1	209.99	0.20
1266	2	48	1	1499.99	0.20
1267	1	45	1	869.99	0.10
1267	2	27	1	999.99	0.07
1267	3	108	1	449.99	0.20
1267	4	95	1	299.99	0.05
1268	1	68	2	449.99	0.07
1268	2	87	2	189.99	0.07
1268	3	59	2	2599.99	0.20
1268	4	100	1	489.99	0.07
1269	1	4	2	2899.99	0.20
1269	2	7	1	3999.99	0.20
1269	3	111	1	470.99	0.10
1270	1	54	1	3199.99	0.20
1271	1	25	2	499.99	0.10
1271	2	50	2	5999.99	0.07
1271	3	87	2	189.99	0.07
1271	4	32	2	469.99	0.07
1272	1	16	2	599.99	0.20
1272	2	71	2	416.99	0.10
1272	3	86	1	149.99	0.07
1273	1	95	2	299.99	0.07
1273	2	20	1	599.99	0.07
1273	3	58	1	4999.99	0.20
1274	1	81	1	1099.99	0.10
1275	1	58	1	4999.99	0.07
1275	2	30	1	999.99	0.10
1276	1	18	2	449.00	0.20
1276	2	58	1	4999.99	0.20
1276	3	42	1	2299.99	0.05
1276	4	24	2	549.99	0.20
1276	5	78	2	647.99	0.20
1277	1	56	2	5499.99	0.20
1277	2	93	2	209.99	0.05
1277	3	9	2	2999.99	0.10
1277	4	4	1	2899.99	0.10
1277	5	11	1	1680.99	0.20
1278	1	103	2	551.99	0.10
1278	2	32	1	469.99	0.10
1279	1	9	2	2999.99	0.05
1280	1	72	2	619.99	0.07
1280	2	74	1	439.99	0.05
1280	3	52	1	875.99	0.07
1280	4	63	1	3499.99	0.20
1281	1	36	1	832.99	0.05
1281	2	49	2	3499.99	0.05
1281	3	75	1	599.99	0.05
1282	1	111	1	470.99	0.05
1282	2	50	2	5999.99	0.20
1283	1	61	2	4999.99	0.05
1283	2	81	1	1099.99	0.20
1283	3	7	1	3999.99	0.10
1283	4	32	1	469.99	0.10
1283	5	11	1	1680.99	0.20
1284	1	101	1	339.99	0.07
1284	2	8	1	1799.99	0.05
1284	3	4	2	2899.99	0.05
1285	1	78	2	647.99	0.07
1285	2	93	1	209.99	0.10
1285	3	69	2	416.99	0.20
1285	4	6	1	469.99	0.10
1286	1	109	2	416.99	0.20
1286	2	81	2	1099.99	0.07
1286	3	87	1	189.99	0.07
1287	1	27	2	999.99	0.20
1287	2	62	2	3499.99	0.10
1287	3	103	1	551.99	0.10
1287	4	100	2	489.99	0.05
1288	1	73	1	749.99	0.20
1288	2	64	2	489.99	0.20
1288	3	62	2	3499.99	0.10
1288	4	17	2	429.00	0.07
1289	1	89	1	209.99	0.05
1289	2	3	1	999.99	0.10
1290	1	75	2	599.99	0.05
1290	2	36	1	832.99	0.05
1290	3	92	2	209.99	0.10
1291	1	57	1	1999.99	0.10
1291	2	58	2	4999.99	0.05
1292	1	70	1	659.99	0.07
1293	1	88	2	189.99	0.10
1293	2	74	2	439.99	0.05
1293	3	38	2	549.99	0.07
1294	1	95	2	299.99	0.05
1294	2	44	1	539.99	0.05
1295	1	5	2	1320.99	0.20
1295	2	61	1	4999.99	0.20
1295	3	52	1	875.99	0.05
1296	1	25	2	499.99	0.05
1296	2	90	1	209.99	0.10
1296	3	16	1	599.99	0.05
1296	4	2	2	749.99	0.10
1297	1	104	2	481.99	0.07
1297	2	43	1	5299.99	0.05
1297	3	51	2	6499.99	0.05
1298	1	59	1	2599.99	0.05
1298	2	110	2	470.99	0.07
1299	1	14	2	269.99	0.10
1299	2	101	1	339.99	0.05
1299	3	75	1	599.99	0.05
1299	4	52	2	875.99	0.20
1300	1	101	2	339.99	0.07
1300	2	58	2	4999.99	0.05
1301	1	45	2	869.99	0.20
1301	2	105	2	533.99	0.10
1301	3	8	1	1799.99	0.20
1302	1	38	1	549.99	0.05
1302	2	20	2	599.99	0.10
1302	3	56	2	5499.99	0.07
1303	1	96	1	349.99	0.10
1303	2	63	2	3499.99	0.20
1303	3	108	1	449.99	0.10
1303	4	73	1	749.99	0.10
1303	5	24	2	549.99	0.10
1304	1	80	1	761.99	0.05
1304	2	99	2	299.99	0.05
1304	3	102	1	489.99	0.20
1304	4	17	1	429.00	0.05
1305	1	85	1	329.99	0.20
1305	2	9	1	2999.99	0.07
1305	3	11	1	1680.99	0.05
1305	4	91	2	349.99	0.05
1306	1	103	2	551.99	0.05
1306	2	81	2	1099.99	0.07
1306	3	45	1	869.99	0.20
1306	4	42	1	2299.99	0.20
1306	5	9	2	2999.99	0.07
1307	1	96	2	349.99	0.07
1307	2	53	2	749.99	0.20
1307	3	69	2	416.99	0.20
1308	1	54	1	3199.99	0.05
1308	2	69	1	416.99	0.20
1308	3	14	2	269.99	0.07
1308	4	56	1	5499.99	0.20
1308	5	32	1	469.99	0.07
1309	1	65	1	346.99	0.05
1309	2	87	2	189.99	0.20
1310	1	59	1	2599.99	0.20
1310	2	77	2	799.99	0.20
1310	3	11	2	1680.99	0.10
1310	4	54	1	3199.99	0.20
1311	1	69	1	416.99	0.10
1311	2	45	2	869.99	0.07
1311	3	27	2	999.99	0.10
1311	4	42	1	2299.99	0.10
1312	1	67	2	250.99	0.05
1312	2	14	1	269.99	0.20
1312	3	20	1	599.99	0.07
1313	1	75	1	599.99	0.20
1313	2	33	1	469.99	0.20
1313	3	69	1	416.99	0.07
1314	1	52	1	875.99	0.07
1314	2	72	2	619.99	0.05
1314	3	94	1	249.99	0.10
1315	1	104	2	481.99	0.07
1315	2	41	1	1469.99	0.05
1315	3	24	1	549.99	0.10
1315	4	26	1	599.99	0.07
1315	5	16	2	599.99	0.20
1316	1	76	2	299.99	0.10
1316	2	90	1	209.99	0.10
1317	1	82	1	659.99	0.10
1318	1	82	2	659.99	0.20
1318	2	62	2	3499.99	0.20
1318	3	111	1	470.99	0.20
1318	4	92	1	209.99	0.07
1319	1	75	1	599.99	0.07
1319	2	91	1	349.99	0.20
1320	1	104	1	481.99	0.10
1320	2	93	1	209.99	0.05
1320	3	99	2	299.99	0.20
1321	1	34	1	469.99	0.10
1321	2	107	1	416.99	0.10
1321	3	11	2	1680.99	0.10
1322	1	28	2	2499.99	0.05
1322	2	104	2	481.99	0.05
1323	1	27	2	999.99	0.07
1323	2	20	1	599.99	0.05
1323	3	70	1	659.99	0.05
1324	1	66	1	250.99	0.10
1324	2	120	2	2499.99	0.20
1324	3	235	1	899.99	0.10
1324	4	3	1	999.99	0.20
1325	1	139	1	2999.99	0.05
1325	2	257	1	899.99	0.05
1325	3	209	1	2999.99	0.10
1325	4	28	1	2499.99	0.07
1326	1	190	2	2799.99	0.07
1326	2	269	2	199.99	0.07
1327	1	151	2	1549.99	0.07
1327	2	235	2	899.99	0.10
1327	3	48	2	1499.99	0.10
1327	4	180	1	919.99	0.20
1328	1	241	1	749.99	0.07
1328	2	129	2	919.99	0.10
1328	3	228	1	319.99	0.07
1328	4	311	1	749.99	0.10
1328	5	247	1	599.99	0.10
1329	1	143	1	1099.99	0.07
1329	2	107	1	416.99	0.05
1329	3	55	1	2699.99	0.07
1329	4	283	2	319.99	0.20
1329	5	13	1	269.99	0.10
1330	1	232	1	479.99	0.20
1330	2	243	2	679.99	0.05
1330	3	230	2	429.99	0.20
1330	4	102	2	489.99	0.05
1330	5	282	1	279.99	0.10
1331	1	253	1	2599.99	0.05
1331	2	290	1	369.99	0.05
1331	3	145	2	1799.99	0.10
1331	4	300	1	799.99	0.20
1332	1	296	1	369.99	0.20
1332	2	93	2	209.99	0.05
1332	3	179	2	919.99	0.07
1332	4	298	1	279.99	0.10
1333	1	205	2	4999.99	0.05
1333	2	304	2	679.99	0.10
1333	3	99	2	299.99	0.10
1333	4	12	1	549.99	0.05
1333	5	78	1	647.99	0.10
1334	1	203	2	4999.99	0.05
1334	2	160	2	4499.99	0.07
1334	3	84	2	109.99	0.10
1334	4	13	1	269.99	0.05
1334	5	42	1	2299.99	0.05
1335	1	138	2	2249.99	0.05
1336	1	29	2	999.99	0.20
1336	2	157	1	6499.99	0.05
1336	3	21	2	269.99	0.07
1336	4	207	1	3999.99	0.10
1336	5	185	1	2799.99	0.10
1337	1	153	1	4999.99	0.10
1338	1	169	2	6499.99	0.07
1339	1	175	1	3199.99	0.07
1340	1	253	1	2599.99	0.20
1340	2	92	2	209.99	0.20
1340	3	237	2	849.99	0.05
1341	1	215	2	749.99	0.07
1341	2	56	2	5499.99	0.20
1341	3	234	2	899.99	0.05
1341	4	66	2	250.99	0.05
1342	1	60	1	1559.99	0.05
1342	2	270	1	209.99	0.05
1343	1	244	1	559.99	0.05
1343	2	99	1	299.99	0.05
1343	3	184	2	3499.99	0.20
1343	4	65	2	346.99	0.20
1343	5	206	1	3299.99	0.10
1344	1	77	2	799.99	0.07
1344	2	103	2	551.99	0.20
1344	3	3	1	999.99	0.07
1344	4	61	1	4999.99	0.07
1345	1	40	2	4999.99	0.20
1345	2	172	2	3199.99	0.05
1345	3	164	2	1549.00	0.20
1345	4	2	2	749.99	0.20
1346	1	134	2	1499.99	0.05
1346	2	150	1	4499.99	0.05
1346	3	18	2	449.00	0.05
1346	4	249	1	749.99	0.10
1346	5	263	2	89.99	0.20
1347	1	43	2	5299.99	0.07
1347	2	53	1	749.99	0.05
1348	1	203	1	4999.99	0.05
1348	2	148	1	5499.99	0.05
1348	3	58	2	4999.99	0.10
1348	4	147	1	1799.99	0.07
1349	1	138	2	2249.99	0.05
1349	2	205	2	4999.99	0.07
1349	3	168	2	1549.00	0.20
1349	4	184	1	3499.99	0.20
1350	1	305	1	749.99	0.10
1350	2	250	1	2599.99	0.07
1350	3	253	1	2599.99	0.07
1350	4	159	1	2299.99	0.05
1350	5	13	2	269.99	0.20
1351	1	297	2	279.99	0.20
1351	2	133	1	1499.99	0.10
1352	1	136	1	1799.99	0.20
1352	2	52	2	875.99	0.10
1352	3	282	2	279.99	0.10
1352	4	86	2	149.99	0.20
1352	5	100	1	489.99	0.05
1353	1	107	2	416.99	0.05
1353	2	233	1	639.99	0.07
1353	3	300	1	799.99	0.20
1353	4	86	2	149.99	0.05
1354	1	166	2	749.99	0.07
1355	1	297	1	279.99	0.10
1355	2	253	1	2599.99	0.07
1355	3	149	1	7499.99	0.20
1355	4	313	2	449.99	0.10
1356	1	192	1	2599.99	0.05
1356	2	199	2	2999.99	0.10
1356	3	276	2	319.99	0.10
1357	1	145	2	1799.99	0.20
1357	2	60	1	1559.99	0.20
1357	3	130	1	919.99	0.20
1358	1	257	2	899.99	0.20
1359	1	282	1	279.99	0.05
1359	2	82	1	659.99	0.05
1360	1	31	1	1632.99	0.05
1361	1	307	2	749.99	0.07
1361	2	153	1	4999.99	0.05
1361	3	163	2	1349.00	0.20
1362	1	27	2	999.99	0.20
1362	2	204	2	3599.99	0.07
1362	3	4	2	2899.99	0.20
1363	1	66	2	250.99	0.10
1364	1	78	1	647.99	0.07
1364	2	155	2	11999.99	0.10
1364	3	152	1	2499.99	0.10
1364	4	110	1	470.99	0.07
1365	1	144	1	1549.99	0.07
1365	2	58	1	4999.99	0.07
1365	3	236	1	749.99	0.05
1366	1	115	1	3199.99	0.10
1366	2	128	2	1899.00	0.20
1366	3	200	1	3499.99	0.07
1367	1	132	1	1499.99	0.10
1367	2	131	2	2599.00	0.20
1367	3	124	1	1499.00	0.07
1367	4	24	2	549.99	0.05
1368	1	66	1	250.99	0.10
1368	2	113	2	489.99	0.07
1368	3	186	1	4499.99	0.20
1369	1	213	2	269.99	0.05
1370	1	7	1	3999.99	0.07
1370	2	89	2	209.99	0.10
1370	3	208	2	1799.99	0.20
1370	4	134	1	1499.99	0.10
1371	1	223	2	529.99	0.07
1371	2	8	2	1799.99	0.20
1372	1	307	1	749.99	0.07
1372	2	283	2	319.99	0.20
1373	1	63	1	3499.99	0.10
1374	1	181	2	2199.99	0.05
1374	2	130	2	919.99	0.07
1375	1	147	2	1799.99	0.05
1375	2	182	1	2499.99	0.20
1376	1	5	1	1320.99	0.07
1377	1	153	2	4999.99	0.05
1377	2	130	1	919.99	0.05
1377	3	48	1	1499.99	0.07
1377	4	188	2	3499.99	0.07
1378	1	96	2	349.99	0.07
1378	2	142	2	3199.99	0.07
1378	3	2	2	749.99	0.20
1378	4	110	1	470.99	0.07
1378	5	129	2	919.99	0.20
1379	1	15	1	529.99	0.10
1379	2	118	1	999.99	0.10
1379	3	263	2	89.99	0.10
1380	1	255	2	899.99	0.10
1380	2	229	2	429.99	0.07
1381	1	274	2	229.99	0.20
1381	2	214	2	899.99	0.10
1382	1	232	1	479.99	0.20
1382	2	81	2	1099.99	0.05
1382	3	225	1	959.99	0.10
1382	4	135	1	1499.99	0.07
1382	5	238	1	749.99	0.20
1383	1	188	2	3499.99	0.20
1383	2	65	2	346.99	0.05
1384	1	32	1	469.99	0.07
1384	2	142	2	3199.99	0.10
1384	3	89	1	209.99	0.10
1384	4	97	1	349.99	0.05
1385	1	24	2	549.99	0.05
1385	2	145	1	1799.99	0.07
1385	3	39	2	1499.99	0.10
1385	4	135	1	1499.99	0.05
1386	1	292	1	369.99	0.20
1386	2	262	1	249.99	0.10
1386	3	306	1	899.99	0.10
1386	4	150	1	4499.99	0.07
1387	1	106	1	449.99	0.10
1388	1	251	1	2999.99	0.10
1389	1	85	2	329.99	0.10
1389	2	171	2	3199.99	0.05
1389	3	227	1	319.99	0.07
1390	1	41	2	1469.99	0.05
1390	2	27	2	999.99	0.05
1390	3	306	1	899.99	0.10
1390	4	104	1	481.99	0.05
1390	5	147	2	1799.99	0.10
1391	1	223	2	529.99	0.07
1391	2	295	2	319.99	0.20
1391	3	277	1	369.99	0.20
1392	1	87	2	189.99	0.20
1392	2	240	2	899.99	0.05
1393	1	92	1	209.99	0.07
1393	2	82	1	659.99	0.07
1393	3	47	2	5299.99	0.05
1393	4	268	2	159.99	0.05
1394	1	165	2	2499.99	0.05
1395	1	204	1	3599.99	0.20
1395	2	48	2	1499.99	0.10
1395	3	180	2	919.99	0.20
1395	4	226	1	679.99	0.10
1396	1	57	1	1999.99	0.05
1396	2	181	1	2199.99	0.20
1397	1	127	2	469.99	0.10
1397	2	139	1	2999.99	0.07
1397	3	7	1	3999.99	0.05
1397	4	249	1	749.99	0.05
1397	5	78	2	647.99	0.10
1398	1	69	2	416.99	0.05
1398	2	53	1	749.99	0.20
1399	1	210	2	1549.00	0.20
1399	2	224	1	479.99	0.05
1399	3	127	2	469.99	0.07
1399	4	28	1	2499.99	0.05
1400	1	24	2	549.99	0.20
1400	2	217	2	909.99	0.20
1400	3	275	1	229.99	0.10
1400	4	90	1	209.99	0.07
1401	1	112	1	379.99	0.07
1401	2	230	1	429.99	0.05
1401	3	254	2	749.99	0.20
1402	1	189	2	2799.99	0.20
1402	2	28	2	2499.99	0.05
1402	3	203	1	4999.99	0.05
1402	4	273	1	289.99	0.07
1403	1	93	2	209.99	0.10
1404	1	112	2	379.99	0.05
1404	2	220	1	269.99	0.10
1404	3	193	2	2799.99	0.20
1405	1	162	2	2999.99	0.10
1406	1	230	2	429.99	0.05
1406	2	113	1	489.99	0.10
1407	1	300	1	799.99	0.05
1407	2	36	2	832.99	0.10
1407	3	266	1	399.99	0.10
1407	4	35	1	832.99	0.20
1408	1	23	2	299.99	0.20
1408	2	166	1	749.99	0.20
1408	3	114	1	579.99	0.07
1408	4	137	2	2599.00	0.20
1409	1	301	2	899.99	0.07
1409	2	170	1	1299.99	0.07
1409	3	171	2	3199.99	0.05
1409	4	265	1	289.99	0.05
1409	5	222	1	269.99	0.10
1410	1	205	2	4999.99	0.10
1410	2	203	2	4999.99	0.20
1410	3	304	1	679.99	0.10
1411	1	9	1	2999.99	0.10
1411	2	308	2	749.99	0.20
1412	1	180	2	919.99	0.07
1412	2	43	1	5299.99	0.10
1412	3	109	2	416.99	0.07
1413	1	297	2	279.99	0.05
1414	1	162	2	2999.99	0.10
1414	2	292	2	369.99	0.05
1415	1	31	2	1632.99	0.07
1415	2	17	1	429.00	0.05
1415	3	264	2	249.99	0.10
1415	4	245	1	659.99	0.05
1416	1	194	1	3499.99	0.20
1416	2	242	2	699.99	0.10
1416	3	92	2	209.99	0.05
1417	1	219	2	639.99	0.20
1418	1	120	2	2499.99	0.20
1418	2	243	2	679.99	0.05
1419	1	124	1	1499.00	0.07
1419	2	235	2	899.99	0.20
1419	3	234	1	899.99	0.10
1420	1	197	1	2299.99	0.20
1420	2	194	2	3499.99	0.10
1420	3	128	1	1899.00	0.10
1421	1	298	2	279.99	0.05
1422	1	80	2	761.99	0.07
1422	2	180	2	919.99	0.20
1422	3	243	1	679.99	0.05
1423	1	249	1	749.99	0.20
1423	2	71	1	416.99	0.10
1423	3	302	1	449.99	0.20
1423	4	113	2	489.99	0.20
1424	1	140	2	4999.99	0.20
1425	1	227	2	319.99	0.05
1425	2	263	1	89.99	0.07
1425	3	93	1	209.99	0.07
1425	4	54	2	3199.99	0.05
1425	5	145	2	1799.99	0.07
1426	1	215	1	749.99	0.07
1426	2	20	2	599.99	0.05
1426	3	281	1	319.99	0.07
1427	1	230	2	429.99	0.07
1427	2	139	1	2999.99	0.05
1427	3	164	2	1549.00	0.07
1428	1	216	2	899.99	0.20
1428	2	126	1	469.99	0.07
1428	3	187	2	2799.99	0.07
1428	4	28	1	2499.99	0.10
1428	5	194	2	3499.99	0.20
1429	1	70	2	659.99	0.20
1430	1	221	1	319.99	0.05
1430	2	281	1	319.99	0.07
1431	1	207	1	3999.99	0.10
1431	2	53	1	749.99	0.07
1431	3	252	1	2999.99	0.20
1431	4	254	1	749.99	0.07
1432	1	161	1	1899.00	0.20
1433	1	264	1	249.99	0.07
1434	1	229	2	429.99	0.20
1434	2	198	1	2999.99	0.10
1434	3	286	2	279.99	0.10
1434	4	61	2	4999.99	0.07
1435	1	141	2	1599.99	0.07
1435	2	29	1	999.99	0.20
1435	3	60	1	1559.99	0.10
1435	4	260	1	799.99	0.07
1436	1	244	2	559.99	0.07
1437	1	141	2	1599.99	0.05
1438	1	225	1	959.99	0.20
1438	2	140	1	4999.99	0.20
1438	3	81	2	1099.99	0.05
1438	4	137	1	2599.00	0.10
1438	5	190	2	2799.99	0.07
1439	1	42	1	2299.99	0.07
1439	2	263	1	89.99	0.20
1439	3	102	2	489.99	0.05
1439	4	149	1	7499.99	0.05
1440	1	116	2	749.99	0.07
1440	2	109	1	416.99	0.07
1440	3	186	1	4499.99	0.10
1440	4	178	2	749.99	0.05
1440	5	67	2	250.99	0.20
1441	1	6	1	469.99	0.05
1441	2	242	2	699.99	0.20
1441	3	46	1	1409.99	0.07
1442	1	160	1	4499.99	0.10
1442	2	220	1	269.99	0.07
1442	3	271	2	209.99	0.05
1443	1	160	1	4499.99	0.07
1443	2	57	1	1999.99	0.20
1443	3	101	2	339.99	0.10
1444	1	90	1	209.99	0.10
1444	2	128	2	1899.00	0.20
1445	1	219	2	639.99	0.10
1445	2	52	1	875.99	0.07
1445	3	123	2	999.99	0.10
1446	1	227	1	319.99	0.05
1446	2	233	2	639.99	0.05
1446	3	234	2	899.99	0.05
1447	1	148	1	5499.99	0.20
1448	1	239	1	749.99	0.10
1449	1	159	1	2299.99	0.07
1449	2	55	1	2699.99	0.20
1449	3	260	2	799.99	0.07
1449	4	252	2	2999.99	0.05
1449	5	14	2	269.99	0.10
1450	1	98	1	489.99	0.07
1450	2	173	2	3199.99	0.10
1450	3	299	1	559.99	0.20
1450	4	209	2	2999.99	0.10
1450	5	235	2	899.99	0.05
1451	1	117	1	1469.99	0.05
1452	1	99	2	299.99	0.10
1452	2	234	1	899.99	0.20
1452	3	86	2	149.99	0.05
1452	4	109	2	416.99	0.07
1453	1	89	2	209.99	0.10
1454	1	283	1	319.99	0.07
1454	2	35	2	832.99	0.10
1454	3	124	1	1499.00	0.20
1454	4	38	2	549.99	0.05
1455	1	101	2	339.99	0.05
1455	2	254	1	749.99	0.20
1456	1	193	2	2799.99	0.05
1456	2	246	1	639.99	0.07
1456	3	268	2	159.99	0.10
1456	4	272	1	289.99	0.10
1456	5	126	1	469.99	0.10
1457	1	113	1	489.99	0.07
1457	2	111	1	470.99	0.20
1457	3	268	1	159.99	0.20
1457	4	152	2	2499.99	0.20
1458	1	295	2	319.99	0.05
1458	2	105	1	533.99	0.05
1458	3	12	1	549.99	0.05
1458	4	78	2	647.99	0.10
1459	1	258	1	1259.90	0.10
1460	1	201	1	4499.99	0.05
1460	2	76	1	299.99	0.07
1460	3	167	1	749.99	0.05
1460	4	7	2	3999.99	0.07
1460	5	123	2	999.99	0.07
1461	1	48	1	1499.99	0.20
1461	2	242	2	699.99	0.20
1462	1	263	1	89.99	0.20
1462	2	25	1	499.99	0.07
1462	3	223	1	529.99	0.10
1462	4	294	1	369.99	0.10
1462	5	251	1	2999.99	0.05
1463	1	51	2	6499.99	0.05
1463	2	168	1	1549.00	0.05
1464	1	109	2	416.99	0.05
1464	2	124	1	1499.00	0.20
1464	3	165	2	2499.99	0.20
1464	4	151	2	1549.99	0.05
1465	1	70	2	659.99	0.05
1466	1	310	2	899.99	0.07
1466	2	251	1	2999.99	0.05
1466	3	163	2	1349.00	0.20
1466	4	39	2	1499.99	0.05
1467	1	18	1	449.00	0.07
1467	2	115	1	3199.99	0.20
1467	3	278	2	369.99	0.10
1468	1	269	1	199.99	0.05
1468	2	58	1	4999.99	0.07
1468	3	50	2	5999.99	0.07
1469	1	77	2	799.99	0.20
1469	2	237	2	849.99	0.05
1469	3	182	1	2499.99	0.07
1469	4	100	2	489.99	0.05
1470	1	110	2	470.99	0.10
1470	2	287	1	279.99	0.05
1470	3	252	2	2999.99	0.05
1471	1	59	2	2599.99	0.20
1471	2	136	1	1799.99	0.07
1472	1	84	1	109.99	0.20
1472	2	300	1	799.99	0.20
1473	1	84	2	109.99	0.20
1473	2	102	1	489.99	0.07
1474	1	301	1	899.99	0.20
1474	2	123	1	999.99	0.05
1475	1	306	2	899.99	0.05
1475	2	261	2	899.99	0.07
1475	3	161	2	1899.00	0.05
1475	4	248	2	599.99	0.20
1476	1	142	2	3199.99	0.07
1476	2	91	2	349.99	0.07
1476	3	43	1	5299.99	0.07
1476	4	191	1	2799.99	0.10
1476	5	265	2	289.99	0.10
1477	1	210	2	1549.00	0.20
1478	1	100	2	489.99	0.10
1478	2	123	1	999.99	0.20
1479	1	252	1	2999.99	0.05
1479	2	256	1	899.99	0.10
1480	1	308	2	749.99	0.10
1480	2	82	2	659.99	0.10
1480	3	92	2	209.99	0.07
1480	4	225	2	959.99	0.07
1481	1	53	2	749.99	0.07
1481	2	130	1	919.99	0.10
1482	1	48	1	1499.99	0.10
1482	2	113	1	489.99	0.05
1482	3	58	2	4999.99	0.07
1482	4	40	1	4999.99	0.05
1482	5	205	2	4999.99	0.05
1483	1	280	1	489.99	0.05
1483	2	226	2	679.99	0.07
1484	1	295	2	319.99	0.07
1484	2	49	2	3499.99	0.20
1484	3	304	2	679.99	0.05
1485	1	122	2	2499.99	0.20
1485	2	276	1	319.99	0.20
1486	1	60	2	1559.99	0.05
1486	2	98	1	489.99	0.05
1486	3	113	1	489.99	0.10
1486	4	269	1	199.99	0.10
1487	1	160	1	4499.99	0.07
1487	2	151	2	1549.99	0.20
1487	3	198	1	2999.99	0.05
1487	4	196	1	2299.99	0.05
1487	5	96	2	349.99	0.20
1488	1	42	1	2299.99	0.07
1488	2	122	1	2499.99	0.07
1489	1	198	1	2999.99	0.20
1489	2	282	2	279.99	0.20
1489	3	52	1	875.99	0.10
1490	1	99	1	299.99	0.10
1490	2	254	1	749.99	0.10
1490	3	218	1	319.99	0.05
1491	1	95	2	299.99	0.20
1491	2	302	1	449.99	0.05
1491	3	60	2	1559.99	0.07
1491	4	139	2	2999.99	0.07
1492	1	37	2	379.99	0.10
1493	1	230	1	429.99	0.10
1494	1	230	2	429.99	0.10
1494	2	178	2	749.99	0.20
1494	3	264	2	249.99	0.05
1495	1	292	2	369.99	0.05
1495	2	308	2	749.99	0.20
1495	3	137	1	2599.00	0.10
1496	1	248	1	599.99	0.07
1496	2	214	1	899.99	0.07
1496	3	224	2	479.99	0.05
1496	4	302	1	449.99	0.05
1496	5	225	2	959.99	0.20
1497	1	141	2	1599.99	0.20
1497	2	198	2	2999.99	0.10
1497	3	204	2	3599.99	0.07
1498	1	172	1	3199.99	0.05
1498	2	260	2	799.99	0.07
1499	1	110	1	470.99	0.05
1499	2	208	1	1799.99	0.07
1499	3	268	2	159.99	0.05
1499	4	2	1	749.99	0.05
1499	5	171	2	3199.99	0.10
1500	1	41	2	1469.99	0.07
1500	2	293	1	319.99	0.07
1501	1	248	1	599.99	0.05
1501	2	219	1	639.99	0.07
1501	3	15	1	529.99	0.05
1501	4	67	1	250.99	0.20
1501	5	210	1	1549.00	0.05
1502	1	231	2	529.99	0.20
1502	2	19	2	449.00	0.07
1502	3	26	2	599.99	0.07
1502	4	268	1	159.99	0.20
1502	5	255	1	899.99	0.07
1503	1	217	1	909.99	0.10
1503	2	302	2	449.99	0.05
1504	1	276	1	319.99	0.07
1505	1	223	2	529.99	0.05
1505	2	24	2	549.99	0.07
1505	3	43	2	5299.99	0.05
1506	1	184	1	3499.99	0.05
1506	2	153	2	4999.99	0.20
1506	3	149	2	7499.99	0.05
1507	1	39	2	1499.99	0.20
1507	2	11	2	1680.99	0.10
1507	3	259	1	1199.99	0.07
1507	4	281	1	319.99	0.07
1507	5	293	2	319.99	0.05
1508	1	37	1	379.99	0.20
1508	2	109	1	416.99	0.10
1508	3	52	2	875.99	0.05
1508	4	88	1	189.99	0.05
1509	1	215	2	749.99	0.07
1510	1	142	2	3199.99	0.05
1510	2	68	1	449.99	0.10
1510	3	251	2	2999.99	0.10
1510	4	220	2	269.99	0.10
1510	5	137	1	2599.00	0.05
1511	1	144	2	1549.99	0.20
1511	2	288	1	389.99	0.07
1511	3	17	2	429.00	0.07
1511	4	41	1	1469.99	0.05
1511	5	124	2	1499.00	0.20
1512	1	217	1	909.99	0.07
1513	1	166	1	749.99	0.10
1513	2	61	2	4999.99	0.05
1513	3	159	2	2299.99	0.05
1514	1	240	2	899.99	0.10
1514	2	203	2	4999.99	0.05
1515	1	27	2	999.99	0.20
1515	2	202	2	3499.99	0.10
1515	3	310	2	899.99	0.05
1515	4	40	1	4999.99	0.10
1515	5	158	2	959.99	0.20
1516	1	172	2	3199.99	0.10
1516	2	253	1	2599.99	0.10
1516	3	196	2	2299.99	0.20
1516	4	259	2	1199.99	0.20
1516	5	271	2	209.99	0.20
1517	1	303	2	2599.99	0.07
1517	2	226	2	679.99	0.05
1518	1	304	2	679.99	0.10
1518	2	182	2	2499.99	0.05
1518	3	252	2	2999.99	0.05
1519	1	150	1	4499.99	0.20
1519	2	85	2	329.99	0.20
1519	3	124	2	1499.00	0.07
1519	4	65	1	346.99	0.20
1519	5	265	2	289.99	0.05
1520	1	186	1	4499.99	0.05
1520	2	188	2	3499.99	0.20
1520	3	310	2	899.99	0.07
1520	4	263	2	89.99	0.10
1521	1	100	1	489.99	0.20
1521	2	314	2	679.99	0.20
1521	3	123	1	999.99	0.10
1521	4	135	2	1499.99	0.20
1522	1	95	1	299.99	0.10
1522	2	141	1	1599.99	0.07
1522	3	117	1	1469.99	0.07
1523	1	311	2	749.99	0.20
1524	1	168	1	1549.00	0.10
1524	2	295	2	319.99	0.20
1524	3	313	1	449.99	0.20
1524	4	252	2	2999.99	0.20
1525	1	156	1	6499.99	0.10
1525	2	163	2	1349.00	0.07
1525	3	193	1	2799.99	0.07
1526	1	151	1	1549.99	0.07
1526	2	56	1	5499.99	0.10
1526	3	238	1	749.99	0.10
1526	4	243	1	679.99	0.05
1527	1	33	1	469.99	0.10
1527	2	103	1	551.99	0.05
1527	3	57	2	1999.99	0.05
1528	1	229	2	429.99	0.20
1529	1	23	1	299.99	0.05
1529	2	50	2	5999.99	0.10
1530	1	213	2	269.99	0.10
1530	2	116	1	749.99	0.10
1531	1	128	1	1899.00	0.10
1532	1	209	2	2999.99	0.07
1533	1	274	2	229.99	0.10
1533	2	78	1	647.99	0.10
1533	3	96	1	349.99	0.10
1533	4	235	2	899.99	0.10
1533	5	51	1	6499.99	0.10
1534	1	194	1	3499.99	0.10
1534	2	117	1	1469.99	0.05
1534	3	269	2	199.99	0.20
1534	4	172	2	3199.99	0.20
1535	1	92	1	209.99	0.05
1535	2	75	2	599.99	0.05
1536	1	183	1	2199.99	0.20
1536	2	185	2	2799.99	0.07
1536	3	196	2	2299.99	0.20
1537	1	237	2	849.99	0.05
1538	1	206	1	3299.99	0.07
1538	2	46	2	1409.99	0.07
1538	3	117	1	1469.99	0.07
1538	4	197	1	2299.99	0.20
1538	5	306	2	899.99	0.05
1539	1	6	2	469.99	0.05
1539	2	12	2	549.99	0.05
1540	1	71	2	416.99	0.05
1540	2	236	1	749.99	0.07
1540	3	224	1	479.99	0.05
1540	4	177	2	5499.99	0.05
1540	5	78	1	647.99	0.20
1541	1	155	2	11999.99	0.10
1541	2	248	2	599.99	0.07
1541	3	142	2	3199.99	0.10
1541	4	17	1	429.00	0.10
1541	5	86	2	149.99	0.05
1542	1	79	1	402.99	0.20
1542	2	122	2	2499.99	0.05
1542	3	184	2	3499.99	0.20
1542	4	37	2	379.99	0.10
1542	5	297	1	279.99	0.20
1543	1	108	2	449.99	0.10
1543	2	93	1	209.99	0.20
1543	3	158	2	959.99	0.07
1543	4	97	2	349.99	0.05
1543	5	136	1	1799.99	0.20
1544	1	194	2	3499.99	0.10
1544	2	107	2	416.99	0.20
1545	1	45	1	869.99	0.10
1546	1	156	1	6499.99	0.10
1546	2	185	2	2799.99	0.10
1546	3	215	1	749.99	0.10
1546	4	25	1	499.99	0.05
1547	1	106	2	449.99	0.20
1547	2	204	1	3599.99	0.20
1548	1	32	1	469.99	0.10
1548	2	202	1	3499.99	0.07
1548	3	62	2	3499.99	0.20
1549	1	158	1	959.99	0.20
1549	2	119	1	469.99	0.05
1549	3	249	2	749.99	0.05
1549	4	242	2	699.99	0.10
1550	1	315	2	559.99	0.05
1550	2	245	1	659.99	0.07
1550	3	185	2	2799.99	0.10
1550	4	148	1	5499.99	0.07
1550	5	86	2	149.99	0.05
1551	1	207	2	3999.99	0.20
1552	1	197	1	2299.99	0.10
1552	2	41	2	1469.99	0.05
1553	1	102	1	489.99	0.07
1553	2	12	1	549.99	0.10
1553	3	251	1	2999.99	0.05
1553	4	89	1	209.99	0.05
1554	1	166	1	749.99	0.05
1554	2	285	1	279.99	0.20
1555	1	24	2	549.99	0.10
1555	2	156	1	6499.99	0.10
1555	3	126	1	469.99	0.10
1555	4	128	2	1899.00	0.05
1555	5	174	1	3199.99	0.20
1556	1	49	2	3499.99	0.20
1556	2	82	1	659.99	0.07
1556	3	265	1	289.99	0.10
1556	4	119	2	469.99	0.05
1556	5	235	2	899.99	0.10
1557	1	163	2	1349.00	0.07
1558	1	46	2	1409.99	0.07
1558	2	123	1	999.99	0.07
1558	3	4	1	2899.99	0.05
1558	4	55	1	2699.99	0.20
1558	5	253	1	2599.99	0.07
1559	1	101	2	339.99	0.07
1559	2	18	1	449.00	0.10
1559	3	54	2	3199.99	0.10
1559	4	221	1	319.99	0.10
1560	1	118	2	999.99	0.20
1560	2	41	1	1469.99	0.20
1561	1	181	2	2199.99	0.07
1561	2	297	2	279.99	0.05
1562	1	54	1	3199.99	0.20
1562	2	66	1	250.99	0.20
1562	3	115	2	3199.99	0.07
1563	1	188	1	3499.99	0.07
1564	1	309	1	899.99	0.07
1564	2	14	1	269.99	0.10
1565	1	37	1	379.99	0.07
1565	2	92	1	209.99	0.10
1565	3	261	1	899.99	0.10
1565	4	95	1	299.99	0.07
1565	5	226	2	679.99	0.20
1566	1	179	1	919.99	0.05
1566	2	61	2	4999.99	0.05
1567	1	279	1	319.99	0.20
1568	1	146	1	4999.99	0.20
1568	2	105	1	533.99	0.07
1568	3	301	1	899.99	0.10
1569	1	252	1	2999.99	0.10
1570	1	155	1	11999.99	0.07
1571	1	312	2	699.99	0.10
1571	2	212	1	559.99	0.07
1571	3	20	2	599.99	0.20
1572	1	216	2	899.99	0.05
1572	2	198	1	2999.99	0.20
1572	3	115	1	3199.99	0.05
1572	4	304	2	679.99	0.20
1573	1	9	1	2999.99	0.05
1573	2	129	1	919.99	0.07
1573	3	15	2	529.99	0.10
1573	4	216	2	899.99	0.07
1573	5	263	2	89.99	0.10
1574	1	127	1	469.99	0.10
1575	1	44	1	539.99	0.07
1575	2	207	2	3999.99	0.10
1575	3	213	1	269.99	0.07
1575	4	126	2	469.99	0.05
1575	5	92	2	209.99	0.20
1576	1	69	1	416.99	0.05
1576	2	293	1	319.99	0.05
1576	3	202	2	3499.99	0.05
1577	1	298	2	279.99	0.05
1577	2	111	2	470.99	0.10
1577	3	300	2	799.99	0.20
1577	4	131	2	2599.00	0.07
1577	5	282	2	279.99	0.05
1578	1	204	2	3599.99	0.07
1578	2	310	1	899.99	0.05
1578	3	241	2	749.99	0.20
1579	1	49	1	3499.99	0.05
1579	2	214	1	899.99	0.10
1579	3	286	1	279.99	0.07
1579	4	65	2	346.99	0.10
1580	1	119	2	469.99	0.07
1580	2	86	2	149.99	0.20
1581	1	64	1	489.99	0.10
1581	2	272	1	289.99	0.20
1582	1	75	1	599.99	0.07
1582	2	133	2	1499.99	0.07
1583	1	15	1	529.99	0.05
1583	2	265	2	289.99	0.20
1584	1	45	2	869.99	0.10
1584	2	216	2	899.99	0.10
1584	3	43	1	5299.99	0.20
1584	4	187	1	2799.99	0.10
1584	5	147	2	1799.99	0.07
1585	1	313	1	449.99	0.10
1585	2	106	2	449.99	0.10
1585	3	207	2	3999.99	0.07
1585	4	95	1	299.99	0.10
1585	5	191	1	2799.99	0.10
1586	1	22	2	269.99	0.10
1586	2	277	1	369.99	0.07
1586	3	295	1	319.99	0.05
1586	4	173	1	3199.99	0.20
1586	5	36	1	832.99	0.10
1587	1	104	1	481.99	0.10
1587	2	63	2	3499.99	0.05
1587	3	78	2	647.99	0.05
1587	4	300	2	799.99	0.07
1588	1	93	2	209.99	0.07
1589	1	246	2	639.99	0.05
1589	2	260	1	799.99	0.20
1589	3	28	2	2499.99	0.10
1590	1	175	2	3199.99	0.07
1590	2	248	1	599.99	0.20
1590	3	23	1	299.99	0.07
1591	1	286	2	279.99	0.20
1591	2	126	2	469.99	0.20
1591	3	97	2	349.99	0.07
1591	4	138	2	2249.99	0.05
1591	5	265	1	289.99	0.20
1592	1	211	2	1549.00	0.05
1592	2	159	1	2299.99	0.07
1592	3	40	2	4999.99	0.07
1592	4	9	1	2999.99	0.20
1592	5	271	2	209.99	0.05
1593	1	97	2	349.99	0.20
1593	2	34	1	469.99	0.07
1593	3	190	2	2799.99	0.10
1593	4	107	1	416.99	0.05
1593	5	169	2	6499.99	0.07
1594	1	79	2	402.99	0.10
1594	2	105	1	533.99	0.10
1595	1	112	1	379.99	0.20
1596	1	91	1	349.99	0.05
1596	2	18	1	449.00	0.10
1597	1	176	1	3199.99	0.07
1597	2	59	1	2599.99	0.07
1598	1	247	1	599.99	0.20
1598	2	49	2	3499.99	0.07
1598	3	88	1	189.99	0.20
1599	1	104	2	481.99	0.20
1600	1	146	1	4999.99	0.10
1600	2	295	1	319.99	0.05
1600	3	36	1	832.99	0.20
1601	1	114	2	579.99	0.20
1601	2	10	1	1549.00	0.20
1601	3	220	2	269.99	0.07
1601	4	7	2	3999.99	0.07
1601	5	180	1	919.99	0.10
1602	1	71	2	416.99	0.05
1602	2	37	1	379.99	0.07
1602	3	275	2	229.99	0.20
1602	4	257	2	899.99	0.05
1603	1	275	2	229.99	0.05
1604	1	271	1	209.99	0.10
1605	1	72	1	619.99	0.10
1605	2	186	1	4499.99	0.20
1605	3	132	2	1499.99	0.10
1605	4	301	1	899.99	0.10
1605	5	29	1	999.99	0.07
1606	1	245	1	659.99	0.10
1606	2	271	1	209.99	0.10
1607	1	29	1	999.99	0.05
1608	1	231	2	529.99	0.05
1609	1	96	1	349.99	0.20
1609	2	238	2	749.99	0.20
1609	3	228	2	319.99	0.10
1609	4	105	1	533.99	0.20
1610	1	36	1	832.99	0.07
1610	2	173	2	3199.99	0.20
1611	1	191	1	2799.99	0.07
1611	2	171	2	3199.99	0.10
1611	3	236	1	749.99	0.20
1612	1	242	1	699.99	0.10
1612	2	289	2	319.99	0.05
1612	3	101	2	339.99	0.20
1612	4	293	2	319.99	0.07
1612	5	60	1	1559.99	0.10
1613	1	153	1	4999.99	0.07
1613	2	283	2	319.99	0.05
1614	1	124	1	1499.00	0.07
1614	2	159	2	2299.99	0.07
1614	3	213	2	269.99	0.20
1615	1	197	2	2299.99	0.20
1615	2	214	1	899.99	0.07
1615	3	182	1	2499.99	0.20
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id) FROM stdin;
1	259	4	2016-01-01	2016-01-03	2016-01-03	1	2
2	1212	4	2016-01-01	2016-01-04	2016-01-03	2	6
3	523	4	2016-01-02	2016-01-05	2016-01-03	2	7
4	175	4	2016-01-03	2016-01-04	2016-01-05	1	3
5	1324	4	2016-01-03	2016-01-06	2016-01-06	2	6
6	94	4	2016-01-04	2016-01-07	2016-01-05	2	6
7	324	4	2016-01-04	2016-01-07	2016-01-05	2	6
8	1204	4	2016-01-04	2016-01-05	2016-01-05	2	7
9	60	4	2016-01-05	2016-01-08	2016-01-08	1	2
10	442	4	2016-01-05	2016-01-06	2016-01-06	2	6
11	1326	4	2016-01-05	2016-01-08	2016-01-07	2	7
12	91	4	2016-01-06	2016-01-08	2016-01-09	1	2
13	873	4	2016-01-08	2016-01-11	2016-01-11	2	6
14	258	4	2016-01-09	2016-01-11	2016-01-12	1	3
15	450	4	2016-01-09	2016-01-10	2016-01-12	2	7
16	552	4	2016-01-12	2016-01-15	2016-01-15	1	3
17	1175	4	2016-01-12	2016-01-14	2016-01-14	1	3
18	541	4	2016-01-14	2016-01-17	2016-01-15	1	3
19	696	4	2016-01-14	2016-01-17	2016-01-16	1	2
20	923	4	2016-01-14	2016-01-16	2016-01-17	1	2
21	1250	4	2016-01-15	2016-01-16	2016-01-18	2	6
22	1035	4	2016-01-16	2016-01-18	2016-01-17	1	2
23	1149	4	2016-01-16	2016-01-19	2016-01-19	1	2
24	636	4	2016-01-18	2016-01-20	2016-01-19	2	7
25	657	4	2016-01-18	2016-01-21	2016-01-21	2	6
26	1280	4	2016-01-18	2016-01-21	2016-01-19	2	7
27	57	4	2016-01-19	2016-01-21	2016-01-20	2	7
28	252	4	2016-01-19	2016-01-20	2016-01-21	2	6
29	437	4	2016-01-20	2016-01-22	2016-01-21	2	6
30	1348	4	2016-01-20	2016-01-21	2016-01-21	2	6
31	1238	4	2016-01-20	2016-01-22	2016-01-22	3	8
32	1259	4	2016-01-21	2016-01-24	2016-01-22	1	3
33	236	4	2016-01-21	2016-01-22	2016-01-22	2	6
34	80	4	2016-01-22	2016-01-25	2016-01-23	2	6
35	813	4	2016-01-22	2016-01-25	2016-01-24	2	7
36	1321	4	2016-01-23	2016-01-24	2016-01-24	2	6
37	164	4	2016-01-25	2016-01-28	2016-01-26	2	6
38	583	4	2016-01-25	2016-01-27	2016-01-26	2	7
39	1296	4	2016-01-25	2016-01-26	2016-01-26	2	7
40	348	4	2016-01-27	2016-01-28	2016-01-29	1	3
41	979	4	2016-01-27	2016-01-30	2016-01-29	2	6
42	1095	4	2016-01-27	2016-01-28	2016-01-30	2	7
43	1434	4	2016-01-27	2016-01-28	2016-01-30	2	7
44	861	4	2016-01-28	2016-01-31	2016-01-30	2	7
45	1220	4	2016-01-28	2016-01-31	2016-01-31	2	7
46	746	4	2016-01-29	2016-01-31	2016-01-31	2	7
47	1234	4	2016-01-29	2016-01-30	2016-01-31	2	7
48	1012	4	2016-01-30	2016-02-01	2016-02-02	2	7
49	608	4	2016-01-31	2016-02-01	2016-02-02	2	6
50	872	4	2016-01-31	2016-02-03	2016-02-02	3	8
51	1047	4	2016-02-01	2016-02-02	2016-02-03	2	7
52	767	4	2016-02-03	2016-02-04	2016-02-05	1	2
53	965	4	2016-02-03	2016-02-04	2016-02-05	2	6
54	535	4	2016-02-04	2016-02-07	2016-02-07	2	7
55	1173	4	2016-02-04	2016-02-07	2016-02-06	2	6
56	1241	4	2016-02-04	2016-02-06	2016-02-07	2	6
57	1305	4	2016-02-04	2016-02-06	2016-02-06	2	7
58	504	4	2016-02-05	2016-02-07	2016-02-07	2	6
59	563	4	2016-02-05	2016-02-07	2016-02-06	2	7
60	151	4	2016-02-06	2016-02-08	2016-02-07	1	3
61	277	4	2016-02-06	2016-02-09	2016-02-09	2	7
62	208	4	2016-02-07	2016-02-10	2016-02-10	1	2
63	1075	4	2016-02-07	2016-02-09	2016-02-09	2	7
64	1185	4	2016-02-07	2016-02-08	2016-02-09	2	6
65	996	4	2016-02-08	2016-02-09	2016-02-11	2	6
66	1253	4	2016-02-09	2016-02-12	2016-02-12	2	7
67	526	4	2016-02-09	2016-02-11	2016-02-10	3	8
68	381	4	2016-02-10	2016-02-11	2016-02-13	2	6
69	1413	4	2016-02-10	2016-02-12	2016-02-11	2	7
70	50	3	2016-02-11	2016-02-11	\N	3	9
71	797	4	2016-02-11	2016-02-14	2016-02-12	2	7
72	1386	4	2016-02-12	2016-02-15	2016-02-13	1	2
73	612	4	2016-02-12	2016-02-15	2016-02-14	2	7
74	264	4	2016-02-13	2016-02-15	2016-02-15	2	7
75	587	4	2016-02-14	2016-02-15	2016-02-17	2	6
76	9	3	2016-02-16	2016-02-16	\N	2	6
77	385	4	2016-02-16	2016-02-19	2016-02-19	1	2
78	1182	4	2016-02-16	2016-02-18	2016-02-19	2	7
79	529	4	2016-02-17	2016-02-20	2016-02-20	1	3
80	397	4	2016-02-17	2016-02-20	2016-02-19	2	6
81	521	4	2016-02-17	2016-02-19	2016-02-18	2	6
82	1223	4	2016-02-18	2016-02-21	2016-02-20	2	6
83	393	4	2016-02-19	2016-02-20	2016-02-20	1	3
84	317	4	2016-02-20	2016-02-22	2016-02-21	2	7
85	1174	4	2016-02-20	2016-02-23	2016-02-21	2	7
86	276	4	2016-02-21	2016-02-22	2016-02-23	2	7
87	516	4	2016-02-21	2016-02-22	2016-02-23	2	6
88	1069	4	2016-02-21	2016-02-22	2016-02-23	2	6
89	668	4	2016-02-21	2016-02-24	2016-02-24	3	8
90	414	4	2016-02-23	2016-02-25	2016-02-24	2	7
91	648	4	2016-02-25	2016-02-27	2016-02-28	1	2
92	1309	4	2016-02-25	2016-02-28	2016-02-28	2	7
93	1328	4	2016-02-26	2016-02-28	2016-02-27	1	3
94	929	4	2016-02-27	2016-02-28	2016-02-29	1	2
95	218	4	2016-02-27	2016-02-29	2016-02-28	2	7
96	1094	4	2016-02-27	2016-02-29	2016-02-28	2	7
97	204	4	2016-02-28	2016-02-29	2016-03-01	2	7
98	1194	4	2016-02-28	2016-02-29	2016-02-29	2	6
99	1165	4	2016-02-29	2016-03-01	2016-03-03	3	9
100	1237	4	2016-03-01	2016-03-04	2016-03-03	2	7
101	271	4	2016-03-01	2016-03-04	2016-03-04	3	8
102	336	4	2016-03-02	2016-03-05	2016-03-03	2	7
103	991	4	2016-03-03	2016-03-06	2016-03-05	1	2
104	7	4	2016-03-03	2016-03-05	2016-03-05	2	7
105	306	4	2016-03-03	2016-03-05	2016-03-04	2	7
106	422	4	2016-03-04	2016-03-05	2016-03-05	3	9
107	633	4	2016-03-06	2016-03-09	2016-03-09	1	2
108	12	4	2016-03-06	2016-03-09	2016-03-07	2	6
109	1255	4	2016-03-06	2016-03-09	2016-03-09	2	6
110	677	4	2016-03-06	2016-03-08	2016-03-09	3	9
111	630	4	2016-03-07	2016-03-10	2016-03-10	2	6
112	469	4	2016-03-08	2016-03-11	2016-03-10	2	6
113	1078	4	2016-03-08	2016-03-11	2016-03-11	2	6
114	1431	4	2016-03-08	2016-03-10	2016-03-11	2	7
115	1369	4	2016-03-09	2016-03-11	2016-03-11	2	7
116	471	4	2016-03-10	2016-03-11	2016-03-11	2	7
117	740	4	2016-03-10	2016-03-13	2016-03-11	2	6
118	577	4	2016-03-12	2016-03-14	2016-03-13	1	2
119	925	4	2016-03-12	2016-03-14	2016-03-14	2	7
120	327	4	2016-03-14	2016-03-15	2016-03-17	2	7
121	755	4	2016-03-14	2016-03-15	2016-03-16	2	6
122	786	4	2016-03-14	2016-03-16	2016-03-15	2	6
123	766	4	2016-03-15	2016-03-18	2016-03-17	2	6
124	403	4	2016-03-16	2016-03-18	2016-03-17	1	3
125	685	4	2016-03-16	2016-03-19	2016-03-17	2	6
126	1365	4	2016-03-16	2016-03-18	2016-03-18	2	7
127	484	4	2016-03-17	2016-03-18	2016-03-19	3	8
128	86	4	2016-03-18	2016-03-20	2016-03-21	2	6
129	84	4	2016-03-19	2016-03-21	2016-03-21	2	7
130	1049	4	2016-03-19	2016-03-22	2016-03-20	2	6
131	316	4	2016-03-19	2016-03-22	2016-03-20	3	8
132	46	4	2016-03-20	2016-03-22	2016-03-23	1	3
133	409	4	2016-03-20	2016-03-22	2016-03-21	2	7
134	679	4	2016-03-20	2016-03-21	2016-03-21	2	7
135	1354	4	2016-03-21	2016-03-23	2016-03-23	2	7
136	1192	4	2016-03-21	2016-03-24	2016-03-23	3	8
137	370	4	2016-03-23	2016-03-26	2016-03-25	2	7
138	438	4	2016-03-23	2016-03-24	2016-03-25	2	7
139	710	4	2016-03-23	2016-03-24	2016-03-26	2	7
140	1264	4	2016-03-23	2016-03-26	2016-03-26	2	7
141	557	4	2016-03-25	2016-03-27	2016-03-26	2	7
142	170	4	2016-03-26	2016-03-27	2016-03-27	1	3
143	693	4	2016-03-26	2016-03-28	2016-03-28	2	7
144	1124	4	2016-03-26	2016-03-29	2016-03-29	2	7
145	366	4	2016-03-27	2016-03-29	2016-03-30	2	6
146	288	4	2016-03-28	2016-03-30	2016-03-30	1	3
147	55	4	2016-03-28	2016-03-31	2016-03-31	2	7
148	714	4	2016-03-28	2016-03-30	2016-03-30	2	6
149	763	4	2016-03-28	2016-03-30	2016-03-29	2	6
150	332	4	2016-03-29	2016-03-31	2016-04-01	1	2
151	926	4	2016-03-29	2016-04-01	2016-03-31	1	2
152	76	4	2016-03-29	2016-03-30	2016-03-30	2	6
153	498	4	2016-03-30	2016-04-02	2016-04-01	2	6
154	1286	4	2016-03-31	2016-04-01	2016-04-01	1	2
155	371	4	2016-04-02	2016-04-03	2016-04-04	2	6
156	357	4	2016-04-03	2016-04-06	2016-04-05	1	3
157	43	4	2016-04-03	2016-04-06	2016-04-06	3	8
158	117	3	2016-04-04	2016-04-04	\N	3	9
159	32	4	2016-04-04	2016-04-06	2016-04-06	1	2
160	205	4	2016-04-04	2016-04-06	2016-04-06	2	7
161	251	4	2016-04-04	2016-04-07	2016-04-05	2	7
162	31	4	2016-04-06	2016-04-08	2016-04-07	1	3
163	1325	4	2016-04-06	2016-04-07	2016-04-07	2	7
164	610	4	2016-04-07	2016-04-08	2016-04-09	2	7
165	574	4	2016-04-08	2016-04-10	2016-04-10	1	3
166	338	4	2016-04-08	2016-04-11	2016-04-11	2	6
167	1034	4	2016-04-08	2016-04-09	2016-04-11	2	7
168	1147	4	2016-04-09	2016-04-12	2016-04-11	1	3
169	99	4	2016-04-10	2016-04-11	2016-04-11	2	7
170	1200	4	2016-04-10	2016-04-11	2016-04-13	2	7
171	237	4	2016-04-11	2016-04-14	2016-04-14	1	3
172	1079	4	2016-04-11	2016-04-12	2016-04-14	2	7
173	117	4	2016-04-11	2016-04-14	2016-04-13	3	8
174	1361	4	2016-04-12	2016-04-13	2016-04-15	2	7
175	951	4	2016-04-13	2016-04-14	2016-04-14	2	6
176	643	4	2016-04-15	2016-04-16	2016-04-17	2	7
177	121	4	2016-04-16	2016-04-19	2016-04-19	1	2
178	756	4	2016-04-16	2016-04-17	2016-04-18	2	6
179	616	4	2016-04-17	2016-04-19	2016-04-19	2	6
180	918	4	2016-04-17	2016-04-20	2016-04-19	2	7
181	459	4	2016-04-18	2016-04-20	2016-04-20	1	3
182	854	4	2016-04-18	2016-04-19	2016-04-20	2	6
183	22	4	2016-04-19	2016-04-20	2016-04-20	2	7
184	134	4	2016-04-19	2016-04-21	2016-04-22	2	7
185	24	3	2016-04-20	2016-04-20	\N	1	2
186	1127	4	2016-04-21	2016-04-22	2016-04-24	2	6
187	183	4	2016-04-22	2016-04-23	2016-04-24	2	6
188	390	4	2016-04-22	2016-04-23	2016-04-25	2	6
189	1288	4	2016-04-23	2016-04-24	2016-04-26	1	2
190	98	4	2016-04-23	2016-04-25	2016-04-25	2	6
191	919	4	2016-04-27	2016-04-28	2016-04-28	1	2
192	728	4	2016-04-27	2016-04-28	2016-04-29	2	7
193	1366	4	2016-04-28	2016-04-30	2016-04-30	1	3
194	558	4	2016-04-28	2016-04-30	2016-05-01	2	7
195	727	4	2016-04-28	2016-05-01	2016-05-01	2	7
196	1247	4	2016-04-28	2016-04-30	2016-05-01	2	6
197	127	4	2016-04-30	2016-05-03	2016-05-03	2	7
198	640	4	2016-05-01	2016-05-04	2016-05-03	2	6
199	760	4	2016-05-01	2016-05-04	2016-05-04	2	7
200	1074	4	2016-05-01	2016-05-03	2016-05-03	2	6
201	280	4	2016-05-01	2016-05-04	2016-05-02	3	9
202	600	4	2016-05-03	2016-05-05	2016-05-04	1	2
203	1102	4	2016-05-03	2016-05-05	2016-05-06	3	9
204	591	4	2016-05-04	2016-05-07	2016-05-06	2	7
205	635	4	2016-05-04	2016-05-05	2016-05-06	2	6
206	743	4	2016-05-04	2016-05-06	2016-05-05	3	9
207	105	4	2016-05-05	2016-05-07	2016-05-07	2	7
208	815	4	2016-05-06	2016-05-07	2016-05-09	2	7
209	514	4	2016-05-07	2016-05-08	2016-05-08	2	6
210	943	4	2016-05-07	2016-05-08	2016-05-09	2	6
211	1140	4	2016-05-07	2016-05-09	2016-05-08	2	6
212	1373	4	2016-05-08	2016-05-09	2016-05-11	2	6
213	788	4	2016-05-08	2016-05-09	2016-05-09	3	8
214	363	4	2016-05-10	2016-05-12	2016-05-11	2	6
215	1420	4	2016-05-10	2016-05-13	2016-05-12	2	7
216	267	4	2016-05-11	2016-05-14	2016-05-13	1	3
217	716	4	2016-05-11	2016-05-12	2016-05-14	2	7
218	1179	4	2016-05-12	2016-05-14	2016-05-14	2	7
219	1338	4	2016-05-12	2016-05-15	2016-05-15	2	6
220	1358	4	2016-05-12	2016-05-14	2016-05-15	2	6
221	1218	4	2016-05-13	2016-05-16	2016-05-14	1	2
222	51	4	2016-05-13	2016-05-16	2016-05-14	2	6
223	1368	4	2016-05-15	2016-05-16	2016-05-17	2	7
224	157	4	2016-05-17	2016-05-18	2016-05-19	1	3
225	307	4	2016-05-17	2016-05-20	2016-05-19	1	3
226	501	4	2016-05-17	2016-05-19	2016-05-20	1	2
227	489	4	2016-05-17	2016-05-18	2016-05-20	2	7
228	615	4	2016-05-17	2016-05-20	2016-05-20	2	7
229	742	4	2016-05-19	2016-05-21	2016-05-20	2	6
230	1167	4	2016-05-19	2016-05-20	2016-05-21	2	6
231	1257	4	2016-05-19	2016-05-22	2016-05-21	2	6
232	1360	4	2016-05-20	2016-05-23	2016-05-23	1	3
233	737	4	2016-05-21	2016-05-22	2016-05-24	2	6
234	1435	4	2016-05-22	2016-05-24	2016-05-24	2	6
235	649	4	2016-05-24	2016-05-25	2016-05-25	2	6
236	206	4	2016-05-25	2016-05-27	2016-05-26	2	6
237	1351	4	2016-05-25	2016-05-26	2016-05-27	2	7
238	1350	4	2016-05-26	2016-05-29	2016-05-29	2	6
239	13	3	2016-05-27	2016-05-27	\N	3	9
240	65	4	2016-05-27	2016-05-29	2016-05-30	2	6
241	1082	4	2016-05-27	2016-05-29	2016-05-29	2	7
242	1168	4	2016-05-27	2016-05-30	2016-05-30	2	7
243	802	4	2016-05-27	2016-05-30	2016-05-28	3	8
244	956	4	2016-05-28	2016-05-29	2016-05-29	2	6
245	223	4	2016-05-29	2016-05-31	2016-05-30	2	7
246	17	3	2016-05-30	2016-05-30	\N	2	6
247	928	4	2016-05-30	2016-06-01	2016-06-01	1	3
248	1376	4	2016-05-30	2016-06-01	2016-05-31	2	7
249	145	4	2016-06-01	2016-06-04	2016-06-04	2	6
250	150	4	2016-06-01	2016-06-02	2016-06-04	2	7
251	851	4	2016-06-01	2016-06-04	2016-06-04	2	7
252	66	4	2016-06-01	2016-06-04	2016-06-02	3	8
253	1267	4	2016-06-02	2016-06-05	2016-06-05	2	6
254	510	4	2016-06-03	2016-06-06	2016-06-05	2	7
255	801	4	2016-06-03	2016-06-06	2016-06-05	2	7
256	26	4	2016-06-04	2016-06-05	2016-06-07	2	7
257	1314	4	2016-06-05	2016-06-06	2016-06-08	1	3
258	107	4	2016-06-06	2016-06-07	2016-06-07	2	7
259	413	4	2016-06-06	2016-06-09	2016-06-09	2	7
260	632	4	2016-06-06	2016-06-08	2016-06-08	2	6
261	1045	4	2016-06-08	2016-06-10	2016-06-09	1	2
262	579	4	2016-06-08	2016-06-11	2016-06-10	3	9
263	1322	4	2016-06-09	2016-06-10	2016-06-12	2	6
264	5	3	2016-06-10	2016-06-10	\N	1	3
265	682	4	2016-06-10	2016-06-12	2016-06-11	2	7
266	933	4	2016-06-10	2016-06-13	2016-06-13	2	7
267	282	4	2016-06-11	2016-06-14	2016-06-14	1	3
268	540	4	2016-06-11	2016-06-14	2016-06-12	1	3
269	764	4	2016-06-12	2016-06-13	2016-06-15	2	6
270	879	4	2016-06-12	2016-06-15	2016-06-13	2	7
271	350	4	2016-06-13	2016-06-16	2016-06-14	2	7
272	497	4	2016-06-15	2016-06-18	2016-06-16	2	7
273	1340	4	2016-06-16	2016-06-19	2016-06-17	2	7
274	411	4	2016-06-17	2016-06-20	2016-06-18	2	7
275	1341	4	2016-06-17	2016-06-19	2016-06-18	2	7
276	1227	4	2016-06-18	2016-06-19	2016-06-19	2	6
277	546	4	2016-06-19	2016-06-20	2016-06-20	2	7
278	1301	4	2016-06-20	2016-06-23	2016-06-21	1	3
279	378	4	2016-06-21	2016-06-22	2016-06-22	2	6
280	638	4	2016-06-21	2016-06-22	2016-06-23	2	7
281	800	4	2016-06-21	2016-06-22	2016-06-23	2	7
282	159	4	2016-06-22	2016-06-25	2016-06-25	3	9
283	181	4	2016-06-23	2016-06-26	2016-06-26	1	2
284	1356	4	2016-06-23	2016-06-25	2016-06-25	2	7
285	319	4	2016-06-25	2016-06-26	2016-06-27	1	2
286	59	4	2016-06-25	2016-06-26	2016-06-26	2	6
287	133	4	2016-06-25	2016-06-26	2016-06-27	2	6
288	780	4	2016-06-25	2016-06-28	2016-06-28	2	6
289	849	4	2016-06-27	2016-06-28	2016-06-30	2	6
290	202	4	2016-06-28	2016-06-29	2016-06-30	2	6
291	158	4	2016-06-29	2016-06-30	2016-07-01	2	6
292	360	4	2016-06-29	2016-06-30	2016-07-02	3	9
293	573	4	2016-06-30	2016-07-03	2016-07-02	2	7
294	732	4	2016-07-01	2016-07-02	2016-07-02	2	7
295	1130	4	2016-07-01	2016-07-04	2016-07-04	2	7
296	1245	4	2016-07-04	2016-07-07	2016-07-06	2	6
297	1425	4	2016-07-04	2016-07-05	2016-07-06	2	7
298	885	4	2016-07-04	2016-07-07	2016-07-07	3	9
299	281	4	2016-07-05	2016-07-06	2016-07-07	2	6
300	1205	4	2016-07-05	2016-07-08	2016-07-08	2	6
301	17	4	2016-07-06	2016-07-09	2016-07-08	2	6
302	1375	4	2016-07-06	2016-07-07	2016-07-09	2	6
303	36	4	2016-07-07	2016-07-08	2016-07-09	2	7
304	230	4	2016-07-07	2016-07-08	2016-07-08	2	6
305	705	4	2016-07-07	2016-07-08	2016-07-08	2	7
306	424	4	2016-07-09	2016-07-10	2016-07-12	2	7
307	695	4	2016-07-09	2016-07-11	2016-07-11	2	6
308	156	4	2016-07-11	2016-07-12	2016-07-14	2	6
309	211	4	2016-07-11	2016-07-13	2016-07-13	2	6
310	627	4	2016-07-12	2016-07-13	2016-07-13	1	2
311	1400	4	2016-07-12	2016-07-14	2016-07-13	2	6
312	299	4	2016-07-13	2016-07-15	2016-07-16	2	6
313	565	4	2016-07-14	2016-07-15	2016-07-15	3	9
314	1019	4	2016-07-15	2016-07-17	2016-07-17	2	7
315	1263	4	2016-07-16	2016-07-19	2016-07-17	2	6
316	670	4	2016-07-17	2016-07-20	2016-07-19	2	7
317	795	4	2016-07-17	2016-07-20	2016-07-19	2	7
318	1141	4	2016-07-17	2016-07-19	2016-07-20	2	7
319	941	4	2016-07-18	2016-07-21	2016-07-21	2	6
320	1428	4	2016-07-19	2016-07-20	2016-07-21	1	2
321	568	4	2016-07-19	2016-07-22	2016-07-21	2	6
322	924	4	2016-07-19	2016-07-22	2016-07-20	2	6
323	1243	4	2016-07-19	2016-07-22	2016-07-21	2	6
324	480	4	2016-07-20	2016-07-22	2016-07-23	2	6
325	848	4	2016-07-20	2016-07-21	2016-07-21	2	6
326	1337	4	2016-07-20	2016-07-21	2016-07-22	3	9
327	83	4	2016-07-21	2016-07-24	2016-07-22	2	6
328	528	4	2016-07-23	2016-07-26	2016-07-25	2	6
329	274	4	2016-07-24	2016-07-27	2016-07-26	2	6
330	622	4	2016-07-24	2016-07-27	2016-07-27	2	6
331	642	4	2016-07-24	2016-07-26	2016-07-25	2	6
332	659	4	2016-07-24	2016-07-26	2016-07-26	2	7
333	779	4	2016-07-25	2016-07-27	2016-07-26	2	6
334	1112	4	2016-07-25	2016-07-28	2016-07-27	2	7
335	1193	4	2016-07-25	2016-07-27	2016-07-26	2	6
336	1030	4	2016-07-26	2016-07-29	2016-07-27	2	7
337	1252	4	2016-07-26	2016-07-27	2016-07-28	2	7
338	1333	4	2016-07-28	2016-07-29	2016-07-30	1	3
339	1110	4	2016-07-28	2016-07-31	2016-07-29	2	7
340	963	4	2016-07-29	2016-07-30	2016-07-31	2	7
341	1357	4	2016-07-31	2016-08-03	2016-08-01	1	3
342	806	4	2016-07-31	2016-08-01	2016-08-03	2	7
343	961	4	2016-07-31	2016-08-02	2016-08-01	2	7
344	750	4	2016-08-01	2016-08-03	2016-08-02	2	6
345	1299	4	2016-08-01	2016-08-04	2016-08-03	2	6
346	584	4	2016-08-01	2016-08-03	2016-08-02	3	9
347	1004	4	2016-08-02	2016-08-03	2016-08-05	2	6
348	907	4	2016-08-02	2016-08-05	2016-08-04	3	9
349	30	3	2016-08-03	2016-08-03	\N	1	3
350	31	3	2016-08-03	2016-08-03	\N	1	3
351	1307	4	2016-08-03	2016-08-06	2016-08-04	1	2
352	16	4	2016-08-03	2016-08-04	2016-08-06	2	7
353	1387	4	2016-08-03	2016-08-06	2016-08-06	2	7
354	551	4	2016-08-03	2016-08-05	2016-08-06	3	8
355	1011	4	2016-08-03	2016-08-05	2016-08-05	3	8
356	1189	4	2016-08-04	2016-08-07	2016-08-06	2	6
357	14	3	2016-08-05	2016-08-05	\N	3	8
358	1042	4	2016-08-05	2016-08-07	2016-08-07	2	7
359	441	4	2016-08-07	2016-08-10	2016-08-10	2	7
360	1300	4	2016-08-07	2016-08-09	2016-08-10	2	6
361	994	4	2016-08-08	2016-08-09	2016-08-11	2	6
362	187	4	2016-08-09	2016-08-11	2016-08-11	1	2
363	834	4	2016-08-11	2016-08-12	2016-08-13	3	8
364	373	4	2016-08-12	2016-08-14	2016-08-13	2	6
365	981	4	2016-08-13	2016-08-14	2016-08-15	2	6
366	1054	4	2016-08-13	2016-08-14	2016-08-14	3	9
367	527	4	2016-08-14	2016-08-15	2016-08-15	2	7
368	995	4	2016-08-14	2016-08-15	2016-08-17	2	7
369	1285	4	2016-08-15	2016-08-18	2016-08-18	1	3
370	758	4	2016-08-15	2016-08-18	2016-08-18	2	7
371	891	4	2016-08-15	2016-08-16	2016-08-18	2	7
372	132	4	2016-08-16	2016-08-18	2016-08-18	2	6
373	337	4	2016-08-16	2016-08-19	2016-08-17	2	7
374	1313	4	2016-08-17	2016-08-19	2016-08-18	1	2
375	536	4	2016-08-17	2016-08-20	2016-08-20	2	7
376	825	4	2016-08-17	2016-08-19	2016-08-18	2	6
377	1355	4	2016-08-17	2016-08-19	2016-08-20	2	6
378	475	4	2016-08-17	2016-08-20	2016-08-20	3	9
379	954	4	2016-08-18	2016-08-21	2016-08-21	2	7
380	1156	4	2016-08-19	2016-08-20	2016-08-21	2	7
381	1297	4	2016-08-19	2016-08-21	2016-08-21	2	7
382	199	4	2016-08-20	2016-08-23	2016-08-23	2	6
383	331	4	2016-08-20	2016-08-23	2016-08-22	2	7
384	410	4	2016-08-20	2016-08-22	2016-08-23	2	7
385	1274	4	2016-08-20	2016-08-23	2016-08-22	2	7
386	1362	4	2016-08-20	2016-08-23	2016-08-23	2	6
387	451	4	2016-08-20	2016-08-21	2016-08-21	3	8
388	1080	4	2016-08-21	2016-08-24	2016-08-23	3	8
389	53	4	2016-08-22	2016-08-24	2016-08-25	1	3
390	576	4	2016-08-22	2016-08-24	2016-08-25	3	9
391	61	3	2016-08-23	2016-08-23	\N	3	9
392	176	4	2016-08-23	2016-08-26	2016-08-24	1	3
393	368	4	2016-08-25	2016-08-26	2016-08-27	2	6
394	522	4	2016-08-26	2016-08-28	2016-08-29	1	3
395	144	4	2016-08-26	2016-08-27	2016-08-29	2	6
396	542	4	2016-08-27	2016-08-30	2016-08-29	2	6
397	1437	4	2016-08-28	2016-08-31	2016-08-29	2	7
398	447	4	2016-08-29	2016-08-30	2016-09-01	1	2
399	1001	4	2016-08-29	2016-09-01	2016-09-01	2	7
400	1295	4	2016-08-29	2016-08-30	2016-08-31	2	6
401	103	4	2016-08-30	2016-09-02	2016-09-01	2	6
402	1335	4	2016-08-30	2016-09-01	2016-08-31	2	6
403	578	4	2016-08-31	2016-09-01	2016-09-02	1	3
404	396	4	2016-08-31	2016-09-03	2016-09-01	2	7
405	603	4	2016-08-31	2016-09-01	2016-09-01	2	6
406	1380	4	2016-08-31	2016-09-02	2016-09-01	2	7
407	77	3	2016-09-01	2016-09-01	\N	3	8
408	1071	4	2016-09-01	2016-09-02	2016-09-02	1	2
409	416	4	2016-09-01	2016-09-04	2016-09-04	2	7
410	1151	4	2016-09-01	2016-09-03	2016-09-02	2	6
411	261	4	2016-09-02	2016-09-04	2016-09-04	1	3
412	1202	4	2016-09-02	2016-09-04	2016-09-04	1	3
413	717	4	2016-09-02	2016-09-05	2016-09-03	2	6
414	917	4	2016-09-03	2016-09-06	2016-09-06	2	7
415	1265	4	2016-09-03	2016-09-06	2016-09-06	2	7
416	1377	4	2016-09-03	2016-09-04	2016-09-06	2	7
417	359	4	2016-09-04	2016-09-05	2016-09-06	1	3
418	88	4	2016-09-04	2016-09-05	2016-09-05	2	6
419	14	4	2016-09-04	2016-09-07	2016-09-06	3	8
420	72	4	2016-09-05	2016-09-06	2016-09-07	1	3
421	240	4	2016-09-05	2016-09-06	2016-09-08	1	3
422	398	4	2016-09-06	2016-09-07	2016-09-09	2	6
423	1397	4	2016-09-06	2016-09-09	2016-09-09	2	7
424	67	4	2016-09-08	2016-09-11	2016-09-11	1	3
425	843	4	2016-09-08	2016-09-11	2016-09-11	2	6
426	944	4	2016-09-08	2016-09-10	2016-09-10	2	6
427	434	4	2016-09-09	2016-09-10	2016-09-11	1	2
428	1039	4	2016-09-09	2016-09-12	2016-09-10	2	6
429	153	4	2016-09-10	2016-09-12	2016-09-12	3	8
430	272	4	2016-09-11	2016-09-13	2016-09-12	2	6
431	1217	4	2016-09-11	2016-09-12	2016-09-12	2	6
432	169	4	2016-09-12	2016-09-15	2016-09-14	1	2
433	1062	4	2016-09-12	2016-09-15	2016-09-13	2	6
434	726	4	2016-09-13	2016-09-15	2016-09-14	2	6
435	77	4	2016-09-14	2016-09-15	2016-09-16	3	9
436	791	4	2016-09-16	2016-09-19	2016-09-19	2	7
437	1085	4	2016-09-16	2016-09-18	2016-09-18	2	7
438	314	4	2016-09-16	2016-09-19	2016-09-18	3	8
439	149	4	2016-09-17	2016-09-20	2016-09-18	2	6
440	882	4	2016-09-17	2016-09-18	2016-09-19	2	7
441	704	4	2016-09-18	2016-09-19	2016-09-19	1	2
442	667	4	2016-09-18	2016-09-21	2016-09-21	2	7
443	1371	4	2016-09-18	2016-09-19	2016-09-20	2	6
444	30	4	2016-09-19	2016-09-20	2016-09-21	1	2
445	362	4	2016-09-19	2016-09-22	2016-09-22	2	6
446	399	4	2016-09-19	2016-09-21	2016-09-20	2	7
447	808	4	2016-09-20	2016-09-23	2016-09-22	3	8
448	101	4	2016-09-21	2016-09-22	2016-09-24	2	6
449	492	4	2016-09-21	2016-09-24	2016-09-22	2	7
450	575	4	2016-09-21	2016-09-24	2016-09-23	2	7
451	1146	4	2016-09-21	2016-09-23	2016-09-22	2	7
452	997	4	2016-09-22	2016-09-23	2016-09-24	2	7
453	1028	4	2016-09-22	2016-09-24	2016-09-25	2	7
454	988	4	2016-09-23	2016-09-25	2016-09-26	2	6
455	1055	4	2016-09-23	2016-09-24	2016-09-24	2	7
456	1061	4	2016-09-23	2016-09-26	2016-09-25	3	9
457	1349	4	2016-09-24	2016-09-27	2016-09-27	1	3
458	197	4	2016-09-25	2016-09-28	2016-09-26	2	6
459	874	4	2016-09-25	2016-09-28	2016-09-26	2	6
460	691	4	2016-09-25	2016-09-27	2016-09-26	3	8
461	853	4	2016-09-26	2016-09-27	2016-09-27	2	7
462	852	4	2016-09-27	2016-09-28	2016-09-29	2	6
463	964	4	2016-09-27	2016-09-28	2016-09-28	3	8
464	74	4	2016-09-28	2016-09-30	2016-09-29	2	7
465	1198	4	2016-09-28	2016-10-01	2016-10-01	2	6
466	1440	4	2016-09-28	2016-09-29	2016-10-01	2	7
467	555	4	2016-09-28	2016-09-30	2016-09-30	3	8
468	1261	4	2016-09-29	2016-10-02	2016-09-30	1	3
469	1089	4	2016-09-29	2016-10-02	2016-10-02	2	7
470	641	4	2016-09-30	2016-10-02	2016-10-02	1	3
471	697	4	2016-09-30	2016-10-02	2016-10-01	1	3
472	468	4	2016-09-30	2016-10-01	2016-10-01	2	7
473	549	4	2016-09-30	2016-10-02	2016-10-03	2	7
474	553	4	2016-10-01	2016-10-04	2016-10-04	1	3
475	241	4	2016-10-01	2016-10-04	2016-10-03	2	7
476	559	4	2016-10-01	2016-10-04	2016-10-02	2	6
477	449	4	2016-10-02	2016-10-05	2016-10-04	1	2
478	304	4	2016-10-02	2016-10-05	2016-10-03	2	7
479	984	4	2016-10-03	2016-10-04	2016-10-04	2	6
480	686	4	2016-10-04	2016-10-07	2016-10-05	1	3
481	481	4	2016-10-04	2016-10-07	2016-10-06	3	9
482	513	4	2016-10-05	2016-10-06	2016-10-06	2	6
483	703	4	2016-10-06	2016-10-07	2016-10-09	1	2
484	421	4	2016-10-06	2016-10-09	2016-10-07	2	7
485	465	4	2016-10-06	2016-10-08	2016-10-07	2	7
486	709	4	2016-10-06	2016-10-08	2016-10-09	2	7
487	827	4	2016-10-06	2016-10-09	2016-10-09	2	6
488	921	4	2016-10-06	2016-10-09	2016-10-08	2	6
489	899	4	2016-10-06	2016-10-08	2016-10-08	3	8
490	876	4	2016-10-07	2016-10-10	2016-10-09	2	6
491	1048	4	2016-10-08	2016-10-10	2016-10-11	1	2
492	191	4	2016-10-09	2016-10-10	2016-10-12	1	2
493	796	4	2016-10-09	2016-10-12	2016-10-11	1	3
494	875	4	2016-10-09	2016-10-10	2016-10-11	2	6
495	712	4	2016-10-10	2016-10-12	2016-10-13	1	3
496	193	4	2016-10-10	2016-10-12	2016-10-11	2	6
497	785	4	2016-10-10	2016-10-11	2016-10-11	2	6
498	1331	4	2016-10-10	2016-10-12	2016-10-11	2	6
499	260	4	2016-10-11	2016-10-14	2016-10-13	1	2
500	148	4	2016-10-11	2016-10-12	2016-10-13	2	6
501	977	4	2016-10-11	2016-10-12	2016-10-13	2	7
502	401	4	2016-10-12	2016-10-13	2016-10-13	3	9
503	932	4	2016-10-13	2016-10-16	2016-10-14	2	6
504	1381	4	2016-10-14	2016-10-15	2016-10-15	1	2
505	721	4	2016-10-14	2016-10-16	2016-10-17	2	6
506	831	4	2016-10-14	2016-10-16	2016-10-16	2	6
507	1378	4	2016-10-15	2016-10-17	2016-10-17	1	3
508	1359	4	2016-10-15	2016-10-18	2016-10-18	2	6
509	235	4	2016-10-16	2016-10-17	2016-10-17	2	7
510	586	4	2016-10-17	2016-10-18	2016-10-18	2	7
511	377	4	2016-10-18	2016-10-20	2016-10-19	2	7
512	8	4	2016-10-19	2016-10-22	2016-10-20	2	7
513	155	4	2016-10-19	2016-10-21	2016-10-21	2	6
514	927	4	2016-10-19	2016-10-21	2016-10-20	2	7
515	986	4	2016-10-19	2016-10-20	2016-10-22	2	6
516	111	4	2016-10-21	2016-10-23	2016-10-24	2	6
517	613	4	2016-10-21	2016-10-22	2016-10-24	2	6
518	1374	4	2016-10-22	2016-10-24	2016-10-25	1	2
519	54	4	2016-10-22	2016-10-23	2016-10-24	2	7
520	639	4	2016-10-23	2016-10-26	2016-10-24	2	7
521	664	4	2016-10-23	2016-10-25	2016-10-25	2	6
522	724	4	2016-10-23	2016-10-24	2016-10-24	2	7
523	1056	4	2016-10-24	2016-10-26	2016-10-27	2	6
524	569	4	2016-10-25	2016-10-26	2016-10-27	1	2
525	1315	4	2016-10-26	2016-10-28	2016-10-29	1	3
526	1096	4	2016-10-26	2016-10-28	2016-10-28	2	6
527	506	4	2016-10-27	2016-10-29	2016-10-28	1	2
528	676	4	2016-10-28	2016-10-31	2016-10-31	2	7
529	753	4	2016-10-28	2016-10-30	2016-10-31	2	7
530	773	4	2016-10-28	2016-10-31	2016-10-31	2	6
531	116	4	2016-10-28	2016-10-29	2016-10-30	3	8
532	817	4	2016-10-29	2016-10-31	2016-10-30	2	7
533	1334	4	2016-10-29	2016-11-01	2016-11-01	2	6
534	1406	4	2016-10-29	2016-10-30	2016-10-31	2	7
535	835	4	2016-10-29	2016-10-31	2016-11-01	3	9
536	759	4	2016-10-31	2016-11-02	2016-11-01	1	3
537	1353	4	2016-10-31	2016-11-01	2016-11-03	1	2
538	341	4	2016-11-02	2016-11-05	2016-11-05	2	6
539	1144	4	2016-11-02	2016-11-04	2016-11-03	2	7
540	1429	4	2016-11-03	2016-11-05	2016-11-06	1	3
541	1228	4	2016-11-04	2016-11-07	2016-11-07	1	3
542	313	4	2016-11-04	2016-11-06	2016-11-05	2	7
543	62	4	2016-11-06	2016-11-09	2016-11-08	2	6
544	321	4	2016-11-06	2016-11-07	2016-11-08	2	7
545	1108	4	2016-11-08	2016-11-10	2016-11-09	3	9
546	470	4	2016-11-09	2016-11-12	2016-11-10	2	7
547	20	4	2016-11-09	2016-11-11	2016-11-10	3	8
548	739	4	2016-11-11	2016-11-13	2016-11-13	2	7
549	64	3	2016-11-12	2016-11-12	\N	3	9
550	892	4	2016-11-12	2016-11-14	2016-11-15	2	7
551	1169	4	2016-11-12	2016-11-13	2016-11-13	2	6
552	1282	4	2016-11-12	2016-11-15	2016-11-13	2	7
553	913	4	2016-11-12	2016-11-13	2016-11-15	3	9
554	104	4	2016-11-13	2016-11-14	2016-11-16	1	3
555	212	4	2016-11-13	2016-11-14	2016-11-16	2	7
556	61	4	2016-11-13	2016-11-14	2016-11-15	3	9
557	1248	4	2016-11-14	2016-11-17	2016-11-15	2	6
558	1443	4	2016-11-15	2016-11-16	2016-11-17	2	7
559	959	4	2016-11-16	2016-11-17	2016-11-17	1	2
560	1405	4	2016-11-18	2016-11-19	2016-11-21	2	6
561	90	4	2016-11-19	2016-11-22	2016-11-22	2	6
562	942	4	2016-11-19	2016-11-20	2016-11-22	2	7
563	365	4	2016-11-20	2016-11-22	2016-11-21	2	6
564	1058	4	2016-11-20	2016-11-23	2016-11-22	2	7
565	894	4	2016-11-21	2016-11-22	2016-11-22	2	7
566	298	4	2016-11-22	2016-11-25	2016-11-23	1	3
567	1430	4	2016-11-22	2016-11-23	2016-11-23	1	2
568	1275	4	2016-11-23	2016-11-25	2016-11-24	1	3
569	707	4	2016-11-23	2016-11-24	2016-11-25	2	6
570	989	4	2016-11-23	2016-11-24	2016-11-25	2	6
571	5	4	2016-11-24	2016-11-25	2016-11-27	1	2
572	178	4	2016-11-24	2016-11-26	2016-11-26	2	6
573	423	4	2016-11-24	2016-11-26	2016-11-27	2	6
574	833	4	2016-11-26	2016-11-27	2016-11-29	2	7
575	33	4	2016-11-27	2016-11-28	2016-11-30	1	3
576	1272	4	2016-11-27	2016-11-30	2016-11-28	1	3
577	445	4	2016-11-27	2016-11-30	2016-11-29	2	6
578	819	4	2016-11-27	2016-11-28	2016-11-29	2	7
579	160	4	2016-11-27	2016-11-30	2016-11-29	3	8
580	581	4	2016-11-30	2016-12-02	2016-12-02	1	3
581	688	4	2016-12-03	2016-12-05	2016-12-06	1	3
582	32	3	2016-12-04	2016-12-04	\N	1	2
583	792	4	2016-12-04	2016-12-05	2016-12-07	2	7
584	1209	4	2016-12-04	2016-12-05	2016-12-05	2	7
585	1219	4	2016-12-04	2016-12-05	2016-12-05	2	7
586	1306	4	2016-12-04	2016-12-06	2016-12-05	2	6
587	487	4	2016-12-06	2016-12-08	2016-12-08	1	2
588	102	4	2016-12-06	2016-12-07	2016-12-07	2	7
589	719	4	2016-12-06	2016-12-07	2016-12-07	2	7
590	990	4	2016-12-06	2016-12-09	2016-12-07	2	7
591	1211	4	2016-12-06	2016-12-09	2016-12-09	2	7
592	1232	4	2016-12-06	2016-12-08	2016-12-08	2	7
593	50	4	2016-12-07	2016-12-10	2016-12-08	3	8
594	1318	4	2016-12-07	2016-12-08	2016-12-08	3	8
595	538	4	2016-12-08	2016-12-09	2016-12-11	1	2
596	952	4	2016-12-08	2016-12-09	2016-12-09	1	3
597	1121	4	2016-12-08	2016-12-09	2016-12-10	2	6
598	40	3	2016-12-09	2016-12-09	\N	1	3
599	1	4	2016-12-09	2016-12-10	2016-12-12	2	6
600	624	4	2016-12-09	2016-12-12	2016-12-11	2	7
601	683	4	2016-12-09	2016-12-10	2016-12-10	2	6
602	823	4	2016-12-09	2016-12-10	2016-12-11	2	6
603	1032	4	2016-12-09	2016-12-10	2016-12-10	2	7
604	96	4	2016-12-10	2016-12-13	2016-12-12	2	7
605	1208	4	2016-12-10	2016-12-11	2016-12-12	2	6
606	18	4	2016-12-11	2016-12-12	2016-12-13	2	7
607	309	4	2016-12-11	2016-12-14	2016-12-13	2	6
608	1103	4	2016-12-12	2016-12-15	2016-12-14	1	3
609	896	4	2016-12-12	2016-12-13	2016-12-14	2	7
610	711	4	2016-12-13	2016-12-15	2016-12-14	2	6
611	1073	4	2016-12-15	2016-12-17	2016-12-18	2	7
612	634	4	2016-12-16	2016-12-17	2016-12-17	2	7
613	1159	4	2016-12-17	2016-12-19	2016-12-19	2	7
614	654	4	2016-12-18	2016-12-21	2016-12-21	1	2
615	560	4	2016-12-19	2016-12-22	2016-12-21	3	9
616	1444	4	2016-12-20	2016-12-23	2016-12-23	2	6
617	118	4	2016-12-21	2016-12-23	2016-12-23	2	7
618	131	4	2016-12-21	2016-12-22	2016-12-22	2	6
619	454	4	2016-12-22	2016-12-25	2016-12-25	2	7
620	466	4	2016-12-22	2016-12-24	2016-12-24	2	6
621	1157	4	2016-12-23	2016-12-25	2016-12-24	2	6
622	1398	4	2016-12-23	2016-12-26	2016-12-25	2	7
623	678	4	2016-12-24	2016-12-26	2016-12-27	2	6
624	814	4	2016-12-24	2016-12-25	2016-12-27	2	6
625	1163	4	2016-12-25	2016-12-28	2016-12-26	1	2
626	130	4	2016-12-25	2016-12-28	2016-12-27	2	7
627	1119	4	2016-12-25	2016-12-26	2016-12-28	2	6
628	561	4	2016-12-26	2016-12-29	2016-12-27	1	3
629	973	4	2016-12-26	2016-12-27	2016-12-29	1	2
630	1404	4	2016-12-26	2016-12-27	2016-12-28	2	6
631	855	4	2016-12-27	2016-12-29	2016-12-29	1	3
632	163	4	2016-12-27	2016-12-29	2016-12-29	2	7
633	1040	4	2016-12-28	2016-12-31	2016-12-30	3	8
634	27	4	2016-12-29	2017-01-01	2016-12-30	2	6
635	520	4	2016-12-30	2017-01-02	2016-12-31	2	6
636	532	4	2017-01-03	2017-01-04	2017-01-05	1	2
637	512	4	2017-01-03	2017-01-05	2017-01-05	2	6
638	1302	4	2017-01-04	2017-01-05	2017-01-06	2	7
639	550	4	2017-01-06	2017-01-07	2017-01-07	2	6
640	1093	4	2017-01-06	2017-01-08	2017-01-07	2	6
641	673	4	2017-01-07	2017-01-10	2017-01-08	1	3
642	847	4	2017-01-07	2017-01-09	2017-01-10	2	7
643	901	4	2017-01-08	2017-01-09	2017-01-11	1	3
644	439	4	2017-01-08	2017-01-11	2017-01-10	2	6
645	1199	4	2017-01-08	2017-01-11	2017-01-10	2	6
646	975	4	2017-01-09	2017-01-12	2017-01-11	1	2
647	283	4	2017-01-09	2017-01-10	2017-01-11	2	7
648	684	4	2017-01-09	2017-01-11	2017-01-11	2	6
649	1153	4	2017-01-10	2017-01-11	2017-01-13	1	3
650	729	4	2017-01-11	2017-01-14	2017-01-12	1	2
651	190	4	2017-01-11	2017-01-13	2017-01-13	2	7
652	985	4	2017-01-12	2017-01-15	2017-01-13	3	9
653	1249	4	2017-01-14	2017-01-17	2017-01-15	1	2
654	1129	4	2017-01-14	2017-01-15	2017-01-17	2	7
655	347	4	2017-01-16	2017-01-17	2017-01-18	1	3
656	949	4	2017-01-16	2017-01-17	2017-01-18	2	7
657	349	4	2017-01-17	2017-01-19	2017-01-20	1	2
658	1051	4	2017-01-17	2017-01-18	2017-01-18	2	7
659	1391	4	2017-01-17	2017-01-19	2017-01-18	2	7
660	383	4	2017-01-18	2017-01-19	2017-01-19	2	7
661	626	4	2017-01-18	2017-01-19	2017-01-20	2	6
662	1125	4	2017-01-19	2017-01-20	2017-01-20	1	3
663	344	4	2017-01-20	2017-01-22	2017-01-23	1	3
664	681	4	2017-01-20	2017-01-23	2017-01-22	2	7
665	29	4	2017-01-21	2017-01-22	2017-01-23	2	6
666	770	4	2017-01-21	2017-01-22	2017-01-24	2	7
667	858	4	2017-01-22	2017-01-24	2017-01-25	2	7
668	297	4	2017-01-22	2017-01-23	2017-01-24	3	8
669	745	4	2017-01-23	2017-01-24	2017-01-26	2	7
670	361	4	2017-01-24	2017-01-25	2017-01-25	2	6
671	922	4	2017-01-25	2017-01-28	2017-01-26	2	7
672	908	4	2017-01-26	2017-01-29	2017-01-29	2	6
673	64	4	2017-01-26	2017-01-28	2017-01-27	3	9
674	733	4	2017-01-27	2017-01-28	2017-01-29	2	6
675	291	4	2017-01-28	2017-01-31	2017-01-30	2	7
676	790	4	2017-01-28	2017-01-30	2017-01-31	2	7
677	809	4	2017-01-28	2017-01-31	2017-01-30	2	7
678	250	4	2017-01-28	2017-01-29	2017-01-31	3	9
679	81	4	2017-01-29	2017-01-30	2017-01-30	1	3
680	245	4	2017-01-29	2017-02-01	2017-01-30	1	3
681	499	4	2017-01-29	2017-02-01	2017-01-31	2	7
682	614	4	2017-01-29	2017-01-30	2017-01-30	2	6
683	741	4	2017-01-29	2017-01-31	2017-02-01	2	6
684	762	4	2017-01-31	2017-02-01	2017-02-02	2	6
685	976	4	2017-01-31	2017-02-03	2017-02-02	2	7
686	380	4	2017-02-01	2017-02-03	2017-02-04	2	7
687	530	4	2017-02-02	2017-02-05	2017-02-04	1	3
688	343	4	2017-02-02	2017-02-03	2017-02-05	2	7
689	884	4	2017-02-02	2017-02-03	2017-02-05	2	7
690	1097	4	2017-02-03	2017-02-04	2017-02-06	1	2
691	1081	4	2017-02-04	2017-02-06	2017-02-06	2	7
692	2	3	2017-02-05	2017-02-05	\N	1	3
693	1233	4	2017-02-05	2017-02-07	2017-02-06	1	3
694	58	4	2017-02-05	2017-02-06	2017-02-08	2	7
695	606	4	2017-02-05	2017-02-08	2017-02-07	2	7
696	1242	4	2017-02-05	2017-02-08	2017-02-08	2	7
697	562	4	2017-02-06	2017-02-08	2017-02-09	1	2
698	543	4	2017-02-06	2017-02-08	2017-02-09	3	8
699	958	4	2017-02-06	2017-02-08	2017-02-09	3	9
700	4	4	2017-02-07	2017-02-10	2017-02-08	2	6
701	850	4	2017-02-07	2017-02-08	2017-02-09	3	9
702	1352	4	2017-02-08	2017-02-09	2017-02-11	1	3
703	417	4	2017-02-08	2017-02-09	2017-02-09	2	7
704	1137	4	2017-02-08	2017-02-09	2017-02-11	2	6
705	1196	4	2017-02-08	2017-02-11	2017-02-11	2	7
706	1271	4	2017-02-09	2017-02-12	2017-02-10	1	2
707	79	4	2017-02-09	2017-02-11	2017-02-11	2	7
708	660	4	2017-02-10	2017-02-12	2017-02-11	1	2
709	1162	4	2017-02-11	2017-02-13	2017-02-12	2	6
710	295	4	2017-02-13	2017-02-15	2017-02-16	2	6
711	1246	4	2017-02-13	2017-02-16	2017-02-14	2	6
712	173	4	2017-02-13	2017-02-14	2017-02-16	3	9
713	207	4	2017-02-13	2017-02-14	2017-02-15	3	8
714	805	4	2017-02-14	2017-02-17	2017-02-15	2	7
715	12	3	2017-02-15	2017-02-15	\N	2	6
716	672	4	2017-02-15	2017-02-17	2017-02-18	2	6
717	1312	4	2017-02-15	2017-02-18	2017-02-17	2	6
718	38	4	2017-02-16	2017-02-17	2017-02-17	2	7
719	200	4	2017-02-16	2017-02-19	2017-02-18	2	6
720	382	4	2017-02-16	2017-02-19	2017-02-19	2	6
721	625	4	2017-02-16	2017-02-19	2017-02-17	2	7
722	1399	4	2017-02-18	2017-02-20	2017-02-21	2	7
723	845	4	2017-02-19	2017-02-21	2017-02-22	2	6
724	864	4	2017-02-19	2017-02-22	2017-02-21	2	6
725	870	4	2017-02-19	2017-02-22	2017-02-22	2	7
726	969	4	2017-02-19	2017-02-22	2017-02-20	2	6
727	962	4	2017-02-19	2017-02-22	2017-02-21	3	9
728	1138	4	2017-02-20	2017-02-21	2017-02-23	1	3
729	897	4	2017-02-20	2017-02-22	2017-02-21	2	7
730	500	4	2017-02-21	2017-02-24	2017-02-22	2	6
731	910	4	2017-02-25	2017-02-27	2017-02-27	3	9
732	147	4	2017-02-26	2017-02-27	2017-03-01	2	7
733	832	4	2017-02-26	2017-03-01	2017-02-27	2	7
734	939	4	2017-02-26	2017-02-28	2017-03-01	3	9
735	20	3	2017-02-27	2017-02-27	\N	3	9
736	184	4	2017-02-27	2017-02-28	2017-02-28	2	7
737	694	4	2017-02-27	2017-03-01	2017-02-28	2	6
738	124	4	2017-02-28	2017-03-01	2017-03-03	1	2
739	49	4	2017-02-28	2017-03-01	2017-03-02	2	6
740	1113	4	2017-02-28	2017-03-01	2017-03-02	2	6
741	119	4	2017-02-28	2017-03-01	2017-03-01	3	8
742	433	4	2017-02-28	2017-03-01	2017-03-01	3	9
743	137	4	2017-03-01	2017-03-04	2017-03-04	2	6
744	166	4	2017-03-01	2017-03-02	2017-03-02	2	7
745	698	4	2017-03-01	2017-03-03	2017-03-03	2	7
746	391	4	2017-03-02	2017-03-04	2017-03-05	1	3
747	87	4	2017-03-03	2017-03-04	2017-03-05	1	3
748	1072	4	2017-03-03	2017-03-05	2017-03-04	3	8
749	255	4	2017-03-04	2017-03-07	2017-03-05	2	7
750	232	4	2017-03-04	2017-03-07	2017-03-05	3	8
751	731	4	2017-03-05	2017-03-08	2017-03-07	1	3
752	335	4	2017-03-05	2017-03-06	2017-03-07	2	6
753	1201	4	2017-03-05	2017-03-08	2017-03-08	2	7
754	646	4	2017-03-06	2017-03-07	2017-03-08	1	2
755	531	4	2017-03-06	2017-03-07	2017-03-07	2	6
756	1143	4	2017-03-06	2017-03-07	2017-03-09	2	6
757	1336	4	2017-03-06	2017-03-08	2017-03-09	2	7
758	953	4	2017-03-06	2017-03-08	2017-03-07	3	9
759	284	4	2017-03-07	2017-03-09	2017-03-08	2	7
760	1104	4	2017-03-07	2017-03-10	2017-03-10	2	6
761	1291	4	2017-03-07	2017-03-08	2017-03-10	2	7
762	572	4	2017-03-08	2017-03-09	2017-03-09	2	6
763	842	4	2017-03-08	2017-03-10	2017-03-09	3	9
764	701	4	2017-03-09	2017-03-10	2017-03-12	1	2
765	1152	4	2017-03-09	2017-03-11	2017-03-12	1	2
766	141	4	2017-03-09	2017-03-11	2017-03-12	2	6
767	564	4	2017-03-09	2017-03-10	2017-03-11	2	7
768	841	4	2017-03-09	2017-03-12	2017-03-10	2	7
769	946	4	2017-03-09	2017-03-11	2017-03-11	2	6
770	135	4	2017-03-09	2017-03-11	2017-03-11	3	9
771	671	4	2017-03-11	2017-03-14	2017-03-12	1	3
772	448	4	2017-03-11	2017-03-12	2017-03-13	2	7
773	1385	4	2017-03-11	2017-03-12	2017-03-12	2	6
774	690	4	2017-03-12	2017-03-14	2017-03-14	2	6
775	968	4	2017-03-12	2017-03-13	2017-03-13	2	6
776	490	4	2017-03-13	2017-03-15	2017-03-16	2	6
777	496	4	2017-03-13	2017-03-16	2017-03-16	2	6
778	56	3	2017-03-15	2017-03-15	\N	3	9
779	367	4	2017-03-15	2017-03-16	2017-03-18	2	6
780	592	4	2017-03-15	2017-03-17	2017-03-17	2	6
781	1018	4	2017-03-15	2017-03-16	2017-03-17	2	6
782	1298	4	2017-03-15	2017-03-16	2017-03-18	2	7
783	1343	4	2017-03-16	2017-03-19	2017-03-17	1	2
784	430	4	2017-03-16	2017-03-19	2017-03-19	2	7
785	794	4	2017-03-18	2017-03-19	2017-03-20	1	2
786	249	4	2017-03-18	2017-03-20	2017-03-19	2	6
787	700	4	2017-03-18	2017-03-20	2017-03-19	3	9
788	1363	4	2017-03-18	2017-03-20	2017-03-20	3	9
789	772	4	2017-03-19	2017-03-20	2017-03-20	2	6
790	1015	4	2017-03-19	2017-03-21	2017-03-22	2	7
791	432	4	2017-03-20	2017-03-22	2017-03-23	2	6
792	479	4	2017-03-22	2017-03-23	2017-03-24	2	6
793	653	4	2017-03-23	2017-03-24	2017-03-24	2	6
794	863	4	2017-03-23	2017-03-25	2017-03-24	2	7
795	992	4	2017-03-23	2017-03-25	2017-03-26	2	7
796	154	4	2017-03-23	2017-03-26	2017-03-25	3	9
797	374	4	2017-03-24	2017-03-26	2017-03-26	2	7
798	619	4	2017-03-26	2017-03-28	2017-03-29	1	3
799	607	4	2017-03-27	2017-03-28	2017-03-29	1	3
800	1057	4	2017-03-27	2017-03-29	2017-03-28	2	6
801	78	4	2017-03-28	2017-03-29	2017-03-30	1	2
802	340	4	2017-03-28	2017-03-29	2017-03-30	2	6
803	1105	4	2017-03-28	2017-03-31	2017-03-30	3	8
804	95	4	2017-03-29	2017-03-31	2017-03-30	2	6
805	420	4	2017-03-29	2017-03-30	2017-04-01	2	6
806	234	4	2017-03-30	2017-03-31	2017-03-31	2	7
807	1148	4	2017-03-30	2017-04-01	2017-04-02	2	6
808	315	4	2017-03-31	2017-04-02	2017-04-02	2	6
809	1222	4	2017-03-31	2017-04-03	2017-04-03	2	7
810	153	3	2017-04-01	2017-04-01	\N	3	8
811	524	4	2017-04-01	2017-04-04	2017-04-04	2	7
812	1164	4	2017-04-01	2017-04-02	2017-04-03	2	7
813	1203	4	2017-04-01	2017-04-03	2017-04-02	3	9
814	629	4	2017-04-02	2017-04-05	2017-04-03	2	7
815	1251	4	2017-04-03	2017-04-05	2017-04-04	1	3
816	811	4	2017-04-03	2017-04-05	2017-04-05	2	6
817	301	4	2017-04-04	2017-04-05	2017-04-07	2	7
818	1319	4	2017-04-04	2017-04-07	2017-04-07	2	6
819	221	4	2017-04-04	2017-04-07	2017-04-05	3	9
820	725	4	2017-04-05	2017-04-08	2017-04-07	2	7
821	1181	4	2017-04-05	2017-04-07	2017-04-08	2	7
822	294	4	2017-04-06	2017-04-08	2017-04-09	2	7
823	415	4	2017-04-06	2017-04-07	2017-04-08	3	8
824	993	4	2017-04-07	2017-04-09	2017-04-10	1	2
825	10	4	2017-04-07	2017-04-08	2017-04-09	2	7
826	45	4	2017-04-07	2017-04-10	2017-04-10	2	6
827	666	4	2017-04-07	2017-04-10	2017-04-10	2	7
828	246	4	2017-04-09	2017-04-10	2017-04-12	2	6
829	674	4	2017-04-09	2017-04-10	2017-04-10	2	7
830	431	4	2017-04-11	2017-04-14	2017-04-12	2	6
831	1000	4	2017-04-11	2017-04-12	2017-04-12	2	7
832	1215	4	2017-04-11	2017-04-12	2017-04-12	2	7
833	406	4	2017-04-12	2017-04-14	2017-04-15	2	7
834	890	4	2017-04-12	2017-04-13	2017-04-15	2	6
835	940	4	2017-04-13	2017-04-15	2017-04-14	1	2
836	455	4	2017-04-13	2017-04-16	2017-04-14	2	6
837	948	4	2017-04-13	2017-04-16	2017-04-14	2	7
838	1395	4	2017-04-14	2017-04-17	2017-04-15	2	7
839	1332	4	2017-04-15	2017-04-18	2017-04-16	1	3
840	372	4	2017-04-15	2017-04-16	2017-04-16	2	6
841	428	4	2017-04-15	2017-04-18	2017-04-17	2	7
842	1133	4	2017-04-15	2017-04-18	2017-04-16	2	6
843	1059	4	2017-04-16	2017-04-17	2017-04-19	2	7
844	1436	4	2017-04-16	2017-04-17	2017-04-18	2	6
845	662	4	2017-04-17	2017-04-18	2017-04-18	2	7
846	715	4	2017-04-17	2017-04-19	2017-04-19	2	6
847	329	4	2017-04-18	2017-04-19	2017-04-19	2	7
848	597	4	2017-04-18	2017-04-20	2017-04-20	2	7
849	776	4	2017-04-19	2017-04-20	2017-04-21	1	2
850	1346	4	2017-04-19	2017-04-22	2017-04-22	1	3
851	1139	4	2017-04-20	2017-04-21	2017-04-22	2	6
852	13	4	2017-04-21	2017-04-23	2017-04-22	3	9
853	883	4	2017-04-21	2017-04-24	2017-04-24	3	8
854	177	4	2017-04-22	2017-04-25	2017-04-23	2	6
855	775	4	2017-04-22	2017-04-23	2017-04-25	2	6
856	477	4	2017-04-23	2017-04-25	2017-04-26	2	6
857	1402	4	2017-04-24	2017-04-25	2017-04-26	2	7
858	162	4	2017-04-25	2017-04-27	2017-04-28	2	6
859	644	4	2017-04-25	2017-04-26	2017-04-26	2	6
860	473	4	2017-04-27	2017-04-29	2017-04-28	2	7
861	1177	4	2017-04-27	2017-04-29	2017-04-30	2	7
862	1230	4	2017-04-27	2017-04-30	2017-04-29	3	8
863	446	4	2017-04-28	2017-04-30	2017-05-01	2	7
864	902	4	2017-04-28	2017-04-30	2017-04-29	2	6
865	974	4	2017-04-29	2017-05-02	2017-05-01	2	6
866	1410	4	2017-04-29	2017-04-30	2017-05-01	2	6
867	97	4	2017-05-01	2017-05-03	2017-05-02	1	3
868	868	4	2017-05-01	2017-05-04	2017-05-02	1	3
869	844	4	2017-05-01	2017-05-04	2017-05-02	2	7
870	1416	4	2017-05-01	2017-05-04	2017-05-02	2	6
871	358	4	2017-05-02	2017-05-04	2017-05-03	2	7
872	394	4	2017-05-03	2017-05-06	2017-05-06	1	3
873	829	4	2017-05-03	2017-05-05	2017-05-05	2	7
874	661	4	2017-05-04	2017-05-05	2017-05-06	2	7
875	386	4	2017-05-05	2017-05-06	2017-05-08	1	3
876	1046	4	2017-05-05	2017-05-08	2017-05-06	2	7
877	784	4	2017-05-06	2017-05-07	2017-05-08	2	6
878	224	4	2017-05-07	2017-05-10	2017-05-09	1	3
879	214	4	2017-05-08	2017-05-09	2017-05-09	2	7
880	1206	4	2017-05-08	2017-05-11	2017-05-10	2	6
881	1024	4	2017-05-08	2017-05-11	2017-05-11	3	9
882	196	4	2017-05-09	2017-05-12	2017-05-10	2	6
883	507	4	2017-05-11	2017-05-13	2017-05-14	2	6
884	871	4	2017-05-11	2017-05-13	2017-05-12	2	7
885	66	3	2017-05-13	2017-05-13	\N	3	8
886	1396	4	2017-05-13	2017-05-14	2017-05-15	1	2
887	1195	4	2017-05-13	2017-05-15	2017-05-15	2	6
888	1038	4	2017-05-14	2017-05-16	2017-05-16	2	7
889	830	4	2017-05-14	2017-05-17	2017-05-15	3	8
890	171	4	2017-05-15	2017-05-18	2017-05-18	2	6
891	384	4	2017-05-15	2017-05-18	2017-05-16	2	6
892	651	4	2017-05-15	2017-05-18	2017-05-17	2	7
893	1293	4	2017-05-16	2017-05-19	2017-05-19	2	7
894	1320	4	2017-05-16	2017-05-19	2017-05-19	2	6
895	857	4	2017-05-18	2017-05-21	2017-05-19	2	6
896	376	4	2017-05-19	2017-05-22	2017-05-21	3	9
897	47	4	2017-05-20	2017-05-21	2017-05-21	1	2
898	352	4	2017-05-20	2017-05-21	2017-05-22	2	6
899	605	4	2017-05-20	2017-05-21	2017-05-21	2	7
900	971	4	2017-05-20	2017-05-21	2017-05-22	2	6
901	345	4	2017-05-21	2017-05-22	2017-05-24	2	7
902	1278	4	2017-05-21	2017-05-24	2017-05-22	2	6
903	179	4	2017-05-22	2017-05-23	2017-05-24	2	7
904	1020	4	2017-05-23	2017-05-26	2017-05-24	1	2
905	609	4	2017-05-23	2017-05-26	2017-05-24	2	6
906	877	4	2017-05-23	2017-05-26	2017-05-26	2	7
907	120	4	2017-05-24	2017-05-26	2017-05-27	1	2
908	402	4	2017-05-25	2017-05-28	2017-05-27	2	7
909	188	4	2017-05-26	2017-05-27	2017-05-28	1	2
910	342	4	2017-05-26	2017-05-28	2017-05-28	2	7
911	887	4	2017-05-26	2017-05-29	2017-05-29	2	6
912	519	4	2017-05-27	2017-05-29	2017-05-29	1	2
913	699	4	2017-05-27	2017-05-29	2017-05-29	2	6
914	1068	4	2017-05-28	2017-05-31	2017-05-31	1	2
915	215	4	2017-05-28	2017-05-30	2017-05-30	2	6
916	718	4	2017-05-28	2017-05-29	2017-05-29	2	6
917	881	4	2017-05-29	2017-05-31	2017-06-01	1	2
918	242	4	2017-05-30	2017-05-31	2017-05-31	1	3
919	781	4	2017-05-30	2017-05-31	2017-05-31	2	7
920	966	4	2017-05-30	2017-06-01	2017-06-02	2	7
921	628	4	2017-05-31	2017-06-02	2017-06-02	2	6
922	656	4	2017-05-31	2017-06-01	2017-06-03	2	6
923	769	4	2017-05-31	2017-06-03	2017-06-02	2	7
924	68	3	2017-06-02	2017-06-02	\N	3	8
925	1316	4	2017-06-02	2017-06-05	2017-06-03	2	7
926	233	4	2017-06-03	2017-06-05	2017-06-06	1	2
927	1438	4	2017-06-03	2017-06-05	2017-06-06	1	2
928	957	4	2017-06-05	2017-06-06	2017-06-06	1	3
929	472	4	2017-06-05	2017-06-06	2017-06-08	2	6
930	1224	4	2017-06-05	2017-06-06	2017-06-06	3	9
931	631	4	2017-06-07	2017-06-08	2017-06-08	2	6
932	804	4	2017-06-07	2017-06-08	2017-06-09	2	6
933	909	4	2017-06-07	2017-06-10	2017-06-08	2	6
934	93	4	2017-06-09	2017-06-10	2017-06-12	2	7
935	43	3	2017-06-10	2017-06-10	\N	3	8
936	265	4	2017-06-10	2017-06-13	2017-06-12	2	6
937	73	4	2017-06-11	2017-06-14	2017-06-13	2	7
938	129	4	2017-06-11	2017-06-12	2017-06-12	2	6
939	1407	4	2017-06-11	2017-06-12	2017-06-14	2	6
940	585	4	2017-06-12	2017-06-14	2017-06-13	1	2
941	736	4	2017-06-12	2017-06-14	2017-06-14	1	2
942	537	4	2017-06-13	2017-06-16	2017-06-15	2	6
943	1025	4	2017-06-13	2017-06-15	2017-06-15	2	6
944	138	4	2017-06-14	2017-06-15	2017-06-17	1	3
945	167	4	2017-06-14	2017-06-15	2017-06-16	2	7
946	525	4	2017-06-14	2017-06-16	2017-06-15	2	6
947	278	4	2017-06-15	2017-06-18	2017-06-17	1	3
948	618	4	2017-06-15	2017-06-17	2017-06-17	2	6
949	867	4	2017-06-16	2017-06-18	2017-06-17	1	3
950	142	4	2017-06-16	2017-06-19	2017-06-18	2	6
951	339	4	2017-06-16	2017-06-19	2017-06-19	2	7
952	355	4	2017-06-16	2017-06-18	2017-06-18	2	7
953	658	4	2017-06-16	2017-06-18	2017-06-17	2	7
954	611	4	2017-06-17	2017-06-20	2017-06-20	2	6
955	880	4	2017-06-17	2017-06-19	2017-06-18	2	6
956	1184	4	2017-06-17	2017-06-19	2017-06-20	2	6
957	722	4	2017-06-17	2017-06-20	2017-06-20	3	9
958	1276	4	2017-06-18	2017-06-20	2017-06-19	1	2
959	650	4	2017-06-18	2017-06-21	2017-06-21	2	7
960	1390	4	2017-06-18	2017-06-19	2017-06-19	2	7
961	82	4	2017-06-19	2017-06-21	2017-06-22	1	2
962	570	4	2017-06-19	2017-06-22	2017-06-20	2	7
963	1432	4	2017-06-19	2017-06-21	2017-06-21	2	6
964	404	4	2017-06-20	2017-06-22	2017-06-22	2	7
965	457	4	2017-06-20	2017-06-22	2017-06-23	2	6
966	389	4	2017-06-20	2017-06-22	2017-06-22	3	8
967	1323	4	2017-06-21	2017-06-24	2017-06-24	2	6
968	1403	4	2017-06-21	2017-06-23	2017-06-23	2	6
969	248	4	2017-06-21	2017-06-24	2017-06-22	3	9
970	836	4	2017-06-22	2017-06-25	2017-06-23	2	7
971	1426	4	2017-06-22	2017-06-23	2017-06-24	3	8
972	270	4	2017-06-23	2017-06-24	2017-06-25	2	7
973	238	4	2017-06-24	2017-06-27	2017-06-27	2	6
974	511	4	2017-06-24	2017-06-27	2017-06-27	3	8
975	1092	4	2017-06-25	2017-06-27	2017-06-28	2	6
976	1266	4	2017-06-25	2017-06-28	2017-06-27	3	9
977	400	4	2017-06-26	2017-06-28	2017-06-27	2	7
978	1123	4	2017-06-26	2017-06-28	2017-06-27	2	6
979	1190	4	2017-06-26	2017-06-29	2017-06-27	2	6
980	328	4	2017-06-26	2017-06-28	2017-06-27	3	9
981	687	4	2017-06-26	2017-06-29	2017-06-28	3	8
982	1423	4	2017-06-26	2017-06-29	2017-06-28	3	9
983	1158	4	2017-06-27	2017-06-28	2017-06-29	2	6
984	1287	4	2017-06-27	2017-06-28	2017-06-29	2	7
985	461	4	2017-06-30	2017-07-02	2017-07-01	2	6
986	556	4	2017-06-30	2017-07-03	2017-07-01	2	7
987	172	4	2017-07-02	2017-07-04	2017-07-04	1	2
988	436	4	2017-07-02	2017-07-04	2017-07-05	2	6
989	1145	4	2017-07-02	2017-07-04	2017-07-03	2	6
990	706	4	2017-07-04	2017-07-07	2017-07-07	2	7
991	751	4	2017-07-06	2017-07-07	2017-07-09	1	2
992	723	4	2017-07-07	2017-07-10	2017-07-09	2	7
993	1415	4	2017-07-09	2017-07-11	2017-07-11	1	3
994	419	4	2017-07-09	2017-07-11	2017-07-11	2	7
995	621	4	2017-07-11	2017-07-13	2017-07-14	1	2
996	915	4	2017-07-11	2017-07-12	2017-07-12	1	2
997	485	4	2017-07-11	2017-07-13	2017-07-14	2	7
998	219	4	2017-07-12	2017-07-13	2017-07-14	2	7
999	590	4	2017-07-12	2017-07-13	2017-07-14	2	6
1000	645	4	2017-07-12	2017-07-14	2017-07-15	2	7
1001	354	4	2017-07-13	2017-07-16	2017-07-15	2	6
1002	1418	4	2017-07-14	2017-07-16	2017-07-16	1	3
1003	503	4	2017-07-14	2017-07-16	2017-07-16	2	7
1004	1389	4	2017-07-14	2017-07-17	2017-07-16	2	6
1005	266	4	2017-07-15	2017-07-17	2017-07-16	2	7
1006	1070	4	2017-07-15	2017-07-18	2017-07-17	2	7
1007	1115	4	2017-07-16	2017-07-17	2017-07-17	2	6
1008	1345	4	2017-07-16	2017-07-18	2017-07-18	2	6
1009	1064	4	2017-07-16	2017-07-19	2017-07-19	3	8
1010	8	3	2017-07-18	2017-07-18	\N	2	7
1011	495	4	2017-07-18	2017-07-21	2017-07-21	1	3
1012	620	4	2017-07-18	2017-07-20	2017-07-20	2	7
1013	174	4	2017-07-19	2017-07-22	2017-07-21	2	6
1014	748	4	2017-07-19	2017-07-21	2017-07-21	2	6
1015	799	4	2017-07-19	2017-07-22	2017-07-21	2	7
1016	1417	4	2017-07-19	2017-07-20	2017-07-21	3	9
1017	168	4	2017-07-20	2017-07-21	2017-07-23	2	6
1018	290	4	2017-07-22	2017-07-23	2017-07-23	2	6
1019	408	4	2017-07-22	2017-07-23	2017-07-24	2	7
1020	16	3	2017-07-23	2017-07-23	\N	2	6
1021	125	4	2017-07-23	2017-07-24	2017-07-26	2	6
1022	353	4	2017-07-23	2017-07-26	2017-07-24	2	7
1023	356	4	2017-07-23	2017-07-26	2017-07-25	2	6
1024	837	4	2017-07-23	2017-07-25	2017-07-26	2	7
1025	1304	4	2017-07-23	2017-07-26	2017-07-26	2	6
1026	1370	4	2017-07-26	2017-07-28	2017-07-29	1	2
1027	588	4	2017-07-26	2017-07-28	2017-07-28	2	6
1028	1273	4	2017-07-27	2017-07-28	2017-07-30	2	7
1029	407	4	2017-07-29	2017-07-30	2017-08-01	1	3
1030	161	4	2017-07-29	2017-07-30	2017-07-31	2	6
1031	1308	4	2017-07-30	2017-08-01	2017-08-02	1	2
1032	429	4	2017-07-30	2017-08-02	2017-08-01	2	6
1033	582	4	2017-07-30	2017-07-31	2017-08-02	2	7
1034	895	4	2017-07-30	2017-07-31	2017-07-31	2	7
1035	1283	4	2017-07-30	2017-08-02	2017-08-02	2	6
1036	1442	4	2017-07-30	2017-08-01	2017-07-31	2	6
1037	1229	4	2017-07-31	2017-08-02	2017-08-03	2	6
1038	1281	4	2017-07-31	2017-08-01	2017-08-03	2	7
1039	1077	4	2017-08-02	2017-08-04	2017-08-03	2	7
1040	1225	4	2017-08-04	2017-08-07	2017-08-05	1	2
1041	70	4	2017-08-04	2017-08-06	2017-08-05	2	7
1042	539	4	2017-08-06	2017-08-07	2017-08-07	2	7
1043	1235	4	2017-08-06	2017-08-09	2017-08-08	2	6
1044	1270	4	2017-08-07	2017-08-10	2017-08-08	2	7
1045	185	4	2017-08-07	2017-08-09	2017-08-10	3	9
1046	1134	4	2017-08-07	2017-08-09	2017-08-08	3	8
1047	116	3	2017-08-08	2017-08-08	\N	3	8
1048	777	4	2017-08-08	2017-08-10	2017-08-09	2	7
1049	194	4	2017-08-09	2017-08-11	2017-08-10	1	2
1050	239	4	2017-08-09	2017-08-12	2017-08-12	1	3
1051	209	4	2017-08-10	2017-08-11	2017-08-11	2	7
1052	460	4	2017-08-10	2017-08-12	2017-08-13	2	6
1053	1439	4	2017-08-10	2017-08-11	2017-08-12	2	6
1054	189	4	2017-08-11	2017-08-12	2017-08-12	2	7
1055	140	4	2017-08-12	2017-08-15	2017-08-15	2	6
1056	325	4	2017-08-12	2017-08-15	2017-08-13	2	7
1057	456	4	2017-08-12	2017-08-15	2017-08-13	2	7
1058	782	4	2017-08-13	2017-08-16	2017-08-14	2	6
1059	6	4	2017-08-14	2017-08-17	2017-08-17	2	7
1060	182	4	2017-08-15	2017-08-18	2017-08-17	2	6
1061	655	4	2017-08-15	2017-08-18	2017-08-18	2	7
1062	1210	4	2017-08-15	2017-08-17	2017-08-18	2	6
1063	198	4	2017-08-16	2017-08-19	2017-08-19	3	8
1064	898	4	2017-08-16	2017-08-18	2017-08-19	3	9
1065	25	4	2017-08-17	2017-08-19	2017-08-19	2	7
1066	106	4	2017-08-17	2017-08-20	2017-08-19	2	7
1067	225	4	2017-08-17	2017-08-19	2017-08-19	2	7
1068	453	4	2017-08-17	2017-08-20	2017-08-19	2	7
1069	493	4	2017-08-17	2017-08-19	2017-08-18	2	6
1070	596	4	2017-08-17	2017-08-20	2017-08-18	2	7
1071	602	4	2017-08-17	2017-08-20	2017-08-18	3	8
1072	47	3	2017-08-18	2017-08-18	\N	1	3
1073	911	4	2017-08-18	2017-08-19	2017-08-21	2	7
1074	11	3	2017-08-19	2017-08-19	\N	2	6
1075	1003	4	2017-08-19	2017-08-21	2017-08-22	1	3
1076	42	4	2017-08-19	2017-08-22	2017-08-22	2	6
1077	412	4	2017-08-19	2017-08-20	2017-08-21	2	6
1078	793	4	2017-08-19	2017-08-21	2017-08-20	2	6
1079	812	4	2017-08-19	2017-08-20	2017-08-20	2	7
1080	1086	4	2017-08-19	2017-08-20	2017-08-20	2	7
1081	1106	4	2017-08-19	2017-08-22	2017-08-22	2	6
1082	1327	4	2017-08-20	2017-08-22	2017-08-21	2	6
1083	1372	4	2017-08-20	2017-08-23	2017-08-23	2	6
1084	2	4	2017-08-21	2017-08-24	2017-08-23	1	2
1085	305	4	2017-08-21	2017-08-23	2017-08-23	1	3
1086	220	4	2017-08-21	2017-08-23	2017-08-24	2	7
1087	675	4	2017-08-22	2017-08-23	2017-08-25	3	8
1088	1160	4	2017-08-22	2017-08-23	2017-08-23	3	8
1089	46	3	2017-08-23	2017-08-23	\N	1	2
1090	1427	4	2017-08-24	2017-08-26	2017-08-26	1	2
1091	1260	4	2017-08-24	2017-08-25	2017-08-25	2	7
1092	40	4	2017-08-25	2017-08-28	2017-08-27	1	2
1093	326	4	2017-08-25	2017-08-28	2017-08-26	1	3
1094	828	4	2017-08-25	2017-08-27	2017-08-28	2	6
1095	1382	4	2017-08-26	2017-08-28	2017-08-27	3	9
1096	589	4	2017-08-27	2017-08-29	2017-08-29	1	2
1097	1311	4	2017-08-27	2017-08-30	2017-08-28	2	6
1098	752	4	2017-08-28	2017-08-30	2017-08-30	1	2
1099	1128	4	2017-08-28	2017-08-29	2017-08-30	2	6
1100	1392	4	2017-08-28	2017-08-29	2017-08-29	2	7
1101	379	4	2017-08-29	2017-08-30	2017-08-30	2	7
1102	1317	4	2017-08-29	2017-08-31	2017-08-31	2	6
1103	1394	4	2017-08-31	2017-09-02	2017-09-02	2	7
1104	268	4	2017-09-01	2017-09-04	2017-09-03	2	6
1105	747	4	2017-09-01	2017-09-04	2017-09-03	3	8
1106	1009	4	2017-09-02	2017-09-04	2017-09-04	2	6
1107	1424	4	2017-09-02	2017-09-05	2017-09-05	2	7
1108	735	4	2017-09-03	2017-09-05	2017-09-04	1	3
1109	23	4	2017-09-03	2017-09-04	2017-09-04	2	6
1110	912	4	2017-09-04	2017-09-07	2017-09-07	2	6
1111	930	4	2017-09-04	2017-09-06	2017-09-05	2	6
1112	798	4	2017-09-05	2017-09-08	2017-09-07	2	7
1113	388	4	2017-09-06	2017-09-08	2017-09-07	2	7
1114	1036	4	2017-09-06	2017-09-08	2017-09-08	2	6
1115	1100	4	2017-09-07	2017-09-09	2017-09-09	2	6
1116	52	4	2017-09-08	2017-09-10	2017-09-10	2	7
1117	334	4	2017-09-08	2017-09-10	2017-09-10	2	6
1118	1023	4	2017-09-08	2017-09-11	2017-09-11	2	6
1119	749	4	2017-09-10	2017-09-12	2017-09-13	1	2
1120	1269	4	2017-09-10	2017-09-12	2017-09-13	2	7
1121	143	4	2017-09-11	2017-09-13	2017-09-12	2	7
1122	1132	4	2017-09-12	2017-09-14	2017-09-14	2	6
1123	598	4	2017-09-13	2017-09-14	2017-09-14	2	7
1124	275	4	2017-09-13	2017-09-14	2017-09-16	3	9
1125	945	4	2017-09-14	2017-09-15	2017-09-15	2	7
1126	1213	4	2017-09-14	2017-09-16	2017-09-15	3	8
1127	494	4	2017-09-15	2017-09-16	2017-09-16	2	7
1128	936	4	2017-09-15	2017-09-17	2017-09-16	2	6
1129	663	4	2017-09-17	2017-09-18	2017-09-20	2	6
1130	69	4	2017-09-18	2017-09-20	2017-09-20	1	3
1131	1178	4	2017-09-18	2017-09-20	2017-09-19	1	3
1132	351	4	2017-09-19	2017-09-20	2017-09-20	2	6
1133	517	4	2017-09-19	2017-09-21	2017-09-21	2	7
1134	978	4	2017-09-19	2017-09-22	2017-09-20	2	6
1135	1347	4	2017-09-19	2017-09-21	2017-09-20	2	6
1136	1050	4	2017-09-20	2017-09-21	2017-09-21	2	6
1137	810	4	2017-09-20	2017-09-23	2017-09-23	3	8
1138	254	4	2017-09-21	2017-09-23	2017-09-22	1	2
1139	1006	4	2017-09-21	2017-09-22	2017-09-23	1	2
1140	1063	4	2017-09-21	2017-09-22	2017-09-22	3	8
1141	1076	4	2017-09-22	2017-09-23	2017-09-24	1	2
1142	554	4	2017-09-23	2017-09-26	2017-09-26	1	3
1143	1087	4	2017-09-24	2017-09-26	2017-09-27	1	2
1144	1414	4	2017-09-24	2017-09-27	2017-09-27	2	7
1145	617	4	2017-09-25	2017-09-27	2017-09-26	2	6
1146	757	4	2017-09-25	2017-09-26	2017-09-28	2	7
1147	1344	4	2017-09-25	2017-09-26	2017-09-27	2	6
1148	1379	4	2017-09-25	2017-09-26	2017-09-27	2	7
1149	787	4	2017-09-27	2017-09-30	2017-09-30	2	7
1150	1183	4	2017-09-28	2017-10-01	2017-09-30	2	7
1151	708	4	2017-09-29	2017-09-30	2017-09-30	1	3
1152	1244	4	2017-09-29	2017-10-02	2017-10-01	2	6
1153	720	4	2017-09-30	2017-10-03	2017-10-03	2	7
1154	789	4	2017-09-30	2017-10-03	2017-10-03	2	7
1155	865	4	2017-09-30	2017-10-01	2017-10-01	2	7
1156	869	4	2017-09-30	2017-10-03	2017-10-03	2	7
1157	24	4	2017-10-01	2017-10-03	2017-10-04	1	3
1158	889	4	2017-10-01	2017-10-03	2017-10-02	1	2
1159	1221	4	2017-10-01	2017-10-02	2017-10-03	1	3
1160	1262	4	2017-10-01	2017-10-02	2017-10-04	1	2
1161	41	4	2017-10-01	2017-10-04	2017-10-02	2	7
1162	888	4	2017-10-01	2017-10-03	2017-10-03	2	6
1163	934	4	2017-10-01	2017-10-02	2017-10-02	2	6
1164	1067	4	2017-10-01	2017-10-02	2017-10-03	2	6
1165	652	4	2017-10-02	2017-10-03	2017-10-05	2	7
1166	286	4	2017-10-03	2017-10-04	2017-10-04	2	7
1167	900	4	2017-10-04	2017-10-07	2017-10-06	1	2
1168	1031	4	2017-10-04	2017-10-05	2017-10-06	2	6
1169	1421	4	2017-10-04	2017-10-06	2017-10-07	2	7
1170	534	4	2017-10-05	2017-10-07	2017-10-06	2	6
1171	826	4	2017-10-05	2017-10-06	2017-10-08	2	6
1172	1339	4	2017-10-07	2017-10-10	2017-10-09	2	7
1173	548	4	2017-10-08	2017-10-10	2017-10-09	2	7
1174	1109	4	2017-10-08	2017-10-10	2017-10-11	2	6
1175	292	4	2017-10-09	2017-10-11	2017-10-12	2	6
1176	1111	4	2017-10-10	2017-10-13	2017-10-11	3	9
1177	21	3	2017-10-12	2017-10-12	\N	3	9
1178	771	4	2017-10-12	2017-10-15	2017-10-13	2	6
1179	1150	4	2017-10-12	2017-10-15	2017-10-15	3	9
1180	1065	4	2017-10-13	2017-10-16	2017-10-16	1	3
1181	1022	4	2017-10-13	2017-10-16	2017-10-15	2	7
1182	1422	4	2017-10-13	2017-10-14	2017-10-16	2	7
1183	216	4	2017-10-14	2017-10-17	2017-10-17	2	6
1184	369	4	2017-10-14	2017-10-15	2017-10-16	2	6
1185	960	4	2017-10-14	2017-10-16	2017-10-17	2	6
1186	1120	4	2017-10-14	2017-10-16	2017-10-15	2	6
1187	486	4	2017-10-15	2017-10-18	2017-10-16	2	6
1188	647	4	2017-10-15	2017-10-18	2017-10-17	2	7
1189	1090	4	2017-10-15	2017-10-17	2017-10-18	2	6
1190	34	4	2017-10-16	2017-10-19	2017-10-17	2	6
1191	186	4	2017-10-17	2017-10-18	2017-10-18	2	6
1192	1114	4	2017-10-17	2017-10-19	2017-10-18	2	6
1193	1412	4	2017-10-17	2017-10-19	2017-10-19	2	7
1194	192	4	2017-10-19	2017-10-22	2017-10-22	1	2
1195	229	4	2017-10-19	2017-10-21	2017-10-21	2	7
1196	508	4	2017-10-19	2017-10-21	2017-10-20	2	6
1197	269	4	2017-10-21	2017-10-23	2017-10-23	2	6
1198	1289	4	2017-10-22	2017-10-24	2017-10-24	2	7
1199	318	4	2017-10-23	2017-10-24	2017-10-26	1	2
1200	48	4	2017-10-23	2017-10-25	2017-10-26	2	6
1201	201	4	2017-10-23	2017-10-24	2017-10-24	2	6
1202	593	4	2017-10-24	2017-10-25	2017-10-25	2	6
1203	1191	4	2017-10-25	2017-10-27	2017-10-26	2	7
1204	1277	4	2017-10-25	2017-10-28	2017-10-28	2	6
1205	1091	4	2017-10-26	2017-10-28	2017-10-28	1	2
1206	222	4	2017-10-26	2017-10-29	2017-10-29	2	6
1207	1002	4	2017-10-26	2017-10-28	2017-10-27	2	6
1208	1226	4	2017-10-26	2017-10-28	2017-10-27	2	7
1209	1342	4	2017-10-26	2017-10-27	2017-10-29	2	7
1210	730	4	2017-10-26	2017-10-27	2017-10-29	3	8
1211	19	4	2017-10-27	2017-10-28	2017-10-29	2	7
1212	213	4	2017-10-27	2017-10-30	2017-10-29	2	6
1213	669	4	2017-10-27	2017-10-29	2017-10-29	3	9
1214	783	4	2017-10-28	2017-10-29	2017-10-29	2	6
1215	807	4	2017-10-28	2017-10-31	2017-10-30	2	7
1216	886	4	2017-10-28	2017-10-30	2017-10-29	2	7
1217	1155	4	2017-10-28	2017-10-31	2017-10-30	2	7
1218	1017	4	2017-10-30	2017-11-01	2017-10-31	1	2
1219	840	4	2017-10-30	2017-11-02	2017-11-02	2	7
1220	803	4	2017-10-31	2017-11-03	2017-11-03	2	6
1221	1290	4	2017-10-31	2017-11-02	2017-11-01	2	7
1222	482	4	2017-11-01	2017-11-04	2017-11-03	3	9
1223	1207	4	2017-11-02	2017-11-03	2017-11-03	2	6
1224	544	4	2017-11-03	2017-11-04	2017-11-04	2	6
1225	768	4	2017-11-04	2017-11-05	2017-11-07	1	2
1226	226	4	2017-11-04	2017-11-07	2017-11-06	2	7
1227	702	4	2017-11-04	2017-11-07	2017-11-06	2	6
1228	1041	4	2017-11-04	2017-11-06	2017-11-06	2	6
1229	89	4	2017-11-05	2017-11-08	2017-11-06	1	3
1230	1107	4	2017-11-05	2017-11-06	2017-11-07	2	6
1231	1180	4	2017-11-05	2017-11-07	2017-11-06	2	6
1232	665	4	2017-11-06	2017-11-07	2017-11-09	1	3
1233	462	4	2017-11-06	2017-11-07	2017-11-08	2	6
1234	19	3	2017-11-07	2017-11-07	\N	2	6
1235	210	4	2017-11-07	2017-11-08	2017-11-09	2	6
1236	243	4	2017-11-08	2017-11-11	2017-11-09	2	7
1237	571	4	2017-11-09	2017-11-12	2017-11-11	1	2
1238	998	4	2017-11-09	2017-11-10	2017-11-11	2	6
1239	1197	4	2017-11-09	2017-11-10	2017-11-11	2	7
1240	903	4	2017-11-10	2017-11-11	2017-11-11	2	7
1241	1170	4	2017-11-10	2017-11-12	2017-11-11	2	7
1242	303	4	2017-11-11	2017-11-12	2017-11-12	2	6
1243	346	4	2017-11-11	2017-11-13	2017-11-14	2	6
1244	333	4	2017-11-12	2017-11-14	2017-11-13	2	6
1245	1166	4	2017-11-13	2017-11-16	2017-11-14	2	7
1246	1329	4	2017-11-13	2017-11-16	2017-11-16	2	7
1247	426	4	2017-11-16	2017-11-18	2017-11-17	1	2
1248	1367	4	2017-11-16	2017-11-17	2017-11-18	1	3
1249	545	4	2017-11-17	2017-11-18	2017-11-20	2	6
1250	1188	4	2017-11-17	2017-11-19	2017-11-18	2	6
1251	289	4	2017-11-17	2017-11-19	2017-11-19	3	9
1252	110	4	2017-11-18	2017-11-20	2017-11-21	1	3
1253	44	4	2017-11-18	2017-11-21	2017-11-21	2	6
1254	1098	4	2017-11-18	2017-11-19	2017-11-19	2	7
1255	375	4	2017-11-19	2017-11-20	2017-11-21	2	6
1256	458	4	2017-11-19	2017-11-20	2017-11-22	2	6
1257	1136	4	2017-11-19	2017-11-22	2017-11-20	2	7
1258	1099	4	2017-11-20	2017-11-21	2017-11-22	2	7
1259	4	3	2017-11-21	2017-11-21	\N	2	7
1260	1117	4	2017-11-22	2017-11-23	2017-11-24	2	6
1261	435	4	2017-11-23	2017-11-25	2017-11-24	2	7
1262	509	4	2017-11-23	2017-11-26	2017-11-26	2	6
1263	1408	4	2017-11-23	2017-11-26	2017-11-26	2	6
1264	113	4	2017-11-24	2017-11-27	2017-11-25	2	6
1265	950	4	2017-11-24	2017-11-27	2017-11-27	2	7
1266	387	4	2017-11-25	2017-11-28	2017-11-27	2	6
1267	467	4	2017-11-25	2017-11-26	2017-11-26	2	6
1268	774	4	2017-11-26	2017-11-28	2017-11-29	1	3
1269	1236	4	2017-11-26	2017-11-29	2017-11-29	2	6
1270	1388	4	2017-11-26	2017-11-29	2017-11-29	2	6
1271	734	4	2017-11-27	2017-11-30	2017-11-30	2	6
1272	935	4	2017-11-27	2017-11-29	2017-11-30	2	6
1273	1268	4	2017-11-27	2017-11-29	2017-11-29	2	6
1274	1364	4	2017-11-28	2017-11-29	2017-12-01	2	7
1275	165	4	2017-11-29	2017-12-01	2017-11-30	1	2
1276	893	4	2017-11-30	2017-12-03	2017-12-02	2	6
1277	227	4	2017-12-01	2017-12-04	2017-12-02	2	6
1278	980	4	2017-12-01	2017-12-02	2017-12-04	2	7
1279	1014	4	2017-12-01	2017-12-04	2017-12-03	2	6
1280	123	4	2017-12-01	2017-12-03	2017-12-03	3	9
1281	1060	4	2017-12-02	2017-12-05	2017-12-05	2	6
1282	320	4	2017-12-03	2017-12-05	2017-12-05	2	6
1283	85	4	2017-12-04	2017-12-07	2017-12-07	2	7
1284	128	4	2017-12-04	2017-12-06	2017-12-07	2	7
1285	262	4	2017-12-04	2017-12-07	2017-12-07	2	7
1286	1033	4	2017-12-04	2017-12-07	2017-12-06	2	7
1287	279	4	2017-12-07	2017-12-10	2017-12-09	1	3
1288	778	4	2017-12-07	2017-12-10	2017-12-09	3	9
1289	1292	4	2017-12-08	2017-12-11	2017-12-10	1	3
1290	967	4	2017-12-08	2017-12-10	2017-12-10	2	6
1291	1284	4	2017-12-09	2017-12-11	2017-12-12	2	6
1292	285	4	2017-12-10	2017-12-13	2017-12-11	2	6
1293	1401	4	2017-12-10	2017-12-12	2017-12-11	2	7
1294	947	4	2017-12-11	2017-12-13	2017-12-14	1	2
1295	37	4	2017-12-11	2017-12-12	2017-12-14	2	7
1296	231	4	2017-12-14	2017-12-17	2017-12-15	1	3
1297	108	4	2017-12-14	2017-12-17	2017-12-16	2	6
1298	533	4	2017-12-14	2017-12-17	2017-12-16	3	9
1299	1216	4	2017-12-15	2017-12-18	2017-12-16	1	2
1300	824	4	2017-12-15	2017-12-17	2017-12-17	2	6
1301	1088	4	2017-12-16	2017-12-19	2017-12-19	1	3
1302	322	4	2017-12-16	2017-12-18	2017-12-19	2	7
1303	878	4	2017-12-16	2017-12-19	2017-12-18	2	7
1304	1409	4	2017-12-16	2017-12-17	2017-12-17	2	6
1305	257	4	2017-12-17	2017-12-19	2017-12-18	2	7
1306	28	4	2017-12-20	2017-12-21	2017-12-22	2	6
1307	1384	4	2017-12-22	2017-12-23	2017-12-25	1	2
1308	713	4	2017-12-22	2017-12-24	2017-12-24	2	7
1309	821	4	2017-12-22	2017-12-25	2017-12-24	2	6
1310	444	4	2017-12-24	2017-12-25	2017-12-26	1	3
1311	1021	4	2017-12-24	2017-12-26	2017-12-27	2	6
1312	311	4	2017-12-25	2017-12-28	2017-12-26	1	3
1313	1294	4	2017-12-25	2017-12-27	2017-12-27	1	3
1314	1027	4	2017-12-25	2017-12-26	2017-12-28	2	7
1315	931	4	2017-12-25	2017-12-27	2017-12-28	3	9
1316	846	4	2017-12-26	2017-12-29	2017-12-27	1	3
1317	418	4	2017-12-27	2017-12-28	2017-12-29	1	3
1318	75	4	2017-12-27	2017-12-30	2017-12-29	2	6
1319	604	4	2017-12-27	2017-12-30	2017-12-30	2	6
1320	244	4	2017-12-28	2017-12-30	2017-12-29	1	3
1321	217	4	2017-12-30	2017-12-31	2017-12-31	1	3
1322	39	4	2017-12-31	2018-01-03	2018-01-02	2	7
1323	273	4	2017-12-31	2018-01-01	2018-01-01	2	6
1324	862	4	2018-01-01	2018-01-04	2018-01-03	2	6
1325	68	4	2018-01-01	2018-01-02	2018-01-03	3	8
1326	567	4	2018-01-01	2018-01-03	2018-01-02	3	9
1327	1026	4	2018-01-02	2018-01-03	2018-01-05	2	6
1328	1083	4	2018-01-02	2018-01-03	2018-01-03	2	6
1329	443	4	2018-01-04	2018-01-05	2018-01-06	1	3
1330	761	4	2018-01-04	2018-01-05	2018-01-07	2	7
1331	1122	4	2018-01-05	2018-01-06	2018-01-08	2	6
1332	256	4	2018-01-06	2018-01-07	2018-01-09	2	7
1333	203	4	2018-01-06	2018-01-07	2018-01-07	3	8
1334	425	4	2018-01-07	2018-01-09	2018-01-10	2	6
1335	955	4	2018-01-07	2018-01-08	2018-01-08	2	7
1336	904	4	2018-01-09	2018-01-10	2018-01-12	1	2
1337	970	4	2018-01-09	2018-01-12	2018-01-12	2	7
1338	905	4	2018-01-10	2018-01-11	2018-01-13	2	6
1339	580	4	2018-01-11	2018-01-14	2018-01-13	1	3
1340	1066	4	2018-01-12	2018-01-13	2018-01-13	1	3
1341	1258	4	2018-01-12	2018-01-13	2018-01-14	2	7
1342	1393	4	2018-01-12	2018-01-13	2018-01-15	2	7
1343	594	4	2018-01-13	2018-01-15	2018-01-14	2	6
1344	916	4	2018-01-13	2018-01-16	2018-01-15	2	6
1345	1037	4	2018-01-14	2018-01-15	2018-01-15	2	6
1346	136	4	2018-01-14	2018-01-15	2018-01-15	3	8
1347	247	4	2018-01-15	2018-01-18	2018-01-18	1	2
1348	1214	4	2018-01-15	2018-01-17	2018-01-17	1	2
1349	464	4	2018-01-15	2018-01-17	2018-01-16	2	6
1350	637	4	2018-01-15	2018-01-18	2018-01-17	2	7
1351	1016	4	2018-01-16	2018-01-19	2018-01-19	2	7
1352	1433	4	2018-01-16	2018-01-18	2018-01-18	2	6
1353	502	4	2018-01-17	2018-01-19	2018-01-18	2	6
1354	476	4	2018-01-19	2018-01-20	2018-01-21	1	3
1355	1010	4	2018-01-19	2018-01-21	2018-01-20	2	7
1356	1161	4	2018-01-19	2018-01-21	2018-01-22	2	6
1357	440	4	2018-01-20	2018-01-23	2018-01-21	2	6
1358	253	4	2018-01-21	2018-01-23	2018-01-24	1	2
1359	1008	4	2018-01-21	2018-01-22	2018-01-22	3	9
1360	71	4	2018-01-22	2018-01-25	2018-01-24	2	6
1361	1084	4	2018-01-22	2018-01-24	2018-01-23	2	7
1362	310	4	2018-01-23	2018-01-24	2018-01-25	2	6
1363	860	4	2018-01-24	2018-01-25	2018-01-25	2	6
1364	122	4	2018-01-25	2018-01-28	2018-01-28	2	6
1365	689	4	2018-01-25	2018-01-28	2018-01-27	2	7
1366	1441	4	2018-01-26	2018-01-27	2018-01-28	2	6
1367	1118	4	2018-01-27	2018-01-28	2018-01-28	1	3
1368	765	4	2018-01-27	2018-01-28	2018-01-29	2	6
1369	92	4	2018-01-28	2018-01-30	2018-01-30	2	6
1370	115	4	2018-01-28	2018-01-29	2018-01-29	2	7
1371	937	4	2018-01-29	2018-01-30	2018-02-01	2	7
1372	1013	4	2018-01-29	2018-02-01	2018-01-30	2	6
1373	427	4	2018-01-29	2018-01-31	2018-01-31	3	9
1374	1330	4	2018-01-30	2018-02-01	2018-02-01	1	3
1375	312	4	2018-01-30	2018-02-01	2018-02-01	3	8
1376	1186	4	2018-02-01	2018-02-02	2018-02-03	1	2
1377	1007	4	2018-02-01	2018-02-03	2018-02-03	2	7
1378	983	4	2018-02-02	2018-02-05	2018-02-04	1	2
1379	1256	4	2018-02-02	2018-02-05	2018-02-05	2	6
1380	818	4	2018-02-05	2018-02-08	2018-02-08	1	3
1381	680	4	2018-02-05	2018-02-06	2018-02-08	2	7
1382	1303	4	2018-02-06	2018-02-09	2018-02-08	2	6
1383	488	4	2018-02-07	2018-02-08	2018-02-08	1	3
1384	1126	4	2018-02-08	2018-02-10	2018-02-09	2	7
1385	866	4	2018-02-08	2018-02-11	2018-02-09	3	9
1386	1254	4	2018-02-09	2018-02-10	2018-02-11	1	2
1387	11	4	2018-02-09	2018-02-11	2018-02-11	2	7
1388	323	4	2018-02-09	2018-02-12	2018-02-12	2	7
1389	491	4	2018-02-11	2018-02-12	2018-02-14	2	7
1390	63	4	2018-02-12	2018-02-13	2018-02-13	2	7
1391	914	4	2018-02-13	2018-02-14	2018-02-14	2	7
1392	1187	4	2018-02-13	2018-02-14	2018-02-14	2	6
1393	547	4	2018-02-14	2018-02-15	2018-02-15	2	7
1394	906	4	2018-02-14	2018-02-16	2018-02-16	3	8
1395	1052	4	2018-02-15	2018-02-18	2018-02-16	1	3
1396	856	4	2018-02-15	2018-02-18	2018-02-16	2	7
1397	920	4	2018-02-15	2018-02-17	2018-02-16	2	6
1398	1383	4	2018-02-16	2018-02-19	2018-02-19	1	3
1399	146	4	2018-02-16	2018-02-18	2018-02-18	2	6
1400	987	4	2018-02-17	2018-02-18	2018-02-18	2	6
1401	15	4	2018-02-18	2018-02-19	2018-02-20	2	7
1402	1171	4	2018-02-19	2018-02-21	2018-02-21	2	6
1403	452	4	2018-02-21	2018-02-22	2018-02-22	2	7
1404	1240	4	2018-02-23	2018-02-26	2018-02-24	1	3
1405	100	4	2018-02-25	2018-02-28	2018-02-27	2	6
1406	1053	4	2018-02-25	2018-02-27	2018-02-27	2	7
1407	18	3	2018-02-26	2018-02-26	\N	2	6
1408	1172	4	2018-02-26	2018-02-27	2018-03-01	2	6
1409	21	4	2018-02-26	2018-02-28	2018-02-28	3	8
1410	1005	4	2018-02-27	2018-02-28	2018-02-28	2	7
1411	109	4	2018-03-01	2018-03-02	2018-03-02	1	2
1412	1043	4	2018-03-01	2018-03-02	2018-03-04	2	7
1413	56	4	2018-03-01	2018-03-03	2018-03-04	3	8
1414	293	4	2018-03-03	2018-03-05	2018-03-06	2	7
1415	839	4	2018-03-03	2018-03-04	2018-03-05	2	7
1416	566	4	2018-03-03	2018-03-04	2018-03-06	3	8
1417	300	4	2018-03-04	2018-03-06	2018-03-07	1	2
1418	364	4	2018-03-04	2018-03-05	2018-03-07	2	6
1419	474	4	2018-03-04	2018-03-07	2018-03-07	2	6
1420	838	4	2018-03-04	2018-03-05	2018-03-07	2	7
1421	1176	4	2018-03-05	2018-03-07	2018-03-07	2	7
1422	599	4	2018-03-05	2018-03-06	2018-03-08	3	8
1423	1231	4	2018-03-06	2018-03-07	2018-03-07	1	2
1424	1445	4	2018-03-07	2018-03-10	2018-03-10	1	2
1425	126	4	2018-03-07	2018-03-09	2018-03-09	2	6
1426	938	4	2018-03-07	2018-03-08	2018-03-10	2	6
1427	999	4	2018-03-07	2018-03-08	2018-03-08	2	6
1428	195	4	2018-03-08	2018-03-10	2018-03-11	2	7
1429	1116	4	2018-03-08	2018-03-09	2018-03-09	2	6
1430	1239	4	2018-03-10	2018-03-13	2018-03-11	2	7
1431	308	4	2018-03-11	2018-03-12	2018-03-14	2	6
1432	483	4	2018-03-11	2018-03-12	2018-03-14	2	6
1433	1142	4	2018-03-11	2018-03-13	2018-03-12	2	7
1434	595	4	2018-03-14	2018-03-16	2018-03-16	2	6
1435	744	4	2018-03-14	2018-03-15	2018-03-16	2	6
1436	1044	4	2018-03-14	2018-03-17	2018-03-16	2	6
1437	518	4	2018-03-15	2018-03-16	2018-03-16	1	2
1438	263	4	2018-03-15	2018-03-17	2018-03-16	2	6
1439	463	4	2018-03-15	2018-03-16	2018-03-17	2	7
1440	859	4	2018-03-15	2018-03-18	2018-03-16	3	8
1441	982	4	2018-03-15	2018-03-16	2018-03-18	3	8
1442	478	4	2018-03-16	2018-03-17	2018-03-17	2	7
1443	972	4	2018-03-16	2018-03-17	2018-03-17	2	7
1444	1154	4	2018-03-16	2018-03-17	2018-03-19	2	6
1445	515	4	2018-03-17	2018-03-18	2018-03-20	2	7
1446	820	4	2018-03-17	2018-03-18	2018-03-18	2	6
1447	1419	4	2018-03-18	2018-03-20	2018-03-20	1	3
1448	228	4	2018-03-18	2018-03-19	2018-03-21	2	6
1449	330	4	2018-03-18	2018-03-19	2018-03-20	2	7
1450	296	4	2018-03-19	2018-03-20	2018-03-22	2	7
1451	822	4	2018-03-19	2018-03-22	2018-03-20	2	6
1452	287	4	2018-03-20	2018-03-23	2018-03-23	1	3
1453	601	4	2018-03-20	2018-03-23	2018-03-22	1	3
1454	395	4	2018-03-20	2018-03-21	2018-03-22	2	6
1455	405	4	2018-03-20	2018-03-22	2018-03-21	2	6
1456	754	4	2018-03-20	2018-03-21	2018-03-23	2	7
1457	1411	4	2018-03-20	2018-03-23	2018-03-23	2	6
1458	1029	4	2018-03-20	2018-03-22	2018-03-21	3	8
1459	9	4	2018-03-21	2018-03-22	2018-03-22	2	7
1460	1131	4	2018-03-21	2018-03-23	2018-03-23	2	7
1461	139	4	2018-03-22	2018-03-25	2018-03-23	2	6
1462	1101	4	2018-03-22	2018-03-24	2018-03-24	2	6
1463	692	4	2018-03-23	2018-03-24	2018-03-24	2	7
1464	1279	4	2018-03-24	2018-03-25	2018-03-25	2	7
1465	623	4	2018-03-25	2018-03-28	2018-03-28	2	7
1466	738	4	2018-03-26	2018-03-29	2018-03-28	1	3
1467	152	4	2018-03-26	2018-03-27	2018-03-29	2	7
1468	3	4	2018-03-27	2018-03-30	2018-03-29	1	2
1469	1135	4	2018-03-27	2018-03-28	2018-03-30	3	8
1470	505	4	2018-03-28	2018-03-31	2018-03-31	2	7
1471	1310	4	2018-03-28	2018-03-30	2018-03-29	2	7
1472	114	4	2018-03-29	2018-03-30	2018-03-31	2	6
1473	302	4	2018-03-30	2018-04-01	2018-04-02	1	2
1474	816	4	2018-03-30	2018-04-01	2018-04-02	1	3
1475	112	4	2018-03-30	2018-04-01	2018-03-31	2	6
1476	35	4	2018-03-31	2018-04-01	2018-04-01	2	7
1477	180	4	2018-03-31	2018-04-03	2018-04-01	2	6
1478	392	4	2018-03-31	2018-04-02	2018-04-02	2	6
1479	23	2	2018-04-01	2018-04-01	\N	2	7
1480	27	2	2018-04-01	2018-04-01	\N	2	7
1481	62	1	2018-04-01	2018-04-01	\N	2	6
1482	94	1	2018-04-01	2018-04-01	\N	2	7
1483	15	1	2018-04-02	2018-04-02	\N	2	7
1484	35	2	2018-04-02	2018-04-02	\N	2	6
1485	51	2	2018-04-02	2018-04-02	\N	2	7
1486	84	2	2018-04-02	2018-04-02	\N	2	7
1487	33	1	2018-04-03	2018-04-03	\N	1	3
1488	181	2	2018-04-03	2018-04-03	\N	1	3
1489	194	1	2018-04-03	2018-04-03	\N	1	3
1490	217	2	2018-04-03	2018-04-03	\N	1	3
1491	82	1	2018-04-04	2018-04-04	\N	1	3
1492	41	1	2018-04-04	2018-04-04	\N	2	7
1493	64	2	2018-04-04	2018-04-04	\N	3	8
1494	69	2	2018-04-05	2018-04-05	\N	1	3
1495	86	2	2018-04-05	2018-04-05	\N	2	7
1496	3	1	2018-04-06	2018-04-06	\N	1	3
1497	31	2	2018-04-06	2018-04-06	\N	1	2
1498	81	1	2018-04-06	2018-04-06	\N	1	2
1499	120	2	2018-04-06	2018-04-06	\N	1	2
1500	151	2	2018-04-06	2018-04-06	\N	1	3
1501	52	1	2018-04-06	2018-04-06	\N	2	6
1502	83	2	2018-04-06	2018-04-06	\N	2	6
1503	208	2	2018-04-07	2018-04-07	\N	1	3
1504	237	2	2018-04-08	2018-04-08	\N	1	2
1505	22	1	2018-04-08	2018-04-08	\N	2	7
1506	75	1	2018-04-08	2018-04-08	\N	2	7
1507	85	2	2018-04-08	2018-04-08	\N	2	6
1508	92	2	2018-04-08	2018-04-08	\N	2	6
1509	2	1	2018-04-09	2018-04-09	\N	1	3
1510	16	2	2018-04-09	2018-04-09	\N	2	6
1511	25	1	2018-04-09	2018-04-09	\N	2	6
1512	68	1	2018-04-09	2018-04-09	\N	3	9
1513	32	2	2018-04-10	2018-04-10	\N	1	2
1514	87	2	2018-04-10	2018-04-10	\N	1	3
1515	61	1	2018-04-10	2018-04-10	\N	3	9
1516	47	2	2018-04-11	2018-04-11	\N	1	3
1517	97	1	2018-04-11	2018-04-11	\N	1	2
1518	175	1	2018-04-11	2018-04-11	\N	1	2
1519	26	2	2018-04-11	2018-04-11	\N	2	7
1520	66	2	2018-04-11	2018-04-11	\N	3	8
1521	53	1	2018-04-12	2018-04-12	\N	1	3
1522	78	1	2018-04-12	2018-04-12	\N	1	3
1523	8	1	2018-04-12	2018-04-12	\N	2	7
1524	37	1	2018-04-12	2018-04-12	\N	2	6
1525	38	2	2018-04-12	2018-04-12	\N	2	7
1526	59	2	2018-04-12	2018-04-12	\N	2	7
1527	13	2	2018-04-12	2018-04-12	\N	3	9
1528	20	1	2018-04-12	2018-04-12	\N	3	8
1529	50	1	2018-04-12	2018-04-12	\N	3	8
1530	110	1	2018-04-13	2018-04-13	\N	1	2
1531	233	1	2018-04-13	2018-04-13	\N	1	2
1532	7	2	2018-04-13	2018-04-13	\N	2	7
1533	28	2	2018-04-13	2018-04-13	\N	2	6
1534	18	2	2018-04-14	2018-04-14	\N	2	7
1535	19	2	2018-04-14	2018-04-14	\N	2	7
1536	34	2	2018-04-14	2018-04-14	\N	2	7
1537	36	1	2018-04-15	2018-04-15	\N	2	6
1538	79	2	2018-04-15	2018-04-15	\N	2	6
1539	116	1	2018-04-15	2018-04-15	\N	3	9
1540	187	1	2018-04-16	2018-04-16	\N	1	2
1541	10	2	2018-04-16	2018-04-16	\N	2	7
1542	58	2	2018-04-16	2018-04-16	\N	2	6
1543	76	1	2018-04-16	2018-04-16	\N	2	6
1544	5	1	2018-04-17	2018-04-17	\N	1	2
1545	67	1	2018-04-17	2018-04-17	\N	1	3
1546	91	2	2018-04-17	2018-04-17	\N	1	3
1547	169	1	2018-04-17	2018-04-17	\N	1	3
1548	170	1	2018-04-17	2018-04-17	\N	1	2
1549	17	1	2018-04-17	2018-04-17	\N	2	7
1550	39	1	2018-04-17	2018-04-17	\N	2	6
1551	70	1	2018-04-17	2018-04-17	\N	2	7
1552	73	1	2018-04-17	2018-04-17	\N	2	7
1553	30	2	2018-04-18	2018-04-18	\N	1	3
1554	172	1	2018-04-18	2018-04-18	\N	1	3
1555	1	1	2018-04-18	2018-04-18	\N	2	7
1556	4	2	2018-04-18	2018-04-18	\N	2	6
1557	121	2	2018-04-19	2018-04-19	\N	1	3
1558	63	1	2018-04-19	2018-04-19	\N	2	6
1559	42	2	2018-04-20	2018-04-20	\N	2	6
1560	57	1	2018-04-20	2018-04-20	\N	2	7
1561	65	2	2018-04-20	2018-04-20	\N	2	7
1562	88	1	2018-04-20	2018-04-20	\N	2	7
1563	77	2	2018-04-20	2018-04-20	\N	3	9
1564	46	1	2018-04-21	2018-04-21	\N	1	3
1565	60	2	2018-04-21	2018-04-21	\N	1	2
1566	72	1	2018-04-21	2018-04-21	\N	1	3
1567	89	2	2018-04-21	2018-04-21	\N	1	2
1568	192	2	2018-04-21	2018-04-21	\N	1	3
1569	29	2	2018-04-22	2018-04-22	\N	2	7
1570	54	2	2018-04-22	2018-04-22	\N	2	7
1571	80	1	2018-04-22	2018-04-22	\N	2	7
1572	14	1	2018-04-22	2018-04-22	\N	3	9
1573	24	2	2018-04-23	2018-04-23	\N	1	2
1574	124	1	2018-04-23	2018-04-23	\N	1	2
1575	224	2	2018-04-23	2018-04-23	\N	1	3
1576	12	2	2018-04-23	2018-04-23	\N	2	7
1577	48	1	2018-04-23	2018-04-23	\N	2	7
1578	93	2	2018-04-23	2018-04-23	\N	2	7
1579	104	2	2018-04-24	2018-04-24	\N	1	2
1580	191	2	2018-04-24	2018-04-24	\N	1	2
1581	188	2	2018-04-25	2018-04-25	\N	1	2
1582	240	1	2018-04-25	2018-04-25	\N	1	3
1583	44	1	2018-04-25	2018-04-25	\N	2	6
1584	109	2	2018-04-26	2018-04-26	\N	1	3
1585	157	1	2018-04-26	2018-04-26	\N	1	3
1586	176	1	2018-04-26	2018-04-26	\N	1	2
1587	231	2	2018-04-26	2018-04-26	\N	1	2
1588	11	1	2018-04-26	2018-04-26	\N	2	6
1589	40	2	2018-04-27	2018-04-27	\N	1	3
1590	138	1	2018-04-27	2018-04-27	\N	1	3
1591	165	2	2018-04-27	2018-04-27	\N	1	2
1592	6	2	2018-04-27	2018-04-27	\N	2	7
1593	9	1	2018-04-27	2018-04-27	\N	2	6
1594	45	1	2018-04-28	2018-04-28	\N	2	7
1595	71	2	2018-04-28	2018-04-28	\N	2	7
1596	21	2	2018-04-28	2018-04-28	\N	3	8
1597	56	1	2018-04-28	2018-04-28	\N	3	9
1598	239	2	2018-04-29	2018-04-29	\N	1	3
1599	49	1	2018-04-29	2018-04-29	\N	2	7
1600	90	1	2018-04-29	2018-04-29	\N	2	6
1601	43	1	2018-04-29	2018-04-29	\N	3	8
1602	55	1	2018-04-30	2018-04-30	\N	2	6
1603	74	2	2018-04-30	2018-04-30	\N	2	6
1604	7	3	2018-06-17	2018-06-17	\N	2	7
1605	123	3	2018-07-01	2018-07-01	\N	3	8
1606	119	3	2018-07-10	2018-07-10	\N	3	8
1607	33	3	2018-07-11	2018-07-11	\N	1	2
1608	53	3	2018-07-12	2018-07-12	\N	1	2
1609	10	3	2018-08-23	2018-08-23	\N	2	7
1610	15	3	2018-08-25	2018-08-25	\N	2	7
1611	6	3	2018-09-06	2018-09-06	\N	2	7
1612	3	3	2018-10-21	2018-10-21	\N	1	3
1613	1	3	2018-11-18	2018-11-18	\N	2	6
1614	135	3	2018-11-28	2018-11-28	\N	3	8
1615	136	3	2018-12-28	2018-12-28	\N	3	8
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_name, brand_id, category_id, model_year, list_price) FROM stdin;
163	Surly Pack Rat - 2018	8	7	2018	1349.00
1	Trek 820 - 2016	9	6	2016	379.99
2	Ritchey Timberwolf Frameset - 2016	5	6	2016	749.99
3	Surly Wednesday Frameset - 2016	8	6	2016	999.99
4	Trek Fuel EX 8 29 - 2016	9	6	2016	2899.99
5	Heller Shagamaw Frame - 2016	3	6	2016	1320.99
6	Surly Ice Cream Truck Frameset - 2016	8	6	2016	469.99
7	Trek Slash 8 27.5 - 2016	9	6	2016	3999.99
8	Trek Remedy 29 Carbon Frameset - 2016	9	6	2016	1799.99
9	Trek Conduit+ - 2016	9	5	2016	2999.99
10	Surly Straggler - 2016	8	4	2016	1549.00
11	Surly Straggler 650b - 2016	8	4	2016	1680.99
12	Electra Townie Original 21D - 2016	1	3	2016	549.99
13	Electra Cruiser 1 (24-Inch) - 2016	1	3	2016	269.99
14	Electra Girl's Hawaii 1 (16-inch) - 2015/2016	1	3	2016	269.99
15	Electra Moto 1 - 2016	1	3	2016	529.99
16	Electra Townie Original 7D EQ - 2016	1	3	2016	599.99
17	Pure Cycles Vine 8-Speed - 2016	4	3	2016	429.00
18	Pure Cycles Western 3-Speed - Women's - 2015/2016	4	3	2016	449.00
19	Pure Cycles William 3-Speed - 2016	4	3	2016	449.00
20	Electra Townie Original 7D EQ - Women's - 2016	1	3	2016	599.99
21	Electra Cruiser 1 (24-Inch) - 2016	1	1	2016	269.99
22	Electra Girl's Hawaii 1 (16-inch) - 2015/2016	1	1	2016	269.99
23	Electra Girl's Hawaii 1 (20-inch) - 2015/2016	1	1	2016	299.99
24	Electra Townie Original 21D - 2016	1	2	2016	549.99
25	Electra Townie Original 7D - 2015/2016	1	2	2016	499.99
26	Electra Townie Original 7D EQ - 2016	1	2	2016	599.99
27	Surly Big Dummy Frameset - 2017	8	6	2017	999.99
28	Surly Karate Monkey 27.5+ Frameset - 2017	8	6	2017	2499.99
29	Trek X-Caliber 8 - 2017	9	6	2017	999.99
30	Surly Ice Cream Truck Frameset - 2017	8	6	2017	999.99
31	Surly Wednesday - 2017	8	6	2017	1632.99
32	Trek Farley Alloy Frameset - 2017	9	6	2017	469.99
33	Surly Wednesday Frameset - 2017	8	6	2017	469.99
34	Trek Session DH 27.5 Carbon Frameset - 2017	9	6	2017	469.99
35	Sun Bicycles Spider 3i - 2017	7	6	2017	832.99
36	Surly Troll Frameset - 2017	8	6	2017	832.99
37	Haro Flightline One ST - 2017	2	6	2017	379.99
38	Haro Flightline Two 26 Plus - 2017	2	6	2017	549.99
39	Trek Stache 5 - 2017	9	6	2017	1499.99
40	Trek Fuel EX 9.8 29 - 2017	9	6	2017	4999.99
41	Haro Shift R3 - 2017	2	6	2017	1469.99
42	Trek Fuel EX 5 27.5 Plus - 2017	9	6	2017	2299.99
43	Trek Fuel EX 9.8 27.5 Plus - 2017	9	6	2017	5299.99
44	Haro SR 1.1 - 2017	2	6	2017	539.99
45	Haro SR 1.2 - 2017	2	6	2017	869.99
46	Haro SR 1.3 - 2017	2	6	2017	1409.99
47	Trek Remedy 9.8 - 2017	9	6	2017	5299.99
48	Trek Emonda S 4 - 2017	9	7	2017	1499.99
49	Trek Domane SL 6 - 2017	9	7	2017	3499.99
50	Trek Silque SLR 7 Women's - 2017	9	7	2017	5999.99
51	Trek Silque SLR 8 Women's - 2017	9	7	2017	6499.99
52	Surly Steamroller - 2017	8	7	2017	875.99
53	Surly Ogre Frameset - 2017	8	7	2017	749.99
54	Trek Domane SL Disc Frameset - 2017	9	7	2017	3199.99
55	Trek Domane S 6 - 2017	9	7	2017	2699.99
56	Trek Domane SLR 6 Disc - 2017	9	7	2017	5499.99
57	Trek Emonda S 5 - 2017	9	7	2017	1999.99
58	Trek Madone 9.2 - 2017	9	7	2017	4999.99
59	Trek Domane S 5 Disc - 2017	9	7	2017	2599.99
60	Sun Bicycles ElectroLite - 2017	7	5	2017	1559.99
61	Trek Powerfly 8 FS Plus - 2017	9	5	2017	4999.99
62	Trek Boone 7 - 2017	9	4	2017	3499.99
63	Trek Boone Race Shop Limited - 2017	9	4	2017	3499.99
64	Electra Townie Original 7D - 2017	1	3	2017	489.99
65	Sun Bicycles Lil Bolt Type-R - 2017	7	3	2017	346.99
66	Sun Bicycles Revolutions 24 - 2017	7	3	2017	250.99
67	Sun Bicycles Revolutions 24 - Girl's - 2017	7	3	2017	250.99
68	Sun Bicycles Cruz 3 - 2017	7	3	2017	449.99
69	Sun Bicycles Cruz 7 - 2017	7	3	2017	416.99
70	Electra Amsterdam Original 3i - 2015/2017	1	3	2017	659.99
71	Sun Bicycles Atlas X-Type - 2017	7	3	2017	416.99
72	Sun Bicycles Biscayne Tandem 7 - 2017	7	3	2017	619.99
73	Sun Bicycles Brickell Tandem 7 - 2017	7	3	2017	749.99
74	Electra Cruiser Lux 1 - 2017	1	3	2017	439.99
75	Electra Cruiser Lux Fat Tire 1 Ladies - 2017	1	3	2017	599.99
76	Electra Girl's Hawaii 1 16" - 2017	1	3	2017	299.99
77	Electra Glam Punk 3i Ladies' - 2017	1	3	2017	799.99
78	Sun Bicycles Biscayne Tandem CB - 2017	7	3	2017	647.99
79	Sun Bicycles Boardwalk (24-inch Wheels) - 2017	7	3	2017	402.99
80	Sun Bicycles Brickell Tandem CB - 2017	7	3	2017	761.99
81	Electra Amsterdam Fashion 7i Ladies' - 2017	1	3	2017	1099.99
82	Electra Amsterdam Original 3i Ladies' - 2017	1	3	2017	659.99
83	Trek Boy's Kickster - 2015/2017	9	1	2017	149.99
84	Sun Bicycles Lil Kitt'n - 2017	7	1	2017	109.99
85	Haro Downtown 16 - 2017	2	1	2017	329.99
86	Trek Girl's Kickster - 2017	9	1	2017	149.99
87	Trek Precaliber 12 Boys - 2017	9	1	2017	189.99
88	Trek Precaliber 12 Girls - 2017	9	1	2017	189.99
89	Trek Precaliber 16 Boys - 2017	9	1	2017	209.99
90	Trek Precaliber 16 Girls - 2017	9	1	2017	209.99
91	Trek Precaliber 24 (21-Speed) - Girls - 2017	9	1	2017	349.99
92	Haro Shredder 20 - 2017	2	1	2017	209.99
93	Haro Shredder 20 Girls - 2017	2	1	2017	209.99
94	Haro Shredder Pro 20 - 2017	2	1	2017	249.99
95	Electra Girl's Hawaii 1 16" - 2017	1	1	2017	299.99
96	Electra Moto 3i (20-inch) - Boy's - 2017	1	1	2017	349.99
97	Electra Savannah 3i (20-inch) - Girl's - 2017	1	1	2017	349.99
98	Electra Straight 8 3i (20-inch) - Boy's - 2017	1	1	2017	489.99
99	Electra Sugar Skulls 1 (20-inch) - Girl's - 2017	1	1	2017	299.99
100	Electra Townie 3i EQ (20-inch) - Boys' - 2017	1	1	2017	489.99
101	Electra Townie 7D (20-inch) - Boys' - 2017	1	1	2017	339.99
102	Electra Townie Original 7D - 2017	1	2	2017	489.99
103	Sun Bicycles Streamway 3 - 2017	7	2	2017	551.99
104	Sun Bicycles Streamway - 2017	7	2	2017	481.99
105	Sun Bicycles Streamway 7 - 2017	7	2	2017	533.99
106	Sun Bicycles Cruz 3 - 2017	7	2	2017	449.99
107	Sun Bicycles Cruz 7 - 2017	7	2	2017	416.99
108	Sun Bicycles Cruz 3 - Women's - 2017	7	2	2017	449.99
109	Sun Bicycles Cruz 7 - Women's - 2017	7	2	2017	416.99
110	Sun Bicycles Drifter 7 - 2017	7	2	2017	470.99
111	Sun Bicycles Drifter 7 - Women's - 2017	7	2	2017	470.99
112	Trek 820 - 2018	9	6	2018	379.99
113	Trek Marlin 5 - 2018	9	6	2018	489.99
114	Trek Marlin 6 - 2018	9	6	2018	579.99
115	Trek Fuel EX 8 29 - 2018	9	6	2018	3199.99
116	Trek Marlin 7 - 2017/2018	9	6	2018	749.99
117	Trek Ticket S Frame - 2018	9	6	2018	1469.99
118	Trek X-Caliber 8 - 2018	9	6	2018	999.99
119	Trek Kids' Neko - 2018	9	6	2018	469.99
120	Trek Fuel EX 7 29 - 2018	9	6	2018	2499.99
121	Surly Krampus Frameset - 2018	8	6	2018	2499.99
122	Surly Troll Frameset - 2018	8	6	2018	2499.99
123	Trek Farley Carbon Frameset - 2018	9	6	2018	999.99
124	Surly Krampus - 2018	8	6	2018	1499.00
125	Trek Kids' Dual Sport - 2018	9	6	2018	469.99
126	Surly Big Fat Dummy Frameset - 2018	8	6	2018	469.99
127	Surly Pack Rat Frameset - 2018	8	6	2018	469.99
128	Surly ECR 27.5 - 2018	8	6	2018	1899.00
129	Trek X-Caliber 7 - 2018	9	6	2018	919.99
130	Trek Stache Carbon Frameset - 2018	9	6	2018	919.99
131	Heller Bloodhound Trail - 2018	3	6	2018	2599.00
132	Trek Procal AL Frameset - 2018	9	6	2018	1499.99
133	Trek Procaliber Frameset - 2018	9	6	2018	1499.99
134	Trek Remedy 27.5 C Frameset - 2018	9	6	2018	1499.99
135	Trek X-Caliber Frameset - 2018	9	6	2018	1499.99
136	Trek Procaliber 6 - 2018	9	6	2018	1799.99
137	Heller Shagamaw GX1 - 2018	3	6	2018	2599.00
138	Trek Fuel EX 5 Plus - 2018	9	6	2018	2249.99
139	Trek Remedy 7 27.5 - 2018	9	6	2018	2999.99
140	Trek Remedy 9.8 27.5 - 2018	9	6	2018	4999.99
141	Trek Stache 5 - 2018	9	6	2018	1599.99
142	Trek Fuel EX 8 29 XT - 2018	9	6	2018	3199.99
143	Trek Domane ALR 3 - 2018	9	7	2018	1099.99
144	Trek Domane ALR 4 Disc - 2018	9	7	2018	1549.99
145	Trek Domane ALR 5 Disc - 2018	9	7	2018	1799.99
146	Trek Domane SLR 6 - 2018	9	7	2018	4999.99
147	Trek Domane ALR 5 Gravel - 2018	9	7	2018	1799.99
148	Trek Domane SL 8 Disc - 2018	9	7	2018	5499.99
149	Trek Domane SLR 8 Disc - 2018	9	7	2018	7499.99
150	Trek Emonda SL 7 - 2018	9	7	2018	4499.99
151	Trek Domane ALR 4 Disc Women's - 2018	9	7	2018	1549.99
152	Trek Domane SL 5 Disc Women's - 2018	9	7	2018	2499.99
153	Trek Domane SL 7 Women's - 2018	9	7	2018	4999.99
154	Trek Domane SLR 6 Disc Women's - 2018	9	7	2018	5499.99
155	Trek Domane SLR 9 Disc - 2018	9	7	2018	11999.99
156	Trek Domane SL Frameset - 2018	9	7	2018	6499.99
157	Trek Domane SL Frameset Women's - 2018	9	7	2018	6499.99
158	Trek CrossRip 1 - 2018	9	7	2018	959.99
159	Trek Emonda ALR 6 - 2018	9	7	2018	2299.99
160	Trek Emonda SLR 6 - 2018	9	7	2018	4499.99
161	Surly ECR - 2018	8	7	2018	1899.00
162	Trek Emonda SL 6 Disc - 2018	9	7	2018	2999.99
164	Surly Straggler 650b - 2018	8	7	2018	1549.00
165	Trek 1120 - 2018	9	7	2018	2499.99
166	Trek Domane AL 2 Women's - 2018	9	7	2018	749.99
167	Surly ECR Frameset - 2018	8	7	2018	749.99
168	Surly Straggler - 2018	8	7	2018	1549.00
169	Trek Emonda SLR 8 - 2018	9	7	2018	6499.99
170	Trek CrossRip 2 - 2018	9	7	2018	1299.99
171	Trek Domane SL 6 - 2018	9	7	2018	3199.99
172	Trek Domane ALR Disc Frameset - 2018	9	7	2018	3199.99
173	Trek Domane ALR Frameset - 2018	9	7	2018	3199.99
174	Trek Domane SLR Disc Frameset - 2018	9	7	2018	3199.99
175	Trek Domane SLR Frameset - 2018	9	7	2018	3199.99
176	Trek Madone 9 Frameset - 2018	9	7	2018	3199.99
177	Trek Domane SLR 6 Disc - 2018	9	7	2018	5499.99
178	Trek Domane AL 2 - 2018	9	7	2018	749.99
179	Trek Domane AL 3 - 2018	9	7	2018	919.99
180	Trek Domane AL 3 Women's - 2018	9	7	2018	919.99
181	Trek Domane SL 5 - 2018	9	7	2018	2199.99
182	Trek Domane SL 5 Disc - 2018	9	7	2018	2499.99
183	Trek Domane SL 5 Women's - 2018	9	7	2018	2199.99
184	Trek Domane SL 6 Disc - 2018	9	7	2018	3499.99
185	Trek Conduit+ - 2018	9	5	2018	2799.99
186	Trek CrossRip+ - 2018	9	5	2018	4499.99
187	Trek Neko+ - 2018	9	5	2018	2799.99
188	Trek XM700+ Lowstep - 2018	9	5	2018	3499.99
189	Trek Lift+ Lowstep - 2018	9	5	2018	2799.99
190	Trek Dual Sport+ - 2018	9	5	2018	2799.99
191	Electra Loft Go! 8i - 2018	1	5	2018	2799.99
192	Electra Townie Go! 8i - 2017/2018	1	5	2018	2599.99
193	Trek Lift+ - 2018	9	5	2018	2799.99
194	Trek XM700+ - 2018	9	5	2018	3499.99
195	Electra Townie Go! 8i Ladies' - 2018	1	5	2018	2599.99
196	Trek Verve+ - 2018	9	5	2018	2299.99
197	Trek Verve+ Lowstep - 2018	9	5	2018	2299.99
198	Electra Townie Commute Go! - 2018	1	5	2018	2999.99
199	Electra Townie Commute Go! Ladies' - 2018	1	5	2018	2999.99
200	Trek Powerfly 5 - 2018	9	5	2018	3499.99
201	Trek Powerfly 5 FS - 2018	9	5	2018	4499.99
202	Trek Powerfly 5 Women's - 2018	9	5	2018	3499.99
203	Trek Powerfly 7 FS - 2018	9	5	2018	4999.99
204	Trek Super Commuter+ 7 - 2018	9	5	2018	3599.99
205	Trek Super Commuter+ 8S - 2018	9	5	2018	4999.99
206	Trek Boone 5 Disc - 2018	9	4	2018	3299.99
207	Trek Boone 7 Disc - 2018	9	4	2018	3999.99
208	Trek Crockett 5 Disc - 2018	9	4	2018	1799.99
209	Trek Crockett 7 Disc - 2018	9	4	2018	2999.99
210	Surly Straggler - 2018	8	4	2018	1549.00
211	Surly Straggler 650b - 2018	8	4	2018	1549.00
212	Electra Townie Original 21D - 2018	1	3	2018	559.99
213	Electra Cruiser 1 - 2016/2017/2018	1	3	2018	269.99
214	Electra Tiger Shark 3i - 2018	1	3	2018	899.99
215	Electra Queen of Hearts 3i - 2018	1	3	2018	749.99
216	Electra Super Moto 8i - 2018	1	3	2018	899.99
217	Electra Straight 8 3i - 2018	1	3	2018	909.99
218	Electra Cruiser 7D - 2016/2017/2018	1	3	2018	319.99
219	Electra Moto 3i - 2018	1	3	2018	639.99
220	Electra Cruiser 1 Ladies' - 2018	1	3	2018	269.99
221	Electra Cruiser 7D Ladies' - 2016/2018	1	3	2018	319.99
222	Electra Cruiser 1 Tall - 2016/2018	1	3	2018	269.99
223	Electra Cruiser Lux 3i - 2018	1	3	2018	529.99
224	Electra Cruiser Lux 7D - 2018	1	3	2018	479.99
225	Electra Delivery 3i - 2016/2017/2018	1	3	2018	959.99
226	Electra Townie Original 21D EQ - 2017/2018	1	3	2018	679.99
227	Electra Cruiser 7D (24-Inch) Ladies' - 2016/2018	1	3	2018	319.99
228	Electra Cruiser 7D Tall - 2016/2018	1	3	2018	319.99
229	Electra Cruiser Lux 1 - 2016/2018	1	3	2018	429.99
230	Electra Cruiser Lux 1 Ladies' - 2018	1	3	2018	429.99
231	Electra Cruiser Lux 3i Ladies' - 2018	1	3	2018	529.99
232	Electra Cruiser Lux 7D Ladies' - 2018	1	3	2018	479.99
233	Electra Cruiser Lux Fat Tire 7D - 2018	1	3	2018	639.99
234	Electra Daydreamer 3i Ladies' - 2018	1	3	2018	899.99
235	Electra Koa 3i Ladies' - 2018	1	3	2018	899.99
236	Electra Morningstar 3i Ladies' - 2018	1	3	2018	749.99
237	Electra Relic 3i - 2018	1	3	2018	849.99
238	Electra Townie Balloon 8D EQ - 2016/2017/2018	1	3	2018	749.99
239	Electra Townie Balloon 8D EQ Ladies' - 2016/2017/2018	1	3	2018	749.99
240	Electra Townie Commute 27D Ladies - 2018	1	3	2018	899.99
241	Electra Townie Commute 8D - 2018	1	3	2018	749.99
242	Electra Townie Commute 8D Ladies' - 2018	1	3	2018	699.99
243	Electra Townie Original 21D EQ Ladies' - 2018	1	3	2018	679.99
244	Electra Townie Original 21D Ladies' - 2018	1	3	2018	559.99
245	Electra Townie Original 3i EQ - 2017/2018	1	3	2018	659.99
246	Electra Townie Original 3i EQ Ladies' - 2018	1	3	2018	639.99
247	Electra Townie Original 7D EQ - 2018	1	3	2018	599.99
248	Electra Townie Original 7D EQ Ladies' - 2017/2018	1	3	2018	599.99
249	Electra White Water 3i - 2018	1	3	2018	749.99
250	Electra Townie Go! 8i - 2017/2018	1	3	2018	2599.99
251	Electra Townie Commute Go! - 2018	1	3	2018	2999.99
252	Electra Townie Commute Go! Ladies' - 2018	1	3	2018	2999.99
253	Electra Townie Go! 8i Ladies' - 2018	1	3	2018	2599.99
254	Electra Townie Balloon 3i EQ - 2017/2018	1	3	2018	749.99
255	Electra Townie Balloon 7i EQ Ladies' - 2017/2018	1	3	2018	899.99
256	Electra Townie Commute 27D - 2018	1	3	2018	899.99
257	Electra Amsterdam Fashion 3i Ladies' - 2017/2018	1	3	2018	899.99
258	Electra Amsterdam Royal 8i - 2017/2018	1	3	2018	1259.90
259	Electra Amsterdam Royal 8i Ladies - 2018	1	3	2018	1199.99
260	Electra Townie Balloon 3i EQ Ladies' - 2018	1	3	2018	799.99
261	Electra Townie Balloon 7i EQ - 2018	1	3	2018	899.99
262	Trek MT 201 - 2018	9	1	2018	249.99
263	Strider Classic 12 Balance Bike - 2018	6	1	2018	89.99
264	Strider Sport 16 - 2018	6	1	2018	249.99
265	Strider Strider 20 Sport - 2018	6	1	2018	289.99
266	Trek Superfly 20 - 2018	9	1	2018	399.99
267	Trek Precaliber 12 Girl's - 2018	9	1	2018	199.99
268	Trek Kickster - 2018	9	1	2018	159.99
269	Trek Precaliber 12 Boy's - 2018	9	1	2018	199.99
270	Trek Precaliber 16 Boy's - 2018	9	1	2018	209.99
271	Trek Precaliber 16 Girl's - 2018	9	1	2018	209.99
272	Trek Precaliber 20 6-speed Boy's - 2018	9	1	2018	289.99
273	Trek Precaliber 20 6-speed Girl's - 2018	9	1	2018	289.99
274	Trek Precaliber 20 Boy's - 2018	9	1	2018	229.99
275	Trek Precaliber 20 Girl's - 2018	9	1	2018	229.99
276	Trek Precaliber 24 (7-Speed) - Boys - 2018	9	1	2018	319.99
277	Trek Precaliber 24 21-speed Boy's - 2018	9	1	2018	369.99
278	Trek Precaliber 24 21-speed Girl's - 2018	9	1	2018	369.99
279	Trek Precaliber 24 7-speed Girl's - 2018	9	1	2018	319.99
280	Trek Superfly 24 - 2017/2018	9	1	2018	489.99
281	Electra Cruiser 7D (24-Inch) Ladies' - 2016/2018	1	1	2018	319.99
282	Electra Cyclosaurus 1 (16-inch) - Boy's - 2018	1	1	2018	279.99
283	Electra Heartchya 1 (20-inch) - Girl's - 2018	1	1	2018	319.99
284	Electra Savannah 1 (20-inch) - Girl's - 2018	1	1	2018	319.99
285	Electra Soft Serve 1 (16-inch) - Girl's - 2018	1	1	2018	279.99
286	Electra Starship 1 16" - 2018	1	1	2018	279.99
287	Electra Straight 8 1 (16-inch) - Boy's - 2018	1	1	2018	279.99
288	Electra Straight 8 1 (20-inch) - Boy's - 2018	1	1	2018	389.99
289	Electra Superbolt 1 20" - 2018	1	1	2018	319.99
290	Electra Superbolt 3i 20" - 2018	1	1	2018	369.99
291	Electra Sweet Ride 1 (20-inch) - Girl's - 2018	1	1	2018	319.99
292	Electra Sweet Ride 3i (20-inch) - Girls' - 2018	1	1	2018	369.99
293	Electra Tiger Shark 1 (20-inch) - Boys' - 2018	1	1	2018	319.99
294	Electra Tiger Shark 3i (20-inch) - Boys' - 2018	1	1	2018	369.99
295	Electra Treasure 1 20" - 2018	1	1	2018	319.99
296	Electra Treasure 3i 20" - 2018	1	1	2018	369.99
297	Electra Under-The-Sea 1 16" - 2018	1	1	2018	279.99
298	Electra Water Lily 1 (16-inch) - Girl's - 2018	1	1	2018	279.99
299	Electra Townie Original 21D - 2018	1	2	2018	559.99
300	Electra Townie Balloon 3i EQ Ladies' - 2018	1	2	2018	799.99
301	Electra Townie Balloon 7i EQ - 2018	1	2	2018	899.99
302	Electra Townie Original 1 - 2018	1	2	2018	449.99
303	Electra Townie Go! 8i - 2017/2018	1	2	2018	2599.99
304	Electra Townie Original 21D EQ - 2017/2018	1	2	2018	679.99
305	Electra Townie Balloon 3i EQ - 2017/2018	1	2	2018	749.99
306	Electra Townie Balloon 7i EQ Ladies' - 2017/2018	1	2	2018	899.99
307	Electra Townie Balloon 8D EQ - 2016/2017/2018	1	2	2018	749.99
308	Electra Townie Balloon 8D EQ Ladies' - 2016/2017/2018	1	2	2018	749.99
309	Electra Townie Commute 27D - 2018	1	2	2018	899.99
310	Electra Townie Commute 27D Ladies - 2018	1	2	2018	899.99
311	Electra Townie Commute 8D - 2018	1	2	2018	749.99
312	Electra Townie Commute 8D Ladies' - 2018	1	2	2018	699.99
313	Electra Townie Original 1 Ladies' - 2018	1	2	2018	449.99
314	Electra Townie Original 21D EQ Ladies' - 2018	1	2	2018	679.99
315	Electra Townie Original 21D Ladies' - 2018	1	2	2018	559.99
316	Trek Checkpoint ALR 4 Women's - 2019	9	7	2019	1699.99
317	Trek Checkpoint ALR 5 - 2019	9	7	2019	1999.99
318	Trek Checkpoint ALR 5 Women's - 2019	9	7	2019	1999.99
319	Trek Checkpoint SL 5 Women's - 2019	9	7	2019	2799.99
320	Trek Checkpoint SL 6 - 2019	9	7	2019	3799.99
321	Trek Checkpoint ALR Frameset - 2019	9	7	2019	3199.99
\.


--
-- Data for Name: staffs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staffs (staff_id, first_name, last_name, email, phone, active, store_id, manager_id) FROM stdin;
1	Fabiola	Jackson	fabiola.jackson@bikes.shop	(831) 555-5554	1	1	\N
2	Mireya	Copeland	mireya.copeland@bikes.shop	(831) 555-5555	1	1	1
3	Genna	Serrano	genna.serrano@bikes.shop	(831) 555-5556	1	1	2
4	Virgie	Wiggins	virgie.wiggins@bikes.shop	(831) 555-5557	1	1	2
5	Jannette	David	jannette.david@bikes.shop	(516) 379-4444	1	2	1
6	Marcelene	Boyer	marcelene.boyer@bikes.shop	(516) 379-4445	1	2	5
7	Venita	Daniel	venita.daniel@bikes.shop	(516) 379-4446	1	2	5
8	Kali	Vargas	kali.vargas@bikes.shop	(972) 530-5555	1	3	1
9	Layla	Terrell	layla.terrell@bikes.shop	(972) 530-5556	1	3	7
10	Bernardine	Houston	bernardine.houston@bikes.shop	(972) 530-5557	1	3	7
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocks (store_id, product_id, quantity) FROM stdin;
1	1	27
1	2	5
1	3	6
1	4	23
1	5	22
1	6	0
1	7	8
1	8	0
1	9	11
1	10	15
1	11	8
1	12	16
1	13	13
1	14	8
1	15	3
1	16	4
1	17	2
1	18	16
1	19	4
1	20	26
1	21	24
1	22	29
1	23	9
1	24	10
1	25	10
1	26	16
1	27	21
1	28	20
1	29	13
1	30	30
1	31	2
1	32	0
1	33	10
1	34	2
1	35	18
1	36	26
1	37	12
1	38	13
1	39	2
1	40	24
1	41	10
1	42	0
1	43	2
1	44	1
1	45	15
1	46	19
1	47	21
1	48	5
1	49	8
1	50	29
1	51	2
1	52	18
1	53	17
1	54	11
1	55	11
1	56	15
1	57	1
1	58	1
1	59	22
1	60	19
1	61	30
1	62	21
1	63	4
1	64	30
1	65	10
1	66	12
1	67	19
1	68	30
1	69	4
1	70	3
1	71	25
1	72	9
1	73	7
1	74	9
1	75	23
1	76	15
1	77	16
1	78	13
1	79	13
1	80	11
1	81	25
1	82	1
1	83	13
1	84	11
1	85	23
1	86	19
1	87	27
1	88	7
1	89	9
1	90	4
1	91	8
1	92	0
1	93	22
1	94	6
1	95	25
1	96	20
1	97	20
1	98	28
1	99	28
1	100	15
1	101	17
1	102	9
1	103	13
1	104	25
1	105	7
1	106	30
1	107	20
1	108	15
1	109	30
1	110	1
1	111	11
1	112	17
1	113	24
1	114	3
1	115	10
1	116	24
1	117	15
1	118	12
1	119	17
1	120	23
1	121	19
1	122	22
1	123	8
1	124	23
1	125	22
1	126	28
1	127	12
1	128	11
1	129	21
1	130	22
1	131	20
1	132	1
1	133	9
1	134	26
1	135	15
1	136	12
1	137	12
1	138	6
1	139	17
1	140	3
1	141	21
1	142	22
1	143	19
1	144	7
1	145	5
1	146	6
1	147	8
1	148	6
1	149	1
1	150	22
1	151	24
1	152	12
1	153	25
1	154	13
1	155	8
1	156	13
1	157	25
1	158	11
1	159	18
1	160	0
1	161	17
1	162	14
1	163	0
1	164	15
1	165	16
1	166	23
1	167	28
1	168	0
1	169	25
1	170	14
1	171	3
1	172	3
1	173	2
1	174	26
1	175	2
1	176	11
1	177	19
1	178	23
1	179	16
1	180	5
1	181	19
1	182	28
1	183	11
1	184	4
1	185	3
1	186	1
1	187	16
1	188	30
1	189	6
1	190	21
1	191	21
1	192	20
1	193	30
1	194	24
1	195	1
1	196	26
1	197	22
1	198	1
1	199	2
1	200	27
1	201	16
1	202	5
1	203	4
1	204	23
1	205	9
1	206	10
1	207	27
1	208	13
1	209	22
1	210	25
1	211	13
1	212	17
1	213	14
1	214	4
1	215	1
1	216	11
1	217	11
1	218	27
1	219	30
1	220	4
1	221	7
1	222	12
1	223	3
1	224	16
1	225	24
1	226	18
1	227	19
1	228	22
1	229	27
1	230	7
1	231	25
1	232	5
1	233	5
1	234	13
1	235	7
1	236	18
1	237	26
1	238	20
1	239	28
1	240	17
1	241	17
1	242	10
1	243	11
1	244	10
1	245	3
1	246	0
1	247	15
1	248	14
1	249	27
1	250	3
1	251	2
1	252	28
1	253	16
1	254	24
1	255	13
1	256	20
1	257	17
1	258	25
1	259	10
1	260	20
1	261	3
1	262	6
1	263	21
1	264	16
1	265	28
1	266	1
1	267	27
1	268	23
1	269	22
1	270	16
1	271	6
1	272	14
1	273	20
1	274	19
1	275	28
1	276	7
1	277	13
1	278	17
1	279	17
1	280	23
1	281	11
1	282	6
1	283	10
1	284	27
1	285	20
1	286	28
1	287	2
1	288	9
1	289	2
1	290	8
1	291	9
1	292	30
1	293	18
1	294	3
1	295	24
1	296	9
1	297	22
1	298	26
1	299	18
1	300	7
1	301	10
1	302	0
1	303	12
1	304	15
1	305	23
1	306	21
1	307	17
1	308	23
1	309	7
1	310	18
1	311	20
1	312	23
1	313	14
2	1	14
2	2	16
2	3	28
2	4	2
2	5	1
2	6	11
2	7	8
2	8	1
2	9	17
2	10	13
2	11	21
2	12	2
2	13	1
2	14	18
2	15	6
2	16	20
2	17	3
2	18	13
2	19	15
2	20	20
2	21	16
2	22	0
2	23	12
2	24	16
2	25	18
2	26	2
2	27	10
2	28	25
2	29	29
2	30	17
2	31	10
2	32	13
2	33	8
2	34	24
2	35	25
2	36	15
2	37	5
2	38	18
2	39	28
2	40	15
2	41	6
2	42	16
2	43	2
2	44	24
2	45	13
2	46	18
2	47	0
2	48	20
2	49	4
2	50	7
2	51	8
2	52	23
2	53	19
2	54	6
2	55	5
2	56	20
2	57	27
2	58	15
2	59	17
2	60	1
2	61	20
2	62	4
2	63	5
2	64	30
2	65	16
2	66	22
2	67	8
2	68	23
2	69	22
2	70	6
2	71	30
2	72	1
2	73	20
2	74	23
2	75	11
2	76	20
2	77	25
2	78	4
2	79	29
2	80	27
2	81	19
2	82	4
2	83	21
2	84	22
2	85	6
2	86	24
2	87	14
2	88	8
2	89	8
2	90	26
2	91	0
2	92	22
2	93	22
2	94	2
2	95	10
2	96	22
2	97	15
2	98	14
2	99	24
2	100	12
2	101	4
2	102	12
2	103	1
2	104	26
2	105	3
2	106	7
2	107	29
2	108	29
2	109	25
2	110	7
2	111	6
2	112	1
2	113	7
2	114	12
2	115	19
2	116	17
2	117	18
2	118	25
2	119	23
2	120	16
2	121	3
2	122	11
2	123	18
2	124	4
2	125	10
2	126	13
2	127	12
2	128	28
2	129	21
2	130	17
2	131	9
2	132	6
2	133	28
2	134	13
2	135	30
2	136	8
2	137	1
2	138	16
2	139	24
2	140	13
2	141	28
2	142	24
2	143	12
2	144	4
2	145	23
2	146	3
2	147	13
2	148	27
2	149	22
2	150	7
2	151	2
2	152	21
2	153	21
2	154	9
2	155	21
2	156	8
2	157	28
2	158	0
2	159	30
2	160	4
2	161	9
2	162	18
2	163	30
2	164	9
2	165	6
2	166	27
2	167	1
2	168	29
2	169	1
2	170	2
2	171	28
2	172	16
2	173	17
2	174	8
2	175	0
2	176	26
2	177	9
2	178	1
2	179	16
2	180	3
2	181	29
2	182	21
2	183	26
2	184	0
2	185	4
2	186	16
2	187	10
2	188	27
2	189	13
2	190	18
2	191	15
2	192	0
2	193	21
2	194	15
2	195	19
2	196	28
2	197	10
2	198	0
2	199	13
2	200	11
2	201	24
2	202	1
2	203	7
2	204	25
2	205	13
2	206	9
2	207	8
2	208	12
2	209	11
2	210	10
2	211	4
2	212	22
2	213	10
2	214	7
2	215	11
2	216	19
2	217	22
2	218	26
2	219	16
2	220	6
2	221	12
2	222	30
2	223	7
2	224	4
2	225	11
2	226	5
2	227	12
2	228	7
2	229	29
2	230	25
2	231	8
2	232	11
2	233	25
2	234	12
2	235	4
2	236	7
2	237	30
2	238	6
2	239	17
2	240	19
2	241	24
2	242	2
2	243	18
2	244	1
2	245	18
2	246	10
2	247	16
2	248	26
2	249	10
2	250	23
2	251	0
2	252	20
2	253	29
2	254	7
2	255	12
2	256	8
2	257	5
2	258	10
2	259	16
2	260	20
2	261	4
2	262	8
2	263	4
2	264	13
2	265	4
2	266	18
2	267	21
2	268	3
2	269	4
2	270	15
2	271	26
2	272	1
2	273	28
2	274	15
2	275	3
2	276	9
2	277	4
2	278	8
2	279	18
2	280	11
2	281	3
2	282	8
2	283	28
2	284	6
2	285	22
2	286	3
2	287	15
2	288	13
2	289	5
2	290	29
2	291	22
2	292	22
2	293	12
2	294	7
2	295	15
2	296	8
2	297	7
2	298	27
2	299	0
2	300	13
2	301	26
2	302	6
2	303	23
2	304	6
2	305	21
2	306	17
2	307	18
2	308	15
2	309	9
2	310	5
2	311	27
2	312	2
2	313	24
3	1	14
3	2	24
3	3	0
3	4	11
3	5	3
3	6	27
3	7	12
3	8	12
3	9	23
3	10	21
3	11	30
3	12	30
3	13	19
3	14	4
3	15	22
3	16	19
3	17	22
3	18	5
3	19	24
3	20	19
3	21	8
3	22	20
3	23	8
3	24	18
3	25	15
3	26	27
3	27	21
3	28	20
3	29	11
3	30	23
3	31	10
3	32	14
3	33	14
3	34	6
3	35	3
3	36	28
3	37	30
3	38	23
3	39	22
3	40	2
3	41	25
3	42	9
3	43	26
3	44	26
3	45	1
3	46	16
3	47	14
3	48	2
3	49	4
3	50	25
3	51	2
3	52	8
3	53	6
3	54	13
3	55	5
3	56	19
3	57	9
3	58	27
3	59	0
3	60	7
3	61	28
3	62	4
3	63	8
3	64	22
3	65	1
3	66	3
3	67	6
3	68	18
3	69	29
3	70	2
3	71	13
3	72	6
3	73	3
3	74	17
3	75	29
3	76	23
3	77	23
3	78	19
3	79	29
3	80	22
3	81	18
3	82	7
3	83	23
3	84	15
3	85	15
3	86	27
3	87	16
3	88	28
3	89	22
3	90	9
3	91	8
3	92	28
3	93	18
3	94	15
3	95	14
3	96	1
3	97	28
3	98	5
3	99	19
3	100	28
3	101	17
3	102	22
3	103	10
3	104	22
3	105	1
3	106	1
3	107	11
3	108	23
3	109	24
3	110	11
3	111	29
3	112	24
3	113	23
3	114	12
3	115	25
3	116	30
3	117	23
3	118	9
3	119	29
3	120	25
3	121	4
3	122	8
3	123	15
3	124	11
3	125	2
3	126	5
3	127	4
3	128	20
3	129	10
3	130	20
3	131	23
3	132	16
3	133	16
3	134	17
3	135	15
3	136	4
3	137	17
3	138	17
3	139	21
3	140	3
3	141	4
3	142	29
3	143	9
3	144	9
3	145	11
3	146	9
3	147	3
3	148	6
3	149	1
3	150	21
3	151	1
3	152	1
3	153	7
3	154	22
3	155	25
3	156	14
3	157	12
3	158	17
3	159	6
3	160	27
3	161	11
3	162	11
3	163	11
3	164	18
3	165	19
3	166	27
3	167	8
3	168	23
3	169	3
3	170	13
3	171	11
3	172	22
3	173	15
3	174	1
3	175	3
3	176	6
3	177	2
3	178	12
3	179	20
3	180	6
3	181	8
3	182	28
3	183	26
3	184	21
3	185	15
3	186	30
3	187	2
3	188	29
3	189	20
3	190	20
3	191	23
3	192	10
3	193	5
3	194	20
3	195	20
3	196	25
3	197	8
3	198	27
3	199	5
3	200	29
3	201	30
3	202	11
3	203	6
3	204	16
3	205	3
3	206	29
3	207	29
3	208	12
3	209	1
3	210	22
3	211	3
3	212	23
3	213	10
3	214	30
3	215	12
3	216	5
3	217	4
3	218	21
3	219	29
3	220	0
3	221	25
3	222	12
3	223	29
3	224	23
3	225	12
3	226	14
3	227	22
3	228	29
3	229	7
3	230	29
3	231	6
3	232	16
3	233	9
3	234	24
3	235	1
3	236	3
3	237	16
3	238	12
3	239	29
3	240	26
3	241	8
3	242	5
3	243	7
3	244	5
3	245	10
3	246	7
3	247	3
3	248	11
3	249	6
3	250	16
3	251	10
3	252	27
3	253	15
3	254	4
3	255	17
3	256	1
3	257	25
3	258	10
3	259	0
3	260	5
3	261	24
3	262	29
3	263	21
3	264	7
3	265	22
3	266	18
3	267	12
3	268	17
3	269	26
3	270	6
3	271	23
3	272	12
3	273	19
3	274	7
3	275	23
3	276	14
3	277	26
3	278	15
3	279	15
3	280	1
3	281	2
3	282	18
3	283	1
3	284	26
3	285	2
3	286	7
3	287	26
3	288	2
3	289	2
3	290	6
3	291	10
3	292	16
3	293	14
3	294	13
3	295	9
3	296	12
3	297	22
3	298	14
3	299	29
3	300	3
3	301	29
3	302	6
3	303	13
3	304	23
3	305	11
3	306	7
3	307	17
3	308	9
3	309	30
3	310	8
3	311	23
3	312	18
3	313	0
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (store_id, store_name, phone, email, street, city, state, zip_code) FROM stdin;
1	Santa Cruz Bikes	(831) 476-4321	santacruz@bikes.shop	3700 Portola Drive	Santa Cruz	CA	95060
2	Baldwin Bikes	(516) 379-8888	baldwin@bikes.shop	4200 Chestnut Lane	Baldwin	NY	11432
3	Rowlett Bikes	(972) 530-5555	rowlett@bikes.shop	8000 Fairway Avenue	Rowlett	TX	75088
\.


--
-- Name: brands_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_brand_id_seq', 1, false);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 1, false);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, false);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 1, false);


--
-- Name: staffs_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staffs_staff_id_seq', 1, false);


--
-- Name: stores_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_store_id_seq', 1, false);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (brand_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_id, item_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: staffs staffs_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffs
    ADD CONSTRAINT staffs_email_key UNIQUE (email);


--
-- Name: staffs staffs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffs
    ADD CONSTRAINT staffs_pkey PRIMARY KEY (staff_id);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (store_id, product_id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (store_id);


--
-- PostgreSQL database dump complete
--

