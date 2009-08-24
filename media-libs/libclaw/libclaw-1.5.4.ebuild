inherit  cmake-utils games

DESCRIPTION=""
SRC_URI="mirror://sourceforge/project/libclaw/libclaw/${PV}/libclaw-${PV}.tar.gz"
LICENSE="LGPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND="
"
RDEPEND=${DEPEND}


src_compile(){
	cmake .
	make
}
