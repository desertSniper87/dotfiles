set -gx PATH /home/torsho/.gem/ruby/2.4.0/bin $PATH
set -gx PATH /home/torsho/bin $PATH

eval (thefuck --alias | tr '
' ';')

set EDITOR /usr/bin/vim

source /etc/profile.d/autojump.fish
