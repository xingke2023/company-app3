--
-- PostgreSQL database dump
--

\restrict ZqpdbWER30H3K3F0NH6NISRj79SC7NxklPTnGTX40gyAUVr34FcYmr2CaHVilXT

-- Dumped from database version 14.23 (Ubuntu 14.23-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.23 (Ubuntu 14.23-0ubuntu0.22.04.1)

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
-- Name: activities; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.activities (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    customer_id bigint,
    lead_id bigint,
    opportunity_id bigint,
    description text,
    scheduled_at timestamp(0) without time zone,
    completed_at timestamp(0) without time zone,
    user_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.activities OWNER TO hengtai_app;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO hengtai_app;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;


--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.api_keys (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    key character varying(64) NOT NULL,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.api_keys OWNER TO hengtai_app;

--
-- Name: COLUMN api_keys.name; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.api_keys.name IS '用途说明，如「进销存小程序服务账号」';


--
-- Name: COLUMN api_keys.key; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.api_keys.key IS '永久有效的 API Key，Bearer token 形式传入';


--
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.api_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_keys_id_seq OWNER TO hengtai_app;

--
-- Name: api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.api_keys_id_seq OWNED BY public.api_keys.id;


--
-- Name: app_settings; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.app_settings (
    id bigint NOT NULL,
    key character varying(100) NOT NULL,
    value text,
    label character varying(100),
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.app_settings OWNER TO hengtai_app;

--
-- Name: COLUMN app_settings.key; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.app_settings.key IS '设置键，如 miniprogram_title';


--
-- Name: COLUMN app_settings.label; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.app_settings.label IS '后台显示的中文说明';


--
-- Name: app_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.app_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_settings_id_seq OWNER TO hengtai_app;

--
-- Name: app_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.app_settings_id_seq OWNED BY public.app_settings.id;


--
-- Name: assistant_notes; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.assistant_notes (
    id bigint NOT NULL,
    type character varying(255) DEFAULT 'note'::character varying NOT NULL,
    content text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT assistant_notes_type_check CHECK (((type)::text = ANY ((ARRAY['note'::character varying, 'plan'::character varying, 'ai_suggestion'::character varying])::text[])))
);


ALTER TABLE public.assistant_notes OWNER TO hengtai_app;

--
-- Name: assistant_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.assistant_notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assistant_notes_id_seq OWNER TO hengtai_app;

--
-- Name: assistant_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.assistant_notes_id_seq OWNED BY public.assistant_notes.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO hengtai_app;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO hengtai_app;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.contacts (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    "position" character varying(255),
    phone character varying(255),
    email character varying(255),
    is_primary boolean DEFAULT false NOT NULL,
    notes text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.contacts OWNER TO hengtai_app;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO hengtai_app;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    company character varying(255),
    phone character varying(255),
    email character varying(255),
    address character varying(255),
    type character varying(255) DEFAULT 'individual'::character varying NOT NULL,
    source character varying(255),
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    assigned_to bigint,
    notes text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    gender character varying(20),
    age_group character varying(20),
    birthday date,
    city character varying(100),
    industry character varying(100),
    income_level character varying(20),
    hobbies json,
    tags json
);


ALTER TABLE public.customers OWNER TO hengtai_app;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO hengtai_app;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO hengtai_app;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO hengtai_app;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: inventory_logs; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.inventory_logs (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    type character varying(255) NOT NULL,
    quantity integer NOT NULL,
    before_stock integer NOT NULL,
    after_stock integer NOT NULL,
    reference_type character varying(255),
    reference_id bigint,
    notes text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.inventory_logs OWNER TO hengtai_app;

--
-- Name: inventory_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.inventory_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_logs_id_seq OWNER TO hengtai_app;

--
-- Name: inventory_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.inventory_logs_id_seq OWNED BY public.inventory_logs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO hengtai_app;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO hengtai_app;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO hengtai_app;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: leads; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.leads (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    company character varying(255),
    phone character varying(255),
    email character varying(255),
    source character varying(255) DEFAULT 'other'::character varying NOT NULL,
    status character varying(255) DEFAULT 'new'::character varying NOT NULL,
    assigned_to bigint,
    notes text,
    last_contacted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.leads OWNER TO hengtai_app;

--
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.leads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leads_id_seq OWNER TO hengtai_app;

--
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.leads_id_seq OWNED BY public.leads.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO hengtai_app;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO hengtai_app;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: opportunities; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.opportunities (
    id bigint NOT NULL,
    customer_id bigint,
    lead_id bigint,
    title character varying(255) NOT NULL,
    amount numeric(12,2) DEFAULT '0'::numeric NOT NULL,
    stage character varying(255) DEFAULT 'prospect'::character varying NOT NULL,
    probability integer DEFAULT 0 NOT NULL,
    expected_close_date date,
    assigned_to bigint,
    notes text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.opportunities OWNER TO hengtai_app;

--
-- Name: opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunities_id_seq OWNER TO hengtai_app;

--
-- Name: opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.opportunities_id_seq OWNED BY public.opportunities.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO hengtai_app;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name text NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO hengtai_app;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO hengtai_app;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    published boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.posts OWNER TO hengtai_app;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO hengtai_app;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.product_categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_categories OWNER TO hengtai_app;

--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categories_id_seq OWNER TO hengtai_app;

--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    category_id bigint,
    supplier_id bigint,
    name character varying(255) NOT NULL,
    sku character varying(255) NOT NULL,
    description text,
    unit character varying(255) DEFAULT '件'::character varying NOT NULL,
    cost_price numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    sell_price numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    stock_quantity integer DEFAULT 0 NOT NULL,
    min_stock integer DEFAULT 0 NOT NULL,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO hengtai_app;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO hengtai_app;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: purchase_order_items; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.purchase_order_items (
    id bigint NOT NULL,
    purchase_order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    total_price numeric(12,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.purchase_order_items OWNER TO hengtai_app;

--
-- Name: purchase_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.purchase_order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_order_items_id_seq OWNER TO hengtai_app;

--
-- Name: purchase_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.purchase_order_items_id_seq OWNED BY public.purchase_order_items.id;


--
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.purchase_orders (
    id bigint NOT NULL,
    order_no character varying(255) NOT NULL,
    supplier_id bigint,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    total_amount numeric(12,2) DEFAULT '0'::numeric NOT NULL,
    notes text,
    ordered_at timestamp(0) without time zone,
    received_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.purchase_orders OWNER TO hengtai_app;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.purchase_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_orders_id_seq OWNER TO hengtai_app;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.purchase_orders_id_seq OWNED BY public.purchase_orders.id;


--
-- Name: quick_action_items; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.quick_action_items (
    id bigint NOT NULL,
    quick_action_id bigint NOT NULL,
    emoji character varying(16),
    label character varying(50) NOT NULL,
    "desc" character varying(100),
    item_type character varying(20) DEFAULT 'external'::character varying NOT NULL,
    route character varying(300),
    prompt text,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.quick_action_items OWNER TO hengtai_app;

--
-- Name: COLUMN quick_action_items."desc"; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.quick_action_items."desc" IS '副标题说明';


--
-- Name: COLUMN quick_action_items.item_type; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.quick_action_items.item_type IS 'external|route|prompt';


--
-- Name: COLUMN quick_action_items.route; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.quick_action_items.route IS 'route/external 路径或完整 URL';


--
-- Name: COLUMN quick_action_items.prompt; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.quick_action_items.prompt IS 'prompt 类型：发给 AI 的文字';


--
-- Name: quick_action_items_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.quick_action_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quick_action_items_id_seq OWNER TO hengtai_app;

--
-- Name: quick_action_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.quick_action_items_id_seq OWNED BY public.quick_action_items.id;


--
-- Name: quick_actions; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.quick_actions (
    id bigint NOT NULL,
    key character varying(50) NOT NULL,
    emoji character varying(16),
    label character varying(50) NOT NULL,
    badge character varying(20),
    action_type character varying(20) DEFAULT 'external'::character varying NOT NULL,
    prompt text,
    target_path character varying(300),
    target_title character varying(50),
    web_label character varying(50),
    enabled boolean DEFAULT true NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.quick_actions OWNER TO hengtai_app;

--
-- Name: COLUMN quick_actions.key; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.quick_actions.key IS '按钮标识（用于样式 qa-chip-{key}）';


--
-- Name: COLUMN quick_actions.badge; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.quick_actions.badge IS '角标文字，空则不显示';


--
-- Name: COLUMN quick_actions.action_type; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.quick_actions.action_type IS 'external|open|menu|home|prompt|web';


--
-- Name: COLUMN quick_actions.prompt; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.quick_actions.prompt IS 'prompt/web 类型：发给 AI 的文字';


--
-- Name: COLUMN quick_actions.target_path; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.quick_actions.target_path IS 'open/external 路径或完整 URL；home 回跳路径';


--
-- Name: COLUMN quick_actions.target_title; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.quick_actions.target_title IS 'web-view 页标题';


--
-- Name: COLUMN quick_actions.web_label; Type: COMMENT; Schema: public; Owner: hengtai_app
--

COMMENT ON COLUMN public.quick_actions.web_label IS 'web 类型「打开完整页」按钮文字';


--
-- Name: quick_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.quick_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quick_actions_id_seq OWNER TO hengtai_app;

--
-- Name: quick_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.quick_actions_id_seq OWNED BY public.quick_actions.id;


--
-- Name: sales_order_items; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.sales_order_items (
    id bigint NOT NULL,
    sales_order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    total_price numeric(12,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.sales_order_items OWNER TO hengtai_app;

--
-- Name: sales_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.sales_order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_order_items_id_seq OWNER TO hengtai_app;

--
-- Name: sales_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.sales_order_items_id_seq OWNED BY public.sales_order_items.id;


--
-- Name: sales_orders; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.sales_orders (
    id bigint NOT NULL,
    order_no character varying(255) NOT NULL,
    customer_id bigint,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    total_amount numeric(12,2) DEFAULT '0'::numeric NOT NULL,
    notes text,
    ordered_at timestamp(0) without time zone,
    shipped_at timestamp(0) without time zone,
    completed_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.sales_orders OWNER TO hengtai_app;

--
-- Name: sales_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.sales_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_orders_id_seq OWNER TO hengtai_app;

--
-- Name: sales_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.sales_orders_id_seq OWNED BY public.sales_orders.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO hengtai_app;

--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.suppliers (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    contact_person character varying(255),
    phone character varying(255),
    email character varying(255),
    address character varying(255),
    notes text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.suppliers OWNER TO hengtai_app;

--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_id_seq OWNER TO hengtai_app;

--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: hengtai_app
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    sso_user_id character varying(255)
);


ALTER TABLE public.users OWNER TO hengtai_app;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: hengtai_app
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO hengtai_app;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hengtai_app
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);


--
-- Name: api_keys id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.api_keys ALTER COLUMN id SET DEFAULT nextval('public.api_keys_id_seq'::regclass);


--
-- Name: app_settings id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.app_settings ALTER COLUMN id SET DEFAULT nextval('public.app_settings_id_seq'::regclass);


--
-- Name: assistant_notes id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.assistant_notes ALTER COLUMN id SET DEFAULT nextval('public.assistant_notes_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: inventory_logs id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.inventory_logs ALTER COLUMN id SET DEFAULT nextval('public.inventory_logs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: leads id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.leads ALTER COLUMN id SET DEFAULT nextval('public.leads_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: opportunities id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.opportunities ALTER COLUMN id SET DEFAULT nextval('public.opportunities_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: purchase_order_items id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.purchase_order_items ALTER COLUMN id SET DEFAULT nextval('public.purchase_order_items_id_seq'::regclass);


--
-- Name: purchase_orders id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.purchase_orders ALTER COLUMN id SET DEFAULT nextval('public.purchase_orders_id_seq'::regclass);


--
-- Name: quick_action_items id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.quick_action_items ALTER COLUMN id SET DEFAULT nextval('public.quick_action_items_id_seq'::regclass);


--
-- Name: quick_actions id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.quick_actions ALTER COLUMN id SET DEFAULT nextval('public.quick_actions_id_seq'::regclass);


--
-- Name: sales_order_items id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.sales_order_items ALTER COLUMN id SET DEFAULT nextval('public.sales_order_items_id_seq'::regclass);


--
-- Name: sales_orders id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.sales_orders ALTER COLUMN id SET DEFAULT nextval('public.sales_orders_id_seq'::regclass);


--
-- Name: suppliers id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.activities (id, type, title, customer_id, lead_id, opportunity_id, description, scheduled_at, completed_at, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.api_keys (id, user_id, name, key, last_used_at, created_at, updated_at) FROM stdin;
1	2	Insurance MiniProgram Service	ak_KpZdww4JzX7wgMjAPKIyO9EZNU2tc9JXm5YpySjeM16lDsKz	2026-06-17 03:40:21	2026-06-17 03:38:22	2026-06-17 03:40:21
\.


--
-- Data for Name: app_settings; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.app_settings (id, key, value, label, sort_order, created_at, updated_at) FROM stdin;
1	miniprogram_title	进销存及CRM	小程序顶部标题	10	2026-06-17 03:33:52	2026-06-17 03:33:52
\.


--
-- Data for Name: assistant_notes; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.assistant_notes (id, type, content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.contacts (id, customer_id, name, "position", phone, email, is_primary, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.customers (id, name, company, phone, email, address, type, source, status, assigned_to, notes, created_at, updated_at, gender, age_group, birthday, city, industry, income_level, hobbies, tags) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: inventory_logs; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.inventory_logs (id, product_id, type, quantity, before_stock, after_stock, reference_type, reference_id, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.leads (id, name, company, phone, email, source, status, assigned_to, notes, last_contacted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_11_29_220023_create_personal_access_tokens_table	1
5	2025_11_29_220222_create_posts_table	1
6	2026_06_11_224312_create_product_categories_table	1
7	2026_06_11_224312_create_suppliers_table	1
8	2026_06_11_224313_create_products_table	1
9	2026_06_11_224313_create_purchase_orders_table	1
10	2026_06_11_224314_create_purchase_order_items_table	1
11	2026_06_11_224315_create_inventory_logs_table	1
12	2026_06_11_224316_create_customers_table	1
13	2026_06_11_224317_create_contacts_table	1
14	2026_06_11_224318_create_leads_table	1
15	2026_06_11_224319_create_opportunities_table	1
16	2026_06_11_224320_create_sales_orders_table	1
17	2026_06_11_224321_create_sales_order_items_table	1
18	2026_06_11_224322_create_activities_table	1
19	2026_06_12_000000_create_quick_actions_tables	1
20	2026_06_12_000001_create_app_settings_table	1
21	2026_06_13_014637_create_api_keys_table	1
22	2026_06_13_053418_add_hobbies_to_customers_table	1
23	2026_06_13_063758_make_supplier_id_nullable_on_purchase_orders	1
24	2026_06_13_063909_make_customer_id_nullable_on_sales_orders	1
25	2026_06_13_075823_make_user_id_nullable_on_activities	1
26	2026_06_14_013841_create_assistant_notes_table	1
27	2026_06_14_215618_add_sso_user_id_to_users_table	1
\.


--
-- Data for Name: opportunities; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.opportunities (id, customer_id, lead_id, title, amount, stage, probability, expected_close_date, assigned_to, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.posts (id, user_id, title, content, published, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.product_categories (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.products (id, category_id, supplier_id, name, sku, description, unit, cost_price, sell_price, stock_quantity, min_stock, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: purchase_order_items; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.purchase_order_items (id, purchase_order_id, product_id, quantity, unit_price, total_price, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.purchase_orders (id, order_no, supplier_id, status, total_amount, notes, ordered_at, received_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: quick_action_items; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.quick_action_items (id, quick_action_id, emoji, label, "desc", item_type, route, prompt, sort_order, created_at, updated_at) FROM stdin;
4	7	📋	线索	潜在客户线索	route	/pages/report/report?path=%2Fleads&title=%E9%94%80%E5%94%AE%E7%BA%BF%E7%B4%A2	\N	10	2026-06-17 03:47:33	2026-06-17 03:47:33
5	7	💼	商机	保单商机跟进	route	/pages/report/report?path=%2Fopportunities&title=%E5%95%86%E6%9C%BA%E7%AE%A1%E7%90%86	\N	20	2026-06-17 03:47:33	2026-06-17 03:47:33
6	8	📊	产品对比	保险产品横向对比	prompt	\N	请帮我对比几款保险产品的条款和保障范围，我需要给客户做方案设计。	10	2026-06-17 03:47:33	2026-06-17 03:47:33
7	8	💬	展业话术	销售开口话术	prompt	\N	请给我一套针对中年家庭客户的保险展业开口话术，要自然不生硬。	20	2026-06-17 03:47:33	2026-06-17 03:47:33
8	8	🛡️	拒绝处理	客户异议处理	prompt	\N	客户说"保险都是骗人的"，请帮我给出专业的异议处理话术。	30	2026-06-17 03:47:33	2026-06-17 03:47:33
9	8	📣	拓客文案	朋友圈/短信推广	prompt	\N	请帮我写一条适合发朋友圈的保险推广文案，要真实有温度，不要夸大宣传。	40	2026-06-17 03:47:33	2026-06-17 03:47:33
10	9	📝	理赔指引	帮客户办理理赔	prompt	\N	请帮我给客户解释理赔流程和需要准备的材料，保险类型是：	10	2026-06-17 03:47:33	2026-06-17 03:47:33
11	9	🔔	续保提醒	生成续保话术	prompt	\N	请帮我生成一条温馨的续保提醒短信，客户的保单即将在下个月到期。	20	2026-06-17 03:47:33	2026-06-17 03:47:33
12	9	💁	客服话术	回应客户投诉/咨询	prompt	\N	客户对理赔结果不满意，请帮我给出安抚客户并解决问题的话术。	30	2026-06-17 03:47:33	2026-06-17 03:47:33
13	10	🎭	话术演练	AI 扮演客户陪练	prompt	\N	请扮演一个对保险持怀疑态度的中年客户，和我进行保险销售话术演练。	10	2026-06-17 03:47:33	2026-06-17 03:47:33
14	10	⚖️	合规查询	条款合规性检查	prompt	\N	请帮我检查以下宣传文案是否符合保险监管合规要求：	20	2026-06-17 03:47:33	2026-06-17 03:47:33
15	10	📚	新人入门	保险基础知识	prompt	\N	我是保险新人，请给我讲解寿险/重疾险/医疗险的核心区别和销售要点。	30	2026-06-17 03:47:33	2026-06-17 03:47:33
\.


--
-- Data for Name: quick_actions; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.quick_actions (id, key, emoji, label, badge, action_type, prompt, target_path, target_title, web_label, enabled, sort_order, created_at, updated_at) FROM stdin;
1	home	🏠	返回主页	\N	home	\N	/pages/industry/industry	\N	\N	t	1	2026-06-17 03:33:52	2026-06-17 03:33:52
6	customers	👥	客户管理	\N	open	\N	/customers	客户管理	\N	t	10	2026-06-17 03:47:33	2026-06-17 03:47:33
7	pipeline	🎯	业务跟进	\N	menu	\N	\N	\N	\N	t	20	2026-06-17 03:47:33	2026-06-17 03:47:33
8	ai-sales	🚀	展业助手	\N	menu	\N	\N	\N	\N	t	30	2026-06-17 03:47:33	2026-06-17 03:47:33
9	ai-service	🛎️	理赔服务	\N	menu	\N	\N	\N	\N	t	40	2026-06-17 03:47:33	2026-06-17 03:47:33
10	ai-training	🎓	培训学习	\N	menu	\N	\N	\N	\N	t	50	2026-06-17 03:47:33	2026-06-17 03:47:33
\.


--
-- Data for Name: sales_order_items; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.sales_order_items (id, sales_order_id, product_id, quantity, unit_price, total_price, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sales_orders; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.sales_orders (id, order_no, customer_id, status, total_amount, notes, ordered_at, shipped_at, completed_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.suppliers (id, name, contact_person, phone, email, address, notes, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: hengtai_app
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, sso_user_id) FROM stdin;
1	Admin	admin@app3.xingke888.com	\N	$2y$12$95OAfjK/ViQAwRe8JYoGDO40SRAOdTTMNBIGW6wwiavOtETRuuKfC	\N	2026-06-17 03:33:57	2026-06-17 03:33:57	\N
2	Insurance Service	service@app3.xingke888.com	\N	$2y$12$7kpdcv5rIWEK8mxh6IoctuGICDSVT9eTh9NfG06xsVGQ9ecPOV.7a	\N	2026-06-17 03:38:06	2026-06-17 03:38:06	\N
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.activities_id_seq', 1, false);


--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.api_keys_id_seq', 1, true);


--
-- Name: app_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.app_settings_id_seq', 1, true);


--
-- Name: assistant_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.assistant_notes_id_seq', 1, false);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.contacts_id_seq', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: inventory_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.inventory_logs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.leads_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.migrations_id_seq', 27, true);


--
-- Name: opportunities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.opportunities_id_seq', 1, false);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: purchase_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.purchase_order_items_id_seq', 1, false);


--
-- Name: purchase_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.purchase_orders_id_seq', 1, false);


--
-- Name: quick_action_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.quick_action_items_id_seq', 15, true);


--
-- Name: quick_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.quick_actions_id_seq', 10, true);


--
-- Name: sales_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.sales_order_items_id_seq', 1, false);


--
-- Name: sales_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.sales_orders_id_seq', 1, false);


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hengtai_app
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: api_keys api_keys_key_unique; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_key_unique UNIQUE (key);


--
-- Name: api_keys api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- Name: app_settings app_settings_key_unique; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT app_settings_key_unique UNIQUE (key);


--
-- Name: app_settings app_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT app_settings_pkey PRIMARY KEY (id);


--
-- Name: assistant_notes assistant_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.assistant_notes
    ADD CONSTRAINT assistant_notes_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: inventory_logs inventory_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.inventory_logs
    ADD CONSTRAINT inventory_logs_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: opportunities opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.opportunities
    ADD CONSTRAINT opportunities_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_sku_unique; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_sku_unique UNIQUE (sku);


--
-- Name: purchase_order_items purchase_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.purchase_order_items
    ADD CONSTRAINT purchase_order_items_pkey PRIMARY KEY (id);


--
-- Name: purchase_orders purchase_orders_order_no_unique; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_order_no_unique UNIQUE (order_no);


--
-- Name: purchase_orders purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (id);


--
-- Name: quick_action_items quick_action_items_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.quick_action_items
    ADD CONSTRAINT quick_action_items_pkey PRIMARY KEY (id);


--
-- Name: quick_actions quick_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.quick_actions
    ADD CONSTRAINT quick_actions_pkey PRIMARY KEY (id);


--
-- Name: sales_order_items sales_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.sales_order_items
    ADD CONSTRAINT sales_order_items_pkey PRIMARY KEY (id);


--
-- Name: sales_orders sales_orders_order_no_unique; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_order_no_unique UNIQUE (order_no);


--
-- Name: sales_orders sales_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_sso_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_sso_user_id_unique UNIQUE (sso_user_id);


--
-- Name: api_keys_key_index; Type: INDEX; Schema: public; Owner: hengtai_app
--

CREATE INDEX api_keys_key_index ON public.api_keys USING btree (key);


--
-- Name: inventory_logs_reference_type_reference_id_index; Type: INDEX; Schema: public; Owner: hengtai_app
--

CREATE INDEX inventory_logs_reference_type_reference_id_index ON public.inventory_logs USING btree (reference_type, reference_id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: hengtai_app
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: personal_access_tokens_expires_at_index; Type: INDEX; Schema: public; Owner: hengtai_app
--

CREATE INDEX personal_access_tokens_expires_at_index ON public.personal_access_tokens USING btree (expires_at);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: hengtai_app
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: quick_action_items_quick_action_id_sort_order_index; Type: INDEX; Schema: public; Owner: hengtai_app
--

CREATE INDEX quick_action_items_quick_action_id_sort_order_index ON public.quick_action_items USING btree (quick_action_id, sort_order);


--
-- Name: quick_actions_enabled_sort_order_index; Type: INDEX; Schema: public; Owner: hengtai_app
--

CREATE INDEX quick_actions_enabled_sort_order_index ON public.quick_actions USING btree (enabled, sort_order);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: hengtai_app
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: hengtai_app
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: activities activities_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE SET NULL;


--
-- Name: activities activities_lead_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_lead_id_foreign FOREIGN KEY (lead_id) REFERENCES public.leads(id) ON DELETE SET NULL;


--
-- Name: activities activities_opportunity_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_opportunity_id_foreign FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id) ON DELETE SET NULL;


--
-- Name: activities activities_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: api_keys api_keys_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: contacts contacts_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: customers customers_assigned_to_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_assigned_to_foreign FOREIGN KEY (assigned_to) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: inventory_logs inventory_logs_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.inventory_logs
    ADD CONSTRAINT inventory_logs_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: leads leads_assigned_to_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_assigned_to_foreign FOREIGN KEY (assigned_to) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: opportunities opportunities_assigned_to_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.opportunities
    ADD CONSTRAINT opportunities_assigned_to_foreign FOREIGN KEY (assigned_to) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: opportunities opportunities_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.opportunities
    ADD CONSTRAINT opportunities_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE SET NULL;


--
-- Name: opportunities opportunities_lead_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.opportunities
    ADD CONSTRAINT opportunities_lead_id_foreign FOREIGN KEY (lead_id) REFERENCES public.leads(id) ON DELETE SET NULL;


--
-- Name: posts posts_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: products products_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.product_categories(id) ON DELETE SET NULL;


--
-- Name: products products_supplier_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_supplier_id_foreign FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id) ON DELETE SET NULL;


--
-- Name: purchase_order_items purchase_order_items_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.purchase_order_items
    ADD CONSTRAINT purchase_order_items_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: purchase_order_items purchase_order_items_purchase_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.purchase_order_items
    ADD CONSTRAINT purchase_order_items_purchase_order_id_foreign FOREIGN KEY (purchase_order_id) REFERENCES public.purchase_orders(id) ON DELETE CASCADE;


--
-- Name: purchase_orders purchase_orders_supplier_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_supplier_id_foreign FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id);


--
-- Name: quick_action_items quick_action_items_quick_action_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.quick_action_items
    ADD CONSTRAINT quick_action_items_quick_action_id_foreign FOREIGN KEY (quick_action_id) REFERENCES public.quick_actions(id) ON DELETE CASCADE;


--
-- Name: sales_order_items sales_order_items_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.sales_order_items
    ADD CONSTRAINT sales_order_items_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_order_items sales_order_items_sales_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.sales_order_items
    ADD CONSTRAINT sales_order_items_sales_order_id_foreign FOREIGN KEY (sales_order_id) REFERENCES public.sales_orders(id) ON DELETE CASCADE;


--
-- Name: sales_orders sales_orders_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hengtai_app
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- PostgreSQL database dump complete
--

\unrestrict ZqpdbWER30H3K3F0NH6NISRj79SC7NxklPTnGTX40gyAUVr34FcYmr2CaHVilXT

