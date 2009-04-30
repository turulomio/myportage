# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit qt4-edge

DESCRIPTION="FotoWall is a creative tool that allows you to layout your photos or pictures in a personal way."
HOMEPAGE="http://code.google.com/p/fotowall/"
SRC_URI="http://fotowall.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

#S=${WORKDIR}/${P}


src_install() {
  emake INSTALL_ROOT="${D}" install || die "install failed"
}

