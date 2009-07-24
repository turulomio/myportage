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
dev-util/scons
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
