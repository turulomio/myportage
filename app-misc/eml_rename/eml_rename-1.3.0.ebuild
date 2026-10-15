# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Script to rename eml files in a directory using mail metadata"
HOMEPAGE="
    https://github.com/turulomio/eml_rename/
    https://pypi.org/project/eml-rename/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    dev-python/chardet[${PYTHON_USEDEP}]
    dev-python/tqdm[${PYTHON_USEDEP}]
    dev-python/pydicts[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
	dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest