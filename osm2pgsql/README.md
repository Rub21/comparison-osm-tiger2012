export osm file to Postgis Data Base
====================================

##Create data base.
psql -U postgres -c "create database dbosm_virginia;"
psql -U postgres -d osm_virginia -f /usr/share/postgresql/9.1/contrib/postgis-2.0/postgis.sql
psql -U postgres -d osm_virginia -f /usr/share/postgresql/9.1/contrib/postgis-2.0/spatial_ref_sys.sql

#export file
 osm2pgsql -v -x -S default.style -d dbosm_virginia  virginia.osm.bz2