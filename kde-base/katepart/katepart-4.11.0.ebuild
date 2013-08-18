# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/katepart/katepart-4.11.0.ebuild,v 1.1 2013/08/14 20:23:45 dilfridge Exp $

EAPI=5

KDE_HANDBOOK="optional"
KMNAME="kate"
KMMODULE="part"
inherit kde4-meta

DESCRIPTION="KDE Editor KPart"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="debug"

RESTRICT="test"
# bug 392993

KMEXTRA="
	addons/ktexteditor
"
PATCHES=( "${FILESDIR}/${PN}-4.10.0-trailing-behaviour.patch" )

src_configure() {
	local mycmakeargs=(
		"-DKDE4_BUILD_TESTS=OFF"
	)

	kde4-meta_src_configure
}
