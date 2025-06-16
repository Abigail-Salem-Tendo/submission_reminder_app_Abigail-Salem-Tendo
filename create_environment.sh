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

#Populating the modules directory with the function.sh file
cat <<EOF > "$main_dir/modules/functions.sh"
#!/bin/bash


# Function to read submissions file and output students who have not submitted
 function check_submissions {
   local submissions_file=$1
   echo "Checking submissions in $submissions_file"

 # Skip the header and iterate through the lines
   while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)
       
        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
              echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
   done < <(tail -n +2 "$submissions_file") # Skip the header                                      
}
EOF

#Creating the config.env file in the config directory
cat <<EOF > "$main_dir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF


#Creating the submission.txt files 
cat <<EOF > "$main_dir/assets/submission.txt"
#Using the format: student, assignment, submission status
Salem, Mission Journal, submitted
Angela, Shell Basics, not submitted
Aaron, Learning Journal, not submitted
Mark, Shell Navigation, submitted
Favour, Mathematics, submitted
EOF

#Creating the startup.sh file
cat <<EOF > "$main_dir/startup.sh"
#!/bin/bash
#using source
source ./app/reminder.sh
source ./config/config.env
source ./modules/functions.sh
EOF


#Making all the .sh files executable
find "$main_dir" -type f -name "*.sh" -exec chmod +x {} \;
