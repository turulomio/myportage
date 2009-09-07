inherit subversion games

DESCRIPTION="Unknown Horizons is a 2D realtime strategy simulation with an emphasis on economy and city building"
HOMEPAGE="http://www.unknown-horizons.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="
http://fife.svn.cvsdude.com/engine/trunk
svn://unknown-horizons.org/unknown-horizons/trunk
"
DEPEND="
media-libs/sdl-image
"
RDEPEND=${DEPEND}

src_unpack() {
        subversion_src_unpack
#        sed -i -e "s:orientation=\"-1\":orientation=\"1\":" navit.xml
}


