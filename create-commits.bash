#!/bin/bash
# This script adds filenames to currently checked out branch and creates a commit message of the format - "<number-of-commit> - <branch-name> - <filename>"
# 1st argument should be - [ Current Number of Commit + 1 ]
# 2nd argument should be - [ branch name ]
# 3rd argument onwards should be - [ filenames without .txt extension ]
# Files are created with contents in the format - "<filename> - <branch-name> - <number-of-commit-to-be-made>" ex: [ f11 - source - 12 ]
# Sample Input : 12 source f11 f21 f31 f41 => f11.txt f21.txt f32.txt f41.txt will be created in the current branch [source] with each commit starting from commit no 12

# To extract 1st and 2nd arguments, we shift the arguments array and collect arguments in required variables

# Assign 1st 2 arguments to variables
commit_number=$1;
branch_name=$2;

shift 2; # 1st 2 arguments which are not filenames are shifted-removed from the args array

echo "$commit_number -- $branch_name";

#Iterate over filenames in args array
for filename in "$@"
do
	echo "CommitNumber: $commit_number - BranchName: $branch_name - Filename: $filename" > "$filename".txt;
	echo $(git add $filename.txt);
	echo $(git commit -m "CommitNumber: $commit_number - BranchName: $branch_name - Filename: $filename");
        commit_number=$((commit_number+1));
done 
