
#!/bin/bash

#changing to the parent directory
script_dir="$(cd "$(dirname "$0")" && pwd)"

#Navigating to the script_dir directory
cd "$script_dir"
export submissions_file="$script_dir/assets/submissions.txt"
source ./config/config.env
source ./modules/functions.sh

#Running the reminder.sh script
bash ./app/reminder.sh
