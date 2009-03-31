#!/bin/bash
mipwd=`pwd`
cd /usr/local/share/osm/
wget  -N  http://planet.openstreetmap.org/planet-latest.osm.bz2 
mv planet-* planet-latest.osm.bz2
bzcat planet-latest.osm.bz2 | osm2navit planet.bin
mv planet.bin /usr/share/navit/maps/ 
cd $mipwd
