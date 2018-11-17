EAPI=5

inherit  autotools cmake-utils games


DESCRIPTION="Plee the Bear will be a 2D platform game like those we found on consoles in the beginning of the 90's."
SHORTPV=${PV:0:3} #Muestra 3 caracteres de substring desde posición 0 
SRC_URI="mirror://sourceforge/project/plee-the-bear/Plee%20the%20Bear/${SHORTPV}/${P}.tar.gz"
LICENSE="LGPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND="
x11-libs/wxGTK
media-libs/libclaw
"
RDEPEND=${DEPEND}


src_compile(){
	cmake .
	cmake-utils_src_make
}
