#!/usr/bin/bash
# .bashrc
#--------------------------------------------------------------------
# Modify Bash behavior
#--------------------------------------------------------------------
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b ~/.dir_colors`"
fi

#--------------------------------------------------------------------
# User specific global variables
#--------------------------------------------------------------------
# For directory control and cleaning
JUNK_FILES="*~ *.pyc *.fig.bak *.blg *.end *.dvi *.aux *.bbl *.log *.toc *.nav *.out *.snm *.o "
DUMMY_FILES="aa bb cc dd ee ff gg hh ii jj kk ll mm nn oo pp qq rr ss tt uu vv ww xx yy zz"

#--------------------------------------------------------------------
# User specific aliases
#--------------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#--------------------------------------------------------------------
# User specific settings
#--------------------------------------------------------------------
set b off
shopt -s extglob

#Set vim as your default editor in terminal
# export EDITOR="vi"
# set -o vi
# Set nano as the default editor
export EDITOR="nano"

#--------------------------------------------------------------------
# Colors from http://systhread.net/texts/200703bashish.php
#--------------------------------------------------------------------
DULL=0
BRIGHT=1

FG_BLACK=30
FG_RED=31
FG_GREEN=32
FG_YELLOW=33
FG_BLUE=34
FG_VIOLET=35
FG_CYAN=36
FG_WHITE=37
FG_NULL=00
FG_DEFAULT=39

BG_BLACK=40
BG_RED=41
BG_GREEN=42
BG_YELLOW=43
BG_BLUE=44
BG_VIOLET=45
BG_CYAN=46
BG_WHITE=47
BG_NULL=00
BG_DEFAULT=49

# ANSI Escape Commands
ESC="\033"
NORMAL="\[$ESC[m\]"
#RESET="\[$ESC[${DULL};${FG_DEFAULT};${BG_DEFAULT}m\]"
RESET="\[$ESC[0m\]"

# Shortcuts for Colored Text ( Bright and FG Only )
# DULL TEXT
BLACK="\[$ESC[${DULL};${FG_BLACK}m\]"
RED="\[$ESC[${DULL};${FG_RED}m\]"
GREEN="\[$ESC[${DULL};${FG_GREEN}m\]"
YELLOW="\[$ESC[${DULL};${FG_YELLOW}m\]"
BLUE="\[$ESC[${DULL};${FG_BLUE}m\]"
VIOLET="\[$ESC[${DULL};${FG_VIOLET}m\]"
CYAN="\[$ESC[${DULL};${FG_CYAN}m\]"
WHITE="\[$ESC[${DULL};${FG_WHITE}m\]"

# BRIGHT TEXT
BRIGHT_BLACK="\[$ESC[${BRIGHT};${FG_BLACK}m\]"
BRIGHT_RED="\[$ESC[${BRIGHT};${FG_RED}m\]"
BRIGHT_GREEN="\[$ESC[${BRIGHT};${FG_GREEN}m\]"
BRIGHT_YELLOW="\[$ESC[${BRIGHT};${FG_YELLOW}m\]"
BRIGHT_BLUE="\[$ESC[${BRIGHT};${FG_BLUE}m\]"
BRIGHT_VIOLET="\[$ESC[${BRIGHT};${FG_VIOLET}m\]"
BRIGHT_CYAN="\[$ESC[${BRIGHT};${FG_CYAN}m\]"
BRIGHT_WHITE="\[$ESC[${BRIGHT};${BG_WHITE}m\]"

# REV TEXT (as an example)
REV_CYAN="\[$ESC[${DULL};${BG_WHITE};${BG_CYAN}m\]"
REV_RED="\[$ESC[${DULL};${FG_YELLOW}; ${BG_RED}m\]"

PROMPT_COMMAND='export ERR=$?'

# Nick's crazy shell
if [ "$PS1" ]; then
    if [[ $UID -eq 0 ]]; then
      PS1="$BRIGHT_RED\u@\h:\w$RESET\n$BRIGHT_GREEN#$RESET "
    else
      PS1="$BRIGHT_CYAN\u@\h:\w$RESET\n$BRIGHT_GREEN\$$RESET "
      #PS1="\[$cyan\]\u@\h:\w\\[$norm\]\n\\[$bright\]\\$ " # broken prompt-color test thing
    fi
    #export PROMPT_COMMAND="echo -n \[\$(date +%H:%M:%S)\]"

    # change the terminal window title
    set_term_title() {
        echo -en "\033]0;$1\a"
    }
    set_term_title_info() {
        set_term_title "$USER@$(uname -n):${PWD/#$HOME/~}"
    }
    timestamp() {
        echo -n "$(date +[%H:%M:%S])"
    }

    # from http://superuser.com/a/175802
    preexec () {
        echo -en "\e]0;$USER@$(uname -n):${PWD/#$HOME/~} - $1\007"
    }
    preexec_invoke_exec () {
        [ -n "$COMP_LINE" ] && return  # do nothing if completing
        [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return # don't cause a preexec for $PROMPT_COMMAND
        local this_command=`history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g"`;
        preexec "$this_command"
    }

    # if not in an xterm, don't try to set the terminal title (prints garbage)
    if [ "$TERM" = "xterm" ]; then
        trap 'preexec_invoke_exec' DEBUG
        export PROMPT_COMMAND="timestamp; set_term_title_info"
    else
        export PROMPT_COMMAND="timestamp"
    fi
fi

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# start in the usual folder of interest
cd /vagrant
