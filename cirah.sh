#!/bin/bash

log_file="audit.log"

# Function to display ASCII art banner
show_banner() {
    if command -v figlet &> /dev/null; then
        figlet "C I R A H"
    else
        echo "C I R A H"
        echo "Figlet is not installed. Install it for a better banner."
    fi
}

# Function to colorize text
colorize() {
    echo -e "\e[1;36m$1\e[0m"  # Cyan color
}

# Function to log messages
log_message() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> "$log_file"
}

# Display the ASCII art banner
show_banner

# Display developer details
echo
echo "$(colorize 'Developed by: Aafaq Ahmad Mir')"
echo "$(colorize 'GitHub: github.com/miraafaq')"
echo "$(colorize 'Website: https://miraafaq.in')"

# Log developer details
log_message "Script started by Aafaq Ahmad Mir"
log_message "GitHub: github.com/miraafaq"
log_message "Website: https://miraafaq.in"

# Display a welcome message
echo "$(colorize 'Welcome to File Organizer')"
echo "$(colorize '==============================')"
log_message "Displayed welcome message"

# Ask for extensions
read -p "$(colorize 'Enter the extensions separated by spaces (e.g., txt pdf): ')" extensions
log_message "User entered extensions: $extensions"

# Ask for target directory
read -p "$(colorize 'Enter the target directory name (will be created if not exists): ')" target_dir_name
log_message "User entered target directory name: $target_dir_name"

# Determine the target directory path
target_dir="./$target_dir_name"

# Create target directory if it doesn't exist
if mkdir -p "$target_dir"; then
    log_message "Target directory created: $target_dir"
else
    log_message "Failed to create target directory: $target_dir"
    echo "$(colorize 'Error: Failed to create target directory.')"
    exit 1
fi

# Move files with the specified extensions from current directory only
for extension in $extensions; do
    files=$(find . -maxdepth 1 -type f -name "*.$extension")
    if [ -n "$files" ]; then
        echo "$(colorize "Organizing files with .$extension extension...")"
        if mv $files "$target_dir"; then
            log_message "Files with .$extension extension moved to $target_dir"
            echo "$(colorize "Files with .$extension extension have been moved to $target_dir")"
        else
            log_message "Failed to move files with .$extension extension to $target_dir"
            echo "$(colorize "Error: Failed to move files with .$extension extension.")"
        fi
    else
        echo "$(colorize "No files found with .$extension extension in the current directory.")"
        log_message "No files found with .$extension extension in the current directory"
    fi
done

# Log the end of the script
log_message "Script ended"

# Exit the script
exit 0
