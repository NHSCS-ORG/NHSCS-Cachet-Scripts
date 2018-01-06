#!/bin/bash
#Make the test files for current status checks

# ==========
# Here we're going to make the dirs on the system as to ensure that touch can make our files.
# To adapt this to your environment, simply change the dir names to those that you setup your script for.
sudo mkdir /cachet-scripts/status
sudo touch /cachet-scripts/status/eh1-nhscs-dc01-S1.txt
sudo touch /cachet-scripts/status/eh1-nhscs-dc01-S2.txt
sudo touch /cachet-scripts/status/eh1-nhscs-dc01-S3.txt
sudo touch /cachet-scripts/status/eh1-nhscs-dc01-S4.txt
