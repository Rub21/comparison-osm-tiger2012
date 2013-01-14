--change a RSR from planet planet_osm_line.
UPDATE planet_osm_line  SET  way=ST_Transform(way, 4326);
--OR
SELECT UpdateGeometrySRID('planet_osm_line', 'way', 4326);
