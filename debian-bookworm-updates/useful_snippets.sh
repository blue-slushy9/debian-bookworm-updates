#!/bin/bash

# Function to prompt for the sudo password
prompt_for_password() {
    echo -en "\nEnter your password: "
    read -s password
    echo -e "\n\nThank you, your password has been received.\n"
    echo "$password"  # Print the password to be captured by the caller
}

# Set the SUDO_ASKPASS environment variable to point to the askpass function
export SUDO_ASKPASS=prompt_for_password

# Run the askpass script and store the password in a variable
password=$(sudo -A true)  # "sudo -A true" is a dummy command to trigger askpass

# Use the stored password in subsequent sudo commands
echo "$password" | sudo -S ./debian_bookworm_updates.sh

# Rest of your main script...
echo "Main script continues..."

######

: << 'COMMENT'

#!/bin/bash

# Function to capture the password without displaying it
capture_password() {
    local password
    password=$(source ./debian_bookworm_updates_askpass.sh)
    echo "$password"
}

# Call the function to capture the password
password=$(capture_password)

# Now, you can use the $password variable without echoing it
echo "Captured password: $password"

# Continue with the rest of your main script...
echo "Starting debian_bookworm_updates.sh"

#######

COMMENT
