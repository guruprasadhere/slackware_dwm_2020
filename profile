# /etc/profile: This file contains system-wide defaults used by
# all Bourne (and related) shells.

# Set the values for some environment variables:
export MINICOM="-c on"
export MANPATH=/usr/local/man:/usr/man
export HOSTNAME="`cat /etc/HOSTNAME`"
export LESSOPEN="|lesspipe.sh %s"
export LESS="-M"
export PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# If the user doesn't have a .inputrc, use the one in /etc.
if [ ! -r "$HOME/.inputrc" ]; then
  export INPUTRC=/etc/inputrc
fi

# Set the default system $PATH:
PATH="/usr/local/bin:/usr/bin:/bin:/usr/games:/home/guru/.vim/bundle/vim-live-latex-preview/bin:/bin/bash"

# For root users, ensure that /usr/local/sbin, /usr/sbin, and /sbin are in
# the $PATH.  Some means of connection don't add these by default (sshd comes
# to mind).
if [ "`id -u`" = "0" ]; then
  echo $PATH | grep /usr/local/sbin 1> /dev/null 2> /dev/null
  if [ ! $? = 0 ]; then
    PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH
  fi
fi

# I had problems with the backspace key using 'eval tset' instead of 'TERM=',
# but you might want to try it anyway instead of the section below it.  I
# think with the right /etc/termcap it would work.
# eval `tset -sQ "$TERM"`

# Set TERM to linux for unknown type or unset variable:
if [ "$TERM" = "" -o "$TERM" = "unknown" ]; then
 TERM=linux
fi

# Set ksh93 visual editing mode:
if [ "$SHELL" = "/bin/ksh" ]; then
  VISUAL=emacs
#  VISUAL=gmacs
#  VISUAL=vi
fi

# Set a default shell prompt:
#PS1='`hostname`:`pwd`# '
if [ "$SHELL" = "/bin/pdksh" ]; then
 PS1="\u\w\\$ "
elif [ "$SHELL" = "/bin/ksh" ]; then
 PS1="\u\w\\$ "
elif [ "$SHELL" = "/bin/zsh" ]; then
 PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
elif [ "$SHELL" = "/bin/ash" ]; then
 PS1="\u\w\\$ "
else
 PS1="\u\w\\$ "
fi
PS2='> '
export PATH DISPLAY LESS TERM PS1 PS2

# Default umask.  A umask of 022 prevents new files from being created group
# and world writable.
umask 022

# Notify user of incoming mail.  This can be overridden in the user's
# local startup file (~/.bash.login or whatever, depending on the shell)
if [ -x /usr/bin/biff ]; then
 biff y 2> /dev/null
fi

# Append any additional sh scripts found in /etc/profile.d/:
for profile_script in /etc/profile.d/*.sh ; do
  if [ -x $profile_script ]; then
    . $profile_script
  fi
done
unset profile_script

OPUSHOME=/usr/local
export OPUSHOME

PATH=$PATH:$OPUSHOME/bin
export PATH

export NNN_OPENER=xdg-open
export NNN_OPENER=gvfs-open

#export NNN_BMS='m:/home/guru/BOOKS;t:/home/guru/RESEARCH/THESIS;r:/home/guru/RESEARCH/THESIS/Report'
#export NNN_CONTEXT_COLORS="2136"
