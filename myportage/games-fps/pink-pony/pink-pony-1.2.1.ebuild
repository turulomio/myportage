EAPI="2"
inherit  autotools eutils games

DESCRIPTION="Pink Pony is a Tron­-like multiplayer racing­ game. "
SRC_URI="http://pink-pony.googlecode.com/files/${P}.tar.bz2"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

S=${WORKDIR}/${PN}

DEPEND="
dev-libs/protobuf
dev-libs/libsigc++
dev-util/scons
media-libs/audiere
media-libs/devil
media-libs/glfw
media-libs/ilmbase
"
RDEPEND=${DEPEND}


src_configure(){
	cd lib && protoc mesh.proto  --cpp_out=./ && cd ..
}


src_compile(){
	scons
}

src_install(){
	dogamesbin install/pink-pony
        exeinto /usr/share/pink-pony/; doexe Pony
        insinto /usr/share/pink-pony/; doins pony.options levels.xml
        insinto /usr/share/pink-pony/textures; doins textures/*
        insinto /usr/share/pink-pony/fonts; doins fonts/*
        insinto /usr/share/pink-pony/models; doins models/*
        insinto /usr/share/pink-pony/music; doins music/*
        insinto /usr/share/pink-pony/levels; doins levels/*
        insinto /usr/share/pink-pony/GLSL; doins GLSL/*

        cp install/pink-pony.png pink-pony.png
        doicon pink-pony.png
        make_desktop_entry pink-pony "Pink pony" /usr/share/pixmaps/pink-pony.png

	prepgamesdirs
}
