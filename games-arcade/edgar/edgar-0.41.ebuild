inherit  autotools eutils games

DESCRIPTION="When Edgar's father fails to return home after venturing out one dark and stormy night, Edgar fears the worst: he has been captured by the evil sorcerer who lives in a fortress beyond the forbidden swamp."
SRC_URI="http://www.parallelrealities.co.uk/download/edgar/edgar-${PV}-1.tar.gz"
LICENSE="LGPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND="
media-libs/sdl-mixer
media-libs/sdl-image
media-libs/sdl-ttf
"
RDEPEND=${DEPEND}

S=${WORKDIR}/edgar-${PV}

src_compile(){
        sed -i -e 's:BIN_DIR = $(PREFIX)/games/:BIN_DIR = $(PREFIX)/games/bin/:' makefile
	emake
}
