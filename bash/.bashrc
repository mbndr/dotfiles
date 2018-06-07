# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias tree='tree -a -C -I ".git"'

export PATH=$PATH:~/.scripts
export PAGER="most"

# Prompt
export PROMPT_COMMAND=_prompt
_prompt() {
	local ec=$?
	local code=""
	if [ $ec -ne 0 ]; then
		code="\[\e[0;31m\][${ec}]\[\e[0m\] "
	fi
	PS1="${code}\[\e[0;32m\]\W\[\e[0m\] $ "
}

# Load ustom bash config file
if [ -f ~/.bash_custom ]; then
    source ~/.bash_custom
fi