#Zsh setup
autoload -U colors && colors
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
setopt CORRECT

#Prompt setup
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
#History setup
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

#Decoration
figlet Guru-Rekha
#neofetch
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks


#Aliases
alias rm='rm -i'
alias hm='cd /home/guru'
alias re='cd /home/guru/Research'
alias dac='cd /home/guru/Research/Latex/DAC-8'
alias th='cd /home/guru/Research/Thesis/Report'
alias ls='ls --color=auto'
alias ne=neofetch
alias bm=bashmount
alias off=poweroff
