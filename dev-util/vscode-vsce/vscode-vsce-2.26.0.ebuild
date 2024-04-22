# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit yarn

DESCRIPTION="VS Code extensions manager for extension developers."
HOMEPAGE="https://code.visualstudio.com"
NPM_P="@${P/-/\/}"
NPM_PN="@${PN/-/\/}"
YARN_PKGS=(
	@vscode/vsce-2.26.0
	@azure/core-rest-pipeline-1.15.2
	sax-1.3.0
	mimic-response-3.1.0
	define-data-property-1.1.4
	cockatiel-3.1.2
	form-data-4.0.0
	fd-slicer-1.1.0
	semver-7.6.0
	@azure/core-client-1.9.2
	bl-4.1.0
	domutils-3.1.0
	end-of-stream-1.4.4
	set-function-length-1.2.2
	domhandler-5.0.3
	nth-check-2.1.1
	simple-get-4.0.1
	mime-types-2.1.35
	object-inspect-1.13.1
	combined-stream-1.0.8
	tunnel-0.0.6
	xml2js-0.5.0
	brace-expansion-1.1.11
	ms-2.1.2
	jsonwebtoken-9.0.2
	boolbase-1.0.0
	prebuild-install-7.1.2
	url-join-4.0.1
	path-is-absolute-1.0.1
	argparse-2.0.1
	buffer-crc32-0.2.13
	has-symbols-1.0.3
	expand-template-2.0.3
	http-proxy-agent-7.0.2
	util-deprecate-1.0.2
	hasown-2.0.2
	hosted-git-info-4.1.0
	safe-buffer-5.2.1
	strip-json-comments-2.0.1
	stoppable-1.1.0
	events-3.3.0
	semver-5.7.2
	color-name-1.1.3
	agent-base-7.1.1
	ieee754-1.2.1
	entities-4.5.0
	pump-3.0.0
	string_decoder-1.3.0
	fs-constants-1.0.0
	lodash.isplainobject-4.0.6
	ms-2.1.3
	@azure/abort-controller-1.1.0
	ini-1.3.8
	@azure/identity-4.1.0
	buffer-equal-constant-time-1.0.1
	https-proxy-agent-7.0.4
	markdown-it-12.3.2
	asynckit-0.4.0
	delayed-stream-1.0.0
	ansi-styles-3.2.1
	yauzl-2.10.0
	buffer-5.7.1
	inflight-1.0.6
	ecdsa-sig-formatter-1.0.11
	uuid-8.3.2
	readable-stream-3.6.2
	@azure/core-tracing-1.1.2
	tar-stream-2.2.0
	concat-map-0.0.1
	keytar-7.9.0
	tunnel-agent-0.6.0
	node-addon-api-4.3.0
	node-abi-3.60.0
	has-proto-1.0.3
	inherits-2.0.4
	mdurl-1.0.1
	pend-1.2.0
	jwa-1.4.1
	@azure/core-util-1.9.0
	function-bind-1.1.2
	gopd-1.0.1
	jws-3.2.2
	is-wsl-2.2.0
	open-8.4.2
	parse5-7.1.2
	call-bind-1.0.7
	es-errors-1.3.0
	qs-6.12.1
	define-lazy-prop-2.0.0
	has-flag-3.0.0
	mkdirp-classic-0.5.3
	css-select-5.1.0
	es-define-property-1.0.0
	minimatch-3.1.2
	chalk-2.4.2
	commander-6.2.1
	napi-build-utils-1.0.2
	deep-extend-0.6.0
	@azure/logger-1.1.2
	color-convert-1.9.3
	parse-semver-1.1.1
	@azure/core-auth-1.7.2
	minimist-1.2.8
	jsonc-parser-3.2.1
	lodash.isstring-4.0.1
	jwa-2.0.0
	tar-fs-2.1.1
	github-from-package-0.0.0
	read-1.0.7
	has-property-descriptors-1.0.2
	lodash.includes-4.3.0
	yallist-4.0.0
	mime-db-1.52.0
	is-docker-2.2.1
	escape-string-regexp-1.0.5
	lodash.isboolean-3.0.3
	xmlbuilder-11.0.1
	leven-3.1.0
	side-channel-1.0.6
	linkify-it-3.0.3
	dom-serializer-2.0.0
	mute-stream-0.0.8
	tslib-2.6.2
	once-1.4.0
	htmlparser2-8.0.2
	jws-4.0.0
	lodash.once-4.1.1
	simple-concat-1.0.1
	lodash.isinteger-4.0.4
	parse5-htmlparser2-tree-adapter-7.0.0
	css-what-6.1.0
	decompress-response-6.0.0
	azure-devops-node-api-12.5.0
	tmp-0.2.3
	uc.micro-1.0.6
	base64-js-1.5.1
	domelementtype-2.3.0
	chownr-1.1.4
	cheerio-select-2.1.0
	wrappy-1.0.2
	debug-4.3.4
	detect-libc-2.0.3
	@azure/abort-controller-2.1.2
	@azure/msal-common-14.9.0
	@azure/msal-node-2.7.0
	fs.realpath-1.0.0
	glob-7.2.3
	rc-1.2.8
	yazl-2.5.1
	lodash.isnumber-3.0.3
	mime-1.6.0
	cheerio-1.0.0-rc.12
	entities-2.1.0
	get-intrinsic-1.2.4
	lru-cache-6.0.0
	supports-color-5.5.0
	underscore-1.13.6
	balanced-match-1.0.2
	typed-rest-client-1.8.11
	@azure/msal-browser-3.13.0
)
yarn_set_globals
SRC_URI="${YARN_SRC_URI}"

BDEPEND="dev-libs/glib"
LICENSE="BSD-2 MIT Apache-2 ISC MIT PSF-2"
KEYWORDS="~amd64"

S="${WORKDIR}"

src_install() {
	yarn_src_install
	fperms 0755 "/usr/$(get_libdir)/${PN}/node_modules/${NPM_PN}/vsce"
	dosym "../$(get_libdir)/${PN}/node_modules/${NPM_PN}/vsce" "/usr/bin/vsce"
}