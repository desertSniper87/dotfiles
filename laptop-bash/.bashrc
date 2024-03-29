# if [ -f /etc/os-release ]; then
#     # freedesktop.org and systemd
#     . /etc/os-release
#     OS=$NAME
#     VER=$VERSION_ID
# elif type lsb_release >/dev/null 2>&1; then
#     # linuxbase.org
#     OS=$(lsb_release -si)
#     VER=$(lsb_release -sr)
# elif [ -f /etc/lsb-release ]; then
#     # For some versions of Debian/Ubuntu without lsb_release command
#     . /etc/lsb-release
#     OS=$DISTRIB_ID
#     VER=$DISTRIB_RELEASE
# elif [ -f /etc/debian_version ]; then
#     # Older Debian/Ubuntu/etc.
#     OS=Debian
#     VER=$(cat /etc/debian_version)
# elif [ -f /etc/SuSe-release ]; then
#     # Older SuSE/etc.
#     ...
# elif [ -f /etc/redhat-release ]; then
#     # Older Red Hat, CentOS, etc.
#     ...
# else
#     # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
#     OS=$(uname -s)
#     VER=$(uname -r)
# ficase $- in
#     *i*) ;;
#       *) return;;
# esac

HISTCONTROL=ignoredups:erasedups

shopt -s histappend

HISTSIZE=100000
HISTFILESIZE=100000

PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

TERM=xterm-256color

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

# N = show line numbers
#export LESS='-N'

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

export PATH="$PATH:/home/torsho/bin"
export PATH="$PATH:/home/torsho/depot_tools"
export PATH="$PATH:/usr/lib/go-1.14/bin"
export PATH="$PATH:/home/torsho/go/bin"
export PATH="$PATH:/home/torsho/dotfiles/scripts"
export PATH="$PATH:/home/torsho/kafka_2.11-2.4.1/bin"
<<<<<<<< HEAD:bash/.bashrc
========
export PATH="$PATH:/home/torsho/dotfiles/git-custom-scripts"
export PATH="$(yarn global bin):$PATH" 
export PATH="$PATH:/home/torsho/spring-1.2.0.M2/bin" 
export PATH=${PATH}:${JAVA_HOME}/bin

# Android SDK
export ANDROID_HOME="~/Android/Sdk"
export ANDROID_SDK_ROOT="~/Android/Sdk"

export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
>>>>>>>> origin/master:laptop-bash/.bashrc

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tailf='tail -f'

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

GOPATH="/home/torsho/go"
# UBUNTU: source /usr/share/autojump/autojump.sh
source /etc/profile.d/autojump.sh # FEDORA
function gi() { curl -sL https://www.gitignore.io/api/$@ ;}
alias mocp='python3 /home/torsho/mocp-scrobbler.py -d ; mocp'

# if [ -n "$DESKTOP_SESSION" ];then
#     eval $(gnome-keyring-daemon --start)
#     export SSH_AUTH_SOCK
# fi

eval "$(direnv hook bash)"
<<<<<<<< HEAD:bash/.bashrc

========
SPRING_HOME="/home/torsho/spring-1.2.0.M2"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export VISUAL=nvim;
export EDITOR=nvim;

# microk8s aliases

# alias kubectl='microk8s kubectl'
alias kubectl='minikube kubectl --'
>>>>>>>> origin/master:laptop-bash/.bashrc
