--
-- PostgreSQL database dump
--

-- Dumped from database version 11.9
-- Dumped by pg_dump version 11.9

-- Started on 2020-11-05 15:06:21

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
-- TOC entry 2869 (class 1262 OID 16978)
-- Name: ProjectETL; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "ProjectETL" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE "ProjectETL" OWNER TO postgres;

\connect "ProjectETL"

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
-- TOC entry 2859 (class 0 OID 17003)
-- Dependencies: 196
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, city_name, state_name, population) FROM stdin;
1	Phoenix	Arizona	4192887
2	Atlanta	Georgia	5286728
3	Baltimore	Maryland	2710489
4	Boston	Massachusettes	4552402
5	Buffalo	New York	1135509
6	Charlotte	North Carolina	2243960
7	Chicago	Illinois	9461105
8	Columbus	Ohio	1901974
9	Cincinnati	Ohio	2137667
10	Cleveland	Ohio	2077240
11	Denver	Colorado	2543482
12	Detroit	Michigan	4296250
13	Green Bay	Wisconsin	306241
14	Houston	Texas	5920416
15	Indianapolis	Indiana	1887877
16	Jacksonville	Florida	1345596
17	Kansas City	Kansas	2009342
18	Las Vegas	Nevada	1951269
19	Los Angeles	California	12828837
20	Memphis	Tennessee	1316100
21	Miami	Florida	5564635
22	Milwaulkie	Wisconsin	1555908
23	Minneapolis	Minnesota	3333633
24	Nashville	Tennessee	1646200
25	New York City	New York	18897109
26	Bay Area	California	4335391
27	Oklahoma City	Oklahoma	1252987
28	Orlando	Florida	2134411
29	Philadelphia	Pennsylvania	5965343
30	Pittsburgh	Pennsylvania	2356285
31	Portland	Oregon	2226009
32	Raleigh	North Carolina	1130490
33	Sacramento	California	2149127
34	Salt Lake City	Utah	1087873
35	San Antonio	Texas	2142508
36	San Diego	California	3095313
37	Seattle	Washington	3439809
38	St. Louis	Missouri	2787701
39	Tampa Bay	Florida	2783243
40	Dallas	Texas	6366542
41	Canada	Canada	33739859
42	Washington	DC	5649540
43	New Orleans	Louisiana 	1189866
\.


--
-- TOC entry 2860 (class 0 OID 17011)
-- Dependencies: 197
-- Data for Name: mlb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mlb (id, team_name, win, loss, tie, win_percent, city_id) FROM stdin;
1	Diamondbacks	65	97	0	0.401234568000000014	1
2	Braves	91	71	0	0.561728395000000047	2
3	Orioles	66	96	0	0.407407406999999999	3
4	Red Sox	89	73	0	0.549382715999999993	4
5	Cubs	75	87	0	0.462962963000000005	7
6	White Sox	88	74	0	0.543209877000000008	7
7	Reds	91	71	0	0.561728395000000047	9
8	Indians	69	93	0	0.42592592600000001	10
9	Rockies	83	79	0	0.512345679000000054	11
10	Tigers	81	81	0	0.5	12
11	Astros	76	86	0	0.469135801999999991	14
12	Royals	67	95	0	0.413580247000000012	17
13	Angels	80	82	0	0.493827159999999987	19
14	Dodgers	80	82	0	0.493827159999999987	19
15	Marlins	80	82	0	0.493827159999999987	21
16	Brewers	77	85	0	0.475308642000000003	22
17	Twins	94	68	0	0.580246913999999947	23
18	Mets	79	83	0	0.487654321000000002	25
19	Yankees	95	67	0	0.586419753000000044	25
20	A's	81	81	0	0.5	41
21	PHI	97	65	0	0.598765431999999986	29
22	Pirates	57	105	0	0.35185185200000002	30
23	Padres	90	72	0	0.55555555599999995	36
24	Giants	92	70	0	0.567901235000000004	41
25	Mariners	61	101	0	0.376543210000000017	37
26	Cardinals	86	76	0	0.530864197999999954	38
27	Rays	96	66	0	0.592592593000000001	39
28	Rangers	90	72	0	0.55555555599999995	40
29	Blue Jays	85	97	0	0.524691357999999997	41
30	Nationals	69	93	0	0.42592592600000001	42
\.


--
-- TOC entry 2862 (class 0 OID 17027)
-- Dependencies: 199
-- Data for Name: nba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nba (id, team_name, win, loss, tie, win_percent, city_id) FROM stdin;
0	Boston Celtics*	50	32	0	0.609999999999999987	4
1	Toronto Raptors	40	42	0	0.487999999999999989	41
2	New York Knicks	29	53	0	0.353999999999999981	25
3	Philadelphia 76ers	27	55	0	0.329000000000000015	29
4	New Jersey Nets	12	70	0	0.145999999999999991	25
5	Cleveland Cavaliers*	61	21	0	0.743999999999999995	10
6	Milwaukee Bucks*	46	36	0	0.561000000000000054	22
7	Chicago Bulls*	41	41	0	0.5	7
8	Indiana Pacers	32	50	0	0.390000000000000013	15
9	Detroit Pistons	27	55	0	0.329000000000000015	12
10	Orlando Magic*	59	23	0	0.719999999999999973	28
11	Atlanta Hawks*	53	29	0	0.646000000000000019	2
12	Miami Heat*	47	35	0	0.572999999999999954	21
13	Charlotte Bobcats*	44	38	0	0.537000000000000033	6
14	Washington Wizards	26	56	0	0.317000000000000004	42
15	Denver Nuggets*	53	29	0	0.646000000000000019	11
16	Utah Jazz*	53	29	0	0.646000000000000019	34
17	Portland Trail Blazers*	50	32	0	0.609999999999999987	31
18	Oklahoma City Thunder*	50	32	0	0.609999999999999987	27
19	Minnesota Timberwolves	15	67	0	0.182999999999999996	23
20	Los Angeles Lakers*	57	25	0	0.694999999999999951	19
21	Phoenix Suns*	54	28	0	0.65900000000000003	1
22	Los Angeles Clippers	29	53	0	0.353999999999999981	19
23	Golden State Warriors	26	56	0	0.317000000000000004	26
24	Sacramento Kings	25	57	0	0.304999999999999993	33
25	Dallas Mavericks*	55	27	0	0.671000000000000041	40
26	San Antonio Spurs*	50	32	0	0.609999999999999987	35
27	Houston Rockets	42	40	0	0.512000000000000011	14
28	Memphis Grizzlies	40	42	0	0.487999999999999989	20
29	New Orleans Hornets	37	45	0	0.451000000000000012	43
\.


