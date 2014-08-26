#!/bin/sh
# appnap_on_powerstate.sh -- Disables AppNap if AC adapter is plugged in, enables AppNap otherwise
#
# Author: Aram Avila-Herrera (aavilahe@users.noreply.github.com)
# Date:   July 27, 2014
#
# License: See LICENSE

CONNECTED="$(system_profiler -detailLevel mini SPPowerDataType | grep Connected | grep -oE 'Yes|No')"
STATUS="$(defaults read NSGlobalDomain NSAppSleepDisabled)"

echo "AC adapter Connected: [${CONNECTED}] - AppNap Disabled: [${STATUS}]"
if [ "${CONNECTED}" == "Yes" ] && [ "${STATUS}" != "1" ]; then
	defaults write NSGlobalDomain NSAppSleepDisabled -bool YES && echo "AppNap Enabled"
elif [ "${CONNECTED}" != "Yes" ] && [ "${STATUS}" == "1" ]; then
	defaults write NSGlobalDomain NSAppSleepDisabled -bool NO && echo "AppNap Disabled"
fi

