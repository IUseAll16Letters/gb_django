--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Debian 14.5-1.pgdg110+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authapp_customuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authapp_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    age integer,
    avatar character varying(100),
    email character varying(256) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    CONSTRAINT authapp_customuser_age_check CHECK ((age >= 0))
);


ALTER TABLE public.authapp_customuser OWNER TO postgres;

--
-- Name: authapp_customuser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authapp_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.authapp_customuser_groups OWNER TO postgres;

--
-- Name: authapp_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authapp_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authapp_customuser_groups_id_seq OWNER TO postgres;

--
-- Name: authapp_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authapp_customuser_groups_id_seq OWNED BY public.authapp_customuser_groups.id;


--
-- Name: authapp_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authapp_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authapp_customuser_id_seq OWNER TO postgres;

--
-- Name: authapp_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authapp_customuser_id_seq OWNED BY public.authapp_customuser.id;


--
-- Name: authapp_customuser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authapp_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.authapp_customuser_user_permissions OWNER TO postgres;

--
-- Name: authapp_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authapp_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authapp_customuser_user_permissions_id_seq OWNER TO postgres;

--
-- Name: authapp_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authapp_customuser_user_permissions_id_seq OWNED BY public.authapp_customuser_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: mainapp_coursefeedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mainapp_coursefeedback (
    id bigint NOT NULL,
    feedback text NOT NULL,
    rating smallint NOT NULL,
    created timestamp with time zone NOT NULL,
    deleted boolean NOT NULL,
    course_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.mainapp_coursefeedback OWNER TO postgres;

--
-- Name: mainapp_coursefeedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mainapp_coursefeedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_coursefeedback_id_seq OWNER TO postgres;

--
-- Name: mainapp_coursefeedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mainapp_coursefeedback_id_seq OWNED BY public.mainapp_coursefeedback.id;


--
-- Name: mainapp_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mainapp_courses (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    description_as_md boolean NOT NULL,
    cost numeric(8,2) NOT NULL,
    image character varying(25) NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    deleted boolean NOT NULL
);


ALTER TABLE public.mainapp_courses OWNER TO postgres;

--
-- Name: mainapp_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mainapp_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_courses_id_seq OWNER TO postgres;

--
-- Name: mainapp_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mainapp_courses_id_seq OWNED BY public.mainapp_courses.id;


--
-- Name: mainapp_lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mainapp_lessons (
    id bigint NOT NULL,
    number integer NOT NULL,
    title character varying(150) NOT NULL,
    description text,
    description_as_md boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    deleted boolean NOT NULL,
    course_id bigint NOT NULL,
    CONSTRAINT mainapp_lessons_number_check CHECK ((number >= 0))
);


ALTER TABLE public.mainapp_lessons OWNER TO postgres;

--
-- Name: mainapp_lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mainapp_lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_lessons_id_seq OWNER TO postgres;

--
-- Name: mainapp_lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mainapp_lessons_id_seq OWNED BY public.mainapp_lessons.id;


--
-- Name: mainapp_news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mainapp_news (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(300),
    author character varying(70) NOT NULL,
    content text,
    content_as_md boolean NOT NULL,
    url character varying(350) NOT NULL,
    source character varying(55) NOT NULL,
    image_url character varying(250),
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    deleted boolean NOT NULL
);


ALTER TABLE public.mainapp_news OWNER TO postgres;

--
-- Name: mainapp_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mainapp_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_news_id_seq OWNER TO postgres;

--
-- Name: mainapp_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mainapp_news_id_seq OWNED BY public.mainapp_news.id;


--
-- Name: mainapp_teacherscourse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mainapp_teacherscourse (
    id bigint NOT NULL,
    name_first character varying(100) NOT NULL,
    name_second character varying(100) NOT NULL,
    birthday date NOT NULL,
    deleted boolean NOT NULL
);


ALTER TABLE public.mainapp_teacherscourse OWNER TO postgres;

--
-- Name: mainapp_teacherscourse_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mainapp_teacherscourse_course (
    id bigint NOT NULL,
    teacherscourse_id bigint NOT NULL,
    courses_id bigint NOT NULL
);


ALTER TABLE public.mainapp_teacherscourse_course OWNER TO postgres;

--
-- Name: mainapp_teacherscourse_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mainapp_teacherscourse_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_teacherscourse_course_id_seq OWNER TO postgres;

--
-- Name: mainapp_teacherscourse_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mainapp_teacherscourse_course_id_seq OWNED BY public.mainapp_teacherscourse_course.id;


--
-- Name: mainapp_teacherscourse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mainapp_teacherscourse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_teacherscourse_id_seq OWNER TO postgres;

--
-- Name: mainapp_teacherscourse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mainapp_teacherscourse_id_seq OWNED BY public.mainapp_teacherscourse.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: authapp_customuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser ALTER COLUMN id SET DEFAULT nextval('public.authapp_customuser_id_seq'::regclass);


--
-- Name: authapp_customuser_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.authapp_customuser_groups_id_seq'::regclass);


--
-- Name: authapp_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.authapp_customuser_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: mainapp_coursefeedback id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_coursefeedback ALTER COLUMN id SET DEFAULT nextval('public.mainapp_coursefeedback_id_seq'::regclass);


--
-- Name: mainapp_courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_courses ALTER COLUMN id SET DEFAULT nextval('public.mainapp_courses_id_seq'::regclass);


--
-- Name: mainapp_lessons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_lessons ALTER COLUMN id SET DEFAULT nextval('public.mainapp_lessons_id_seq'::regclass);


--
-- Name: mainapp_news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_news ALTER COLUMN id SET DEFAULT nextval('public.mainapp_news_id_seq'::regclass);


--
-- Name: mainapp_teacherscourse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_teacherscourse ALTER COLUMN id SET DEFAULT nextval('public.mainapp_teacherscourse_id_seq'::regclass);


--
-- Name: mainapp_teacherscourse_course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_teacherscourse_course ALTER COLUMN id SET DEFAULT nextval('public.mainapp_teacherscourse_course_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Course	6	add_courses
22	Can change Course	6	change_courses
23	Can delete Course	6	delete_courses
24	Can view Course	6	view_courses
25	Can add Lesson	7	add_lessons
26	Can change Lesson	7	change_lessons
27	Can delete Lesson	7	delete_lessons
28	Can view Lesson	7	view_lessons
29	Can add Teacher	8	add_teacherscourse
30	Can change Teacher	8	change_teacherscourse
31	Can delete Teacher	8	delete_teacherscourse
32	Can view Teacher	8	view_teacherscourse
33	Can add News	9	add_news
34	Can change News	9	change_news
35	Can delete News	9	delete_news
36	Can view News	9	view_news
37	Can add course feedback	10	add_coursefeedback
38	Can change course feedback	10	change_coursefeedback
39	Can delete course feedback	10	delete_coursefeedback
40	Can view course feedback	10	view_coursefeedback
41	Can add user	11	add_customuser
42	Can change user	11	change_customuser
43	Can delete user	11	delete_customuser
44	Can view user	11	view_customuser
45	Can add association	12	add_association
46	Can change association	12	change_association
47	Can delete association	12	delete_association
48	Can view association	12	view_association
49	Can add code	13	add_code
50	Can change code	13	change_code
51	Can delete code	13	delete_code
52	Can view code	13	view_code
53	Can add nonce	14	add_nonce
54	Can change nonce	14	change_nonce
55	Can delete nonce	14	delete_nonce
56	Can view nonce	14	view_nonce
57	Can add user social auth	15	add_usersocialauth
58	Can change user social auth	15	change_usersocialauth
59	Can delete user social auth	15	delete_usersocialauth
60	Can view user social auth	15	view_usersocialauth
61	Can add partial	16	add_partial
62	Can change partial	16	change_partial
63	Can delete partial	16	delete_partial
64	Can view partial	16	view_partial
\.


--
-- Data for Name: authapp_customuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authapp_customuser (id, password, last_login, is_superuser, username, first_name, last_name, age, avatar, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: authapp_customuser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authapp_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: authapp_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authapp_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	mainapp	courses
7	mainapp	lessons
8	mainapp	teacherscourse
9	mainapp	news
10	mainapp	coursefeedback
11	authapp	customuser
12	social_django	association
13	social_django	code
14	social_django	nonce
15	social_django	usersocialauth
16	social_django	partial
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-12-22 04:32:09.712259+00
2	contenttypes	0002_remove_content_type_name	2022-12-22 04:32:09.728258+00
3	auth	0001_initial	2022-12-22 04:32:09.77926+00
4	auth	0002_alter_permission_name_max_length	2022-12-22 04:32:09.789262+00
5	auth	0003_alter_user_email_max_length	2022-12-22 04:32:09.796776+00
6	auth	0004_alter_user_username_opts	2022-12-22 04:32:09.804768+00
7	auth	0005_alter_user_last_login_null	2022-12-22 04:32:09.811769+00
8	auth	0006_require_contenttypes_0002	2022-12-22 04:32:09.815769+00
9	auth	0007_alter_validators_add_error_messages	2022-12-22 04:32:09.823768+00
10	auth	0008_alter_user_username_max_length	2022-12-22 04:32:09.832769+00
11	auth	0009_alter_user_last_name_max_length	2022-12-22 04:32:09.840769+00
12	auth	0010_alter_group_name_max_length	2022-12-22 04:32:09.84977+00
13	auth	0011_update_proxy_permissions	2022-12-22 04:32:09.859721+00
14	auth	0012_alter_user_first_name_max_length	2022-12-22 04:32:09.874943+00
15	authapp	0001_customuser_model_created	2022-12-22 04:32:09.950947+00
16	admin	0001_initial	2022-12-22 04:32:09.979414+00
17	admin	0002_logentry_remove_auto_add	2022-12-22 04:32:09.989417+00
18	admin	0003_logentry_add_action_flag_choices	2022-12-22 04:32:10.000416+00
19	authapp	0002_email_as_username	2022-12-22 04:32:10.016414+00
20	mainapp	0001_created_courses	2022-12-22 04:32:10.029416+00
21	mainapp	0002_created_lessons	2022-12-22 04:32:10.048416+00
22	mainapp	0003_created_teachers	2022-12-22 04:32:10.073413+00
23	mainapp	0004_created_news	2022-12-22 04:32:10.083418+00
24	mainapp	0005_courses_data_migration	2022-12-22 04:32:10.147412+00
25	mainapp	0006_lessons_data_migration	2022-12-22 04:32:10.167413+00
26	mainapp	0007_teachers_data_migration	2022-12-22 04:32:10.214418+00
27	mainapp	0008_added_manager_to_courses	2022-12-22 04:32:10.230413+00
28	mainapp	0009_created_rating_model	2022-12-22 04:32:10.256419+00
29	sessions	0001_initial	2022-12-22 04:32:10.272413+00
30	default	0001_initial	2022-12-22 04:32:10.350419+00
31	social_auth	0001_initial	2022-12-22 04:32:10.353414+00
32	default	0002_add_related_name	2022-12-22 04:32:10.366413+00
33	social_auth	0002_add_related_name	2022-12-22 04:32:10.369413+00
34	default	0003_alter_email_max_length	2022-12-22 04:32:10.378415+00
35	social_auth	0003_alter_email_max_length	2022-12-22 04:32:10.380413+00
36	default	0004_auto_20160423_0400	2022-12-22 04:32:10.390413+00
37	social_auth	0004_auto_20160423_0400	2022-12-22 04:32:10.393413+00
38	social_auth	0005_auto_20160727_2333	2022-12-22 04:32:10.403417+00
39	social_django	0006_partial	2022-12-22 04:32:10.420414+00
40	social_django	0007_code_timestamp	2022-12-22 04:32:10.430413+00
41	social_django	0008_partial_timestamp	2022-12-22 04:32:10.441419+00
42	social_django	0009_auto_20191118_0520	2022-12-22 04:32:10.461413+00
43	social_django	0010_uid_db_index	2022-12-22 04:32:10.478416+00
44	social_django	0002_add_related_name	2022-12-22 04:32:10.484413+00
45	social_django	0001_initial	2022-12-22 04:32:10.487414+00
46	social_django	0005_auto_20160727_2333	2022-12-22 04:32:10.490413+00
47	social_django	0004_auto_20160423_0400	2022-12-22 04:32:10.492413+00
48	social_django	0003_alter_email_max_length	2022-12-22 04:32:10.495412+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: mainapp_coursefeedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mainapp_coursefeedback (id, feedback, rating, created, deleted, course_id, user_id) FROM stdin;
\.


--
-- Data for Name: mainapp_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mainapp_courses (id, name, description, description_as_md, cost, image, created, updated, deleted) FROM stdin;
1	Web Python	Курс Web Python поможет Вам осовоить язык программирования Python, а также разобраться с его основными аспектами, такими как: модули, парсеры, регулярные выражения. Курс поможет Вам научиться составлять эффективные программы для решения Ваших задач и проблем. Он научит Вас создавать собственные веб-приложения для работы с базами данных и сайтами. Вы сможете использовать Python для изучения Java, Ruby, PHP, C, C ++, C # или любого другого языка программирования.\r\nНа курсе Web Python проходит изучение веб-фреймворков Django, Bootstrap и Flask.\r\nВо втором семестре вы изучите такие инструменты и методы, как:\r\n\r\n* PHP и MySql;\r\n* Работа с файлами DOC, EXCEL, PATH;\r\n* Реляционная и объектная модель базы данных;\r\n* Создание и управление пакетами;\r\n* Как работать с FTP сервером;\r\n* Настройка среды и создание сайтов;\r\n* Веб-серверы;\r\n* Конфигурационное управление в Unix и Windows;\r\n* Инструменты для создания сайта;\r\n* Интеграция внешних приложений;\r\n* Расширения;	t	10000.50	img/course001.jpg	2022-12-22 04:32:10.095417+00	2022-12-22 04:32:10.095417+00	f
2	Web Golang	На курсе Web Golang вы изучите основы Go, получите практические навыки реализации проектов на Golang и научитесь работать в распределенных средах разработки. Вы узнаете: что такое Go как компилировать код Go как писать тесты как работает веб-сервер. Курс ведет Виктор Иванов\r\nСертифицированный специалист Google Developer Expert (Certified Technical Professional).\r\nАвтор учебника “Web-разработка на Go”. На курсе вы будете изучать основы языка программирования Go и получите практический опыт реализации проектов на Go.	t	9009.99	img/course002.jpg	2022-12-22 04:32:10.095417+00	2022-12-22 04:32:10.095417+00	f
3	Web JavaScript	Курс JavaScript ведёт преподаватель Дмитрий Кокшаров. Он преподает в разных вузах, в том числе и в МФТИ. Дмитрий считает, что курс — это база знаний, которая пригодится в жизни. \r\nКурс JavaScript состоит из модулей, один из которых — «Основы функционального программирования». Этот модуль рассчитан на тех, кто не знает основы JavaScript или только начал заниматься этим языком. Вы узнаете, как устроены функции, какие бывают типы данных, как применять модификаторы.\r\nНа курсе JavaScript Вы изучите:\r\n\r\n* Основные паттерны проектирования (design patterns) \r\n* Разработку на чистом JavaScript\r\n* ReactJS и AngularJS\r\n* ООП на JavaScript \r\n* Основы HTML 5 и CSS3\r\n* Javascript ES6 и ES7\r\n* Основы кроссбраузерные\r\n\r\nВы погрузитесь в динамичный мир современного JS-разработки, который станет интересным и увлекательным. Курс JavaScript будет полезен как новичкам, так и опытным разработчикам, желающим изучить новые технологии и получить новые знания.	t	2500.15	img/course003.jpg	2022-12-22 04:32:10.095417+00	2022-12-22 04:32:10.095417+00	f
4	Web Java	На курсе Java Вы изучите язык и фреймворк Java с самых азов до продвинутого уровня.\r\nА главное — Вы получите теоретические и практические навыки для создания, отладки, тестирования своих программ. В итоге Вы сможете выполнить проекты любой степени сложности, используя различные среды разработки и инструменты: от Eclipse IDE до IntelliJ IDEA, не говоря уже о современных облачных решениях от Google и GitHub.\r\nКурс Java ведёт сильный преподаватель Дмитрий. Дмитрий - это живой пример профессионального, увлеченного и целеустремленного преподавателя. С первых занятий, уже на первом уроке можно понять, что преподаватель очень заинтересован в том чтобы его ученики не просто получили теоретические знания, а приобрели практические навыки.	f	10000.00	img/course004.jpg	2022-12-22 04:32:10.095417+00	2022-12-22 04:32:10.095417+00	f
5	Web PHP	На курсе PHP Вы изучите основы PHP и получите навыки работы с PHP, такими как работа с базами данных, работа с графикой, создание сайтов, работа в PHPEdit, обработка исключений, управление памятью,работа со строками, работа с файлами. Курс PHP позволяет получить навыки программирования на языке PHP. После прохождения курса Вы сможете создавать собственный веб-сайт с системой управления, а так же применять свои знания для создания полноценных информационных систем.\r\nКурс PHP ведёт разработчик из «Сбербанка», который умеет делать сложные вещи из простых. Он рассказывает, как сделать сайт, не имея ничего, кроме базовых знаний — и делится секретами, за которые в других сферах с радостью уволили бы. У меня было достаточно времени, чтобы посмотреть на PHP с нуля и понять, что он крутой. Как-то раз меня спросили, почему я не пишу код сам, а только консультирую других. Я ответил: «Потому что мне нравится помогать людям». Но для этого нужно уметь всё.\r\nPHP — это сложная штука.	f	9500.78	img/course005.jpg	2022-12-22 04:32:10.095417+00	2022-12-22 04:32:10.095417+00	f
6	Python AI	На курсе Python AI Вы изучите создание простых нейросетей для задач машинного зрения.\r\nА также научитесь создавать и развивать более сложные нейросети.\r\nКурс рассчитан на:\r\n\r\n* Для тех, кому интересен мир машинного обучения, создания ИИ и робототехники.\r\n* Для специалистов в области физики, математики, программирования на Python.\r\n* Для всех, кто хочет прокачать свои навыки в Python, а также понять алгоритм работы нейронных сетей и научиться применять их на практике.\r\n\r\nКурс Python AI ведёт преподаватель школы "Фабрика Открытий" Денис Мигачёв.\r\nОн изучает математику и IT, много программирует и делает игры. Денис расскажет вам про инструменты, которые пригодятся для создания ИИ, и даст практические задания — напишите свою игру на Python.	t	6660.66	img/course006.jpg	2022-12-22 04:32:10.095417+00	2022-12-22 04:32:10.095417+00	f
7	DevOps	На курсе DevOps Вы изучите основы автоматизации с Python, Git, Docker и узнаете про GitHub, Jenkins и Kubernetes. Узнаете, как все это работает, и поймете, зачем вам все это нужно.\r\nКурс состоит из 12 онлайн-семинаров, длительностью 90 минут. Он подходит опытным программистам, которые хотят усовершенствовать свои навыки в области управления проектами.\r\nНа курсе Вы изучите:\r\n\r\n* Основные возможности и функции Git\r\n* Как создавать, добавлять и удалять ветки, коммиты и тэги\r\n* Как использовать ветку и как ее можно назвать	t	7770.77	img/course007.jpg	2022-12-22 04:32:10.095417+00	2022-12-22 04:32:10.095417+00	f
8	3D-моделирование	Курс 3D-моделирования ведёт практикующий архитектор с высшим архитектурным образованием, со стажем преподавания более 7 лет.\r\nНа курсе 3D-моделирования Вы изучите программы:\r\n\r\n* 3D-Max\r\n* Blender\r\n* Rhino\r\n* Maya\r\n* AutoCAD (V-Ray)\r\n\r\nНа курсе Вы научитесь:\r\n\r\n1. Создавать модели для разработки приложений.\r\n2. Создавать дизайн мебели.\r\n3. Создавать реалистичные текстуры и освещение.\r\n4. Создавать анимации.\r\n5. Настраивать рабочий процесс в программах.\r\n6. Уметь работать с 3D Studio Max, Blender, Rhinoceros.\r\n7. Уметь использовать инструменты программы AutoCAD.\r\n8. Уметь создавать свои собственные проекты или адаптировать модели 3D программ под свои нужды.	t	5900.00	img/no_image.svg	2022-12-22 04:32:10.095417+00	2022-12-22 04:32:10.095417+00	f
\.


--
-- Data for Name: mainapp_lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mainapp_lessons (id, number, title, description, description_as_md, created, updated, deleted, course_id) FROM stdin;
1	1	Lesson 1	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	1
2	2	Lesson 2	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	1
3	3	Lesson 3	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	1
4	4	Lesson 4	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	1
5	5	Lesson 5	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	1
6	6	Lesson 6	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	1
7	7	Lesson 7	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	1
8	8	Lesson 8	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	1
9	1	Lesson 1	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	2
10	2	Lesson 2	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	2
11	3	Lesson 3	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	2
12	4	Lesson 4	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	2
13	5	Lesson 5	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	2
14	6	Lesson 6	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	2
15	7	Lesson 7	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	2
16	8	Lesson 8	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	2
17	1	Lesson 1	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	3
18	2	Lesson 2	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	3
19	3	Lesson 3	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	3
20	4	Lesson 4	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	3
21	5	Lesson 5	Описание урока	f	2022-12-22 04:32:10.160418+00	2022-12-22 04:32:10.160418+00	f	3
22	6	Lesson 6	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	3
23	7	Lesson 7	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	3
24	8	Lesson 8	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	3
25	1	Lesson 1	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	4
26	2	Lesson 2	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	4
27	3	Lesson 3	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	4
28	4	Lesson 4	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	4
29	5	Lesson 5	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	4
30	6	Lesson 6	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	4
31	7	Lesson 7	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	4
32	8	Lesson 8	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	4
33	1	Lesson 1	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	5
34	2	Lesson 2	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	5
35	3	Lesson 3	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	5
36	4	Lesson 4	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	5
37	5	Lesson 5	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	5
38	6	Lesson 6	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	5
39	7	Lesson 7	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	5
40	8	Lesson 8	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	5
41	1	Lesson 1	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	6
42	2	Lesson 2	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	6
43	3	Lesson 3	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	6
44	4	Lesson 4	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	6
45	5	Lesson 5	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	6
46	6	Lesson 6	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	6
47	7	Lesson 7	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	6
48	8	Lesson 8	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	6
49	1	Lesson 1	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	7
50	2	Lesson 2	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	7
51	3	Lesson 3	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	7
52	4	Lesson 4	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	7
53	5	Lesson 5	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	7
54	6	Lesson 6	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	7
55	7	Lesson 7	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	7
56	8	Lesson 8	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	7
57	1	Lesson 1	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	8
58	2	Lesson 2	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	8
59	3	Lesson 3	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	8
60	4	Lesson 4	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	8
61	5	Lesson 5	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	8
62	6	Lesson 6	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	8
63	7	Lesson 7	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	8
64	8	Lesson 8	Описание урока	f	2022-12-22 04:32:10.161413+00	2022-12-22 04:32:10.161413+00	f	8
\.


--
-- Data for Name: mainapp_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mainapp_news (id, title, description, author, content, content_as_md, url, source, image_url, created, updated, deleted) FROM stdin;
1	OpenAI’s new chatbot can hallucinate a Linux shell—or calling a BBS	ChatGPT-generated command line can create virtual files, execute code, play games.	Benj Edwards	Enlarge/ An AI-generated illustration of an AI-hallucinated computer.\r\n8 with 0 posters participating\r\nOver the weekend, experimenters discovered that OpenAI's new chatbot, ChatGPT, can hallucinate s… [+4572 chars]	f	https://arstechnica.com/information-technology/2022/12/openais-new-chatbot-can-hallucinate-a-linux-shell-or-calling-a-bbs/	Ars Technica	https://cdn.arstechnica.net/wp-content/uploads/2022/12/ai_terminal_hero_2-760x380.jpg	2022-12-05 22:45:41+00	2022-12-05 22:45:41+00	f
2	When Chips are Scarce: Maker Ingenuity in Uncertain Times	The past few years have been … unprecedented. Supply chain failures manifest themselves visibly around us, from parking lots in Detroit...	David Groom	The past few years have been unprecedented. Supply chain failures manifest themselves visibly around us, from parking lots in Detroit full of cars that cant be finished for lack of a single part, to … [+13202 chars]	f	https://makezine.com/article/maker-news/when-chips-are-scarce-maker-ingenuity-in-uncertain-times/	Makezine.com	https://i0.wp.com/makezine.com/wp-content/uploads/2022/11/PnP-reels-Diego-Fonstad-scaled.jpg?fit=1920%2C2560&ssl=1	2022-11-15 16:00:00+00	2022-11-15 16:00:00+00	f
3	Survey of 26K Developers Finds Java, Python, Kotlin, and Rust Growing Rapidly	While the popularity of jQuery is decreasing, React.JS "is currently the most widely used client-side framework," reports ZDNet, citing SlashData's 23rd State of the Developer Nation report (compiled from more than 26,000 developers last summer from 163 count…	EditorDavid	While the popularity of jQuery is decreasing, React.JS "is currently the most widely used client-side framework," reports ZDNet, citing SlashData's 23rd State of the Developer Nation report (compiled… [+1878 chars]	f	https://developers.slashdot.org/story/22/11/13/2340221/survey-of-26k-developers-finds-java-python-kotlin-and-rust-growing-rapidly	Slashdot.org	https://a.fsdn.com/sd/topics/programming_64.png	2022-11-14 00:04:00+00	2022-11-14 00:04:00+00	f
4	AI-Assisted Coding Start-Up Kite Is Saying Farewell and Open-Sourcing Its Code	Kite, a start-up that has been developing artificial intelligence technology to help developers write code for nearly a decade, is saying farewell and open-sourcing its code. Silicon Republic reports: Based in San Francisco, Kite was founded in 2014 as an ear…	BeauHD	Based in San Francisco, Kite was founded in 2014 as an early pioneer in the emerging field of AI that assists software developers in writing code -- an 'autocomplete' for programming of sorts. But no… [+2306 chars]	f	https://news.slashdot.org/story/22/11/22/2153257/ai-assisted-coding-start-up-kite-is-saying-farewell-and-open-sourcing-its-code	Slashdot.org	https://a.fsdn.com/sd/topics/opensource_64.png	2022-11-22 22:40:00+00	2022-11-22 22:40:00+00	f
5	Get a Robot Dog While It's on Sale	Start a robotics hobby with this early Black Friday deal.	Entrepreneur Store	Entrepreneurship is hard work, but you can't reach the peak of your success without giving yourself an opportunity to relax from time to time. That's why having a hobby is so valuable for entrepreneu… [+1673 chars]	f	https://www.entrepreneur.com/science-technology/get-a-robot-dog-while-its-on-sale/438801	Entrepreneur	https://assets.entrepreneur.com/content/3x2/2000/1668015134-Ent-PetoiBittleROBODog.jpeg	2022-11-13 13:30:00+00	2022-11-13 13:30:00+00	f
6	Want a new tech job in 2023? Here’s what you need to know	The areas of cloud computing, cyber security, AI and blockchain technology in particular will continue to grow and prosper in 2023.	Aoibhinn McBride	Despite big techs behemoths ending 2022 with fewer workers on the books, the tech industry as a whole remains robust and the areas of cloud computing, cyber security, AI and blockchain technology wil… [+4967 chars]	f	https://venturebeat.com/programming-development/want-a-new-tech-job-in-2023-heres-what-you-need-to-know/	VentureBeat	https://venturebeat.com/wp-content/uploads/2022/12/GettyImages-1322050853.jpg?w=1200&strip=all	2022-12-06 16:26:00+00	2022-12-06 16:26:00+00	f
7	7 critical power skills you need to succeed at work	Where hard skills are the nuts and bolts that define a job, soft skills provide the glide to make your day-to-day easier.	Kirstie McDermott	There are a lot of skills we need in life, and when it comes to our working lives, the ones we hear about needing the most are hard and soft skills. We also need functional skills, which are core Eng… [+5122 chars]	f	https://venturebeat.com/programming-development/7-critical-power-skills-you-need-to-succeed-at-work/	VentureBeat	https://venturebeat.com/wp-content/uploads/2022/11/GettyImages-519434666.jpg?w=1200&strip=all	2022-11-29 19:49:00+00	2022-11-29 19:49:00+00	f
8	Carefully exploring Rust as a Python developer	Trying out the Rust programming ecosystem as a 10+ years Python developer. How to do common programming tasks and how the tooling looks like.	Karim Jedda	I've recently joined a new company where one of the most used programming languages is Rust. \r\nAfter using Python for almost a decade now, mostly for data engineering, I thought I'd give this new (to… [+11603 chars]	f	https://karimjedda.com/carefully-exploring-rust/	Karimjedda.com	https://karimjedda.com/content/images/2022/10/rust-for-python-developers.png	2022-11-13 10:58:25+00	2022-11-13 10:58:25+00	f
9	A Compiler Writing Playground	Programming book reviews, programming tutorials,programming news, C#, Ruby, Python,C, C++, PHP, Visual Basic, Computer book reviews, computer history, programming history, joomla, theory, spreadsheets and more.	Editor	"Create Your Own Compiler" is an interactive tutorial that step by step shows how to write your own simple compiler that transforms JavaScript into Lisp. Along with it, we take a look at what a compi… [+6749 chars]	f	https://www.i-programmer.info/news/90-tools/15901-a-compiler-writing-playground.html	I-programmer.info	\N	2022-11-26 13:31:27+00	2022-11-26 13:31:27+00	f
10	The Origins of Python – Lambert Meertens	Python is arguably the most popular programming language worldwide. Since its debut in 1991, Python’s accessibility and rich functionality has helped it gather a huge userbase. Its design was influenced by creator Guido van Rossum’s involvement with an earlie…	Lambert Meertens	On Sunday, June 21, 1970, in an office building on Great Portland Street in London, a teletype sprang to life. Under the heading HAPPY FAMILIES, the machine rattled out a sequence of English sentence… [+36243 chars]	f	https://inference-review.com/article/the-origins-of-python	Inference-review.com	http://inference-review.com/assets/img/meta/the-origins-of-python.jpg	2022-11-26 08:02:16+00	2022-11-26 08:02:16+00	f
11	Common Lisp Object System (CLOS)	I’ve encountered Object-Oriented Programming when I was learning Python (which is my first language). I’ve struggled with it because the paradigm is not as o...	Unknown author	Ive encountered Object-Oriented Programming when I was learning Python (which is my first language). Ive struggled with it because the paradigm is not as obvious as using functions and structures in … [+1056 chars]	f	https://hescaide.me/clos/	Hescaide.me	\N	2022-11-23 11:47:15+00	2022-11-23 11:47:15+00	f
12	The cloudy layers of modern-day programming	Is what we do development anymore?	Unknown author	Composition X, Kandinsky\r\nRecently, Ive come to the realization that much of what we do in modern software development is not true software engineering. We spend the majority of our days trying to co… [+24249 chars]	f	https://vickiboykis.com/2022/12/05/the-cloudy-layers-of-modern-day-programming/	Vickiboykis.com	https://veekaybee.github.io/images/logo.png	2022-12-06 15:56:52+00	2022-12-06 15:56:52+00	f
13	ᚣ the Rune Programming Language	Rune is a programming language developed to test ideas for improving security and efficiency. - GitHub - google/rune: Rune is a programming language developed to test ideas for improving security a...	google	A faster, safer, and more productive systems programming language\r\nThis is not an officially supported Google product.\r\nNOTE: Rune is an unfinished language. Feel free to kick tires and evaluate the\r… [+6937 chars]	f	https://github.com/google/rune	Github.com	https://opengraph.githubassets.com/3e8f2de17a7ad95149eb8fb089363427e8cd2f5cf653f3529697d09ca45c34a4/google/rune	2022-11-27 07:36:21+00	2022-11-27 07:36:21+00	f
14	Compiler and Runtime Specializations for Accelerating Managed Languages on FPGAs	In recent years, heterogeneous computing has emerged as the vital way to increase computers’ performance and energy efficiency by combini...	Papadimitriou, Michail, Fumero, Juan, Stratikopoulos, Athanasios, Zakk	Michail Papadimitriou1, Juan Fumero2, Athanasios Stratikopoulos3, Foivos S. Zakkak4, and Christos Kotselidis5\r\nThe Art, Science, and Engineering of Programming, 2021, Vol. 5, Issue 2, Article 8\r\nSubm… [+2639 chars]	f	https://programming-journal.org/2021/5/8/	Programming-journal.org	data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7	2022-11-26 16:48:37+00	2022-11-26 16:48:37+00	f
15	Codon: A high-performance Python compiler using LLVM	A high-performance, zero-overhead, extensible Python compiler using LLVM - GitHub - exaloop/codon: A high-performance, zero-overhead, extensible Python compiler using LLVM	exaloop	What is Codon?\r\nCodon is a high-performance Python compiler that compiles Python code to native machine code without any runtime overhead.\r\nTypical speedups over Python are on the order of 10-100x or… [+3133 chars]	f	https://github.com/exaloop/codon	Github.com	https://opengraph.githubassets.com/23a38d0823a285e5b565c93926b9a87e60404f76becb7ddd75e18d2a246fd722/exaloop/codon	2022-12-08 15:05:45+00	2022-12-08 15:05:45+00	f
16	Dagger Python SDK: Develop Your CI/CD Pipelines as Code	Dagger.io | Blog | Develop your pipelines as code with the Dagger Python SDK	Unknown author	Today we are proud to introduce the Dagger Python SDK: a new way to develop your CI/CD pipelines as code and run them anywhere.\r\nThe Dagger Python SDK may be a good fit if you are...\r\n<ul><li>A Pytho… [+2184 chars]	f	https://dagger.io/blog/python-sdk	Dagger.io	https://dagger.io/img/dagger_python_sdk.jpg	2022-11-10 17:23:20+00	2022-11-10 17:23:20+00	f
17	Temporal Programming, a new name for an old paradigm	A C++ to Verilog translation tool with some basic guarantees that your code will work. - Metron/TemporalTLDR.md at master · aappleby/Metron	aappleby	Hi, my name is Austin Appleby and I'm the author of MurmurHash (a commonly used hash function), GateBoy (a gate-level Game Boy simulator), Metron (a very experimental C++ to SystemVerilog transpiler)… [+7031 chars]	f	https://github.com/aappleby/Metron/blob/master/docs/TemporalTLDR.md	Github.com	https://opengraph.githubassets.com/fe08ea709a521a03354d9613eb7e076810e3284cd28baa97343cdbb6a3a598c7/aappleby/Metron	2022-11-27 19:46:30+00	2022-11-27 19:46:30+00	f
18	Go Framework: No Framework?	While writing this blog and leading Go teams for a couple of years, the most common question I heard from beginners was &ldquo;What framework should I use?&rdquo;. One of the worst things you can do in Go is follow an approach from other programming languages…	Robert Laszczak	While writing this blog and leading Go teams for a couple of years,\r\nthe most common question I heard from beginners was “What framework should I use?”.\r\nOne of the worst things you can do in Go is f… [+10084 chars]	f	https://threedots.tech/post/best-go-framework/	Threedots.tech	https://threedots.tech/post/best-go-framework/cover-social.png	2022-11-29 12:01:13+00	2022-11-29 12:01:13+00	f
19	ChatGPT, the Abacus, and Education	tags: #cs-education\nIntroduction\nI’ve remained skeptical of AI code generation for a long time, until I began chatting with ChatGPT last week. It effortlessl...	Unknown author	tags: #cs-education\r\nIntroduction\r\nIve remained skeptical of AI code generation for a long time, until I began chatting with ChatGPT last week. It effortlessly worked through problems in Java, Python… [+3256 chars]	f	https://blog.charliemeyer.co/chatgpt-the-abacus-and-education/	Charliemeyer.co	\N	2022-12-09 14:02:15+00	2022-12-09 14:02:15+00	f
20	I am disappointed by dynamic typing	Here’s weird thing about me: I’m pro-dynamic types. This is weird because I’m also pro-formal methods, in fact teach formal methods as a career, which seems...	Unknown author	Here’s weird thing about me: I’m pro-dynamic types. This is weird because I’m also pro-formal methods, in fact teach formal methods as a career, which seems completely antithetical. So on one hand I … [+8422 chars]	f	https://buttondown.email/hillelwayne/archive/i-am-disappointed-by-dynamic-typing/	Buttondown.email	https://buttondown.email/static/images/icons/icon-square@400.png	2022-11-29 17:34:32+00	2022-11-29 17:34:32+00	f
21	Ooh.directory	A collection of 852 blogs about every topic	Unknown author	<li>Janet Reid, Literary Agent"Never miss a chance to do good"--David Stanley.\r\nUpdated 3 hours ago\r\nAm I A Delusional Nutbag?\r\nI have read your many posts on comps, and I am reading (even more) book… [+6219 chars]	f	https://ooh.directory	Ooh.directory	https://ooh.directory/static/oohdir/img/site_icon.png	2022-11-23 15:04:36+00	2022-11-23 15:04:36+00	f
22	An Interview with Mickey Petersen, Author of Mastering Emacs	An interview with Mickey Petersen, author of Mastering Emacs Who are you, and what do you do? I'm Mickey Petersen. I live in London, UK. I'm a professional software developer, and I have been programming since I was around 10 years old. I did not have friends…	Syntopikon	An interview with Mickey Petersen, author of Mastering Emacs\r\nWho are you, and what do you do?\r\nI'm Mickey Petersen. I live in London, UK.\r\nI'm a professional software developer, and I have been prog… [+12518 chars]	f	https://syntopikon.substack.com/p/an-interview-with-mickey-petersen	Substack.com	https://substackcdn.com/image/fetch/w_1200,h_600,c_limit,f_jpg,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fdbfc8c37-b81f-4779-97cb-276b5503215d_460x459.jpeg	2022-11-19 18:28:54+00	2022-11-19 18:28:54+00	f
23	Kite is saying farewell, and is open-sourcing all of its code.	From 2014 to 2021, Kite was a startup using AI to help developers write code. We have stopped working on Kite, and are no longer supporting the Kite software. Thank you to everyone who used our product, and thank you to our team members and investors who made…	Unknown author	From 2014 to 2021, Kite was a startup using AI to help developers write code. We have stopped working on Kite, and are no longer supporting the Kite software.\r\nThank you to everyone who used our prod… [+6044 chars]	f	https://www.kite.com/blog/product/kite-is-saying-farewell/	Kite.com	https://www.kite.com/wp-content/uploads/2019/10/IMG_4936-1024x683.jpeg	2022-11-20 20:57:33+00	2022-11-20 20:57:33+00	f
24	Using Rust at a Startup: A Cautionary Tale	Rust is awesome, for certain things. But think twice before picking it up for a startup that needs to move fast. I hesitated writing this post, because I don’t want to start, or get into, a holy war…	Matt Welsh	Using Rust at a startup: A cautionary tale\r\nRust is awesome, for certain things. But think twice before picking it up for a startup that needs to move fast.\r\nAll of the art for this post was generate… [+12627 chars]	f	https://mdwdotla.medium.com/using-rust-at-a-startup-a-cautionary-tale-42ab823d9454	Medium	https://miro.medium.com/max/1024/1*vybmUMCSKd_OjJUO9Bwarg.png	2022-11-23 01:38:22+00	2022-11-23 01:38:22+00	f
25	Fly.io (YC W20) Is Hiring Ops Engineers	Join our team!	Unknown author	Infrastructure Ops engineers are our human to metal interface. They manage the foundation that everything else is built on, and provide the tools to support our Platform team and Fly.io end customers… [+3120 chars]	f	https://fly.io/jobs/infrastructure-ops-engineering/	Fly.io	https://fly.io/public/images/flyctl-preview.png	2022-11-15 12:00:19+00	2022-11-15 12:00:19+00	f
26	Building a Virtual Machine Inside ChatGPT	Unless you have been living under a rock, you have heard of this new ChatGPT assistant made by OpenAI. Did you know, that you can run a whole virtual machine inside of ChatGPT?	Jonas Degrave	Unless you have been living under a rock, you have heard of this new ChatGPT assistant made by OpenAI. You might be aware of its capabilities for solving IQ tests, tackling leetcode problems or to he… [+3204 chars]	f	https://www.engraved.blog/building-a-virtual-machine-inside/	Engraved.blog	https://www.engraved.blog/content/images/2022/12/deepmind-mbq0qL3ynMs-unsplash.jpg	2022-12-03 21:19:45+00	2022-12-03 21:19:45+00	f
27	Learning Rust with ChatGPT, Copilot and Advent of Code	I’m using this year’s Advent of Code to learn Rust—with the assistance of GitHub Copilot and OpenAI’s new ChatGPT. I think one of the most exciting applications of large language …	Unknown author	Im using this years Advent of Code to learn Rustwith the assistance of GitHub Copilot and OpenAIs new ChatGPT.\r\nI think one of the most exciting applications of large language models is to support se… [+13116 chars]	f	https://simonwillison.net/2022/Dec/5/rust-chatgpt-copilot/	Simonwillison.net	https://static.simonwillison.net/static/2022/copilot-2.jpg	2022-12-05 21:47:56+00	2022-12-05 21:47:56+00	f
28	Tea: A new package manager from the creator of brew	the unified package manager (brew2). Contribute to teaxyz/cli development by creating an account on GitHub.	teaxyz	tea is not a package manager.\r\ntea is unified packaging infrastructure.\r\nFrom the creator of brew, tea is a standalone, binary download for all\r\nplatforms that puts the entire open\r\nsource ecosystem … [+23548 chars]	f	https://github.com/teaxyz/cli	Github.com	https://opengraph.githubassets.com/1f5c9bd19b044b2e4217959c73415366d0e180f10b3a940fadd50cad06759fdc/teaxyz/cli	2022-11-20 14:39:56+00	2022-11-20 14:39:56+00	f
29	Porting Doom to the 3D0 Console	Today Rebecca Burger Becky Heineman shares the tale of porting Doom to the 3DO console under extreme conditions. There is an engine to tweak, deadlines to hit, hardware acceleration to get working, and dramatic rock anthems to record.We also learn about how g…	Adam Gordon Bell	Introduction\r\nAdam:\r\nHi. This is CoRecursive, and Im Adam Gordon Bell. Each episode is the story of a piece of software being built. Why dont you tell me what you do and who you are?\r\nBecky:\r\nOkay. Y… [+43473 chars]	f	https://corecursive.com/doomed-to-fail-with-burger-becky/	Corecursive.com	https://corecursive.com/assets/images/083/wide.png	2022-12-04 19:44:04+00	2022-12-04 19:44:04+00	f
30	WTF Is T_paamayim_nekudotayim (2013)	Anyone who has mentioned PHP Fractal of Bad Design to me knows I don’t give it much credit. It’s a list of complaints about loose-typing in…	Unknown author	Anyone who has mentioned PHP Fractal of Bad Design to me knows I dont give it much credit. Its a list of complaints about loose-typing in general, some its not Python rants, lots of complaints about … [+18679 chars]	f	https://phil.tech/2013/wtf-is-t-paamayim-nekudotayim/	Phil.tech	\N	2022-12-02 12:26:57+00	2022-12-02 12:26:57+00	f
31	Building a Dynamic VRChat World	VRChat, its idiosyncrasies, and things I learned	Unknown author	Background\r\nI first tried VRChat in 2021 after a friend showed it to me, and I saved up and bought a headset as soon as I could. It was pretty much love at first sight and my only regret is not getti… [+38264 chars]	f	https://blog.natalie.ee/posts/building-dynamic-vrchat-world/	Natalie.ee	\N	2022-11-18 13:30:55+00	2022-11-18 13:30:55+00	f
32	The Uses of Friction	Plus! Market-Making; Poaching and Equity Currency; China's Covid Economy; The Cost of AI; Friendshoring; Diff Jobs	Byrne Hobart	Welcome to the free weekly edition of The Diff! This newsletter goes out to 48,000+ readers. In this issue:\r\n<ul><li>The Uses of Friction\r\n</li><li>Market-Making\r\n</li><li>Poaching and Equity Currenc… [+17474 chars]	f	https://www.thediff.co/p/the-uses-of-friction	Thediff.co	https://substackcdn.com/image/fetch/w_256,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F5b730ae4-aa35-496e-8198-965a187e2e43_600x600.png	2022-12-05 13:52:08+00	2022-12-05 13:52:08+00	f
33	Black Friday Deals (macOS apps, SaaS, Books, Courses, etc.)	Awesome deals on Black Friday: Apps, SaaS, Books, Courses, etc. - GitHub - trungdq88/Awesome-Black-Friday-Cyber-Monday: Awesome deals on Black Friday: Apps, SaaS, Books, Courses, etc.	trungdq88	Curated list of deals on Black Friday 2022. Feel free to add your app's deal below with a Pull Request.\r\nMake sure you add your deal at the end of each category (first come, first merged).\r\nFollow th… [+77432 chars]	f	https://github.com/trungdq88/Awesome-Black-Friday-Cyber-Monday	Github.com	https://opengraph.githubassets.com/1e49f7fb42b363f6895a2ef059e73f512f6865c39b85d574fca9abb5a7e5ff27/trungdq88/Awesome-Black-Friday-Cyber-Monday	2022-11-25 16:32:44+00	2022-11-25 16:32:44+00	f
34	The 10 Best Discord Servers for Web Developers	If you're a web developer looking for a place to connect with other developers, then these Discord servers offer an excellent platform for doing so.	Joshua Adegoke	Discord is a chatting app that used to be for gamers, but has recently evolved into a community where people with like interests converge online and discuss specific topics. The simplest way to grow … [+6707 chars]	f	https://www.makeuseof.com/discord-servers-for-web-developers/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/11/A-finger-pointing-at-the-Discord-logo-on-a-phone--(1).jpg	2022-11-11 16:45:15+00	2022-11-11 16:45:15+00	f
35	The 8 Best Coding Apps for Android	Whether you're an experience programmer or just starting out, these Android coding apps will help you practice and develop your skills.	Sajid Shaik	Coding serves as the foundation for some of the most revolutionary technological developments. If you're already involved directly or indirectly in coding, you might want to level up your programming… [+7018 chars]	f	https://www.makeuseof.com/best-coding-apps-for-android/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/12/best-coding-apps-android.jpg	2022-12-08 15:30:16+00	2022-12-08 15:30:16+00	f
36	Why Should You Learn C++?	C++ is a fast language, but a complicated one too. So should you really bother to learn it?	Fatih Küçükkarakurt	C++ is a very powerful programming language that is actively used in many areas. Those who are new to the C++ programming language or want to master the language often have one question: why bother?\r… [+7112 chars]	f	https://www.makeuseof.com/c-plus-plus-should-you-learn/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/11/is-it-difficult-to-master-the-C-language.jpg	2022-11-19 16:00:14+00	2022-11-19 16:00:14+00	f
37	Game Development Is Easy With Pygame Zero	Pygame Zero simplifies game development by doing a lot of the work for you.	Elijah Drown	Programming can be a daunting prospect for anyone dipping their toe into the world of game development.\r\nPython is often revered as an excellent coding gateway as this language prioritizes readabilit… [+4604 chars]	f	https://www.makeuseof.com/pygame-zero-game-development-easy/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/11/retro-consoles--fi.jpg	2022-11-15 11:00:14+00	2022-11-15 11:00:14+00	f
38	Data Scientist vs. Data Engineer: How Do They Differ?	Data scientists and data engineers are crucial roles in big data and analytics, but they have different skills and job duties. Here's how they differ!	Joshua Adegoke	Data is the new oil with many sides to its exploration. From the extraction of data down to the system infrastructure needed to contain this data flow, the concept of data organization continues to b… [+7593 chars]	f	https://www.makeuseof.com/data-scientist-vs-data-engineer/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/11/a-man-in-thoughts-standing-in-front-of-a-white-board-_.jpg	2022-12-06 18:45:16+00	2022-12-06 18:45:16+00	f
39	Beautiful Soup vs. Scrapy vs. Selenium: Which Web Scraping Tool Should You Use?	When you start with Python web scraping, your choices eventually boil down to three tools: Beautiful Soup, Scrapy, and Selenium.	Deepesh Sharma	Want to learn web scraping with Python but are confused about whether to use Beautiful Soup, Selenium, or Scrapy for your next project? While all these Python libraries and frameworks are powerful in… [+6560 chars]	f	https://www.makeuseof.com/beautiful-soup-vs-scrapy-vs-selenium/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/12/beautifulsoup-vs-scrapy-vs-selenium.jpg	2022-12-04 22:00:15+00	2022-12-04 22:00:15+00	f
40	How to Become a Machine Learning Engineer: A Beginner’s Guide	Want to become a machine learning engineer? Here's the ultimate guide to help you pursue an ML career and get a job in this industry.	Raji Oluwaniyi	Machine learning is a critical component of artificial intelligence systems, with which AI is more effective today. Many big companies utilize machine learning to predict outcomes in their business, … [+6328 chars]	f	https://www.makeuseof.com/become-machine-learning-engineer/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/11/Man-in-Front-of-Monitor.jpg	2022-11-25 13:30:15+00	2022-11-25 13:30:15+00	f
41	How to Become a DevOps Engineer: A Step-by-Step Guide	If you’re interested in becoming a DevOps engineer, there are several things you should do to prepare yourself. Here's a step-by-step guide to help.	Raji Oluwaniyi	In a traditional organizational setting, a product undergoes several stages before it is launched, from the project initiation stage to the development and operation stages. However, forward-thinking… [+7454 chars]	f	https://www.makeuseof.com/how-to-become-devops-engineer/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/11/A-laptop-covered-with-DevOps--Agile-stickers.jpg	2022-11-14 20:30:20+00	2022-11-14 20:30:20+00	f
42	Connect to Your Wireless Network With a Raspberry Pi Pico W	Make the most of the Raspberry Pi Pico W's wireless capability by getting it to connect to your Wi-Fi network.	Elijah Drown	Smartphones, tablets, and computers make connecting to your Wi-Fi at home, a coffee shop, or a local library painless and straightforward. That's because they have an operating system that comes with… [+4657 chars]	f	https://www.makeuseof.com/connect-wireless-network-with-raspberry-pi-pico-w/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/11/wireless-pico-FI.jpg	2022-11-24 15:30:16+00	2022-11-24 15:30:16+00	f
43	How to Use a Switch Statement in C#	Tidy up awkward repeated if statements with the convenient language feature.	Sharlene Khan	In an application, it is common for certain events to only occur based on certain conditions. You can use different types of conditional statements to handle these events. This includes if-statements… [+6454 chars]	f	https://www.makeuseof.com/c-sharp-switch-statement/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/11/Code-switch-statement-on-laptop.jpg	2022-11-15 17:00:14+00	2022-11-15 17:00:14+00	f
44	How to Become a Database Engineer: A Beginner's Guide	Do you want a career as a database engineer, but don't know where to begin? Here's a step-by-step guide you can follow.	Raji Oluwaniyi	Data is the lifeblood of many thriving organizations today, and very few establishments can afford to ignore its value in the modern economy. However, collating, storing, and utilizing data requires … [+6432 chars]	f	https://www.makeuseof.com/how-to-become-database-engineer/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/08/Software-Engineer-Standing-Beside-Server-Racks.jpg	2022-11-14 18:30:14+00	2022-11-14 18:30:14+00	f
45	4 Ways to Shorten Linux Commands and Save Time	Improve your terminal experience and save more time by reducing the length of your Linux commands with these methods.	Deepesh Sharma	Linux commands are often known for being too long, and with excessive length comes increased complexity and comprehension issues. But there's always a way to shorten your Linux commands and turn them… [+6135 chars]	f	https://www.makeuseof.com/ways-to-shorten-linux-commands/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/11/shorten-linux-commands.jpg	2022-11-30 21:30:15+00	2022-11-30 21:30:15+00	f
46	The 7 Best Places to Host Your Developer Portfolio	If you're a software developer looking for a place to host your portfolio or showcase your skills, check out these sites that can help you create one.	Raji Oluwaniyi	As a developer, building a strong portfolio is vital for your career development, as it's a great way to attract employers and get job opportunities. However, using a platform to display your portfol… [+8610 chars]	f	https://www.makeuseof.com/best-places-to-host-developer-portfolio/	MakeUseOf	https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/11/Multiple-Monitors-Turned-On.jpg	2022-12-01 13:45:15+00	2022-12-01 13:45:15+00	f
47	C++ zooms past Java in programming popularity contest	TIOBE or not TIOBE, that is the question\nJava is no longer among the top three most popular programming languages in the TIOBE Index, one of several not particularly definitive yardsticks by which such things are measured.…<!--#include virtual='/data_centre/_…	Thomas Claburn	Java is no longer among the top three most popular programming languages in the TIOBE Index, one of several not particularly definitive yardsticks by which such things are measured.\r\nAccording to Pau… [+3392 chars]	f	https://www.theregister.com/2022/12/10/java_slips_behind_c_in/	Theregister.com	https://regmedia.co.uk/2022/12/09/shutterstock_coffee.jpg	2022-12-10 08:50:09+00	2022-12-10 08:50:09+00	f
48	An Introduction To Using R For SEO via @sejournal, @TaylorDanRW	Leave a bigger impact on your business. Discover how to connect R to your SEO work, plus how you can learn it in-depth (for free).\nThe post An Introduction To Using R For SEO appeared first on Search Engine Journal.	Dan Taylor	Predictive analysis refers to the use of historical data and analyzing it using statistics to predict future events.\r\n It takes place in seven steps, and these are: defining the project, data collect… [+10142 chars]	f	https://www.searchenginejournal.com/an-introduction-to-using-r-for-seo/470277/	Search Engine Journal	https://cdn.searchenginejournal.com/wp-content/uploads/2022/11/beginners-guide-to-r-analytics-637631fff3950-sej.png	2022-11-23 10:00:04+00	2022-11-23 10:00:04+00	f
49	Transitioning From Excel To Python: Essential Functions For SEO Data Analysis via @sejournal, @williamjnye	Learn the Python equivalents of your favorite Excel formulas to speed up your data analysis and automate repetitive tasks.\nThe post Transitioning From Excel To Python: Essential Functions For SEO Data Analysis appeared first on Search Engine Journal.	Will Nye	Learning to code, whether with Python, JavaScript, or another programming language, has a whole host of benefits, including the ability to work with larger datasets and automate repetitive tasks.\r\nBu… [+19025 chars]	f	https://www.searchenginejournal.com/transitioning-from-excel-to-python-essential-functions-for-seo-data-analysis/472147/	Search Engine Journal	https://cdn.searchenginejournal.com/wp-content/uploads/2022/11/excel-to-python-for-data-analysis-637f4d8b66fb7-sej.png	2022-12-02 09:15:42+00	2022-12-02 09:15:42+00	f
50	A Practical Guide To Multi-Touch Attribution	Learn the difference between 4 multi-touch attribution models to leverage them, and ultimately create better conversion rate optimation. Here's how to do it step-by-step.\nThe post A Practical Guide To Multi-Touch Attribution appeared first on Search Engine Jo…	Wilson Lau	The customer journey involves multiple interactions between the customer and the merchant or service provider.\r\nWe call each interaction in the customer journey a touch point.\r\nAccording to Salesforc… [+17420 chars]	f	https://www.searchenginejournal.com/practical-guide-multi-touch-attribution/471022/	Search Engine Journal	https://cdn.searchenginejournal.com/wp-content/uploads/2022/11/multi-touch-attribution-637b8f47e79ad-sej.png	2022-11-23 09:15:08+00	2022-11-23 09:15:08+00	f
\.


--
-- Data for Name: mainapp_teacherscourse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mainapp_teacherscourse (id, name_first, name_second, birthday, deleted) FROM stdin;
1	Герасим	Нечипарукошвили	1991-11-11	f
2	Андрей	Уважаемый	1988-05-24	f
3	Сергей	Трудовой	1979-01-30	f
4	Василий	Василевский	1990-07-17	f
5	Валерий	Валерьев	1999-05-19	f
6	Семен	Садачевич	1997-11-05	f
7	Абстрактный	Чувак	1993-09-25	f
\.


--
-- Data for Name: mainapp_teacherscourse_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mainapp_teacherscourse_course (id, teacherscourse_id, courses_id) FROM stdin;
1	1	3
2	1	5
3	2	1
4	2	6
5	3	1
6	3	5
7	3	7
8	4	8
9	4	2
10	4	3
11	5	2
12	5	4
13	5	6
14	6	8
15	6	1
16	6	7
17	7	1
18	7	4
19	7	5
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- Name: authapp_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authapp_customuser_groups_id_seq', 1, false);


--
-- Name: authapp_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authapp_customuser_id_seq', 1, false);


--
-- Name: authapp_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authapp_customuser_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 48, true);


--
-- Name: mainapp_coursefeedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mainapp_coursefeedback_id_seq', 1, false);


--
-- Name: mainapp_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mainapp_courses_id_seq', 1, false);


--
-- Name: mainapp_lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mainapp_lessons_id_seq', 1, false);


--
-- Name: mainapp_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mainapp_news_id_seq', 50, true);


--
-- Name: mainapp_teacherscourse_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mainapp_teacherscourse_course_id_seq', 19, true);


--
-- Name: mainapp_teacherscourse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mainapp_teacherscourse_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authapp_customuser authapp_customuser_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser
    ADD CONSTRAINT authapp_customuser_email_key UNIQUE (email);


--
-- Name: authapp_customuser_groups authapp_customuser_groups_customuser_id_group_id_03af0264_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser_groups
    ADD CONSTRAINT authapp_customuser_groups_customuser_id_group_id_03af0264_uniq UNIQUE (customuser_id, group_id);


--
-- Name: authapp_customuser_groups authapp_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser_groups
    ADD CONSTRAINT authapp_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: authapp_customuser authapp_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser
    ADD CONSTRAINT authapp_customuser_pkey PRIMARY KEY (id);


--
-- Name: authapp_customuser_user_permissions authapp_customuser_user__customuser_id_permission_abd7dbc4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser_user_permissions
    ADD CONSTRAINT authapp_customuser_user__customuser_id_permission_abd7dbc4_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: authapp_customuser_user_permissions authapp_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser_user_permissions
    ADD CONSTRAINT authapp_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: authapp_customuser authapp_customuser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser
    ADD CONSTRAINT authapp_customuser_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: mainapp_coursefeedback mainapp_coursefeedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_coursefeedback
    ADD CONSTRAINT mainapp_coursefeedback_pkey PRIMARY KEY (id);


--
-- Name: mainapp_courses mainapp_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_courses
    ADD CONSTRAINT mainapp_courses_pkey PRIMARY KEY (id);


--
-- Name: mainapp_lessons mainapp_lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_lessons
    ADD CONSTRAINT mainapp_lessons_pkey PRIMARY KEY (id);


--
-- Name: mainapp_news mainapp_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_news
    ADD CONSTRAINT mainapp_news_pkey PRIMARY KEY (id);


--
-- Name: mainapp_teacherscourse_course mainapp_teacherscourse_c_teacherscourse_id_course_cf0a5a04_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_teacherscourse_course
    ADD CONSTRAINT mainapp_teacherscourse_c_teacherscourse_id_course_cf0a5a04_uniq UNIQUE (teacherscourse_id, courses_id);


--
-- Name: mainapp_teacherscourse_course mainapp_teacherscourse_course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_teacherscourse_course
    ADD CONSTRAINT mainapp_teacherscourse_course_pkey PRIMARY KEY (id);


--
-- Name: mainapp_teacherscourse mainapp_teacherscourse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_teacherscourse
    ADD CONSTRAINT mainapp_teacherscourse_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authapp_customuser_email_40efe401_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authapp_customuser_email_40efe401_like ON public.authapp_customuser USING btree (email varchar_pattern_ops);


--
-- Name: authapp_customuser_groups_customuser_id_d338aa9f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authapp_customuser_groups_customuser_id_d338aa9f ON public.authapp_customuser_groups USING btree (customuser_id);


--
-- Name: authapp_customuser_groups_group_id_4143a1f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authapp_customuser_groups_group_id_4143a1f8 ON public.authapp_customuser_groups USING btree (group_id);


--
-- Name: authapp_customuser_user_permissions_customuser_id_5e7638ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authapp_customuser_user_permissions_customuser_id_5e7638ee ON public.authapp_customuser_user_permissions USING btree (customuser_id);


--
-- Name: authapp_customuser_user_permissions_permission_id_a4c601ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authapp_customuser_user_permissions_permission_id_a4c601ab ON public.authapp_customuser_user_permissions USING btree (permission_id);


--
-- Name: authapp_customuser_username_eeefaeff_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authapp_customuser_username_eeefaeff_like ON public.authapp_customuser USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: mainapp_coursefeedback_course_id_12c3b9d0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mainapp_coursefeedback_course_id_12c3b9d0 ON public.mainapp_coursefeedback USING btree (course_id);


--
-- Name: mainapp_coursefeedback_user_id_423814a8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mainapp_coursefeedback_user_id_423814a8 ON public.mainapp_coursefeedback USING btree (user_id);


--
-- Name: mainapp_lessons_course_id_d17175f3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mainapp_lessons_course_id_d17175f3 ON public.mainapp_lessons USING btree (course_id);


--
-- Name: mainapp_teacherscourse_course_courses_id_34a555bd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mainapp_teacherscourse_course_courses_id_34a555bd ON public.mainapp_teacherscourse_course USING btree (courses_id);


--
-- Name: mainapp_teacherscourse_course_teacherscourse_id_b0eb892c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mainapp_teacherscourse_course_teacherscourse_id_b0eb892c ON public.mainapp_teacherscourse_course USING btree (teacherscourse_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authapp_customuser_groups authapp_customuser_g_customuser_id_d338aa9f_fk_authapp_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser_groups
    ADD CONSTRAINT authapp_customuser_g_customuser_id_d338aa9f_fk_authapp_c FOREIGN KEY (customuser_id) REFERENCES public.authapp_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authapp_customuser_groups authapp_customuser_groups_group_id_4143a1f8_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser_groups
    ADD CONSTRAINT authapp_customuser_groups_group_id_4143a1f8_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authapp_customuser_user_permissions authapp_customuser_u_customuser_id_5e7638ee_fk_authapp_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser_user_permissions
    ADD CONSTRAINT authapp_customuser_u_customuser_id_5e7638ee_fk_authapp_c FOREIGN KEY (customuser_id) REFERENCES public.authapp_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authapp_customuser_user_permissions authapp_customuser_u_permission_id_a4c601ab_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_customuser_user_permissions
    ADD CONSTRAINT authapp_customuser_u_permission_id_a4c601ab_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_authapp_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_authapp_customuser_id FOREIGN KEY (user_id) REFERENCES public.authapp_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mainapp_coursefeedback mainapp_coursefeedba_user_id_423814a8_fk_authapp_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_coursefeedback
    ADD CONSTRAINT mainapp_coursefeedba_user_id_423814a8_fk_authapp_c FOREIGN KEY (user_id) REFERENCES public.authapp_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mainapp_coursefeedback mainapp_coursefeedback_course_id_12c3b9d0_fk_mainapp_courses_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_coursefeedback
    ADD CONSTRAINT mainapp_coursefeedback_course_id_12c3b9d0_fk_mainapp_courses_id FOREIGN KEY (course_id) REFERENCES public.mainapp_courses(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mainapp_lessons mainapp_lessons_course_id_d17175f3_fk_mainapp_courses_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_lessons
    ADD CONSTRAINT mainapp_lessons_course_id_d17175f3_fk_mainapp_courses_id FOREIGN KEY (course_id) REFERENCES public.mainapp_courses(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mainapp_teacherscourse_course mainapp_teacherscour_courses_id_34a555bd_fk_mainapp_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_teacherscourse_course
    ADD CONSTRAINT mainapp_teacherscour_courses_id_34a555bd_fk_mainapp_c FOREIGN KEY (courses_id) REFERENCES public.mainapp_courses(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mainapp_teacherscourse_course mainapp_teacherscour_teacherscourse_id_b0eb892c_fk_mainapp_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_teacherscourse_course
    ADD CONSTRAINT mainapp_teacherscour_teacherscourse_id_b0eb892c_fk_mainapp_t FOREIGN KEY (teacherscourse_id) REFERENCES public.mainapp_teacherscourse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersoci_user_id_17d28448_fk_authapp_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersoci_user_id_17d28448_fk_authapp_c FOREIGN KEY (user_id) REFERENCES public.authapp_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

