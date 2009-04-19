EAPI="2"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://chernsha.sitesled.com/AlFont209.rar"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"


DIR=${WORKDIR}/alfont
imagen=${D}/usr

src_compile() {
    cd ${DIR}
    cp makefile.unx Makefile
    emake 
}

src_install () {
    cd ${DIR}
    insinto /usr/lib; dolib lib/linux/libalfont.a
    insinto /usr/include; doins include/alfont*

}
