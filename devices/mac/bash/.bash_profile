HISTCONTROL=ignoredups:erasedups

shopt -s histappend

HISTSIZE=100000
HISTFILESIZE=100000

PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

shopt -s checkwinsize

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tailf='tail -f'
alias vim='nvim'
alias alacritty='/Applications/Alacritty.app/Contents/MacOS/alacritty'
alias bruno='/Applications/Bruno.app/Contents/MacOS/Bruno'
alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'

export M3_HOME=/opt/maven
export PATH="/opt/homebrew/bin:/bin:/usr/bin:/usr/local/bin:/Users/bccca/.local/bin$PATH"
export PATH=$M3_HOME/bin:$PATH
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

export VISUAL=nvim;
export EDITOR=nvim;

for FILE in ~/bashrc/*; do
    source $FILE
done

if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
    source "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh"
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

# for intel x86_64 brew
alias axbrew='arch -x86_64 /usr/local/homebrew/bin/brew'

# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(atuin init bash --disable-up-arrow)"
eval "$(/opt/homebrew/bin/brew shellenv)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Created by `pipx` on 2024-03-18 06:29:06
export PATH="$PATH:/Users/bccca/.local/bin"
