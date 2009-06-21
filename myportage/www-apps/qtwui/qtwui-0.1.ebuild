# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit qt4-edge

DESCRIPTION="QtWui is a module for Qt that enables you to write web applications just like you where writing a standard desktop GUI application with QtGui."
HOMEPAGE="http://qtwui.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
MAKEOPTS="-j1"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S=${WORKDIR}/${PN}


src_install() {
  	dolib bin/libQtWui.so
	dolib bin/libQtWui.so.1.0.0
}

