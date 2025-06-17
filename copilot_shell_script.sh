#!/usr/bin/env bash
#Asking the user to enter the name of the directory
echo "Enter your name (used when creating your environment): "
read usr_name
app_dir="submission_reminder_$usr_name"
#Checking if the directory exists
if [ ! -d "$app_dir" ]; then
	echo "Error: $app_dir does not exit"
	exit 1
fi

#Asking the user to enter their assignment name
echo "Enter the name of your new assignment: "
read new_assignment

#Update the config.env file with the new assignment
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=${new_assignment}/" ./$main_dir/config/config.env

#Running the script startup.sh again
source ./startup.sh
