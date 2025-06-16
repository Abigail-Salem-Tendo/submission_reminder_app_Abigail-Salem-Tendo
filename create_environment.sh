#!/usr/bin/env bash
#This script creates the environment for the app

#Prompting the user to enter their name
read -p "Enter your name: " usr_name

#Create the folder with the user's name; this will be the parent directory
main_dir="submission_reminder_$usr_name"

#Creating the parent directory and subdirectories
mkdir -p "$main_dir/app"
mkdir -p "$main_dir/modules"
mkdir -p "$main_dir/assets"
mkdir -p "$main_dir/config"

#Now populating the app directory with reminder.sh script
cat <<EOF > "$main_dir/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF



