# # ~/.profile: executed by the command interpreter for login shells.
# # This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# # exists.
# # see /usr/share/doc/bash/examples/startup-files for examples.
# # the files are located in the bash-doc package.
#
# # the default umask is set in /etc/profile; for setting the umask
# # for ssh logins, install and configure the libpam-umask package.
# #umask 022
#
# # if running bash
# if [ -n "$BASH_VERSION" ]; then
#     # include .bashrc if it exists
#     if [ -f "$HOME/.bashrc" ]; then
# 			. "$HOME/.bashrc"
#     fi
# fi
#
# # set PATH so it includes user"s private bin if it exists
# if [ -d "$HOME/bin" ] ; then
#     PATH="$HOME/bin:$PATH"
# fi
#
# # set PATH so it includes user"s private bin if it exists
# if [ -d "$HOME/.local/bin" ] ; then
#     PATH="$HOME/.local/bin:$PATH"
# fi
#
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# export TERM=xterm-256color
# export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
#
# # User Binaries
# export PATH="$HOME/.local/bin:$PATH"
#
# # Go (Golang)
# export GOROOT="/usr/local/share/go"
# export GOBIN="$GOROOT/bin"
# export GOPATH="$HOME/.go"
# export PATH="$GOBIN:$GOPATH/bin:$PATH"
#
# # Composer (PHP)
# export PATH="$HOME/.config/composer/vendor/bin:$HOME/.composer/vendor/bin:$PATH"
#
# # Java
# export JAVA_HOME="/usr/local/share/java"
# export PATH="$JAVA_HOME/bin:$PATH"
#
# # BitTorrent Trackers
# export TRACKERS="tr=udp://tracker.openbittorrent.com:80&tr=udp://tracker.opentrackr.org:1337/announce&tr=udp://zer0day.ch:1337/announce&tr=udp://tracker.coppersurfer.tk:6969/announce&tr=udp://tracker.coppersurfer.tk:6969&tr=udp://9.rarbg.to:2710/announce&tr=udp://9.rarbg.me:2710/announce&tr=udp://explodie.org:6969/announce&tr=udp://p4p.arenabg.ch:1337/announce&tr=udp://tracker.piratepublic.com:1337/announce&tr=udp://eddie4.nl:6969/announce&tr=udp://tracker.leechers-paradise.org:6969/announce&tr=udp://tracker.sktorrent.net:6969/announce&tr=udp://tracker.aletorrenty.pl:2710/announce&tr=udp://tracker.trackerfix.com:80/announce&tr=udp://tracker.zer0day.to:1337/announce&tr=udp://tracker.leechers-paradise.org:6969/announce&tr=udp://coppersurfer.tk:6969/announce"
#
# # Aliases
# alias ls="ls --color=auto -shF"
# alias lr="ls --color=auto -shR"
# alias ll="ls --color=auto -shl"
# alias la="ls --color=auto -shFA"
# alias l="ls -CF"
# alias htmltopdf="rasterize.js"
# alias htmltojpeg="rasterize.js"
# alias htmltopng="rasterize.js"
# alias download_music="youtube-dl -x --embed-thumbnail --add-metadata --audio-format mp3 -o '%(title)s.%(ext)s' --exec 'ffmpeg -i {} -c copy -metadata comment= -metadata description= -metadata purl= tmp.mp3 && mv -f tmp.mp3 {}'"

export SHELL=/usr/bin/zsh
if [ -n "$ZSH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.zshrc" ]; then
			. "$HOME/.zshrc"
    fi
fi
