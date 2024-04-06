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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Load Cargo for Rust if it existss
if [ -d "$HOME/.cargo" ] ; then
     . "$HOME/.cargo/env"
fi
     
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -d "$HOME/rvm/bin" ] ; then
    PATH="$PATH:$HOME/rvm/bin"
fi

# Load RVM into a shell session *as a function*
if [ -s "$HOME/rvm/scripts/rvm" ] ; then
    . "$HOME/rvm/scripts/rvm"
fi

# Add AWS CLI binaries to PATH if in aws CLI is in home
if [ -x ~/.awscliv2/binaries/aws ] ; then
    PATH=$PATH:~/.awscliv2/binaries
fi
