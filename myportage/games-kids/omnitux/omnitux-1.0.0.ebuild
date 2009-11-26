inherit  autotools eutils

DESCRIPTION="The project aims to provide various educational activities around multimedia elements (images, sounds, texts)"
HOMEPAGE="http://omnitux.sourceforge.net/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

SRC_URI="mirror://sourceforge/omnitux/v1.0/${P}.noarch.tar.bz2"

DEPEND="
"
RDEPEND=${DEPEND}

src_install(){
	insinto /usr/bin/; dobin "${FILESDIR}/omnitux.sh"
	dodir /usr/share/${PN}
	cp -r * ${D}/usr/share/
}
