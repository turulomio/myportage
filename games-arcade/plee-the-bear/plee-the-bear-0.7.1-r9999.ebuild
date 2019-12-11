EAPI=7

inherit cmake-utils

BEARCOMMIT="2a785228d85997dc1682ee71899841528fa09c33"
PLEECOMMIT="42d8511ae53325e464a8f32ca0cb55ece30926ea"

SRC_URI="https://github.com/j-jorge/bear/archive/${BEARCOMMIT}.zip -> bear.zip
https://github.com/j-jorge/plee-the-bear/archive/${PLEECOMMIT}.zip -> plee-the-bear.zip"

#EGIT_REPO_URI="https://github.com/j-jorge/plee-the-bear https://github.com/j-jorge/bear"

DESCRIPTION=""
LICENSE="LGPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND="
media-libs/libclaw
"

S=${WORKDIR}

RDEPEND=${DEPEND}

#src_fetch(){
#    mkdir plee-the-bear2
#    cd plee-the-bear2
#    git-r3_fetch https://github.com/j-jorge/plee-the-bear
#    cd ../bear
#    git-r3_fetch https://github.com/j-jorge/bear

#}


src_prepare() {
    mv plee-the-bear-${PLEECOMMIT} plee-the-bear
    mv bear-${BEARCOMMIT} bear
    cp ${FILESDIR}/CMakeLists.txt ${WORKDIR}
    cd bear
    eapply "${FILESDIR}/bear.patch"
    eapply_user
    cmake-utils_src_prepare
}



#src_configure() {
#    local mycmakeargs=(
#        -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/${P}
#        -DCMAKE_INSTALL_LIBDIR="/usr/lib64/"
#        -DCMAKE_BUILD_TYPE=release
#        -DCMAKE_INSTALL_PREFIX="/usr"
#        -DCLAW_INSTALLDIR_LIB="/usr/lib64/"
#        -DCLAW_INSTALLDIR_DOC="/usr/share/doc/${P}"
#    )
#    cmake-utils_src_configure
#}

#src_compile(){
#        sed -i '39i#include <zlib.h>' claw/png.hpp
#	cmake -DCMAKE_INSTALL_PREFIX="${D}" .
#	emake
#}

#src_install(){

#    cmake-utils_src_install
    
#        emake DESTDIR="${D}" install || die "install failed"
#}
