# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{14..15} )

inherit distutils-r1 pypi

DESCRIPTION="Python library and CLI tool to manage and monitor CPU frequencies and turbo state"
HOMEPAGE="
    https://github.com/turulomio/pycpufreq
	https://pypi.org/project/pycpufreq/
	"
	
	LICENSE="GPL-3+"
	SLOT="0"
	KEYWORDS="~amd64 ~x86"
	
	distutils_enable_tests pytest