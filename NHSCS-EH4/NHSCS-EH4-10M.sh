#!/bin/bash
#Alert Script for nhscs-eh4 - 10 Minute Intervals
if ping -c 1 10.162.150.53 > /dev/null
  then
    dc01stat1=$(cat /cachet-scripts/status/nhscs-eh4-S1.txt)
    dc01stat2=$(cat /cachet-scripts/status/nhscs-eh4-S2.txt)
    if [ $dc01stat1 = "1" ];
      then
        echo 0 > /cachet-scripts/status/nhscs-eh4-S1.txt
      else
        :
    fi
    if [ $dc01stat2 = "1" ];
      then
        echo 0 > /cachet-scripts/status/nhscs-eh4-S2.txt
        curl -H "X-Cachet-Token: 0dKkef9ucNbQ0mGbxGkZ" -X PUT -d 'id=10&status=1' http://eh1-nhscs-cas01.ad.nhscs.net/api/v1/components/
      else
        :
    fi
  else
    echo 1 > /cachet-scripts/status/nhscs-eh4-S2.txt
    dc01stat1=$(cat /cachet-scripts/status/nhscs-eh4-S1.txt)
    if [ $dc01stat1 = "1" ];
      then
        curl -H "X-Cachet-Token: 0dKkef9ucNbQ0mGbxGkZ" -X PUT -d 'id=10&status=2' http://eh1-nhscs-cas01.ad.nhscs.net/api/v1/components/
      else
        exit
    fi
fi
