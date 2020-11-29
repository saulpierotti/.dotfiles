#!/bin/sh

envFile=~/.config/polybar/scripts/env.sh
changeValue=300

changeMode() {
  sed -i "s/REDSHIFT=$1/REDSHIFT=$2/g" $envFile 
  REDSHIFT=$2
  echo $REDSHIFT
}

case $1 in 
  toggle) 
    if [ "$REDSHIFT" = on ];
    then
      changeMode on off
      redshift -x
    else
      changeMode off on
      redshift -O 3600
    fi
    ;;
  status)
    case $REDSHIFT in
      on)
        printf ""
        ;;
      off)
        printf ""
        ;;
    esac
    ;;
  restore)
    if [ "$REDSHIFT" = on ];
    then
      redshift -x
      changeMode off on
      redshift -O 3600
    else
      changeMode on off
      redshift -x
    fi
    ;;
esac
