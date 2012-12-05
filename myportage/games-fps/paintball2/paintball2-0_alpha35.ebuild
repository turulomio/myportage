EAPI="2"
inherit  autotools eutils games

DESCRIPTION="http://digitalpaint.org/files/"
SRC_URI="mirror://sourceforge/paintball2/paintball20_alpha035_src_20120109.zip"
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
	emake release|| die
}

