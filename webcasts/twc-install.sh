#!/bin/bash

# Install all bash scripts for creating webcasts to the user's bin directory.

# Create directory for local binaries in user home if it doesn't exist
mkdir -p ~/bin/

# Copy all shell scripts (excluding this install script)
ls -1 | grep -v 'twc-install' | while read filename
	do cp ${filename} ~/bin/
done

# Add ~/bin/ to PATH variable (via .profile) if not already included
if [[ $PATH != *"$HOME/bin"* ]];
  then 
    echo "Add $HOME/bin to your PATH variable (in $HOME/.profile)"
    echo "export PATH=$HOME/bin:\$PATH" >> ~/.profile
    echo "You need to open a new terminal for the changes to take effect..."
fi

echo "Installing twc scripts to $HOME/bin/ was successful."
