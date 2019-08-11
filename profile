# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user"s private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user"s private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# Go (Golang)
export GOROOT="/usr/local/go"
export GOBIN="$GOROOT/bin"
export GOPATH="$HOME/go"
export PATH="$GOBIN:$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Composer (PHP)
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Node.js (JavaScript)
export NODEPATH="/usr/local/node"
export PATH="$NODEPATH/bin:$PATH"

# Aliases
alias ls="ls --color=auto -shF"
alias lr="ls --color=auto -shR"
alias ll="ls --color=auto -shl"
alias la="ls --color=auto -shFA"
alias l="ls -CF"
alias htmltopdf="rasterize.js"
alias htmltojpeg="rasterize.js"
alias htmltopng="rasterize.js"
alias ssh="dbclient"
