#!/bin/bash

# ~/moi/GitHub/bash/debian_bookworm_updates/debian_bookworm_updates.sh

# Just a little message that will print to the terminal, for clarity;
echo -e "\n\nNow starting debian_bookworm_updates.sh....\n"

# Since this service runs as root, we do not need to use sudo;
# "apt update" updates our configured APT repos;
apt update

# "apt upgrade" will install all available updates for our installed APT
# packages, the -y option skips most of the ensuing prompts;
apt upgrade -y

# Checks for updates on all installed snap packages and then installs them if
# there are any; please note that snap packages are designed to auto-refresh
# in the background, however this command was added to the script for good
# measure;
snap refresh

# Just a final confirmation message; 
echo -e "\nFinished running debian_bookworm_updates.sh, system is now up to date!"
