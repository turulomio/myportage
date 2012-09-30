EAPI=3
inherit autotools eutils
DESCRIPTION="Remake of the classic Stratego game."
HOMEPAGE="http://java-stratego.sourceforge.net"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"

SRC_URI="http://sourceforge.net/projects/java-stratego/files/stratego_v${PV}.tar.gz"

DEPEND="
"
RDEPEND=${DEPEND}

src_compile(){
        emake compile || die "Error compiling"
}

src_install(){
        emake DESTDIR="${D}/usr" install || die "Install failed"
}
