#!/bin/bash

# Get the absolute base path (2 levels up from this file)
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Source the config and functions
source "$script_dir/config/config.env"
source "$script_dir/modules/functions.sh"

 Set the path to submissions file
submissions_file="$script_dir/assets/submissions.txt"

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "$submissions_file"

