# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )


inherit distutils-r1


DESCRIPTION="Python module to save console output and create GIF or video"
HOMEPAGE="https://sourceforge.net/projects/ttyrecgenerator/"
SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${PV}/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
    dev-python/mangenerator"
DEPEND="${RDEPEND}"


src_prepare(){
   cp -Rv ${WORKDIR}/${P}/locale/ ${WORKDIR}/${P}/ttyrecgenerator/
   cp -Rv ${WORKDIR}/${P}/locale/ ${S}/locale/
distutils-r1_python_prepare_all
}