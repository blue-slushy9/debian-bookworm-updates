#!/bin/bash

source ./debian_bookworm_updates_askpass.sh

password=$(source ./debian_bookworm_updates_askpass.sh)

echo "$password"

echo "Starting debian_bookworm_updates.sh"

# Update the APT repos and then install all available updates
echo "$password" | sudo -S apt update 

echo "$password" | sudo -S apt upgrade -y

# Install all snap updates
echo "$password" | sudo -S snap refresh

echo "Finished running debian_bookworm_updates.sh"
