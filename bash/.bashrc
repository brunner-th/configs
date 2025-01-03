# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias grep="grep --color=auto"
alias matlab="sh  //usr/local/MATLAB/R2023a/bin/matlab"
alias paraview="~/Dev/Paraview/paraview_build/bin/paraview"
alias zotero="sh ~/Dev/Zotero/Zotero_linux-x86_64/zotero"
alias cfs="./Dev/openCFS/cfs/build/bin/cfs"

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.



if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/thomas/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/thomas/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/thomas/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/thomas/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export PATH="/usr/bin:$PATH"

alias flexi='/home/thomas/Dev/flexi/flexi/build/bin/flexi'
alias hopr='/home/thomas/Dev/hopr/hopr/build/bin/hopr'
alias posti_visu='/home/thomas/Dev/flexi/flexi/build/bin/posti_visu'
export PATH=$PATH:/home/thomas/Dev/flexi/flexi/build/bin
alias posti_preparerecordpoints='/home/thomas/Dev/flexi/flexi/build/bin/posti_preparerecordpoints'

export KMT_MGLET_ROOT="/home/thomas/Dev/mglet/mglet-8.8"
alias mglet_docu="/home/thomas/Dev/mglet/mglet-8.8/python/bin/python /home/thomas/Dev/mglet/mglet-8.8/python/bin/mgletGuide.py"
alias gmsh="/home/thomas/Dev/gmsh/gmsh-3.0.5-Linux64/gmsh-3.0.5-Linux/bin/gmsh"
alias gittree="git log --oneline --graph --decorate --all"

# eval "$(fzf --bash)"

export FZF_DEFAULT_COMMAND="find . -maxdepth 6"


fcd() {
  local target
  target=$(find ~ \( -type d -o -type f \) 2>/dev/null | fzf) || return 1
  if [ -d "$target" ]; then
    # If it's a directory, change into it
    cd "$target" || return 1
  else
    # If it's a file, change into its parent directory
    cd "$(dirname "$target")" || return 1
  fi
}


fcode() {
  local target
  target=$(find ~ \( -type d -o -type f \) 2>/dev/null | fzf) || return 1
  if [ -d "$target" ]; then
    # Open the directory in a new VS Code window
    code --new-window "$target" || return 1
  else
    # Open the file's directory and the file in a new VS Code window
    code --new-window "$(dirname "$target")" || return 1
    code "$target" || return 1
  fi
}



fh() {
  local cmd
  cmd=$(history | tac | fzf | sed 's/^[ ]*[0-9]*[ ]*//') || return 1
  read -p "Execute: $cmd? (y/n) " confirm
  if [[ $confirm == [Yy]* ]]; then
    eval "$cmd"
  fi
}


fnvim() {
  local target
  target=$(find ~ \(-type f \) 2>/dev/null | fzf) || return 1

    # Open the file's directory and the file in a new VS Code window

  nvim "$target" || return 1

}


