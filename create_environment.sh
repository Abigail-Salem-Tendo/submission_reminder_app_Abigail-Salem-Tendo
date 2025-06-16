#!/usr/bin/env bash
#This script creates the environment for the app

#Prompting the user to enter their name
read -p "Enter your name: " usr_name

#Create the folder with the user's name; this will be the parent directory
folder="submission_reminder_$usr_name"

#Creating the parent directory and subdirectories
mkdir -p $folder/app
mkdir -p $folder/modules
mkdir -p $folder/assets
mkdir -p $folder/config

#Copying the files that were downloades into the respective subdirectories
cp /home/abbysalem/reminder.sh $folder/app
cp /home/abbysalem/functions.sh $folder/modules
cp /home/abbysalem/submissions.txt $folder/assets
cp /home/abbysalem/config.env $folder/config

#Creating a script to start the app

cat <<EOF > $folder/startup.sh
#!/bin/bash
source ./config/config.env
source ./modules/functions.sh
bash ./app/reminder.sh
EOF

#making all .sh file in folder executable
chmod +x $folder/*.sh
