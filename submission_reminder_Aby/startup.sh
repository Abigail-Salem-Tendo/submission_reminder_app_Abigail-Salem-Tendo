#!/bin/bash
#changing to the parent directory
script_dir="$(dirname "$0")"
#Navigateing to that directory
cd "$script_dir"
source ./config/config.env
source ./modules/functions.sh
bash ./app/reminder.sh
