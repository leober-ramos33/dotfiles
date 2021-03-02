export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"

CASE_SENSITIVE="true"

export ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(
	git
	command-not-found
)

source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

POWERLEVEL9K_BATTERY_STAGES=('\u2581 ' '\u2582 ' '\u2583 ' '\u2584 ' '\u2585 ' '\u2586 ' '\u2587 ' '\u2588 ')

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir nvm vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time battery)

POWERLEVEL9K_MODE='awesome-fontconfig'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# Go (Golang)
export GOROOT="/usr/local/share/go"
export GOBIN="$GOROOT/bin"
export GOPATH="$HOME/.go"
export PATH="$GOBIN:$GOPATH/bin:$PATH"

# Composer (PHP)
export PATH="$HOME/.config/composer/vendor/bin:$HOME/.composer/vendor/bin:$PATH"

# Aliases
alias ls="ls --color=auto -shF"
alias lr="ls --color=auto -shR"
alias ll="ls --color=auto -shl"
alias la="ls --color=auto -shFA"
alias l="ls -CF"
# alias htmltopdf="rasterize.js"
# alias htmltojpeg="rasterize.js"
# alias htmltopng="rasterize.js"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias livereload="browser-sync start -s -f . --no-notify --host localhost --port 8080"

# Functions
# lscwd () {
# 	if [ -z "$1" ]; then
# 		DIR="."
# 	else
# 		DIR="$1"
# 	fi
#
# 	find "$DIR" -maxdepth 1 ! -name "." -printf "" -exec du -sh {} \; 2>/dev/null
# }
#
# txt2pdf () {
# 	if [ -z "$1" ]; then
# 		echo "A file is required."
# 		exit 1
# 	fi
#
# 	filename=$(basename -s .txt $1)
# 	vim $1 -c "hardcopy > $filename.ps | q"
# 	ps2pdf "$filename.ps"
# 	rm -f "$filename.ps"
# }

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
