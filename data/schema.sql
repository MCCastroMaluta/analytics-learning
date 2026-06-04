--
-- PostgreSQL database dump
--

\restrict 6ZuNHPbnWQ5bcjh4ZuL3eN4i1HZ4rj0c3xbvLib5PpUuPF3kgVQTdGZX9YNDeqe

-- Dumped from database version 14.23 (Ubuntu 14.23-1.pgdg24.04+1)
-- Dumped by pg_dump version 14.23 (Ubuntu 14.23-1.pgdg24.04+1)

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
-- Name: supermarket; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA supermarket;


ALTER SCHEMA supermarket OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cart_events; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.cart_events (
    cart_event_id integer NOT NULL,
    session_id integer,
    product_id integer,
    event_type character varying(50),
    quantity integer,
    event_timestamp timestamp without time zone
);


ALTER TABLE supermarket.cart_events OWNER TO postgres;

--
-- Name: cart_events_cart_event_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.cart_events_cart_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.cart_events_cart_event_id_seq OWNER TO postgres;

--
-- Name: cart_events_cart_event_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.cart_events_cart_event_id_seq OWNED BY supermarket.cart_events.cart_event_id;


--
-- Name: cart_items; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.cart_items (
    cart_item_id integer NOT NULL,
    cart_id integer,
    product_id integer,
    quantity integer,
    added_at timestamp without time zone
);


ALTER TABLE supermarket.cart_items OWNER TO postgres;

--
-- Name: cart_items_cart_item_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.cart_items_cart_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.cart_items_cart_item_id_seq OWNER TO postgres;

--
-- Name: cart_items_cart_item_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.cart_items_cart_item_id_seq OWNED BY supermarket.cart_items.cart_item_id;


--
-- Name: carts; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.carts (
    cart_id integer NOT NULL,
    customer_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    status character varying(50)
);


ALTER TABLE supermarket.carts OWNER TO postgres;

--
-- Name: carts_cart_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.carts_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.carts_cart_id_seq OWNER TO postgres;

--
-- Name: carts_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.carts_cart_id_seq OWNED BY supermarket.carts.cart_id;


--
-- Name: categories; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.categories (
    category_id integer NOT NULL,
    category_name character varying(100),
    parent_category_id integer
);


ALTER TABLE supermarket.categories OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.categories_category_id_seq OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.categories_category_id_seq OWNED BY supermarket.categories.category_id;


--
-- Name: cities; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.cities (
    city_id integer NOT NULL,
    city_name character varying(100),
    state character varying(100),
    population integer
);


ALTER TABLE supermarket.cities OWNER TO postgres;

--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.cities_city_id_seq OWNER TO postgres;

--
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.cities_city_id_seq OWNED BY supermarket.cities.city_id;


