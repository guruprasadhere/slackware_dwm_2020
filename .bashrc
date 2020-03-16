#PS1="\u\w\\$ "
#export PS1="\[$(tput bold)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;1m\]:\[$(tput sgr0)\]\[\033[38;5;83m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \\$\[$(tput sgr0)\]"
#export PS1="\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32;40m\]\w\[\e[m\]:\[\e[34m\]-\[\e[m\]\[\e[34m\]>\[\e[m\]"
if [[ -z "$DISPLAY" ]]
then
    DISPLAY=":0"
    export DISPLAY
fi
alias bm='bashmount'
export NNN_OPENER=xdg-open
export NNN_OPENER=gvfs-open
export NNN_BMS="h:/home/guru;t:/home/guru/RESEARCH/THESIS;r:/home/guru/RESEARCH/THESIS/Report;d:/home/guru/DOWNLOADS;m:/mnt/DATA"
export NNN_CONTEXT_COLORS="2138"
export EDITOR='leafpad'
export VISUAL='leafpad'

