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

# Locations for PATH
locations=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/miniconda3/bin"
    "$HOME/conda3/bin"
    "$HOME/rvm/bin"
    "$HOME/rvm/scripts/rvm"
    "$HOME/.awscliv2/binaries"
)

# Add locations to PATH
for location in "${locations[@]}"; do
	if [[ -d $location && ! $PATH =~ (^|:)$location(:|$) ]]; then
		PATH="$location:$PATH"
	fi
done

# Load Cargo for Rust if it existss
if [ -d "$HOME/.cargo" ] ; then
     . "$HOME/.cargo/env"
fi
