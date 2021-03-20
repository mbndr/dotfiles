# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon # Disable ctrl-s and ctrl-q
shopt -s autocd # Auto cd if only dir given


# Aliases
alias p="sudo pacman"
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -lah"
alias tree="tree -a -C -I '.git'"
alias nv="nvim"
alias mkd="mkdir -pv"
alias mixer="ncpamixer"

# misc vars
DWMHOME="$HOME/.local/share/src/dwm"
STHOME="$HOME/.local/share/src/st"

export PATH=$PATH:~/.scripts:~/.local/bin
export PAGER="most"

# Prompt
export PROMPT_COMMAND=_prompt
_prompt() {
	local ec=$?
	local codepart=""
	if [ $ec -ne 0 ]; then
		codepart="\[\e[0;31m\][${ec}]\[\e[0m\] "
	fi
	PS1="${codepart}[\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;36m\]\H\[\e[0m\]] \[\e[0;33m\]\W\[\e[0m\] $ "
}

# Load shortcuts
if [ -f ~/.bash_shortcuts ]; then
    source ~/.bash_shortcuts
fi

# Load custom bash config file
if [ -f ~/.bash_custom ]; then
    source ~/.bash_custom
fi

