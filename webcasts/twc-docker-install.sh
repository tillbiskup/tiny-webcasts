#!/bin/bash

# Name of the executable
targetFile=dtwc

# Create directory for local binaries in user home if it doesn't exist
mkdir -p ~/bin/

# Copy executable to local bin dir
cp ../docker/run.sh ~/bin/${targetFile}

# Build docker
cd ../docker/
./build.sh

# Add ~/bin/ to PATH variable (via .profile) if not already included
if [[ $PATH != *"$HOME/bin"* ]];
  then 
    echo "Add $HOME/bin to your PATH variable (in $HOME/.profile)"
    echo "export PATH=$HOME/bin:\$PATH" >> ~/.profile
    echo "You need to open a new terminal for the changes to take effect..."
fi

echo ""
echo "Installing '${targetFile}' script to $HOME/bin/ was successful."
echo "You may now create tiny webcasts by calling '${targetFile}' from anyhwere."