--
-- TOC entry 2861 (class 0 OID 17019)
-- Dependencies: 198
-- Data for Name: nfl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nfl (id, team_name, win, loss, tie, win_percent, city_id) FROM stdin;
0	New England Patriots*	10	6	0	0.625	4
1	New York Jets+	9	7	0	0.562999999999999945	25
2	Miami Dolphins	7	9	0	0.438	21
3	Buffalo Bills	6	10	0	0.375	5
4	Cincinnati Bengals*	10	6	0	0.625	9
5	Baltimore Ravens+	9	7	0	0.562999999999999945	3
6	Pittsburgh Steelers	9	7	0	0.562999999999999945	30
7	Cleveland Browns	5	11	0	0.313	10
8	Indianapolis Colts*	14	2	0	0.875	15
9	Houston Texans	9	7	0	0.562999999999999945	14
10	Tennessee Titans	8	8	0	0.5	24
11	Jacksonville Jaguars	7	9	0	0.438	16
12	San Diego Chargers*	13	3	0	0.812999999999999945	36
13	Denver Broncos	8	8	0	0.5	11
14	Oakland Raiders	5	11	0	0.313	26
15	Kansas City Chiefs	4	12	0	0.25	17
16	Dallas Cowboys*	11	5	0	0.687999999999999945	40
17	Philadelphia Eagles+	11	5	0	0.687999999999999945	29
18	New York Giants	8	8	0	0.5	25
19	Washington Redskins	4	12	0	0.25	42
20	Minnesota Vikings*	12	4	0	0.75	23
21	Green Bay Packers+	11	5	0	0.687999999999999945	13
22	Chicago Bears	7	9	0	0.438	7
23	Detroit Lions	2	14	0	0.125	12
24	New Orleans Saints*	13	3	0	0.812999999999999945	43
25	Atlanta Falcons	9	7	0	0.562999999999999945	2
26	Carolina Panthers	8	8	0	0.5	6
27	Tampa Bay Buccaneers	3	13	0	0.188	39
28	Arizona Cardinals*	10	6	0	0.625	1
29	San Francisco 49ers	8	8	0	0.5	26
30	Seattle Seahawks	5	11	0	0.313	37
31	St. Louis Rams	1	15	0	0.0630000000000000004	38
\.


--
-- TOC entry 2863 (class 0 OID 17035)
-- Dependencies: 200
-- Data for Name: nhl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nhl (id, team_name, win, loss, tie, win_percent, city_id) FROM stdin;
1	Thrashers	35	34	13	0.506097561000000029	2
2	Bruines	39	30	13	0.55487804900000004	4
3	Sabres	45	27	10	0.609756097999999969	5
4	Flames	40	32	10	0.548780488000000011	41
5	Blackhawks	52	22	8	0.682926829000000013	7
6	Blue Jackets	32	35	15	0.481707317000000024	8
7	Stars	37	31	14	0.536585365999999953	41
8	Capitals	54	15	13	0.737804878000000053	41
9	Avalanche	43	30	9	0.579268293000000045	11
10	Red Wings	44	24	14	0.621951220000000027	12
11	Oilers	27	47	8	0.378048779999999973	41
12	Kings	46	27	9	0.615853658999999998	19
13	Ducks	39	32	11	0.542682926999999982	41
14	Panthers	32	37	13	0.469512195000000021	21
15	Wild	38	36	8	0.512195121999999947	23
16	Canadiens	39	33	10	0.536585365999999953	41
17	Predators	47	29	6	0.609756097999999969	24
18	Devils	48	27	7	0.628048779999999973	25
19	Rangers	38	33	11	0.530487805000000034	25
20	Islanders	34	37	11	0.481707317000000024	25
21	Senators 	44	32	6	0.573170732000000016	41
22	Flyers	41	35	6	0.536585365999999953	29
23	Coyotes	50	25	7	0.652439023999999979	1
24	Penguins	47	28	7	0.615853658999999998	30
25	Hurricaines	35	37	10	0.487804877999999997	32
26	Sharks	51	20	11	0.689024390000000042	41
27	Blues	40	32	10	0.548780488000000011	38
28	Lightning	34	36	12	0.487804877999999997	39
29	Maple Leafs	30	38	14	0.451219511999999989	41
30	Canucks	49	28	5	0.628048779999999973	41
\.


-- Completed on 2020-11-05 15:06:22

--
-- PostgreSQL database dump complete
--

