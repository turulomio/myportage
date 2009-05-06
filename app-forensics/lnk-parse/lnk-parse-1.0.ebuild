# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs eutils

DESCRIPTION="Lnk parser"
HOMEPAGE="http://sourceforge.net/project/showfiles.php?group_id=100847"
SRC_URI="mirror://sourceforge/jafat/lnk-parse-1.0.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""

src_install() {
	dobin lnk-parse-1.0.pl
	dodoc lnk-parse.README COPYING
}

