EAPI=2
inherit subversion games

DESCRIPTION="Zero-K is a FREE, multiplatform, open-source RTS game. It aims to be dynamic, action-packed and hassle-free, full of clever strategies and constantly moving combat with games lasting an average 20-30 minutes."
HOMEPAGE="http://zero-k.info/"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

ESVN_REPO_URI="http://zero-k.googlecode.com/svn/trunk/mods/zk"

DEPEND="
games-strategy/spring
games-util/springlobby
"
RDEPENDS="${DEPEND}"


src_unpack() {
        subversion_src_unpack
}

