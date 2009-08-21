# Written by Nighsoft at www.nighsoft.com

inherit eutils games

DESCRIPTION="Remake of Diaspora"
HOMEPAGE="http://www.nighsoft.com"
SRC_URI="http://downloads.sourceforge.net/pdiaspora/pdiaspora_client-beta-1.2.5.tar.gz"

LICENSE="zlib"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="mirror"

DEPEND="media-libs/libsdl
	media-libs/sdl-gfx
	media-libs/sdl-ttf
	media-libs/sdl-image
	net-misc/curl"
RDEPEND="${DEPEND}"


S=${WORKDIR}/pdiaspora_client-beta-1.2.5

src_unpack() 
{
	unpack ${A}
}

src_compile() 
{
	cd ${S}/src
	make || die "make failed"
}

src_install() 
{
	insinto ${GAMES_DATADIR}/pdiaspora-client-beta
	doins -r ${S}/*

	games_make_wrapper pdiaspora ./pdiaspora ${GAMES_DATADIR}/pdiaspora-client-beta

	doicon graphics/pdiaspora.xpm
	make_desktop_entry pdiaspora "Project Diaspora" pdiaspora.xpm

	prepgamesdirs
}

pkg_postinst() 
{
	games_pkg_postinst
	chmod -R 0770 ${GAMES_DATADIR}/pdiaspora-client-beta

	elog ""
	elog ""
	elog ""
	elog "############################################################"
	elog ""
	elog "Project Diaspora is a game from Nighsoft at www.nighsoft.com"
	elog ""
	elog "                  Type pdiaspora to play"
	elog ""
	elog "############################################################"
	elog ""
	elog ""
	elog ""
}