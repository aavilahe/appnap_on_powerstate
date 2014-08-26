#!/bin/sh
# make_appnap_plist.sh -- writes the launchAgent plist
#
# Author: Aram Avila-Herrera (aavilahe@users.noreply.github.com)
# Date:   July 27, 2014
#
# License: See LICENSE

usage="usage: $0 install_path > local.appnap_on_powerstate.plist
install_path: where appnap_on_powerstate.sh is installed"

if [ $# -ne 1 ]; then
	echo "$usage" >> /dev/stderr
	exit 1
fi

INSTALL_PATH="${1}/appnap_on_powerstate.sh"

PLIST='<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>appnap_on_powerstate</string>
	<key>ProcessType</key>
	<string>Background</string>
	<key>ProgramArguments</key>
	<array>
		<string>'"${INSTALL_PATH}"'</string>
	</array>
	<key>RunAtLoad</key>
	<true/>
	<key>StartInterval</key>
	<integer>300</integer>
</dict>
</plist>'

echo "${PLIST}"
