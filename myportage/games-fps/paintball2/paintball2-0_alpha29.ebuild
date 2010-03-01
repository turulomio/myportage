EAPI="2"
inherit  autotools eutils games

DESCRIPTION="http://digitalpaint.org/files/"
SRC_URI="mirror://sourceforge/paintball2/paintball2_build029_linux_full.tar.gz"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

S=${WORKDIR}/${PN}

DEPEND="
"
RDEPEND=${DEPEND}

S=${WORKDIR}/${PN}

src_configure(){

        sed -i -e "s:/usr/local:/usr:" makefile
	sed -i -e "s:WITH_DATADIR?=NO:WITH_DATADIR?=YES:" makefile            
	sed -i -e "s:WITH_LIBDIR?=NO:WITH_LIBDIR?=YES:" makefile    
}

src_compile(){
	emake release
}

src_install(){
#	make install_root
#        cp ${FILESDIR}/paintball2.sh ${S}
	dogamesbin paintball2/paintball2

	exeinto /usr/games/${PN}
	doexe   paintball2/ref_pbgl.so  paintball2/snd_alsa.so  paintball2/snd_oss.so
#        insinto "${GAMES_DATADIR}/${PN}/pics"
#        doins -r pics/* || die "doins failed"

}
