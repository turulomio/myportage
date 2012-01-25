# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit subversion games eutils

DESCRIPTION="Heroes III"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="https://vcmi.svn.sourceforge.net/svnroot/vcmi/trunk"

#S=${WORKDIR}/gameandwatch-0.0/gamewatch/trunk

src_unpack() {
        subversion_src_unpack
}
