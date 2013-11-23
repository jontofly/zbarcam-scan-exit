#!/bin/bash
# Data Matrix Reader - Scan And Exit

# Vars
datamtx=''
# Current directory to var
cwd=$(pwd)
# tmp data-matrix holder
tmp="$cwd/zbartmp"
# Name of scan results file
ScanResult="$cwd/scan-results.txt"

function scan() {
  zbarcam --raw --prescale=320x240 /dev/video0 > $tmp &

  # Last job running in background eg. zbarcam
  pid=$!

  # Sleep loop until $tmp file has content
  while [[ ! -s $tmp ]]
    do
      sleep 1
      # cleanup - add a trap that will remove $tmp and kill zbarcam
      # if any of the signals - SIGHUP SIGINT SIGTERM it received.
      trap "rm -f $tmp; kill -s 9 $pid; exit" SIGHUP SIGINT SIGTERM
  done

  kill -s 9 $pid
  datamtx=$(cat $tmp)
  rm -f $tmp

  # Append scan results to file
  echo $datamtx >> $ScanResult

  # Open scan results
  kate -n "$ScanResult" || gedit "$ScanResult" || nano "$ScanResult"
  exit
}
# Call the scan function
scan

# Pause like command, for user to view the sdtout before quitting.
#read -p "Press [Enter] Key to Exit..."
