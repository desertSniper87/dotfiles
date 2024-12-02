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
alias siyoek='/Applications/sioyek.app/Contents/MacOS/sioyek'

# === Maven Location === #
# export M3_HOME=/opt/maven
export M3_HOME=/opt/maven-3.5.4

# === JAVA_HOME === #
# export JAVA_HOME=/opt/homebrew/Cellar/openjdk/21.0.2/libexec/openjdk.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home
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
export PATH=${PATH}:/opt/sonar-scanner/bin

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
VAGRANT_VERSION=$(vagrant --version | awk '{print $2}')
. /opt/vagrant/embedded/gems/gems/vagrant-$VAGRANT_VERSION/contrib/bash/completion.sh
# <<<<  Vagrant command completion (end)
# Copyright 2013-2023 The Cobra Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# bash completion V2 for tailscale                            -*- shell-script -*-

__tailscale_debug()
{
if [[ -n ${BASH_COMP_DEBUG_FILE-} ]]; then
echo "$*" >> "${BASH_COMP_DEBUG_FILE}"
fi
}

# Macs have bash3 for which the bash-completion package doesn't include
# _init_completion. This is a minimal version of that function.
__tailscale_init_completion()
{
COMPREPLY=()
_get_comp_words_by_ref "$@" cur prev words cword
}

