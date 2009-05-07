#!/bin/bash
my=`pwd`
cd /usr/share/navit/maps/
wget -N http://maps.navit-project.org/planet.bin
cd ${my}
echo "<map type=\"binfile\" enabled=\"yes\" data=\"$NAVIT_SHAREDIR/maps/planet.bin\"/>" > /usr/share/navit/maps/planet.xml
