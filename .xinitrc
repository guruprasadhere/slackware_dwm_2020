#!/bin/sh

# Apply Xresource settings
xrdb -merge ~/.Xresources	   

# Set LED backlight
xbacklight -set 5

# Correction for Java applications
wmname LG3D &

# Zsh setting
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=/hom/guru/.cache/zsh/history
export HISTFILE
export HISTSIZE
export SAVEHIST
export PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# nnn file manager setting
export NNN_OPENER=xdg-open
export NNN_OPENER=gvfs-open
export NNN_BMS="h:/home/guru;t:/home/guru/Research/Thesis;r:/home/guru/Research/Latex/DAC-8;d:/home/guru/Downloads;m:/mnt/DATA"
export NNN_COLORS="6542"
export EDITOR='vim'
export NNN_TRASH=1 

# XDG directory set-up
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks


# Script for monitoring and displaying battery, volume and time information
while true; do
	BAT=$(cat /sys/class/power_supply/BAT0/capacity)
     	CHR=$(cat /sys/class/power_supply/BAT0/status)
     	LOW_BATTERY="10"
     	HIGH_BATTERY="95"
	
	if [ "$CHR" = "Discharging" ] 
	then
		CHR1="Down"
        if [ "$BAT" -lt "$LOW_BATTERY" ]; then
		notify-send   "Battery is low !!"
        fi 
else
	CHR1="Up"
	if [ "$BAT" -gt "$HIGH_BATTERY" ]; then
		notify-send   "Battery is full !!"
        fi
fi
CLK=$( date +'%I:%M')
VOL=$( amixer get Master | tail -1 | awk '{ print $5}' | tr -d '[]' )
xsetroot -name "|$VOL |$BAT%($CHR1) |$CLK "  
# Turn off monitor if screen is idle for 
xset dpms 300 400 500; 
sleep 1
done &

# Desktop background
xsetroot -solid '#5D0F0D'
#xsetroot -solid teal
#xsetroot -bitmap /usr/include/X11/bitmaps/l-linux.xbm

# Other window managers
#exec twm
#exec spectrwm

# Run dwm 
if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
exec ck-launch-session /usr/local/bin/dwm
else
  exec /usr/local/bin/dwm
fi
