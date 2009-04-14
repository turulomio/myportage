#!/bin/bash
my=`pwd`
cd /usr/share/navit/maps/
wget -N http://maps.navit-project.org/planet.bin
cd ${my}
