# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="RealESRGAN super resolution plugin for VapourSynth"
HOMEPAGE="https://github.com/Tatsh/VapourSynth-Real-ESRGAN-ncnn-vulkan"
SHA="703928516393afb8ba3eb5be2efbed49f8ace70c"
SRC_URI="https://github.com/Tatsh/VapourSynth-Real-ESRGAN-ncnn-vulkan/archive/${SHA}.tar.gz -> ${P}.tar.gz
	https://dev.gentoo.org/~slashbeast/distfiles/realesrgan-ncnn-vulkan/realesrgan-ncnn-vulkan-models.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/ncnn media-libs/vulkan-loader"
RDEPEND="${DEPEND}"

S="${WORKDIR}/VapourSynth-Real-ESRGAN-ncnn-vulkan-${SHA}/src"

src_configure() {
	local mycmakeargs=(
		"-DVAPOURSYNTH_INCLUDE_DIR=${EPREFIX}/usr/include/vapoursynth"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	insinto /usr/lib64/vapoursynth/models
	doins "${WORKDIR}/models/"*
}