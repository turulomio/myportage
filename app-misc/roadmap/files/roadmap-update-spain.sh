#!/bin/bash
my=`pwd`
cd /usr/local/share/osm
bunzip2 -k spain.osm.bz2
mv spain.osm iso-es.osm
buildmap_osm -m /usr/local/share/roadmap/ -r -c /usr/share/roadmap/default/All -i  iso-es.osm 
rm iso-es.osm
cd ${my}
