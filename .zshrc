# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/torsho/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#source /usr/share/zsh/share/antigen.zsh
source ~/antigen.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/local/lib/python3.6"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle archlinux
antigen bundle battery
antigen bundle colored-man-pages
antigen bundle virtualenv

antigen bundle popstas/zsh-command-time

#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh-history-substring-search/zsh-history-substring-search.zsh

antigen bundle zsh-autosuggestions
antigen bundle zsh-history-substring-search

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell
#antigen theme agnoster
#antigen theme amuse
#antigen theme clean
#antigen theme af-magic

source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right

#autojump source
source /usr/share/autojump/autojump.zsh


# Tell Antigen that you're done.
antigen apply
alias python=python3.6
alias pip=pip3
