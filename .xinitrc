#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
xbacklight -set 5
wmname LG3D &

#export PS1='$(tput bold)[$USER~$PWD:]$ $(tput sgr0)'
#export PS1='[$USER~$PWD:]$ '
HISTSIZE=10000
 SAVEHIST=10000
 HISTFILE=/hom/guru/.cache/zsh/history
export HISTFILE
export HISTSIZE
export SAVEHIST
 export PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
export NNN_OPENER=xdg-open
export NNN_OPENER=gvfs-open
export NNN_BMS="h:/home/guru;t:/home/guru/Research/Thesis;r:/home/guru/Research/Latex/DAC-8;d:/home/guru/Downloads;m:/mnt/DATA"
export NNN_COLORS="4562"
#export EDITOR='vim'
export NNN_TRASH=1 
export VISUAL='vim'
# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

/usr/bin/xdg-user-dirs-update


while true; do
   BAT=$(cat /sys/class/power_supply/BAT0/capacity)
   CHR=$(cat /sys/class/power_supply/BAT0/status)
   CLK=$( date +'%I:%M %P')
   VOL=$( amixer get Master | tail -1 | awk '{ print $5}' | tr -d '[]' )
   xsetroot -name " Vol:$VOL | Bat:$BAT% ($CHR) | $CLK"  
   sleep 1    # Update time every minute
done &

while true; do
LOW_BATTERY="10"
BATTERY_PATH="/sys/class/power_supply/BAT0/"

if [ -e "$BATTERY_PATH" ]; then
    BATTERY_ON=$(cat $BATTERY_PATH/status)

    if [ "$BATTERY_ON" = "Discharging" ]; then
        CURRENT_BATTERY=$(cat $BATTERY_PATH/capacity)

        if [ "$CURRENT_BATTERY" -lt "$LOW_BATTERY" ]; then
            notify-send   "Battery is low !!"
        fi
    fi
fi

sleep 60
done &


xsetroot -solid '#5D0F0D'
sleep 1;
xset dpms 300 400 500; sleep 1;
#exec twm
#exec spectrwm

if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
exec ck-launch-session /usr/local/bin/dwm
else
  exec /usr/local/bin/dwm
fi

#bash ~/bin/dzconky.sh
# Start herbstluftwm
#if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
 #  exec ck-launch-session dbus-launch --exit-with-session /usr/bin/spectrwm
#else
 #  exec spectrwm
#fi




