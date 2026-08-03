#!/bin/bash

# Now try to Implimante read and Date 

# Ask user for course start date
echo "Enter course start date (YYYY-MM-DD):"
read -r start_date

# Duration in days (3 months ≈ 90 days)
duration_days=90

# Calculate end date using 'date' command
end_date=$(date -d "$start_date +$duration_days days" +"%Y-%m-%d")

# Print schedule
echo "-----------------------------------"
echo "📚 Course Schedule"
echo "Start Date : $start_date"
echo "End Date   : $end_date"
echo "Timings    : 4:00 PM to 7:00 PM"
echo "Daily Duration : 3 hours"
echo "Total Duration : 3 months (~$duration_days days)"
echo "-----------------------------------"
