****SUBMISSION REMINDER APP****

This is a Bash-based app whose purpose is to help remind students of pending assignments that have not been submitted yet.

****Features of the Submission Reminder App****

-The app contains a script  that sets up the directories and files necessary to run the application smoothly

-The app is able to automatically generate reminders used to track the assignment submissions

-The app displays reminders for assignments that have not been submitted yet

****Scripts in the Submission Reminder App****


#1. 'create_environment.sh script'

This is the script that creates the folder and all the files needed for the app to run.
This file writes the necessary files to a particular location in the directory so that the user does not have to put in anything manually unless prompted.

#2. 'copilot_shell_script.sh'

This script prompts the user to enter an assignment name and the number of days remaining.
It automatically updates the config files
It checks the submissions.txt file to see if the assignment of a user already exists and adds that assignment if it does not
It runs the reminder tool 

****How to Use the Submission Reminder App****

#1. Run the 'create_environment.sh' script and enter your name

        ./create_environment.sh
    
This will create a directory called 'submission_reminder_<YourName>'

#2. Next, run 'copilot_shell_script.sh'

        ./copilot_shell_script.sh
        
Follow the prompts to enter the name of the assignment and the number of days it is due.

The system will then display the students who have not submitted that assignment

****Description of Files in the Submission Reminder App****

(These files were created within the create_environment.sh script)

***functions.sh:***  This is a function that reads the submissions file and outputs students who have not submitted.

***reminder.sh***  This is a file that contains the main logic of the application.

***config.env***  This file holds the assignment and days_remaining variables.

***submissions.txt*** This file contains the list of students, the assignment name, and submission status.

***startup.sh***  This script launches the application and executes the reminder.sh script


****Author:****  Abigail Salem Tendo

****GitHub Username:****  @Abigail-Salem-Tendo
