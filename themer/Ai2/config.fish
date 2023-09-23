if status is-interactive
    # Commands to run in interactive sessions can go here
end

# fish config
set fish_greeting

alias python='python3'

# Powerline
set PYTHON_SITE_PATH (python3 -c "import site; print(site.getsitepackages()[0])")
source "$PYTHON_SITE_PATH/powerline/bindings/fish/powerline-setup.fish"
powerline-setup

function fish_vi_cursor
end

# some colors
set fish_color_autosuggestion e9cb9e
set fish_color_comment        331a2a
set fish_color_command        e9cb9e --bold
set fish_color_valid_path     e9cb9e --bold
set fish_color_error          e3c896 --bold
set fish_color_param          d1bbcf

# Some important exports
set -gx TERM xterm-256color
set -gx EDITOR vim

set -gx DEVKITPRO /opt/devkitpro
set -gx DEVKITARM /opt/devkitpro/devkitARM

# some alias

alias g++='g++-13 -std=c++23 -O2 -static -w'

alias Update='brew update; and brew upgrade'
alias Install='brew install'
alias Search='brew search'
alias Remove='brew remove'

alias π='pdfpc'

alias Pb='python3 setup.py build'
alias Pi='sudo python3 setup.py install'

alias σ='sudo systemctl restart tor'

alias タ='youtube-dl -x --audio-format mp3 --audio-quality 0'
alias た='θ -o "%(playlist_index)s - %(title)s.%(ext)s"'

alias :q='exit'

alias cal='cal -m'

alias mpi='sudo openconnect sslvpn.mpi-klsb.mpg.de'

alias calc='ipython'

eval "$(/opt/homebrew/bin/brew shellenv)"

export LANG="ja_JP.UTF8"