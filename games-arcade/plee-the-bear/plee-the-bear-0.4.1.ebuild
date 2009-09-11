inherit  autotools cmake-utils games

DESCRIPTION="Plee the Bear will be a 2D platform game like those we found on consoles in the beginning of the 90's."

SRC_URI="mirror://sourceforge/project/plee-the-bear/Plee%20the%20Bear/0.4/${P}.tar.gz"
LICENSE="LGPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND="
media-libs/libclaw
"
RDEPEND=${DEPEND}


src_compile(){
	cmake .
	make
}
