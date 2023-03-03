#!/bin/bash


for student_dir in */; do
    # Get student's first name, last name and ID from the directory name
    first_name=$(echo $student_dir | cut -d' ' -f1)
    last_name=$(echo $student_dir | cut -d' ' -f2)
    student_id=$(echo $student_dir | cut -d' ' -f3)

    # Loop through lab scripts in the student's directory
    for lab_script in $student_dir/*.sh; do
        # Extract lab number from the script name
        lab_number=$(echo $lab_script | sed 's/.*lab_\([0-9]\+\)\.sh/\1/')

        # Initialize variables for score calculation
        total_score=0
        num_tests=0

        # Loop through 3 test cases for each lab
        for i in {1..3}; do
            # Get test case input, expected output and result
            input=$(cat $student_dir/lab${lab_number}_test${i}_in.txt)
            expected_output=$(cat $student_dir/lab${lab_number}_test${i}_out.txt)
            result=$(timeout 5s sh $lab_script <<<"$input")

            # Compare expected output with actual output
            if [[ "$result" -eq "$expected_output" ]]; then
                score=100
            elif [[ "$result" -eq *"syntax error"* ]]; then
                score=25
            elif [[ "$result" -eq *"timed out"* ]]; then
                score=25
            elif [[ ! -f $lab_script ]]; then
                score=0
            else
                score=50
            fi

            # Add score to total score
            total_score=$((total_score + score))
            num_tests=$((num_tests + 1))
        done

        # Calculate average score for the lab
        if [[ $num_tests -eq 0 ]]; then
            average_score=0
        else
            average_score=$((total_score / num_tests))
        fi

        # Output score to a file
        echo "$first_name $last_name $student_id lab$lab_number $average_score%" >> scores.txt
    done
done


