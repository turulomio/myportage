EAPI=7

inherit cmake

DESCRIPTION="Dust Racing (Dustrac) is a tile-based, cross-platform 2D racing game written in Qt (C++) and OpenGL."
HOMEPAGE="https://github.com/juzzlin/DustRacing2D"
SRC_URI="https://github.com/juzzlin/DustRacing2D/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
KEYWORDS="amd64 x86"
IUSE=""
SLOT=0

DEPEND="
dev-qt/qtopengl
media-libs/openal
media-libs/libvorbis
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/DustRacing2D-${PV}/

src_configure(){
    #./${D}/usr/bin/ -D DATA_PATH=data -DReleaseBuild=ON -DCMAKE_INSTALL_PREFIX=${D}/usr
    #cd ${S}
    local mycmakeargs=(
        -DReleaseBuild=ON
    #    -DBIN_PATH=bin
        -DCMAKE_INSTALL_PREFIX=/usr
    )

    cmake_src_configure
}

#src_compile(){
#    cmake_src_compile
#}

src_install(){
	cmake_src_install 
	#dobin ${FILESDIR}/dustrac*
	insinto /usr/share/pixmaps 
	doins data/icons/dustrac-*
        make_desktop_entry dustrac-game "Dusting Race Game" /usr/share/pixmaps/dustrac-game
        make_desktop_entry dustrac-editor "Dusting Race Editor" /usr/share/pixmaps/dustrac-editor
}
