#!/bin/bash

#
# File Name: CrowdStrikeVersionCA.sh https://github.com/dcoobs/mosyle
#
# Custom command attribute to check and report the installed version of CrowdStrike on a Mac
# Includes logic to echo "N/A" if the computer does not have CrowdStrike running
# Custom command attributes are intended for use with Mosyle MDM
#

FALCONCTL="/Applications/Falcon.app/Contents/Resources/falconctl"

# Check if CrowdStrike is running before going further
$FALCONCTL stats > /dev/null 2>&1
if [ $? -eq 0 ]; then
    sudo /Applications/Falcon.app/Contents/Resources/falconctl stats agent_info | grep "version" | awk '{print $2}'
else
	echo "N/A"
fi