#!/bin/bash

# Function to display ASCII art banner

# Function to display ASCII art banner
show_banner() {
 
 figlet C I R A H

}
# Function to colorize text
colorize() {
    echo -e "\e[1;36m$1\e[0m"  # Cyan color
}
# Display developer details
echo
echo "$(colorize 'Developed by: Aafaq Ahmad Mir')"
echo "$(colorize 'GitHub: github.com/miraafaq')"
echo "$(colorize 'Website: https://miraafaq.in')"

# Function to colorize text
colorize() {
    echo -e "\e[1;36m$1\e[0m"  # Cyan color
}

# Display the ASCII art banner
show_banner

# Display a welcome message
echo "$(colorize 'Welcome to File Organizer')"
echo "$(colorize '==============================')"

# Ask for extension
read -p "$(colorize 'Enter the extension (e.g., txt, pdf): ')" extension

# Ask for target directory
read -p "$(colorize 'Enter the target directory name (will be created if not exists): ')" target_dir_name

# Determine the target directory path
target_dir="./$target_dir_name"

# Create target directory if it doesn't exist
mkdir -p "$target_dir"

# Move files with the specified extension from current directory only
files=$(find . -maxdepth 1 -type f -name "*.$extension")
if [ -n "$files" ]; then
    echo "$(colorize 'Organizing files with .$extension extension...')"
    mv $files "$target_dir"
    echo "$(colorize "Files with .$extension extension have been moved to $target_dir")"
else
    echo "$(colorize "No files found with .$extension extension in the current directory.")"
fi

# Exit the script
exit 0