# This function calls the tailscale program to obtain the completion
# results and the directive.  It fills the 'out' and 'directive' vars.
__tailscale_get_completion_results() {
local requestComp lastParam lastChar args

# Prepare the command to request completions for the program.
# Calling ${words[0]} instead of directly tailscale allows handling aliases
args=("${words[@]:1}")
requestComp="${words[0]} completion __complete --descs=true --flags=true -- ${args[*]}"

lastParam=${words[$((${#words[@]}-1))]}
lastChar=${lastParam:$((${#lastParam}-1)):1}
__tailscale_debug "lastParam ${lastParam}, lastChar ${lastChar}"

if [[ -z ${cur} && ${lastChar} != = ]]; then
# If the last parameter is complete (there is a space following it)
# We add an extra empty parameter so we can indicate this to the go method.
__tailscale_debug "Adding extra empty parameter"
requestComp="${requestComp} ''"
fi

# When completing a flag with an = (e.g., tailscale -n=<TAB>)
# bash focuses on the part after the =, so we need to remove
# the flag part from $cur
if [[ ${cur} == -*=* ]]; then
cur="${cur#*=}"
fi

__tailscale_debug "Calling ${requestComp}"
# Use eval to handle any environment variables and such
out=$(eval "${requestComp}" 2>/dev/null)

# Extract the directive integer at the very end of the output following a colon (:)
directive=${out##*:}
# Remove the directive
out=${out%:*}
if [[ ${directive} == "${out}" ]]; then
# There is not directive specified
directive=0
fi
__tailscale_debug "The completion directive is: ${directive}"
__tailscale_debug "The completions are: ${out}"
}

__tailscale_process_completion_results() {
local shellCompDirectiveError=1
local shellCompDirectiveNoSpace=2
local shellCompDirectiveNoFileComp=4
local shellCompDirectiveFilterFileExt=8
local shellCompDirectiveFilterDirs=16
local shellCompDirectiveKeepOrder=32

if (((directive & shellCompDirectiveError) != 0)); then
# Error code.  No completion.
__tailscale_debug "Received error from custom completion go code"
return
else
if (((directive & shellCompDirectiveNoSpace) != 0)); then
	if [[ $(type -t compopt) == builtin ]]; then
		__tailscale_debug "Activating no space"
		compopt -o nospace
	else
		__tailscale_debug "No space directive not supported in this version of bash"
	fi
fi
if (((directive & shellCompDirectiveKeepOrder) != 0)); then
	if [[ $(type -t compopt) == builtin ]]; then
		# no sort isn't supported for bash less than < 4.4
		if [[ ${BASH_VERSINFO[0]} -lt 4 || ( ${BASH_VERSINFO[0]} -eq 4 && ${BASH_VERSINFO[1]} -lt 4 ) ]]; then
			__tailscale_debug "No sort directive not supported in this version of bash"
		else
			__tailscale_debug "Activating keep order"
			compopt -o nosort
		fi
	else
		__tailscale_debug "No sort directive not supported in this version of bash"
	fi
fi
if (((directive & shellCompDirectiveNoFileComp) != 0)); then
	if [[ $(type -t compopt) == builtin ]]; then
		__tailscale_debug "Activating no file completion"
		compopt +o default
	else
		__tailscale_debug "No file completion directive not supported in this version of bash"
	fi
fi
fi

# Separate activeHelp from normal completions
local completions=()
while IFS='' read -r comp; do
	completions+=("$comp")
done <<<"${out}"

if (((directive & shellCompDirectiveFilterFileExt) != 0)); then
# File extension filtering
local fullFilter filter filteringCmd

# Do not use quotes around the $completions variable or else newline
# characters will be kept.
for filter in ${completions[*]}; do
	fullFilter+="$filter|"
done

filteringCmd="_filedir $fullFilter"
__tailscale_debug "File filtering command: $filteringCmd"
$filteringCmd
elif (((directive & shellCompDirectiveFilterDirs) != 0)); then
# File completion for directories only

local subdir
subdir=${completions[0]}
if [[ -n $subdir ]]; then
	__tailscale_debug "Listing directories in $subdir"
	pushd "$subdir" >/dev/null 2>&1 && _filedir -d && popd >/dev/null 2>&1 || return
else
	__tailscale_debug "Listing directories in ."
	_filedir -d
fi
else
__tailscale_handle_completion_types
fi

__tailscale_handle_special_char "$cur" :
__tailscale_handle_special_char "$cur" =

# Print the activeHelp statements before we finish
if ((${#activeHelp[*]} != 0)); then
printf "\n";
printf "%s\n" "${activeHelp[@]}"
printf "\n"

# The prompt format is only available from bash 4.4.
# We test if it is available before using it.
if (x=${PS1@P}) 2> /dev/null; then
	printf "%s" "${PS1@P}${COMP_LINE[@]}"
else
	# Can't print the prompt.  Just print the
	# text the user had typed, it is workable enough.
	printf "%s" "${COMP_LINE[@]}"
fi
fi
}

__tailscale_handle_completion_types() {
__tailscale_debug "__tailscale_handle_completion_types: COMP_TYPE is $COMP_TYPE"

case $COMP_TYPE in
37|42)
# Type: menu-complete/menu-complete-backward and insert-completions
# If the user requested inserting one completion at a time, or all
# completions at once on the command-line we must remove the descriptions.
# https://github.com/spf13/cobra/issues/1508
local tab=$'\t' comp
while IFS='' read -r comp; do
	[[ -z $comp ]] && continue
	# Strip any description
	comp=${comp%%$tab*}
	# Only consider the completions that match
	if [[ $comp == "$cur"* ]]; then
		COMPREPLY+=("$comp")
	fi
done < <(printf "%s\n" "${completions[@]}")
;;

*)
# Type: complete (normal completion)
__tailscale_handle_standard_completion_case
;;
esac
}

__tailscale_handle_standard_completion_case() {
local tab=$'\t' comp

# Short circuit to optimize if we don't have descriptions
if [[ "${completions[*]}" != *$tab* ]]; then
IFS=$'\n' read -ra COMPREPLY -d '' < <(compgen -W "${completions[*]}" -- "$cur")
return 0
fi

local longest=0
local compline
# Look for the longest completion so that we can format things nicely
while IFS='' read -r compline; do
[[ -z $compline ]] && continue
# Strip any description before checking the length
comp=${compline%%$tab*}
# Only consider the completions that match
[[ $comp == "$cur"* ]] || continue
COMPREPLY+=("$compline")
if ((${#comp}>longest)); then
	longest=${#comp}
fi
done < <(printf "%s\n" "${completions[@]}")

# If there is a single completion left, remove the description text
if ((${#COMPREPLY[*]} == 1)); then
__tailscale_debug "COMPREPLY[0]: ${COMPREPLY[0]}"
comp="${COMPREPLY[0]%%$tab*}"
__tailscale_debug "Removed description from single completion, which is now: ${comp}"
COMPREPLY[0]=$comp
else # Format the descriptions
__tailscale_format_comp_descriptions $longest
fi
}

__tailscale_handle_special_char()
{
local comp="$1"
local char=$2
if [[ "$comp" == *${char}* && "$COMP_WORDBREAKS" == *${char}* ]]; then
local word=${comp%"${comp##*${char}}"}
local idx=${#COMPREPLY[*]}
while ((--idx >= 0)); do
	COMPREPLY[idx]=${COMPREPLY[idx]#"$word"}
done
fi
}

__tailscale_format_comp_descriptions()
{
local tab=$'\t'
local comp desc maxdesclength
local longest=$1

local i ci
for ci in ${!COMPREPLY[*]}; do
comp=${COMPREPLY[ci]}
# Properly format the description string which follows a tab character if there is one
if [[ "$comp" == *$tab* ]]; then
	__tailscale_debug "Original comp: $comp"
	desc=${comp#*$tab}
	comp=${comp%%$tab*}

	# $COLUMNS stores the current shell width.
	# Remove an extra 4 because we add 2 spaces and 2 parentheses.
	maxdesclength=$(( COLUMNS - longest - 4 ))

	# Make sure we can fit a description of at least 8 characters
	# if we are to align the descriptions.
	if ((maxdesclength > 8)); then
		# Add the proper number of spaces to align the descriptions
		for ((i = ${#comp} ; i < longest ; i++)); do
			comp+=" "
		done
	else
		# Don't pad the descriptions so we can fit more text after the completion
		maxdesclength=$(( COLUMNS - ${#comp} - 4 ))
	fi

	# If there is enough space for any description text,
	# truncate the descriptions that are too long for the shell width
	if ((maxdesclength > 0)); then
		if ((${#desc} > maxdesclength)); then
			desc=${desc:0:$(( maxdesclength - 1 ))}
			desc+="…"
		fi
		comp+="  ($desc)"
	fi
	COMPREPLY[ci]=$comp
	__tailscale_debug "Final comp: $comp"
fi
done
}

__start_tailscale()
{
local cur prev words cword split

COMPREPLY=()

# Call _init_completion from the bash-completion package
# to prepare the arguments properly
if declare -F _init_completion >/dev/null 2>&1; then
_init_completion -n =: || return
else
__tailscale_init_completion -n =: || return
fi

__tailscale_debug
__tailscale_debug "========= starting completion logic =========="
__tailscale_debug "cur is ${cur}, words[*] is ${words[*]}, #words[@] is ${#words[@]}, cword is $cword"

# The user could have moved the cursor backwards on the command-line.
# We need to trigger completion from the $cword location, so we need
# to truncate the command-line ($words) up to the $cword location.
words=("${words[@]:0:$cword+1}")
__tailscale_debug "Truncated words[*]: ${words[*]},"

local out directive
__tailscale_get_completion_results
__tailscale_process_completion_results
}

if [[ $(type -t compopt) = "builtin" ]]; then
complete -o default -F __start_tailscale tailscale
else
complete -o default -o nospace -F __start_tailscale tailscale
fi

# ex: ts=4 sw=4 et filetype=sh
. "$HOME/.cargo/env"
