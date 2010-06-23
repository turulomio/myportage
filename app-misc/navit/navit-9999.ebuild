# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils autotools subversion

if [[ ${PV} == "9999" ]]; then
	NAVIT_REV="live"
	ESVN_REPO_URI="https://navit.svn.sourceforge.net/svnroot/navit/trunk/navit"
	SRC_URI=""
elif [[ ${PV} =~ (_p)([0-9]+) ]]; then
	NAVIT_REV=${BASH_REMATCH[2]}
	ESVN_REPO_URI="https://navit.svn.sourceforge.net/svnroot/navit/trunk/navit@${NAVIT_REV}"
	ESVN_OPTIONS="--ignore-externals"
	SRC_URI=""
else
	NAVIT_REV="R${PV//-/_}"
	ESVN_REPO_URI="https://navit.svn.sourceforge.net/svnroot/navit/tags/${NAVIT_REV}/navit"
	SRC_URI=""
fi

DESCRIPTION="An open-source vector based car navigation system with a routing engine."
HOMEPAGE="http://www.navit-project.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

IUSE_GPS="gps_source_android +gps_source_demo +gps_source_file gps_source_gpsd
	gps_source_gypsy gps_source_iphone gps_source_wince"
IUSE_GUI="gui_sdl +gui_gtk +gui_internal gui_win32"
IUSE_GRAPHICS="graphics_android graphics_gd +graphics_gtk graphics_opengl
	graphics_qt graphics_sdl graphics_win32"
IUSE_SPEECH="speech_android speech_cmd speech_speechd"
IUSE="dbus garmin hildon +nls python +svg svg2png samplemap
	${IUSE_GPS} ${IUSE_GRAPHICS} ${IUSE_GUI} ${IUSE_SPEECH}"

COMMON_DEPEND="
	dev-libs/glib:2
	dbus? ( sys-apps/dbus )
	garmin? ( dev-libs/libgarmin )
	gps_source_gpsd? ( sci-geosciences/gpsd )
	gps_source_gypsy? ( sci-geosciences/gypsy )
	nls? ( sys-devel/gettext )
	python? ( dev-lang/python )
	gui_gtk? ( x11-libs/gtk+:2 )
	graphics_gtk? (
		x11-libs/gtk+:2
		svg? ( gnome-base/librsvg[zlib] )
	)
	graphics_qt? ( x11-libs/qt-core )
	graphics_sdl? ( media-libs/sdl-image[png] )
	speech_speechd? ( app-accessibility/speechd )"

# cvs required by gettext's autopoint.
# subversion requires webdav to fetch navit. See subversion.eclass
DEPEND="${COMMON_DEPEND}
	dev-vcs/cvs
	dev-util/pkgconfig
	sys-devel/gettext
	svg2png? (
		|| (
			gnome-base/librsvg[zlib]
			media-gfx/imagemagick[svg,png,xml]
			media-gfx/inkscape
			kde-base/kdelibs
		)
	)"


EPATCH_SOURCE="${FILESDIR}"
EPATCH_SUFFIX="patch"
src_prepare() {

	einfo "the revision requested is ${NAVIT_REV}"

	autopoint -f || die "autopoint failed"
	eautoreconf
}

src_configure() {

	local conf="
	$(use_enable hildon)
	$(use_enable garmin)
	$(use_enable samplemap)
	$(use_enable nls)
	$(use_enable dbus binding-dbus)
	$(use_enable python binding-python)
	$(use_enable svg)
	$(use_enable svg2png)"

	# Frontends
	conf="$conf
	$(use_enable gui_gtk gui-gtk)
	$(use_enable gui_internal gui-internal)
	$(use_enable gui_win32 gui-win32)"

	# Graphics
	conf="$conf
	$(use_enable graphics_sdl graphics-sdl)
	$(use_enable graphics_opengl graphics-opengl)
	$(use_enable graphics_gd graphics-gd)
	$(use_enable graphics_gtk graphics-gtk-drawing-area)
	$(use_enable graphics_win32 graphics-win32)
	$(use_enable graphics_qt graphics-qt-qpainter)"

	# GPS data sources
	conf="$conf
	$(use_enable gps_source_android vehicle-android)
	$(use_enable gps_source_demo vehicle-demo)
	$(use_enable gps_source_file vehicle-file)
	$(use_enable gps_source_gpsd vehicle-gpsd)
	$(use_enable gps_source_gypsy vehicle-gypsy)
	$(use_enable gps_source_iphone vehicle-iphone)
	$(use_enable gps_source_wince vehicle-wince)"

	# Speech
	conf="$conf
	$(use_enable speech_android speech-android)
	$(use_enable speech_cmd speech-cmdline)
	$(use_enable speech_speechd speech-speech-dispatcher)"

	econf $conf
}

src_install () {
	emake DESTDIR="${D}" install || die "Install failed"
}

pkg_postinst () {
	einfo
	einfo "Visit http://wiki.navit-project.org/index.php/Configuring_Navit"
	einfo "to learn about how to get navit running."
	einfo

	use graphics_sdl && ! use svg2png && (
		ewarn
		ewarn "You have enabled the use flag graphics_sdl but not svg2png."
		ewarn "This is likely not what you want"
		ewarn
	)

	! use svg && ! use svg2png && (
		ewarn
		ewarn "You have neither the svg nor the svg2png use flag enabled."
		ewarn "This is likely not what you want."
		ewarn
	)
}

