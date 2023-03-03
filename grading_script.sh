#!/bin/bash

# Get input file name from user
echo "Enter input file name (CSV format): "
read input_file

# Check if input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: File not found!"
  exit 1
fi

# Create output file name
output_file="${input_file%.*}_graded.csv"

# Loop through each line in input file and calculate grade
while IFS=',' read -r first_name last_name student_id score; do

  # Calculate grade based on score
  if [ "$score" -ge 90 ]; then
    grade='A+'
    borderline=90
  elif [ "$score" -ge 80 ]; then
    grade='A'
    borderline=80
  elif [ "$score" -ge 75 ]; then
    grade='B+'
    borderline=75
  elif [ "$score" -ge 70 ]; then
    grade='B'
    borderline=70
  elif [ "$score" -ge 65 ]; then
    grade='C+'
    borderline=65
  elif [ "$score" -ge 60 ]; then
    grade='C'
    borderline=60
  elif [ "$score" -ge 55 ]; then
    grade='D+'
    borderline=55
  elif [ "$score" -ge 50 ]; then
    grade='D'
    borderline=50
  else
    grade='F'
    borderline=0
  fi

  # Append grade and borderline score to the line
  echo "$first_name,$last_name,$student_id,$score,$grade,$borderline" >> $output_file

done < "$input_file"

echo "Grading complete. Output file: $output_file"

