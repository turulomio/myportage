# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )

inherit distutils-r1 subversion

DESCRIPTION="PySGAE"
HOMEPAGE="https://pysgae.com"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="svn://10.52.188.177/PySGAE"
ESVN_USER="guest"
ESVN_PASSWORD="guested"

RDEPEND=${PYTHON_DEPS}
DEPEND="${RDEPEND}
app-misc/rlwrap
dev-python/psutil
dev-python/colorama
dev-python/cx-oracle
dev-python/python-stdnum
dev-python/officegenerator
dev-python/gc_office
dev-python/tqdm
sci-libs/pyshp
sci-geosciences/qgis
=dev-db/oracle-instantclient-sqlplus-11.2.0.4
"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

