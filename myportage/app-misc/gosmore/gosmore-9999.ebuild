EAPI="1"
inherit subversion

DESCRIPTION="osmore is a routing and viewer of OSM XML data"
HOMEPAGE="http://wiki.openstreetmap.org/wiki/Gosmore"
SRC_URI=""

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="http://svn.openstreetmap.org/applications/rendering/gosmore/"

src_compile() {
    perl -pi -e "s|\(prefix\)/usr/share/|(prefix)/share/gosmore/|g" Makefile || die

    emake prefix=/usr
}

src_install () {
    emake install DESTDIR="${D}" prefix=/usr
}
