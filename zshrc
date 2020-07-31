export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"

CASE_SENSITIVE="true"

ZSH_THEME="powerlevel9k/powerlevel9k"
eval `dircolors ~/.solarized/dircolors.ansi-dark`

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
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)

POWERLEVEL9K_MODE='awesome-fontconfig'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
# export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# User Binaries
export PATH="$HOME/.local/bin:$PATH"

# Go (Golang)
export GOROOT="/usr/local/share/go"
export GOBIN="$GOROOT/bin"
export GOPATH="$HOME/.go"
export PATH="$GOBIN:$GOPATH/bin:$PATH"

# Java
export JAVAHOME="/usr/local/share/jre"
export PATH="$JAVAHOME/bin:$PATH"

# Composer (PHP)
export PATH="$HOME/.config/composer/vendor/bin:$HOME/.composer/vendor/bin:$PATH"

# BitTorrent Trackers
export TRACKERS="tr=udp://tracker.openbittorrent.com:80&tr=udp://tracker.opentrackr.org:1337/announce&tr=udp://zer0day.ch:1337/announce&tr=udp://tracker.coppersurfer.tk:6969/announce&tr=udp://tracker.coppersurfer.tk:6969&tr=udp://9.rarbg.to:2710/announce&tr=udp://9.rarbg.me:2710/announce&tr=udp://explodie.org:6969/announce&tr=udp://p4p.arenabg.ch:1337/announce&tr=udp://tracker.piratepublic.com:1337/announce&tr=udp://eddie4.nl:6969/announce&tr=udp://tracker.leechers-paradise.org:6969/announce&tr=udp://tracker.sktorrent.net:6969/announce&tr=udp://tracker.aletorrenty.pl:2710/announce&tr=udp://tracker.trackerfix.com:80/announce&tr=udp://tracker.zer0day.to:1337/announce&tr=udp://tracker.leechers-paradise.org:6969/announce&tr=udp://coppersurfer.tk:6969/announce&tr=udp://tracker.internetwarriors.net:1337/announce"

# Aliases
alias ls="ls --color=auto -shF"
# alias lr="ls --color=auto -shR"
# alias ll="ls --color=auto -shl"
# alias la="ls --color=auto -shFA"
# alias l="ls -CF"
alias htmltopdf="rasterize.js"
alias htmltojpeg="rasterize.js"
alias htmltopng="rasterize.js"
alias download_music="youtube-dl -x --embed-thumbnail --add-metadata --audio-format mp3 -o '%(title)s.%(ext)s' --exec 'ffmpeg -i {} -c copy -metadata comment= -metadata description= -metadata purl= tmp.mp3 && mv -f tmp.mp3 {}'"
alias download_file="aria2c -j 16 -s 16 -x 16 -k 1M -c"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

# Functions
lscwd () {
	if [ -z "$1" ]; then
		DIR="."
	else
		DIR="$1"
	fi

	find "$DIR" -maxdepth 1 ! -name "." -printf "" -exec du -sh {} \; 2>/dev/null
}

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

# VIM to NVIM
alias vim="nvim"
