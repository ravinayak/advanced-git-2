#!/bin/bash
# This script adds filenames to currently checked out branch and creates a commit message of the format - "<number-of-commit> - <branch-name> - <filename>"
# 1st argument should be - [ Current Number of Commit + 1 ]
# 2nd argument should be - [ branch name ]
# 3rd argument should be - [true/false]. if true, then, files are created with - "commit number, branch-name, filename; added to index; and committed" in same branch. If false, then, 
# 				         files are created with "branch-name, filename" but not added to index, or committed. They are left untracked in repository
# 4th argument onwards should be - [ filenames without .txt extension ]
# Files are created with contents in the format - "<filename> - <branch-name> - <number-of-commit-to-be-made>" ex: [ f11 - source - 12 ]

# Sample Input 1: 12 source true f11 f21 f31 f41 => f11.txt f21.txt f31.txt f41.txt will be created in the current branch [source] with each commit starting from commit no 12
# Sample Input 2: 12 source false f11 f21 f31 f41 => f11.txt f21.txt f31.txt f41.txt will be created in the current branch [source] but no file will be added to staging area

# To extract 1st and 2nd arguments, we shift the arguments array and collect arguments in required variables

# Assign 1st 3 arguments to variables
commit_number=$1;
branch_name=$2;
commit_or_create=$3;
shift 3; # 1st 3 arguments which are not filenames are shifted-removed from the args array

# Print a message about whether files are going to be created and committed OR just committed to branch
if [[ "$commit_or_create" == true ]]
	then
		echo "Files are about to be created and committed :: $commit_number -- $branch_name";
	else
		echo "Files are only created :: $branch_name";
fi

# Iterate over filenames in args array and make a choice depending upon commit_or_create boolean
for filename in "$@"
do
	if [[ "$commit_or_create" == true ]]
	then
		echo "CommitNumber: $commit_number - BranchName: $branch_name - Filename: $filename" > "$filename".txt;
		echo $(git add $filename.txt);
		echo $(git commit -m "CommitNumber: $commit_number - BranchName: $branch_name - Filename: $filename");
        	commit_number=$((commit_number+1));
	else
		echo "BranchName: $branch_name - Filename: $filename" > "$filename".txt;
	fi
done 
