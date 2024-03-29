# fish config
set fish_greeting

# Promptline
#function fish_prompt
#  env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.shell_prompt.sh left
#end

function us_exit
    while true
        σ; sleep 1; set loc (curl -s ipinfo.io/country)
        echo $loc
        if [ $loc = "US" ]
            break
        end
    end
end

# Powerline
set PYTHON_SITE_PATH (python -c "import site; print(site.getsitepackages()[0])")
source "$PYTHON_SITE_PATH/powerline/bindings/fish/powerline-setup.fish"
powerline-setup

function fish_vi_cursor
end

# some colors
set fish_color_autosuggestion ae2d53
set fish_color_comment        6c91d4
set fish_color_command        d56f96 --bold
set fish_color_valid_path     ae2d53 --bold
set fish_color_error          ffffff --bold
set fish_color_param          ffffff

# Some important exports
set -gx TERM xterm-256color
set -gx EDITOR vim

set -gx DEVKITPRO /opt/devkitpro
set -gx DEVKITARM /opt/devkitpro/devkitARM

# some alias

alias g++='g++ -std=c++11 -O2 -static -w'

alias Update='aurman -Syu --noconfirm'
alias Install='sudo pacman -S'
alias Search='sudo pacman -Ss'
alias Remove='sudo pacman -Rns'
alias Clean='sudo pacman -Scc'

alias AurUpdate='aurman -Syu --devel'
alias AurSearch='aurman -Ss'
alias AurInstall='aurman -S'

alias rand='echo "srand(time());rand(); exit" | calc | tail -n 1'

alias π='pdfpc'

alias Pb='python setup.py build'
alias Pi='sudo python setup.py install'
alias Pu='twine upload dist/*'

alias σ='sudo systemctl restart tor'

alias θ='youtube-dl -x --audio-format mp3 --audio-quality 0'
alias θp='θ -o "%(playlist_index)s - %(title)s.%(ext)s"'

alias εε='sudo systemctl enable'
alias δδ='sudo systemctl disable'
alias ρ='sudo systemctl restart'
alias ε='sudo systemctl start'
alias δ='sudo systemctl stop'

alias mosml='rlwrap mosml'

alias debug='adb forward tcp:4444 localabstract:/adb-hub; adb connect localhost:4444'

alias :q='exit'

alias cal='cal -m'

alias 暦='cal -m'
alias お掃除='sudo pacman -Scc'
alias 更新='aurman -Syu --devel'
alias 切るが良い='killall telegram-deskto thunderbird Discord'

alias uni='sudo openconnect asa1.uni-saarland.de'
alias mpi='sudo openconnect sslvpn.mpi-klsb.mpg.de'
alias vpn='sudo openconnect uswdc1-ovpn-udp.pointtoserver.com'

alias calc='ipython'