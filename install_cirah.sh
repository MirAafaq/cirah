#!/bin/bash

# Name of the script to be installed
script_name="cirah.sh"
target_name="cirah"

# Directory to install the script
install_dir="/usr/local/bin"

# Check if the script exists in the current directory
if [ ! -f "$script_name" ]; then
    echo "Error: $script_name not found in the current directory."
    exit 1
fi

# Make the script executable
chmod +x "$script_name"

# Move the script to the install directory
sudo mv "$script_name" "$install_dir/$target_name"

# Verify the installation
if [ -f "$install_dir/$target_name" ]; then
    echo "Installation successful. You can now run the script using the command: $target_name"
else
    echo "Installation failed."
    exit 1
fi
