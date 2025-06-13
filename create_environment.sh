#!/usr/bin/env bash
#This script creates the environment for the app

#Prompting the user to enter their name
read -p "Enter your name: " usr_name

#Create the folder with the user's name
folder="submission_reminder_$usr_name"

#Creating the main directory and subdirectories
mkdir -p $folder/app
mkdir -p $folder/modules
mkdir -p $folder/assets
mkdir -p $folder/config

cp /home/abbysalem/reminder.sh $folder/app
cp /home/abbysalem/functions.sh $folder/modules
cp /home/abbysalem/submissions.txt $folder/assets
cp /home/abbysalem/config.env $folder/config
