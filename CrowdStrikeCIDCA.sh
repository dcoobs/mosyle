#!/bin/bash

#
# File Name: CrowdStrikeCID.sh https://github.com/dcoobs/mosyle
#
# Custom command attribute to check and report the Mac's CrowdStrike instance CID
# Includes logic to echo "N/A" if the computer does not have CrowdStrike running
# Custom command attributes are intended for use with Mosyle MDM
#

FALCONCTL="/Applications/Falcon.app/Contents/Resources/falconctl"

# Check if CrowdStrike is running before going further
$FALCONCTL stats > /dev/null 2>&1
if [ $? -eq 0 ]; then
    sudo /Applications/Falcon.app/Contents/Resources/falconctl stats agent_info | grep "customerID" | awk '{print $2}' | sed 's/-//g'
else
	echo "N/A"
fi