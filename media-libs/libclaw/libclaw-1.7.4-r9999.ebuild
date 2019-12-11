EAPI=7

inherit git-r3 cmake-utils

EGIT_REPO_URI="https://github.com/j-jorge/libclaw"

DESCRIPTION=""
LICENSE="LGPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND="
x11-libs/wxGTK
"

RDEPEND=${DEPEND}
src_prepare() {
    eapply "${FILESDIR}/gentoo.patch"
    eapply_user
    cmake-utils_src_prepare
}



src_configure() {
    local mycmakeargs=(
#        -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/${P}
#        -DCMAKE_INSTALL_LIBDIR="/usr/lib64/"
        -DCMAKE_BUILD_TYPE=release
#        -DCMAKE_INSTALL_PREFIX="/usr"
        -DCLAW_INSTALLDIR_LIB="/usr/lib64/"
        -DCLAW_INSTALLDIR_DOC="/usr/share/doc/${P}"
    )
    cmake-utils_src_configure
}

#src_compile(){
#        sed -i '39i#include <zlib.h>' claw/png.hpp
#	cmake -DCMAKE_INSTALL_PREFIX="${D}" .
#	emake
#}

#src_install(){

#    cmake-utils_src_install
    
#        emake DESTDIR="${D}" install || die "install failed"
#}
