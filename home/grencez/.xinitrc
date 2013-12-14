#!/bin/sh

if test "$1" = recurse
then
  opt=dwm
  #opt=fluxbox
  #opt=compiz
  #opt=xfce
  #opt=xmonad
  if [ $opt = "dwm" ]
  then
    dwm
  elif [ $opt = "fluxbox" ]
  then
    fluxbox
  elif [ $opt = "compiz" ]
  then
    if ! ps -e | grep tint2
    then
      tint2 &
      mrxvt &
    fi
    compiz
  elif [ $opt = "xfce" ]
  then
    startxfce4
  elif [ $opt = "xmonad" ]
  then
    xmonad
  elif [ $opt = "dwm2" ]
  then
    # Dual screen
    xrandr --output LVDS1 --auto
    xrandr --output VGA1 --left-of LVDS1
    hsetroot -fill ~/.current_wallpaper  # Reset background
    dwm
  else
    echo "BAD OPT: $opt"
    exit 1
  fi

  # Recurse to (re)start a window manager!
  exec $0 recurse
fi

# Set dvorak keyboard
xmodmap ~/.xmodmap

# Hand over brightness keys to BIOS
xrandr --output LVDS1 --set BACKLIGHT_CONTROL native

# Increase the keyboard repeat-rate
xset r rate 150 50

# Turn off beeps
xset -b

## Start jackd if not up already
#if ! ps -e | grep jackd
#then
#    jackd -r -d alsa &
#fi

# Set background
hsetroot -fill ~/.current_wallpaper  # A png image or somesuch

# Start the window manager!
exec $0 recurse

##############################################################################
###### BEGIN UNUSED ######
##############################################################################
# Obviously all below crap never gets reached
# But just in case...
exit 1 ; return 1 ; while true ; do sleep 1 ; done

# Compositing manager
xcompmgr &

# Your favourite mouse cursor
xsetroot -cursor_name right_ptr

# Your own fonts-dir
xset +fp "/home/grencez/.fonts"

# Start an xterm
xterm -geometry 72x34+100+40 -fn *-fixed-*-*-*-20-*

# Set dvorak keymap
# (NOW use xmodmap)
setxkbmap -layout us -variant dvp -option compose:102 -option keypad:atm -option numpad:sg -option kpdl:semi

# Use xbacklight for brightness
# (NOW use BIOS + brightness keys)
xbacklight = 50

