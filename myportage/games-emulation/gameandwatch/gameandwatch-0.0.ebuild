# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit subversion games eutils

DESCRIPTION="Old machines game"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="https://gameandwatch.svn.sourceforge.net/svnroot/gameandwatch/gamewatch/trunk"

#S=${WORKDIR}/gameandwatch-0.0/gamewatch/trunk

src_unpack() {
        subversion_src_unpack
}

src_configure(){
        ./autogen.sh || die "autogen.sh failed"
	econf || die "configure failed"
}

#src_compile() {
#        econf || die "configure failed"
#        emake || die "make failed"
#}

#src_install () {
#        emake DESTDIR="${D}" install || die "install failed"
#}

