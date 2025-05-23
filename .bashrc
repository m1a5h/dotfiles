# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# PS4='+ $(date "+%s.%N")\011 '
# exec 3>&2 2>/tmp/bashstart.$$.log
# set -x

# Cow says a quote as you open the terminal
if [[ -x /usr/games/fortune ]]; then
    fortune -a | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)
fi

if [[ -x /usr/bin/fortune ]]; then
    fortune -a | cowsay -f $(ls /usr/share/cowsay/ | shuf -n1)
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

source /etc/os-release

if [[ "$ID_LIKE" = "debian" || "$ID" = "debian" ]]; then
    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
fi

if [[ "$ID_LIKE" =~ "rhel" ]]; then
    if [ "$color_prompt" = yes ]; then
        PS1='\[\e[m\][\[\e[m\]\[\e[35m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[m\]]\[\e[m\]\$ '
    else
        PS1='[\u@\h:\w]\$ '
    fi
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
    *)
	;;
esac

# add tab completion to sudo
complete -cf sudo

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# for using git
source ~/.git-completion.bash
source ~/.git-prompt.sh
alias gitt='export PS1="[\033[01;34m]\W\$(__git_ps1)$ [\033[00m] "'

export PYTHONSTARTUP=~/.pythonrc

# Set EDITOR and VISUAL variables to Emacs if it is installed and otherwise whatever vi is aliased to
[[ $(command -v emacsclient) ]] && export EDITOR="emacsclient -a vi" VISUAL="emacsclient -a vi" || export EDITOR=${BASH_ALIASES[vi]} VISUAL=${BASH_ALIASES[vi]}

# Symbolic link ~/winhome to %USERPROFILE% (C:\Users\<username>) if in WSL
[[ ! -L $HOME/winhome && $(uname -r) =~ "WSL" ]] && ln -s /mnt/c/Users/$(whoami) $HOME/winhome

# Symbolic link ~/myfiles to MyFiles on ChromeOS (/mnt/chromeos/MyFiles) in Crostini on ChromeOS
[[ ! -L $HOME/myfiles && $(uname -n) == "penguin" ]] && ln -s /mnt/chromeos/MyFiles/ $HOME/myfiles
# Symbolic link ~/gdrive to GoogleDrive on ChromeOS (/mnt/chromeos/GoogleDrive) in Crostini on ChromeOS
[[ ! -L $HOME/gdrive && $(uname -n) == "penguin" ]] && ln -s /mnt/chromeos/GoogleDrive/ $HOME/gdrive

# Encrypted tokens by GPG de-crypted and sourced when opening a new shell
# Use `gpg -c ~/.tokens` to encrypt regenerated tokens
if [[ -f $HOME/.tokens.gpg ]]; then
    gpg --quiet -d ~/.tokens.gpg > ~/.tokens
    export $(<~/.tokens)
    echo "Tokens/API keys available as environment variables: "
    cut -d"=" -f1 < ~/.tokens
    rm ~/.tokens
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# set completion for AWS if aws_completer in ~/.awscliv2/binaries
[[ $(command -v aws_completer) ]] && complete -C "$(command -v aws_completer)" aws
