EAPI="2"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://launchpad.net/ubuntu/hardy/+source/alogg/1.3.7-1/+files/alogg_1.3.7.orig.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"


DIR=${WORKDIR}/alogg-1.3.7.orig
imagen=${D}/usr

src_compile() {
    cd ${DIR}
    emake 
}

src_install () {
    cd ${DIR}
    PREFIX=${imagen} emake install
}
