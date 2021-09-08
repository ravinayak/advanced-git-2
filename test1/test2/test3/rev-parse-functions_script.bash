#!/bin/bash

# This script demonstrates how we can work inside any directory in working tree and still be able to execute commands from top level. *rev-parse* has many methods which can be used to # shell scripts for GIT. It can be very useful when we are doing a demo to team mates or showing work to others. We no longer have to write a bunch of commands live, we can have it all# inside a shell script, and simply run the shell script

echo "Arguments :: $@";

# Get the prefix which represents the current directory in working tree relative to the project root
prefix=$(git rev-parse --show-prefix);
echo "Prefix :: $prefix";

# Get the project root - absolute path of top level
top_level=$(git rev-parse --show-toplevel);
echo "Top Level - Project Root :: $top_level";

# Change directory to go to top level from current directory in working tree
cd $top_level;

# set -- $@ : This sets positional parameters to same value as that of arguments. We use *eval* function to execute code in script, so positional parameters can have the value of
# arguments that we can use at later stages in script. We use --sq to quote the output properly, and -- for set function
eval "set $(git rev-parse --sq --prefix $prefix -- $@)";

echo "Positional Parameters after being set :: $1 -- $2";

echo "Demonstrate working of prefix :: $(git rev-parse --prefix 'level1/level2/' -- 'file.txt')";
