#!/usr/bin/env bash

#Asking the user to enter the name of the directory
echo "Enter your name (used when creating your environment): "
read usr_name

#Storing the name of the directory in a variable
app_dir="submission_reminder_$usr_name"

#Checking if the directory with the username exists
if [ ! -d "$app_dir" ]; then
	echo "Error: $app_dir does not exist. First run the create_environment.sh script."
	exit 1
fi

#Asking the user to enter their assignment name
echo "Enter the name of your new assignment: "
read assignment

#Asking the user to enter the number of days remaining to complete the new assignment
echo "Enter the number of days remaining to submit your assignment"
read remaining_days
#Storing the location of the config file in a variable
config_file="$app_dir/config/config.env"

#Update the config.env file with the new assignment
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"${assignment}\"/" "$config_file"
sed -i "s/^DAYS_REMAINING=.*/DAYS_REMAINING=${remaining_days}/" "$config_file"

#Giving feedback to the user
echo "Assignment: $assignment"
echo "Adding reminders..."
echo "------------------------"

#Storing the location of the startup.sh script in a variable
startup_script="$app_dir/startup.sh"

#Running the script startup.sh
bash "$startup_script"
