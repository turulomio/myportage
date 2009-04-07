#!/usr/bin/python
import os, sys

os.system("wget  http://planet.openstreetmap.org/planet-latest.osm.bz2.md5 -O /usr/local/share/osm/planet-latest.osm.bz2.md5 -o /dev/null")
f=open("/usr/local/share/osm/planet-latest.osm.bz2.md5")
md5remoto=f.read();
f.close()

o=os.popen("cd /usr/local/share/osm && md5sum planet-latest.osm.bz2")
md5local=o.read()
o.close()

print md5remoto,  md5local

if md5remoto==md5local:
	print "Ya se ha descargado el fichero. Se sale del programa sin crear los mapas"
	sys.exit(0)
else:
	os.popen("wget -c http://planet.openstreetmap.org/planet-latest.osm.bz2 -O planet-latest.osm.bz2")

os.popen("bzcat /usr/local/share/osm/planet-latest.osm.bz2 | osm2navit /usr/share/navit/maps/planet.bin")
