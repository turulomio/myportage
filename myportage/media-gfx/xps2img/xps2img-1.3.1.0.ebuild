# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Mariano Muñoz

EAPI=2

DESCRIPTION="XPS (XML Paper Specification) document to set of images command-line conversion utility"
HOMEPAGE="http://xps2img.sourceforge.net/"
SRC_URI="mirror://sourceforge/xps2img/Sources/xps2img-src-${PV}.7z"
LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""


#src_compile() {
#	sed -i -e "s:0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ:0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ;,._-¿?!¡:" rarcrack.h
#	emake || die "emake failed"
#}

#src_install() {
#        dobin rarcrack || die "dobin failed"
#}
