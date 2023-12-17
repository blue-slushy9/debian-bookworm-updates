#!/bin/bash

password=$(./debian_bookworm_updates_askpass.sh)

echo "Starting debian_bookworm_updates.sh"

# Update the APT repos and then install all available updates
sudo /usr/bin/apt update && sudo /usr/bin/apt upgrade -y

# Install all snap updates
sudo usr/bin/snap refresh

echo "Finished running debian_bookworm_updates.sh"
