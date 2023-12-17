#!/bin/bash

echo "Starting debian_bookworm_updates.sh"

# Update the APT repos and then install all available updates
sudo apt update && sudo apt upgrade -y

# Install all snap updates
sudo snap refresh

echo "Finished running debian_bookworm_updates.sh"
