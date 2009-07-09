# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-emulation/gxmame/gxmame-0.35_beta2.ebuild,v 1.8 2006/10/05 23:26:25 nyhm Exp $

inherit games

DESCRIPTION="frontend for SDLMame using the GTK library"
HOMEPAGE="http://gmameui.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="debug doc gnome nls joystick"

RDEPEND="dev-libs/expat
	>=x11-libs/gtk+-2.4
	>=dev-libs/glib-2.4
	x11-themes/gnome-icon-theme
	nls? ( virtual/libintl )
	gnome? ( gnome-base/libgnome )"

DEPEND="${RDEPEND}
	games-emulation/sdlmame
	nls? ( sys-devel/gettext )"

src_compile() {
	local myconf
	if use ! nls; then
		myconf="${myconf} --disable-libgnome"
	else
		if ! use gnome; then
			myconf="${myconf} --disable-libgnome"
		fi
	fi
	egamesconf \
		${myconf} \
		--with-sdlmame-dir="${GAMES_DATADIR}"/sdlmame \
		$(use_enable debug) \
		$(use_enable doc) \
		$(use_enable joystick) \
		|| die
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS BUGS ChangeLog NEWS README TODO
	prepgamesdirs
}
