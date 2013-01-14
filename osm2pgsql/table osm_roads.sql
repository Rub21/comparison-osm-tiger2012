--create other table for "osm_roads".
--and expor data from "planet_osm_line" to "osm_roads"

CREATE TABLE osm_roads( 
id serial NOT NULL,
osm_id BIGINT,
osm_uid BIGINT,
osm_version INT,
osm_timestamp TEXT,
way GEOMETRY
)
CREATE INDEX id_osm_roads_index ON osm_roads(id);

CREATE INDEX geom_osm_roads_index  ON osm_roads  USING gist(way );