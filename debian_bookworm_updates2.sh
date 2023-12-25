#!/bin/bash

passwd_prompt() {
    local password

    # read -s means silent mode, the characters are accepted by the terminal
    # without producing any output; -p allows for a prompt; password is the
    # variable that will store what the user types in;
    read -s -p "Please enter your password: " password
   
    #export PASSWD="$password"

    echo "Thank you, your password has been received."
    
    echo "This is within the func: $password"

    echo "$password"
}

#export SUDO_ASKPASS=passwd_prompt

#export -f passwd_prompt

#export SUDO_ASKPASS="$0"

#passwd=$(sudo -A true)

passwd=$(passwd_prompt)

echo "This is outside of func: $passwd"

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



##########


echo "Starting debian_bookworm_updates.sh"

# Update the APT repos and then install all available updates
echo "$password" | sudo -S apt update 

echo "$password" | sudo -S apt upgrade -y

# Install all snap updates
echo "$password" | sudo -S snap refresh

echo "Finished running debian_bookworm_updates.sh"

COMMENT
