#!/bin/bash
my=`pwd`
cd /usr/share/games/naev
./naev -f 1024x768 -d /usr/share/games/naev/ndata
cd ${my}
