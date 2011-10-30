inherit  cmake-utils games

DESCRIPTION=""
SRC_URI="mirror://sourceforge/project/libclaw/libclaw/${PV}/libclaw-${PV}.tar.gz"
LICENSE="LGPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND="
sys-libs/zlib"

RDEPEND=${DEPEND}


src_compile(){
        sed -i '39i#include <zlib.h>' claw/png.hpp
	cmake .
	make
}
