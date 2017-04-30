# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://www.github.com/anbox/${PN}.git"
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Run Android on Linux via containers"
HOMEPAGE="http://anbox.io/
		  https://github.com/anbox/anbox"
LICENSE="GPL-3"
SLOT="0"

IUSE=""

DEPEND="sys-apps/dbus
	dev-libs/dbus-c++
	dev-cpp/gtest
	dev-cpp/gmock
	dev-libs/boost
	sys-libs/libcap
	media-libs/mesa[egl,gles]
	dev-libs/glib:2
	media-libs/libsdl2
	dev-libs/protobuf
	app-emulation/lxc"
RDEPEND="${DEPEND}"

src_prepare() {
	# pkg_check_modules(DBUS_CPP dbus-cpp REQUIRED) - CMakeLists.txt needs alterted should be: kg_check_modules(DBUS_CPP dbus-c++-1 REQUIRED)
    sed -i 's/"dbus-cpp"/"dbus-c++-1"/g' CMakeLists.txt || die "Sed failed!"
	eapply_user
}
