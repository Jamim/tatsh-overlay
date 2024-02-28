# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake linux-info systemd udev

DESCRIPTION="Emulate OSS devices using CUSE."
HOMEPAGE="https://github.com/OpenMandrivaSoftware/ossp"
SHA="c380089faa21cb92738fc02560fa195042023512"
SRC_URI="https://github.com/OpenMandrivaSoftware/${PN}/archive/${SHA}.tar.gz -> ${PN}-${SHA:0:7}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa pulseaudio"

DEPEND="sys-fs/fuse
	alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-libs/libpulse )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${SHA}"

CONFIG_CHECK="!SND_OSSEMUL
	!SND_MIXER_OSS
	!SND_PCM_OSS
	!SND_PCM_OSS_PLUGINS
	CUSE"

src_prepare() {
	sed -re 's|"\$\{CMAKE_INSTALL_LIBEXECDIR\}/ossp"|${CMAKE_INSTALL_BINDIR}|g' \
		-i cmake/${PN}-util.cmake || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-Dalsa=$(usex alsa)
		-Ddaemon=ON
		-Dpulseaudio=$(usex pulseaudio)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	echo cuse > osspd.conf
	insinto /usr/lib/modules-load.d
	doins osspd.conf
	systemd_dounit "${FILESDIR}/${PN}d.service"
	einstalldocs
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
