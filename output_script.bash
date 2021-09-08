# This script consumes input string which is properly quoted from rev-parse function, formats the output, and outputs it
# To see both scripts, with rev-parse function, run the following:
#				./output_script.bash $(git rev-parse --sq-quote $(bash input_script.bash))
# 			git rev-parse operates in sq-quote mode where it quotes the output from input_script.bash and provides it as arguments to output_script which then formats and 
#			outputs the value
counter=1;
for str in "$@"
	do
		if [[ "$counter" -eq "$#" ]]
		then 
			echo "$str";
		else
			echo -n "$str + ";
		fi
		counter=$((counter+1));
	done		

