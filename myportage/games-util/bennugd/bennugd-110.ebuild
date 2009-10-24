# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils autotools subversion

DESCRIPTION="Is an interpreted programming language aimed at making games. It is designed in such a way, the graphical, sound and threading systems are easier to use, which makes Bennu a powerful language, not only for beginners, but also for experienced programmers."
HOMEPAGE="http://www.bennugd.org/"
ESVN_REPO_URI="https://bennugd.svn.sourceforge.net/svnroot/bennugd@${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"


src_configure(){
	cd core
	bash configure --prefix=/usr
}

src_compile(){
	cd core
	emake
}

src_Install(){
	emake install
}
