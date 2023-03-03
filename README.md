# AutoTesting-Script
This is an auto testing script using bash.

This Bash script is designed to create an automated testing process for a directory named "Class" containing the work of "N" students in sub-directories named "students first and last names and student ID". Each sub-directory contains shell scripts named lab_1, lab_2, lab_3, lab_4, and so on.

The purpose of the script is to execute each lab script and compare the output with expected output. The script will use at least 3 test cases to determine the correctness of each script and calculate the score of each student based on the given rubric.

**Directory Structure**

The directory structure for this project should be as follows:

Class/

├── student1_first-last_studentID/

│   ├── lab_1


│   ├── lab_2

│   ├── lab_3

│   ├── lab_4

│   └── ...

├── student2_first-last_studentID/

│   ├── lab_1

│   ├── lab_2

│   ├── lab_3

│   ├── lab_4

│   └── ...

├── ...

└── studentN_first-last_studentID/

├── lab_1

├── lab_2

├── lab_3

├── lab_4

└── ...

**Usage**

To use the script, run the following command:

bash autotest.sh

The script will execute each lab script and compare the output with expected output. The script will use at least 3 test cases to determine the correctness of each script and calculate the score of each student based on the given rubric.

The script will output the scores obtained for each lab in a file named "scores.txt". This file records the scores beside the student's first name, last name, and student ID.

**Test Cases**

Each test case has three fields: input (if needed), expected output, and the result of the test. The result is an average score for that lab based on the given rubric and 3 test cases.

**Rubric**

The rubric for grading the labs is as follows:

-100% for a correct output
- 50% for partially correct work (that is not a 100% correct output but a program getting executed without errors)
- 25% for attempting, and the code runs into a syntax error or times out due to an infinite loop.
- 0% if a lab file is not found.
The examiner has the option to halt the script and inspect a lab file, and then return to continue with auto-testing.

**Conclusion**

The autotest-script using Bash is a useful tool for grading student labs. The script will execute each lab script and compare the output with expected output using at least 3 test cases. The script will calculate the score of each student based on the given rubric and output the scores to a file. This tool will save time and effort for examiners in grading labs and provide objective and fair grading for students.
