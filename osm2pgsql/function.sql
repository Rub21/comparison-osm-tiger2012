--fuccion for fill data from planet_osm_line to osm_roads

CREATE OR REPLACE FUNCTION fill_osm_roads(init BIGINT, final BIGINT) --
RETURNS INT
AS $$
DECLARE
	_highway TEXT;	
	_osm_id BIGINT;
	_osm_uid BIGINT;
	_osm_version INT;
	_osm_timestamp TEXT;
	_way GEOMETRY;        
BEGIN
	
        FOR _i IN init..final

		LOOP 
			_highway=(SELECT x.highway FROM  planet_osm_line AS x  WHERE x.id = _i);
						
			IF (_highway IS NULL) THEN		
				RAISE  NOTICE 'NULL';
			ELSE
				RAISE  NOTICE '====================ID=%', _i;
				_osm_id  = (SELECT osm_id FROM planet_osm_line WHERE id = _i);
				_osm_uid = (SELECT  osm_uid FROM planet_osm_line WHERE id = _i);
				_osm_version = (SELECT  osm_version  FROM planet_osm_line WHERE id = _i);
				_osm_timestamp = (SELECT   osm_timestamp  FROM planet_osm_line WHERE id = _i);
				_way= (SELECT way  FROM planet_osm_line WHERE id = _i);
			INSERT INTO osm_roads(osm_id,
						osm_uid,
						osm_version,
						osm_timestamp ,
						way)

			VALUES (_osm_id,
				_osm_uid,
				_osm_version,
				_osm_timestamp,
				_way
			);

			END IF;
 
		END LOOP;
		
	       RETURN final;
END;
$$ LANGUAGE plpgsql;





