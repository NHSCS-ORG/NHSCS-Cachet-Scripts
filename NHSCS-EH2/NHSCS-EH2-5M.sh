#!/bin/bash
#Alert Script for nhscs-eh2 - 5 Minute Intervals
if ping -c 1 10.162.150.51 > /dev/null
  then
    dc01stat1=$(cat /cachet-scripts/status/nhscs-eh2-S1.txt)
    if [ $dc01stat1 = "1" ];
      then
        echo 0 > /cachet-scripts/status/nhscs-eh2-S1.txt
        curl -H "X-Cachet-Token: 0dKkef9ucNbQ0mGbxGkZ" -X PUT -d 'id=8&status=1' http://eh1-nhscs-cas01.ad.nhscs.net/api/v1/components/1
      else
        :
    fi
  else
    echo 1 > /cachet-scripts/status/nhscs-eh2-S1.txt
    curl -H "X-Cachet-Token: 0dKkef9ucNbQ0mGbxGkZ" -X PUT -d 'id=8&status=2' http://eh1-nhscs-cas01.ad.nhscs.net/api/v1/components/1
    exit
fi
