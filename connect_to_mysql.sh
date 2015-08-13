#!/usr/bin/bash
<<comment
	Author............: P R Rakesh Sharma
	File Type.........: bash file, .sh
	Description.......: Make connection and get data from the database
comment

test=on

# Connect to database and get the list of databases
# Gets the only the names of database and avoids the schema
func_get_databases_from_mysql() {
	command_output=`mysql -u root -proot123 -e "show databases"`
	for word in $commmand_output; do
		ret="x"
		ret="$ret"$( echo "$word" | grep 'Database\|schema' )
		if [ "$ret" == "x" ]
			then
			echo "$word"
		fi
	done
	echo 0	
}




# Section for testing
# Triggers test if the argument t is given to the script call
if [ "$test" == "on" ]
	then

	# Test the return value from the function
	test_func_get_databases_from_mysql() {
		echo "$1"
		retval=$( func_get_databases_from_mysql )
		assertEquals $retval 0
	}

	# load testing script shunit2
	. shunit2
fi