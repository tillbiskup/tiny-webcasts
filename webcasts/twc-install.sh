#!/bin/bash

# Install all bash scripts for creating webcasts to the user's bin directory.

# Create directory for local binaries in user home if it doesn't exist
mkdir -p ~/bin/

# Copy all shell scripts (excluding this install script)
ls -1 | grep -v 'twc-install' | while read filename
	do cp ${filename} ~/bin/
done