--
-- Name: claim_categories; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.claim_categories (
    category_id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE supermarket.claim_categories OWNER TO postgres;

--
-- Name: claim_categories_category_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.claim_categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.claim_categories_category_id_seq OWNER TO postgres;

--
-- Name: claim_categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.claim_categories_category_id_seq OWNED BY supermarket.claim_categories.category_id;


--
-- Name: claim_events; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.claim_events (
    event_id integer NOT NULL,
    claim_id integer,
    status character varying(50),
    event_timestamp timestamp without time zone,
    note text
);


ALTER TABLE supermarket.claim_events OWNER TO postgres;

--
-- Name: claim_events_event_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.claim_events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.claim_events_event_id_seq OWNER TO postgres;

--
-- Name: claim_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.claim_events_event_id_seq OWNED BY supermarket.claim_events.event_id;


--
-- Name: customer_addresses; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.customer_addresses (
    address_id integer NOT NULL,
    customer_id integer,
    address text,
    city character varying(100),
    state character varying(100),
    zip_code character varying(20),
    is_default boolean
);


ALTER TABLE supermarket.customer_addresses OWNER TO postgres;

--
-- Name: customer_addresses_address_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.customer_addresses_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.customer_addresses_address_id_seq OWNER TO postgres;

--
-- Name: customer_addresses_address_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.customer_addresses_address_id_seq OWNED BY supermarket.customer_addresses.address_id;


--
-- Name: customer_claims; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.customer_claims (
    claim_id integer NOT NULL,
    customer_id integer,
    order_id integer,
    claim_type character varying(50),
    description text,
    created_at timestamp without time zone,
    status character varying(50),
    resolution_time interval,
    category_id integer
);


ALTER TABLE supermarket.customer_claims OWNER TO postgres;

--
-- Name: customer_claims_claim_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.customer_claims_claim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.customer_claims_claim_id_seq OWNER TO postgres;

--
-- Name: customer_claims_claim_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.customer_claims_claim_id_seq OWNED BY supermarket.customer_claims.claim_id;


--
-- Name: customers; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.customers (
    customer_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    email character varying(150),
    phone character varying(50),
    date_of_birth date,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE supermarket.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.customers_customer_id_seq OWNED BY supermarket.customers.customer_id;


--
-- Name: deliveries; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.deliveries (
    delivery_id integer NOT NULL,
    order_id integer,
    driver_id integer,
    pickup_time timestamp without time zone,
    delivery_time timestamp without time zone,
    status character varying(50),
    distance_km numeric(10,2)
);


ALTER TABLE supermarket.deliveries OWNER TO postgres;

--
-- Name: deliveries_delivery_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.deliveries_delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.deliveries_delivery_id_seq OWNER TO postgres;

--
-- Name: deliveries_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.deliveries_delivery_id_seq OWNED BY supermarket.deliveries.delivery_id;


--
-- Name: delivery_drivers; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.delivery_drivers (
    driver_id integer NOT NULL,
    name character varying(100),
    vehicle_type character varying(50)
);


ALTER TABLE supermarket.delivery_drivers OWNER TO postgres;

--
-- Name: delivery_drivers_driver_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.delivery_drivers_driver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.delivery_drivers_driver_id_seq OWNER TO postgres;

--
-- Name: delivery_drivers_driver_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.delivery_drivers_driver_id_seq OWNED BY supermarket.delivery_drivers.driver_id;


--
-- Name: delivery_events; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.delivery_events (
    event_id integer NOT NULL,
    delivery_id integer,
    status character varying(50),
    event_timestamp timestamp without time zone
);


ALTER TABLE supermarket.delivery_events OWNER TO postgres;

--
-- Name: delivery_events_event_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.delivery_events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.delivery_events_event_id_seq OWNER TO postgres;

--
-- Name: delivery_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.delivery_events_event_id_seq OWNED BY supermarket.delivery_events.event_id;


--
-- Name: events; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.events (
    event_id integer NOT NULL,
    session_id integer,
    event_type character varying(50),
    page character varying(100),
    product_id integer,
    event_timestamp timestamp without time zone
);


ALTER TABLE supermarket.events OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.events_event_id_seq OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.events_event_id_seq OWNED BY supermarket.events.event_id;


--
-- Name: inventory; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.inventory (
    inventory_id integer NOT NULL,
    product_id integer,
    store_id integer,
    warehouse_id integer,
    quantity integer,
    last_updated timestamp without time zone
);


ALTER TABLE supermarket.inventory OWNER TO postgres;

--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.inventory_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.inventory_inventory_id_seq OWNER TO postgres;

--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.inventory_inventory_id_seq OWNED BY supermarket.inventory.inventory_id;


--
-- Name: inventory_movements; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.inventory_movements (
    movement_id integer NOT NULL,
    product_id integer,
    from_location_type character varying(50),
    from_location_id integer,
    to_location_type character varying(50),
    to_location_id integer,
    quantity integer,
    movement_type character varying(50),
    movement_timestamp timestamp without time zone
);


ALTER TABLE supermarket.inventory_movements OWNER TO postgres;

--
-- Name: inventory_movements_movement_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.inventory_movements_movement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.inventory_movements_movement_id_seq OWNER TO postgres;

--
-- Name: inventory_movements_movement_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.inventory_movements_movement_id_seq OWNED BY supermarket.inventory_movements.movement_id;


--
-- Name: order_items; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.order_items (
    order_item_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    price numeric(10,2)
);


ALTER TABLE supermarket.order_items OWNER TO postgres;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.order_items_order_item_id_seq OWNER TO postgres;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.order_items_order_item_id_seq OWNED BY supermarket.order_items.order_item_id;


--
-- Name: orders; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.orders (
    order_id integer NOT NULL,
    customer_id integer,
    store_id integer,
    order_timestamp timestamp without time zone,
    delivery_type character varying(50),
    delivery_address_id integer,
    payment_method_id integer,
    total_amount numeric(10,2),
    status character varying(50)
);


ALTER TABLE supermarket.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.orders_order_id_seq OWNED BY supermarket.orders.order_id;


--
-- Name: payment_methods; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.payment_methods (
    payment_method_id integer NOT NULL,
    customer_id integer,
    method_type character varying(50),
    provider character varying(50),
    last_four_digits character varying(4),
    expiration_date date
);


ALTER TABLE supermarket.payment_methods OWNER TO postgres;

--
-- Name: payment_methods_payment_method_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.payment_methods_payment_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.payment_methods_payment_method_id_seq OWNER TO postgres;

--
-- Name: payment_methods_payment_method_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.payment_methods_payment_method_id_seq OWNED BY supermarket.payment_methods.payment_method_id;


--
-- Name: product_reviews; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.product_reviews (
    review_id integer NOT NULL,
    product_id integer,
    customer_id integer,
    order_id integer,
    rating integer,
    review_text text,
    created_at timestamp without time zone,
    is_verified_purchase boolean,
    helpful_votes integer DEFAULT 0,
    CONSTRAINT product_reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE supermarket.product_reviews OWNER TO postgres;

--
-- Name: product_reviews_review_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.product_reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.product_reviews_review_id_seq OWNER TO postgres;

--
-- Name: product_reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.product_reviews_review_id_seq OWNED BY supermarket.product_reviews.review_id;


--
-- Name: products; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.products (
    product_id integer NOT NULL,
    product_name character varying(150),
    category_id integer,
    brand character varying(100),
    price numeric(10,2),
    cost numeric(10,2),
    is_active boolean DEFAULT true
);


ALTER TABLE supermarket.products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.products_product_id_seq OWNED BY supermarket.products.product_id;


--
-- Name: promotion_products; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.promotion_products (
    id integer NOT NULL,
    promotion_id integer,
    product_id integer
);


ALTER TABLE supermarket.promotion_products OWNER TO postgres;

--
-- Name: promotion_products_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.promotion_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.promotion_products_id_seq OWNER TO postgres;

--
-- Name: promotion_products_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.promotion_products_id_seq OWNED BY supermarket.promotion_products.id;


--
-- Name: promotion_usage; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.promotion_usage (
    usage_id integer NOT NULL,
    order_id integer,
    promotion_id integer,
    discount_applied numeric(10,2)
);


ALTER TABLE supermarket.promotion_usage OWNER TO postgres;

--
-- Name: promotion_usage_usage_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.promotion_usage_usage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.promotion_usage_usage_id_seq OWNER TO postgres;

--
-- Name: promotion_usage_usage_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.promotion_usage_usage_id_seq OWNED BY supermarket.promotion_usage.usage_id;


--
-- Name: promotions; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.promotions (
    promotion_id integer NOT NULL,
    name character varying(150),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    discount_type character varying(50),
    discount_value numeric(10,2),
    is_active boolean
);


ALTER TABLE supermarket.promotions OWNER TO postgres;

--
-- Name: promotions_promotion_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.promotions_promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.promotions_promotion_id_seq OWNER TO postgres;

--
-- Name: promotions_promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.promotions_promotion_id_seq OWNED BY supermarket.promotions.promotion_id;


--
-- Name: sessions; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.sessions (
    session_id integer NOT NULL,
    customer_id integer,
    device_type character varying(50),
    browser character varying(50),
    os character varying(50),
    ip_address character varying(50),
    session_start timestamp without time zone,
    session_end timestamp without time zone
);


ALTER TABLE supermarket.sessions OWNER TO postgres;

--
-- Name: sessions_session_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.sessions_session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.sessions_session_id_seq OWNER TO postgres;

--
-- Name: sessions_session_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.sessions_session_id_seq OWNED BY supermarket.sessions.session_id;


--
-- Name: store_reviews; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.store_reviews (
    review_id integer NOT NULL,
    store_id integer,
    customer_id integer,
    rating integer,
    review_text text,
    created_at timestamp without time zone,
    CONSTRAINT store_reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE supermarket.store_reviews OWNER TO postgres;

--
-- Name: store_reviews_review_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.store_reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.store_reviews_review_id_seq OWNER TO postgres;

--
-- Name: store_reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.store_reviews_review_id_seq OWNED BY supermarket.store_reviews.review_id;


--
-- Name: stores; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.stores (
    store_id integer NOT NULL,
    city_id integer,
    store_name character varying(100),
    address text,
    latitude numeric,
    longitude numeric
);


ALTER TABLE supermarket.stores OWNER TO postgres;

--
-- Name: stores_store_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.stores_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.stores_store_id_seq OWNER TO postgres;

--
-- Name: stores_store_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.stores_store_id_seq OWNED BY supermarket.stores.store_id;


--
-- Name: warehouses; Type: TABLE; Schema: supermarket; Owner: postgres
--

CREATE TABLE supermarket.warehouses (
    warehouse_id integer NOT NULL,
    name character varying(100),
    city_id integer
);


ALTER TABLE supermarket.warehouses OWNER TO postgres;

--
-- Name: warehouses_warehouse_id_seq; Type: SEQUENCE; Schema: supermarket; Owner: postgres
--

CREATE SEQUENCE supermarket.warehouses_warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supermarket.warehouses_warehouse_id_seq OWNER TO postgres;

--
-- Name: warehouses_warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: supermarket; Owner: postgres
--

ALTER SEQUENCE supermarket.warehouses_warehouse_id_seq OWNED BY supermarket.warehouses.warehouse_id;


--
-- Name: cart_events cart_event_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.cart_events ALTER COLUMN cart_event_id SET DEFAULT nextval('supermarket.cart_events_cart_event_id_seq'::regclass);


--
-- Name: cart_items cart_item_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.cart_items ALTER COLUMN cart_item_id SET DEFAULT nextval('supermarket.cart_items_cart_item_id_seq'::regclass);


--
-- Name: carts cart_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.carts ALTER COLUMN cart_id SET DEFAULT nextval('supermarket.carts_cart_id_seq'::regclass);


--
-- Name: categories category_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.categories ALTER COLUMN category_id SET DEFAULT nextval('supermarket.categories_category_id_seq'::regclass);


--
-- Name: cities city_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.cities ALTER COLUMN city_id SET DEFAULT nextval('supermarket.cities_city_id_seq'::regclass);


--
-- Name: claim_categories category_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.claim_categories ALTER COLUMN category_id SET DEFAULT nextval('supermarket.claim_categories_category_id_seq'::regclass);


--
-- Name: claim_events event_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.claim_events ALTER COLUMN event_id SET DEFAULT nextval('supermarket.claim_events_event_id_seq'::regclass);


--
-- Name: customer_addresses address_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.customer_addresses ALTER COLUMN address_id SET DEFAULT nextval('supermarket.customer_addresses_address_id_seq'::regclass);


--
-- Name: customer_claims claim_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.customer_claims ALTER COLUMN claim_id SET DEFAULT nextval('supermarket.customer_claims_claim_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.customers ALTER COLUMN customer_id SET DEFAULT nextval('supermarket.customers_customer_id_seq'::regclass);


--
-- Name: deliveries delivery_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.deliveries ALTER COLUMN delivery_id SET DEFAULT nextval('supermarket.deliveries_delivery_id_seq'::regclass);


--
-- Name: delivery_drivers driver_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.delivery_drivers ALTER COLUMN driver_id SET DEFAULT nextval('supermarket.delivery_drivers_driver_id_seq'::regclass);


--
-- Name: delivery_events event_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.delivery_events ALTER COLUMN event_id SET DEFAULT nextval('supermarket.delivery_events_event_id_seq'::regclass);


--
-- Name: events event_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.events ALTER COLUMN event_id SET DEFAULT nextval('supermarket.events_event_id_seq'::regclass);


--
-- Name: inventory inventory_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.inventory ALTER COLUMN inventory_id SET DEFAULT nextval('supermarket.inventory_inventory_id_seq'::regclass);


--
-- Name: inventory_movements movement_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.inventory_movements ALTER COLUMN movement_id SET DEFAULT nextval('supermarket.inventory_movements_movement_id_seq'::regclass);


--
-- Name: order_items order_item_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('supermarket.order_items_order_item_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.orders ALTER COLUMN order_id SET DEFAULT nextval('supermarket.orders_order_id_seq'::regclass);


--
-- Name: payment_methods payment_method_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.payment_methods ALTER COLUMN payment_method_id SET DEFAULT nextval('supermarket.payment_methods_payment_method_id_seq'::regclass);


--
-- Name: product_reviews review_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.product_reviews ALTER COLUMN review_id SET DEFAULT nextval('supermarket.product_reviews_review_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.products ALTER COLUMN product_id SET DEFAULT nextval('supermarket.products_product_id_seq'::regclass);


--
-- Name: promotion_products id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.promotion_products ALTER COLUMN id SET DEFAULT nextval('supermarket.promotion_products_id_seq'::regclass);


--
-- Name: promotion_usage usage_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.promotion_usage ALTER COLUMN usage_id SET DEFAULT nextval('supermarket.promotion_usage_usage_id_seq'::regclass);


--
-- Name: promotions promotion_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.promotions ALTER COLUMN promotion_id SET DEFAULT nextval('supermarket.promotions_promotion_id_seq'::regclass);


--
-- Name: sessions session_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.sessions ALTER COLUMN session_id SET DEFAULT nextval('supermarket.sessions_session_id_seq'::regclass);


--
-- Name: store_reviews review_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.store_reviews ALTER COLUMN review_id SET DEFAULT nextval('supermarket.store_reviews_review_id_seq'::regclass);


--
-- Name: stores store_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.stores ALTER COLUMN store_id SET DEFAULT nextval('supermarket.stores_store_id_seq'::regclass);


--
-- Name: warehouses warehouse_id; Type: DEFAULT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.warehouses ALTER COLUMN warehouse_id SET DEFAULT nextval('supermarket.warehouses_warehouse_id_seq'::regclass);


--
-- Name: cart_events cart_events_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.cart_events
    ADD CONSTRAINT cart_events_pkey PRIMARY KEY (cart_event_id);


--
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (cart_item_id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (cart_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- Name: claim_categories claim_categories_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.claim_categories
    ADD CONSTRAINT claim_categories_pkey PRIMARY KEY (category_id);


--
-- Name: claim_events claim_events_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.claim_events
    ADD CONSTRAINT claim_events_pkey PRIMARY KEY (event_id);


--
-- Name: customer_addresses customer_addresses_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.customer_addresses
    ADD CONSTRAINT customer_addresses_pkey PRIMARY KEY (address_id);


--
-- Name: customer_claims customer_claims_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.customer_claims
    ADD CONSTRAINT customer_claims_pkey PRIMARY KEY (claim_id);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (delivery_id);


--
-- Name: delivery_drivers delivery_drivers_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.delivery_drivers
    ADD CONSTRAINT delivery_drivers_pkey PRIMARY KEY (driver_id);


--
-- Name: delivery_events delivery_events_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.delivery_events
    ADD CONSTRAINT delivery_events_pkey PRIMARY KEY (event_id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- Name: inventory_movements inventory_movements_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.inventory_movements
    ADD CONSTRAINT inventory_movements_pkey PRIMARY KEY (movement_id);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (payment_method_id);


--
-- Name: product_reviews product_reviews_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.product_reviews
    ADD CONSTRAINT product_reviews_pkey PRIMARY KEY (review_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: promotion_products promotion_products_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.promotion_products
    ADD CONSTRAINT promotion_products_pkey PRIMARY KEY (id);


--
-- Name: promotion_usage promotion_usage_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.promotion_usage
    ADD CONSTRAINT promotion_usage_pkey PRIMARY KEY (usage_id);


--
-- Name: promotions promotions_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.promotions
    ADD CONSTRAINT promotions_pkey PRIMARY KEY (promotion_id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (session_id);


--
-- Name: store_reviews store_reviews_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.store_reviews
    ADD CONSTRAINT store_reviews_pkey PRIMARY KEY (review_id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (store_id);


--
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (warehouse_id);


--
-- Name: idx_cart_session; Type: INDEX; Schema: supermarket; Owner: postgres
--

CREATE INDEX idx_cart_session ON supermarket.cart_events USING btree (session_id);


--
-- Name: idx_events_session; Type: INDEX; Schema: supermarket; Owner: postgres
--

CREATE INDEX idx_events_session ON supermarket.events USING btree (session_id);


--
-- Name: idx_orders_customer; Type: INDEX; Schema: supermarket; Owner: postgres
--

CREATE INDEX idx_orders_customer ON supermarket.orders USING btree (customer_id);


--
-- Name: idx_orders_store; Type: INDEX; Schema: supermarket; Owner: postgres
--

CREATE INDEX idx_orders_store ON supermarket.orders USING btree (store_id);


--
-- Name: idx_sessions_customer; Type: INDEX; Schema: supermarket; Owner: postgres
--

CREATE INDEX idx_sessions_customer ON supermarket.sessions USING btree (customer_id);


--
-- Name: cart_events cart_events_product_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.cart_events
    ADD CONSTRAINT cart_events_product_id_fkey FOREIGN KEY (product_id) REFERENCES supermarket.products(product_id);


--
-- Name: cart_events cart_events_session_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.cart_events
    ADD CONSTRAINT cart_events_session_id_fkey FOREIGN KEY (session_id) REFERENCES supermarket.sessions(session_id);


--
-- Name: cart_items cart_items_cart_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.cart_items
    ADD CONSTRAINT cart_items_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES supermarket.carts(cart_id);


--
-- Name: cart_items cart_items_product_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.cart_items
    ADD CONSTRAINT cart_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES supermarket.products(product_id);


--
-- Name: carts carts_customer_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.carts
    ADD CONSTRAINT carts_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES supermarket.customers(customer_id);


--
-- Name: categories categories_parent_category_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.categories
    ADD CONSTRAINT categories_parent_category_id_fkey FOREIGN KEY (parent_category_id) REFERENCES supermarket.categories(category_id);


--
-- Name: claim_events claim_events_claim_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.claim_events
    ADD CONSTRAINT claim_events_claim_id_fkey FOREIGN KEY (claim_id) REFERENCES supermarket.customer_claims(claim_id);


--
-- Name: customer_addresses customer_addresses_customer_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.customer_addresses
    ADD CONSTRAINT customer_addresses_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES supermarket.customers(customer_id);


--
-- Name: customer_claims customer_claims_category_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.customer_claims
    ADD CONSTRAINT customer_claims_category_id_fkey FOREIGN KEY (category_id) REFERENCES supermarket.claim_categories(category_id);


--
-- Name: customer_claims customer_claims_customer_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.customer_claims
    ADD CONSTRAINT customer_claims_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES supermarket.customers(customer_id);


--
-- Name: customer_claims customer_claims_order_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.customer_claims
    ADD CONSTRAINT customer_claims_order_id_fkey FOREIGN KEY (order_id) REFERENCES supermarket.orders(order_id);


--
-- Name: deliveries deliveries_driver_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.deliveries
    ADD CONSTRAINT deliveries_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES supermarket.delivery_drivers(driver_id);


--
-- Name: deliveries deliveries_order_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.deliveries
    ADD CONSTRAINT deliveries_order_id_fkey FOREIGN KEY (order_id) REFERENCES supermarket.orders(order_id);


--
-- Name: delivery_events delivery_events_delivery_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.delivery_events
    ADD CONSTRAINT delivery_events_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES supermarket.deliveries(delivery_id);


--
-- Name: events events_session_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.events
    ADD CONSTRAINT events_session_id_fkey FOREIGN KEY (session_id) REFERENCES supermarket.sessions(session_id);


--
-- Name: inventory_movements inventory_movements_product_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.inventory_movements
    ADD CONSTRAINT inventory_movements_product_id_fkey FOREIGN KEY (product_id) REFERENCES supermarket.products(product_id);


--
-- Name: inventory inventory_product_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.inventory
    ADD CONSTRAINT inventory_product_id_fkey FOREIGN KEY (product_id) REFERENCES supermarket.products(product_id);


--
-- Name: inventory inventory_store_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.inventory
    ADD CONSTRAINT inventory_store_id_fkey FOREIGN KEY (store_id) REFERENCES supermarket.stores(store_id);


--
-- Name: inventory inventory_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.inventory
    ADD CONSTRAINT inventory_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES supermarket.warehouses(warehouse_id);


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES supermarket.orders(order_id);


--
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES supermarket.products(product_id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES supermarket.customers(customer_id);


--
-- Name: orders orders_delivery_address_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.orders
    ADD CONSTRAINT orders_delivery_address_id_fkey FOREIGN KEY (delivery_address_id) REFERENCES supermarket.customer_addresses(address_id);


--
-- Name: orders orders_payment_method_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.orders
    ADD CONSTRAINT orders_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES supermarket.payment_methods(payment_method_id);


--
-- Name: orders orders_store_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.orders
    ADD CONSTRAINT orders_store_id_fkey FOREIGN KEY (store_id) REFERENCES supermarket.stores(store_id);


--
-- Name: payment_methods payment_methods_customer_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.payment_methods
    ADD CONSTRAINT payment_methods_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES supermarket.customers(customer_id);


--
-- Name: product_reviews product_reviews_customer_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.product_reviews
    ADD CONSTRAINT product_reviews_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES supermarket.customers(customer_id);


--
-- Name: product_reviews product_reviews_order_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.product_reviews
    ADD CONSTRAINT product_reviews_order_id_fkey FOREIGN KEY (order_id) REFERENCES supermarket.orders(order_id);


--
-- Name: product_reviews product_reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.product_reviews
    ADD CONSTRAINT product_reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES supermarket.products(product_id);


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES supermarket.categories(category_id);


--
-- Name: promotion_products promotion_products_product_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.promotion_products
    ADD CONSTRAINT promotion_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES supermarket.products(product_id);


--
-- Name: promotion_products promotion_products_promotion_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.promotion_products
    ADD CONSTRAINT promotion_products_promotion_id_fkey FOREIGN KEY (promotion_id) REFERENCES supermarket.promotions(promotion_id);


--
-- Name: promotion_usage promotion_usage_order_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.promotion_usage
    ADD CONSTRAINT promotion_usage_order_id_fkey FOREIGN KEY (order_id) REFERENCES supermarket.orders(order_id);


--
-- Name: promotion_usage promotion_usage_promotion_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.promotion_usage
    ADD CONSTRAINT promotion_usage_promotion_id_fkey FOREIGN KEY (promotion_id) REFERENCES supermarket.promotions(promotion_id);


--
-- Name: sessions sessions_customer_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.sessions
    ADD CONSTRAINT sessions_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES supermarket.customers(customer_id);


--
-- Name: store_reviews store_reviews_customer_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.store_reviews
    ADD CONSTRAINT store_reviews_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES supermarket.customers(customer_id);


--
-- Name: store_reviews store_reviews_store_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.store_reviews
    ADD CONSTRAINT store_reviews_store_id_fkey FOREIGN KEY (store_id) REFERENCES supermarket.stores(store_id);


--
-- Name: stores stores_city_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.stores
    ADD CONSTRAINT stores_city_id_fkey FOREIGN KEY (city_id) REFERENCES supermarket.cities(city_id);


--
-- Name: warehouses warehouses_city_id_fkey; Type: FK CONSTRAINT; Schema: supermarket; Owner: postgres
--

ALTER TABLE ONLY supermarket.warehouses
    ADD CONSTRAINT warehouses_city_id_fkey FOREIGN KEY (city_id) REFERENCES supermarket.cities(city_id);


--
-- PostgreSQL database dump complete
--

\unrestrict 6ZuNHPbnWQ5bcjh4ZuL3eN4i1HZ4rj0c3xbvLib5PpUuPF3kgVQTdGZX9YNDeqe

