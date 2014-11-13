--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: weather_logs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE weather_logs (
    id integer NOT NULL,
    datetime timestamp without time zone,
    air_temperature double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    report_type character varying(255),
    wban character varying(255),
    weather_station character varying(255),
    sea_level_pressure double precision,
    dew_point_temperature double precision,
    elevation double precision,
    visibility_distance double precision,
    precipitation_hour double precision,
    precipitation_depth_in_mm double precision,
    lonlat_id integer
);


--
-- Name: weather_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE weather_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: weather_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE weather_logs_id_seq OWNED BY weather_logs.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY weather_logs ALTER COLUMN id SET DEFAULT nextval('weather_logs_id_seq'::regclass);


--
-- Name: weather_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY weather_logs
    ADD CONSTRAINT weather_logs_pkey PRIMARY KEY (id);


--
-- Name: index_weather_logs_on_lonlat_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_weather_logs_on_lonlat_id ON weather_logs USING btree (lonlat_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20141111051302');

INSERT INTO schema_migrations (version) VALUES ('20141111053744');

INSERT INTO schema_migrations (version) VALUES ('20141113080136');

INSERT INTO schema_migrations (version) VALUES ('20141113091604');

INSERT INTO schema_migrations (version) VALUES ('20141113091832');

INSERT INTO schema_migrations (version) VALUES ('20141113092204');

INSERT INTO schema_migrations (version) VALUES ('20141113101752');

INSERT INTO schema_migrations (version) VALUES ('20141113102436');

INSERT INTO schema_migrations (version) VALUES ('20141113113149');

INSERT INTO schema_migrations (version) VALUES ('20141113145419');

