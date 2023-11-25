[[ $(command -v nvim) ]] && alias vi='nvim' || alias vi='vim'
[[ $(command -v nvim) ]] && alias vim='nvim'
[[ $(command -v htop) ]] && alias top='htop' # nicer top
[[ $(command -v btop) ]] && alias top='btop' # even nicer top
alias octave='octave --no-gui' # start GNU Octave REPL on command line
alias dmesg='dmesg | tail --follow' # see what's happening
alias rx='pkill X' # restart X
alias stu='sudo service lightdm start' # start lightdm
alias sudo='sudo '
alias z='zathura'

# history
alias h='history'
alias hf='h | grep '

# t the todo script
alias t='python ~/bin/t/t.py --task-dir ~/tasks --list todo.txt --delete-if-empty' 

# package management laziness
source /etc/os-release
if [[ "$ID_LIKE" = "debian" || "$ID" = "debian" ]]; then
    if [[ $(command -v nala) ]]; then
	alias up2='[[ $(command -v snap) ]] && sudo snap refresh ; sudo nala upgrade'
	function get {
	    if [[ -n $(command -v snap) ]]; then
		if sudo snap install "$1" --candidate; then
		    return 0
		fi
	    fi
	    sudo nala install --no-install-recommends "$1"
	}
	alias hld='sudo nala-mark hold'
	alias sar='sudo nala remove'
	alias unhld='sudo nala-mark unhold'
	alias sauce='sudo nala update && sudo nala dist-upgrade && sudo nala-get autoremove'
	alias sai='sudo nala install'
	alias nalas='nala search'
	alias rget='sudo nala install --reinstall --no-install-recommends'
    else
	alias up2='[[ $(command -v snap) ]] && sudo snap refresh ; sudo apt update && sudo apt dist-upgrade --no-install-recommends && sudo apt-get autoremove'
	function get {
	    if [[ -n $(command -v snap) ]]; then
		if sudo snap install "$1" --candidate; then
		    return 0
		fi
	    fi
	    sudo apt install --no-install-recommends "$1"
	}
	alias hld='sudo apt-mark hold'
	alias sar='sudo apt remove'
	alias unhld='sudo apt-mark unhold'
	alias sauce='sudo apt update && sudo apt dist-upgrade && sudo apt-get autoremove'
	alias sai='sudo apt install'
	alias apts='apt search'
	alias rget='sudo apt install --reinstall --no-install-recommends'
    fi
fi

if [[ "$ID_LIKE" =~ "rhel" ]]; then
    if [[ $(command -v dnf) ]]; then
	alias up2='sudo dnf update && sudo dnf clean all'
	alias get='sudo dnf install'
	alias dnfs='dnf search'
    else
	alias up2='sudo yum update && sudo yum clean all'
	alias get='sudo yum install'
	alias yums='yum search'
    fi
fi

alias pipup="pip list --format=json --outdated | jq -r '.[] | .name+\"==\"+.latest_version' | xargs pip install -U --upgrade"

# Terraform and Ansible
alias tf=terraform

# remote access the Pi
alias rpi='ssh raspberrypi'
alias rpix='rpi -X'
alias vpi='vncviewer raspberrypi:1'

# git
alias gi='git init'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias gh='git log --pretty=oneline --graph --abbrev-commit --stat'

# get_iplayer laziness
alias iplayr='get_iplayer --refresh'
alias iplays='iplayr | grep'
alias iplayg='get_iplayer --get'

# make a directory and enter it function
function dmc() { mkdir -p $1 ; cd  $1 ; }

# make and run
function mnr() { make $1 && ./$1; }

# rerun as root
alias pls='sudo $(history -p \!\!)'

# open Pokemon Blue in VisualBoyAdvance
alias vbablue='vba -F2 ~/ROMs/Pokemon_Blue.zip'
alias vms='vboxmanage startvm '

# start ranger file manager
alias r='ranger'

# clean things up
alias bb='bleachbit -c $(bleachbit -l)'
alias sbb='sudo bleachbit -c $(bleachbit -l)'

# virtual Ubuntu server
alias startog='VBoxHeadless -s together &'
alias tog='tmux a -t together || tmux new -s together ssh together'

# virtual CentOS server
alias stap='VBoxHeadless -s apollo &'
alias apo='tmux a -t apollo || tmux new -s apollo ssh apollo'

# adjust brightness via command line
display=$(xrandr -q | grep "primary" | awk '{ print $1 }')
alias bright='xrandr --output $display --brightness '

# learning stuff
function learn () {
    subject=${@};
    path=$(echo "$HOME/learning/*$subject" | sed 's/\ /\*\/\*/g; s/$/*/g' );
    subject=$(echo $subject | sed 's/\ //g');
    echo "$subject";
    echo "$path";
    tmux a -t ${subject} || tmux new -s ${subject} -c ${path};
}

# create or list tmux sessions
function tmx {
    ((!$#)) && tmux ls && return
    [[ $# -eq 1 ]] && tmux attach-session -t $1 || tmux new-session -s $1 -c $2 $3
}

# Kill and restart Firefox 
function fin () {
    for p in $(pidof $1)
    do
	kill $p
    done
    nohup $1 &
}

# Save startx log into file in home directory
alias startx='startx > $HOME/startx.log 2>&1'

