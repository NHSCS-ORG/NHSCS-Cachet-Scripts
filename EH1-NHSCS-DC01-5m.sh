#!/bin/bash
#Alert Script for EH1-NHSCS-DC01 - 5 Minute Intervals
if ping -c 1 10.162.150.10 > /dev/null
  then
    :
  else
    curl -H "X-Cachet-Token: 0dKkef9ucNbQ0mGbxGkZ" -X PUT -d 'id=1&status=2' http://eh1-nhscs-cas01.ad.nhscs.net/api/v1/components/1
    echo 1 > /cachet-scripts/status/eh1-nhscs-dc01.txt
