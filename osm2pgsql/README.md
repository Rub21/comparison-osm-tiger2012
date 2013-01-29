export osm file to Postgis Data Base
====================================

##Create data base.

* psql -U postgres -c "create database dbosm_virginia;"</br>

* psql -U postgres -d dbosm_virginia -f /usr/share/postgresql/9.1/contrib/postgis-2.0/postgis.sql</br>

* psql -U postgres -d dbosm_virginia -f /usr/share/postgresql/9.1/contrib/postgis-2.0/spatial_ref_sys.sql</br>


#export file

* osm2pgsql -v -x -S default.style -d dbosm_virginia  virginia.osm.bz2 </br>

### after the recommendation

* osm2pgsql -v  -x -s -E 4326 -S default.style -d db_virginia  virginia.osm.pbf
 
 
