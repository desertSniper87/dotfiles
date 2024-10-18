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
alias lk='ls -haltr'
alias tailf='tail -f'
alias vim='nvim'
alias alacritty='/Applications/Alacritty.app/Contents/MacOS/alacritty'
alias bruno='/Applications/Bruno.app/Contents/MacOS/Bruno'
alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'
alias google-chrome='/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
alias openssl='/usr/bin/openssl'

# === Maven Location === #
# export M3_HOME=/opt/maven
export M3_HOME=/opt/maven-3.5.4

# === JAVA_HOME === #
# export JAVA_HOME=/opt/homebrew/Cellar/openjdk/21.0.2/libexec/openjdk.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home
# export JAVA_HOME=/opt/homebrew/Cellar/openjdk@17/17.0.12/libexec/openjdk.jdk/Contents/Home

export PATH="/opt/homebrew/bin:/bin:/usr/bin:/usr/local/bin:/Users/bccca/.local/bin$PATH"
export PATH=$M3_HOME/bin:$PATH
export DENO_INSTALL="/Users/bccca/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="/usr/local/mysql-8.0.33-macos13-arm64/bin:$PATH"
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
export PATH=$PATH:"/Applications/KeyStore Explorer.app/Contents/MacOS"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/16/bin
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
[[ -f $HOME/.git-completion.bash ]] && . "$HOME/.git-completion.bash" 
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


# >>>> Vagrant command completion (start)
. /opt/vagrant/embedded/gems/gems/vagrant-2.4.1/contrib/bash/completion.sh
# <<<<  Vagrant command completion (end)
