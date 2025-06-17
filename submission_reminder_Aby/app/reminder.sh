#!/bin/bash
#Getteing a good directory
basedir=$(dirname "$0")
# Source environment variables and helper functions
source "$basedir/../config/config.env"
bash "$basedir/../modules/functions.sh"

# Path to the submissions file
submissions_file="$basedir/../assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: "
echo "Days remaining to submit:  days"
echo "--------------------------------------------"

check_submissions $submissions_file
