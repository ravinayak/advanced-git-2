# This script simply outputs 3 strings, which is consumed by rev-parse function for proper quoting, and the quoted result is then consumed by another script which formats given input 
# and ouputs it again. These 3 strings are split on whitespace by rev-parse function which then provides each string to another script as quoted input

str1='Hello, How are you?';
str2='Wow! what an excellent shot!';
str3='   There you go buddy';
echo "$str1 $str2 $str3";

