EAPI=2
inherit subversion games


DESCRIPTION="Red Eclipse a Free and Open Source FPS"
HOMEPAGE="http://www.redeclipse.net/"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="https://redeclipse.svn.sourceforge.net/svnroot/redeclipse"

DEPEND=""
RDEPENDS="${DEPEND}"

src_unpack() {
        subversion_src_unpack
}

