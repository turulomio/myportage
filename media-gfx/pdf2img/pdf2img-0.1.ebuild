# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Mariano Muñoz

EAPI=2

DESCRIPTION="Covierte un pdf a imágenes en una carpeta nueva"
HOMEPAGE="http://turulomio.users.sourceforge.net/"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="
media-gfx/imagemagick"

src_install() {
        dobin ${FILESDIR}/pdf2img
}
