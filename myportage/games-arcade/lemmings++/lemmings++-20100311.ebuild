inherit  autotools eutils games

DESCRIPTION="L++ is a single- and multiplayer Lemmings variant. It provides a networking mode for up to eight players. This allows a Lemmings experience like Amiga Lemmings or SNES Lemmings provided in the days back then"
SRC_URI="http://members.allegro.cc/simon/src.tar.gz"
LICENSE="LGPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND="
"
RDEPEND=${DEPEND}

src_compile(){
   cd ${WORKDIR}/lpp/src
   emake 
}

src_install(){
   echo "#!/bin/bash" > lpp.sh
   echo "pw=\`pwd\`" >> lpp.sh
   echo "cd /usr/share/games/lpp" >> lpp.sh
   echo "./lpp" >> lpp.sh
   echo "cd \$pw" >> lpp.sh
   dogamesbin lpp.sh 


   cp lpp/src/icon.ico lpp/src/lemmings++.ico
   doicon lpp/src/lemmings++.ico
   make_desktop_entry lpp "Lemmings++" /usr/share/pixmaps/lemmings++.ico

   mkdir -p  ${D}/usr/share/games/
   cp -R * ${D}/usr/share/games/
   rm -R ${D}/usr/share/games/lpp/src

}
