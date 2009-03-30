#!/bin/bash
mipwd=`pwd`
cd /usr/local/share/osm/
wget  -N http://download.geofabrik.de/osm/europe/spain.osm.bz2
bzcat spain.osm.bz2 | osm2navit spain.bin
mv spain.bin /usr/share/navit/maps/ 
cd $mipwd
