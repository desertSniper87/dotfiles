bindkey -v
bindkey '^R' history-incremental-search-backward

export EDITOR=nvim
export VISUAL=nvim
bindkey -e 

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="/Users/bccca/.local/bin:$PATH"
eval "$(rbenv init - zsh)"
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
export M2_HOME=/opt/maven
export PATH=$M2_HOME/bin:$PATH

# for intel x86_64 brew
alias axbrew='arch -x86_64 /usr/local/homebrew/bin/brew'

eval "$(atuin init zsh --disable-up-arrow)"

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.1/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)
