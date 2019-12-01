# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop

DESCRIPTION="Stand-alone viewer of SWF files."
HOMEPAGE="https://www.adobe.com/support/flashplayer/debug_downloads.html"
SRC_URI="https://fpdownload.macromedia.com/pub/flashplayer/updaters/32/flash_player_sa_linux.x86_64.tar.gz -> ${P}.tar.gz
	https://fpdownload.adobe.com/pub/flashplayer/pdc/${PV}/flash_player_npapi_linux.x86_64.tar.gz -> ${PN}-${PV}-assets.tar.gz"

LICENSE="AdobeFlash-11.x"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="virtual/opengl
	x11-libs/gtk+:2"
DEPEND="${RDEPEND}"
BDEPEND=""

S="${WORKDIR}"
QA_PREBUILT="/usr/bin/flashplayer"
DOCS=( LGPL/LGPL.txt LGPL/notice.txt license.pdf )

src_install() {
	dobin flashplayer
	for s in 48 32 24 16; do
		newicon -s "$s" "usr/share/icons/hicolor/${s}x${s}/apps/flash-player-properties.png" "${PN}.png"
	done
	make_desktop_entry flashplayer 'Flash Player Projector' "$PN" AudioVideo
	einstalldocs
}
