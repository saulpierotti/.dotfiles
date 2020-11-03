#!/bin/sh

GPU=`optimus-manager --status|grep Current|cut -d ':' -f 2|xargs`

if [[ $GPU -eq 'intel' ]]
then
  echo "Intel"
elif [[ $GPU -eq 'nvidia' ]]
then
  echo "Nvidia"
else
  echo "Unexpected value in optimus manager"
fi
