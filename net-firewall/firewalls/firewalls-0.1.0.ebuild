# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Firewalls configurations in Gentoo systems"
HOMEPAGE="https://github.com/turulomio/firewalls"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="test"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	dev-python/colorama
	net-firewall/firewalld
"
