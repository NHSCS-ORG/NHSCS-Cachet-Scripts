#!/bin/bash
#Alert Script for eh1-nhscs-laps01 - 30 Minute Intervals
if ping -c 1 10.162.150.17 > /dev/null
  then
    dc01stat1=$(cat /cachet-scripts/status/eh1-nhscs-laps01-S1.txt)
    dc01stat2=$(cat /cachet-scripts/status/eh1-nhscs-laps01-S2.txt)
    dc01stat3=$(cat /cachet-scripts/status/eh1-nhscs-laps01-S3.txt)
    dc01stat4=$(cat /cachet-scripts/status/eh1-nhscs-laps01-S4.txt)
    if [ $dc01stat1 = "1" ];
      then
        echo 0 > /cachet-scripts/status/eh1-nhscs-laps01-S1.txt
      else
        :
    fi
    if [ $dc01stat2 = "1" ];
      then
        echo 0 > /cachet-scripts/status/eh1-nhscs-laps01-S2.txt
      else
        :
    fi
    if [ $dc01stat3 = "1" ];
      then
        echo 0 > /cachet-scripts/status/eh1-nhscs-laps01-S3.txt
      else
        :
    fi
    if [ $dc01stat4 = "1" ];
      then
        echo 0 > /cachet-scripts/status/eh1-nhscs-laps01-S4.txt
        curl -H "X-Cachet-Token: 0dKkef9ucNbQ0mGbxGkZ" -X PUT -d 'id=18&status=1' http://eh1-nhscs-cas01.ad.nhscs.net/api/v1/components/
      else
        :
    fi
  else
    echo 1 > /cachet-scripts/status/eh1-nhscs-laps01-S4.txt
    dc01stat1=$(cat /cachet-scripts/status/eh1-nhscs-laps01-S1.txt)
    dc01stat2=$(cat /cachet-scripts/status/eh1-nhscs-laps01-S2.txt)
    dc01stat3=$(cat /cachet-scripts/status/eh1-nhscs-laps01-S3.txt)
    if [ $dc01stat1 = "1" ];
      then
        if [ $dc01stat2 = "1" ];
          then
            if [ $dc01stat3 = "1" ];
              then
                curl -H "X-Cachet-Token: 0dKkef9ucNbQ0mGbxGkZ" -X PUT -d 'id=18&status=4' http://eh1-nhscs-cas01.ad.nhscs.net/api/v1/components/1
              else
                :
            fi
          else
            :
        fi
      else
        exit
     fi
fi
