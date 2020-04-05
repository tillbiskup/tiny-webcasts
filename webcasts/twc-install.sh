#!/bin/bash

# Create and install bash script for creating webcasts to the user's bin directory.
targetFile=twc

# Create directory for local binaries in user home if it doesn't exist
mkdir -p ~/bin/

# Generate awk calling function
cd functions
./generate-combine-user-chaptermetadata-times-awk-function.sh > combine-user-chaptermetadata-times.sh
cd ../

# Create bash script containing all functions contained in .sh files
# excluding those with "awk" in their filename
(echo '#!/bin/bash'; cat `ls functions/*sh | grep -v 'awk'` | grep -v '^#!/bin/bash'; grep -v '^#!/bin/bash' twc.sh) > ${targetFile}
chmod +x ${targetFile}

mv ${targetFile} ~/bin/

# Add ~/bin/ to PATH variable (via .profile) if not already included
if [[ $PATH != *"$HOME/bin"* ]];
  then 
    echo "Add $HOME/bin to your PATH variable (in $HOME/.profile)"
    echo "export PATH=$HOME/bin:\$PATH" >> ~/.profile
    echo "You need to open a new terminal for the changes to take effect..."
fi

echo "Installing '${targetFile}' script to $HOME/bin/ was successful."
echo "You may now create tiny webcasts by calling '${targetFile}' from anyhwere."