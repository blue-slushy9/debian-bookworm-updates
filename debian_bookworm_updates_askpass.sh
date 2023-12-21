#!/bin/bash

# echo -e allows for interpretation of the \n character, echo -n suppresses
# the default newline character at the end of the line;
echo -en "\nEnter your password: "

# read -s means silent mode, the characters are accepted by the terminal
# without producing any output;
read -s password

export PASSWD="$password"

echo -e "\n\nThank you, your password has been received.\n"

# Exit askpass script and return to main script;
#exit 0
