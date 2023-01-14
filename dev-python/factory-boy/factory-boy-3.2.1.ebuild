# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{3_9,3_10,3_11} )

inherit distutils-r1

DESCRIPTION="A test fixtures replacement for Python"
HOMEPAGE="https://github.com/FactoryBoy/factory_boy"
SRC_URI="https://github.com/FactoryBoy/factory_boy/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

S="${WORKDIR}/factory_boy-${PV}/"

DEPEND="
dev-python/faker
"