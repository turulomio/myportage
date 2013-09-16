EAPI="2"
inherit  scons-utils games
#utotools eutils games

DESCRIPTION="Pink Pony is a Tron­-like multiplayer racing­ game. "
SRC_URI="http://pink-pony.googlecode.com/files/${P}.tar.bz2"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

#S=${WORKDIR}/${PN}

DEPEND="
dev-libs/protobuf
dev-libs/libsigc++
dev-util/scons
media-libs/audiere
media-libs/devil
media-libs/glfw
media-libs/ftgl
media-libs/ilmbase
"
RDEPEND=${DEPEND}


#src_configure(){
#	cd lib && protoc mesh.proto  --cpp_out=./ && cd ..
#}


src_compile(){
	escons
}

src_install(){
	dogamesbin install/pink-pony
        exeinto /usr/lib; doexe Pony
        insinto /usr/share/pink-pony/resources; doins -r  resources/*
	insinto /etc; doins pony.options
#        insinto /usr/share/pink-pony/textures; doins resources/textures/*
#        insinto /usr/share/pink-pony/fonts; doins resources/fonts/*
#        insinto /usr/share/pink-pony/models; doins resources/models/*
#        insinto /usr/share/pink-pony/music; doins music/*
#        insinto /usr/share/pink-pony/levels; doins levels/*
#        insinto /usr/share/pink-pony/GLSL; doins GLSL/*
        insinto /usr/share/pixmaps; doins install/pink-pony.png
        insinto /usr/share/applications; doins install/pink-pony.desktop

	prepgamesdirs
}
