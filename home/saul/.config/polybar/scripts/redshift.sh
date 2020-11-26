#!/bin/sh

envFile=~/.config/polybar/scripts/env.sh
changeValue=300

changeMode() {
  sed -i "s/REDSHIFT=$1/REDSHIFT=$2/g" $envFile 
  REDSHIFT=$2
  echo $REDSHIFT
}

restoreMode() {
  sed -i "s/REDSHIFT_RESTORE=$1/REDSHIFT_RESTORE=$2/g" $envFile 
  REDSHIFT=$2
  echo $REDSHIFT
}

case $1 in 
  toggle) 
    if [ "$REDSHIFT" = on ];
    then
      changeMode on off
      restoreMode no yes
      redshift -x
    else
      changeMode off on
      restoreMode no yes
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
    case $REDSHIFT in
      on)
        if [ "$REDSHIFT_RESTORE" = yes ]; then
            restoreMode yes no
            redshift -O 3600
	fi
        ;;
      off)
        redshift -x
        ;;
    esac
    ;;
esac
