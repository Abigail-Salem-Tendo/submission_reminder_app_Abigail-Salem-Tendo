#!/usr/bin/env bash
#Asking the user to enter their assignment name 
echo "Enter the name of your new assignment: "
read new_assignment

#Update the config.env file with the new assignment
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=${new_assignment}/" ./config/config.env

#Running the script startup.sh again
source ./startup.sh
