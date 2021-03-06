#!/bin/bash
#Alert Script for vc1-nhscs-vcs02 - 15 Minute Intervals
if ping -c 1 10.162.150.57 > /dev/null
  then
    dc01stat1=$(cat /cachet-scripts/status/vc1-nhscs-vcs02-S1.txt)
    dc01stat2=$(cat /cachet-scripts/status/vc1-nhscs-vcs02-S2.txt)
    dc01stat3=$(cat /cachet-scripts/status/vc1-nhscs-vcs02-S3.txt)
    if [ $dc01stat1 = "1" ];
      then
        echo 0 > /cachet-scripts/status/vc1-nhscs-vcs02-S1.txt
      else
        :
    fi
    if [ $dc01stat2 = "1" ];
      then
        echo 0 > /cachet-scripts/status/vc1-nhscs-vcs02-S2.txt
      else
        :
    fi
    if [ $dc01stat3 = "1" ];
      then
        echo 0 > /cachet-scripts/status/vc1-nhscs-vcs02-S3.txt
        curl -H "X-Cachet-Token: 0dKkef9ucNbQ0mGbxGkZ" -X PUT -d 'id=1&status=1' http://eh1-nhscs-cas01.ad.nhscs.net/api/v1/components/
      else
        :
    fi
  else
    echo 1 > /cachet-scripts/status/vc1-nhscs-vcs02-S3.txt
    dc01stat1=$(cat /cachet-scripts/status/vc1-nhscs-vcs02-S1.txt)
    dc01stat2=$(cat /cachet-scripts/status/vc1-nhscs-vcs02-S2.txt)
    if [ $dc01stat1 = "1" ];
      then
        if [ $dc01stat2 = "1" ];
          then
            curl -H "X-Cachet-Token: 0dKkef9ucNbQ0mGbxGkZ" -X PUT -d 'id=1&status=3' http://eh1-nhscs-cas01.ad.nhscs.net/api/v1/components/
          else
            :
        fi
      else
        exit
fi
