#!/usr/bin/env bash

#Asking the user to enter the name of the directory
read -p "Enter your name (used when creating your environment): " usr_name

#Storing the name of the directory in a variable
app_dir="submission_reminder_$usr_name"

#Checking if the directory with the username exists
if [ ! -d "$app_dir" ]; then
	echo "Error: $app_dir does not exist. First run the create_environment.sh script."
	exit 1
fi

#Asking the user to enter their assignment name
read -p "Enter the name of the assignment: " assignment

#checking to see if the user, and assignment already exist in the submissions.txt file
if ! grep -q "^$usr_name, $assignment" "$app_dir/assets/submissions.txt"; then

	#Adding the user's new assignment to the submissions.txt file if it does not exist yet
	echo "$usr_name, $assignment, not submitted" >> "$app_dir/assets/submissions.txt"
fi

#Asking the user to enter the number of days remaining to complete the assignment
read -p "Enter the number of days remaining to submit your assignment: " remaining_days


#Storing the location of the config file in a variable
config_file="$app_dir/config/config.env"

#Update the config.env file with the new assignment and days remaining to submit the assignment
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
