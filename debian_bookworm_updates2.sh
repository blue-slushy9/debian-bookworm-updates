#!/bin/bash

# This function will be used to capture the password per user input without
# producing any output in the terminal, so that the password remains secret
# and secure;
passwd_prompt() {
    # Declare password as a local variable within this function, we will later
    # echo it out to the rest of the script;
    local password

    # read -s means silent mode, the characters are accepted by the terminal
    # without producing any output, which we want for security reasons; 
    # -p allows for a prompt; 
    # password is the variable that will store what the user types in;
    read -s -p "Please enter your password: " password
   
    # The echo command seems to cause the function to temporarily exit, 
    # ergo I could only include one echo command at the end of the function;
    echo "$password"
}

# Call our function and then assign the output, which is our password, to the
# new variable, passwd---not to be confused with the local variable within the
# function, password;
passwd=$(passwd_prompt)

# Just a little message that will print to the terminal, for clarity;
echo -e "\n\nPassword successfully captured, now starting debian_bookworm_updates.sh....\n"

# echo pipes our captures password to sudo -S, an option that allows for the
# sudo password to be provided through a pipe or input redirection;
# apt update will update the APT repos;
echo "$passwd" | sudo -S apt update 

# upgrade -y will install available updates for installed packages, without
# prompting for user approval, this helps automate the update process;
echo "$passwd" | sudo -S apt upgrade -y

# Checks for updates on all installed snap packages and then installs them if
# there are any; please note that snap packages are designed to auto-refresh
# in the background, however this command was added to the script for good
# measure;
echo "$passwd" | sudo -S snap refresh

# Just a final confirmation message for clarity;
echo -e "\nFinished running debian_bookworm_updates.sh, system is now up to date!"

