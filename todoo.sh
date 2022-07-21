#!bin/bash

while getopts c:d:m:s: flag; do
	#Getting the selected task
	task=$(todoist l | grep $OPTARG)	
	if [[ -z $task ]]
	then
		echo "The $OPTARG task doesn't exist."
		exit 0
	fi
	#Only the id from the task
	id=$(echo $task | awk '{print $1}')
	case $flag in
		d)	
			echo "Deleting $OPTARG..."
			todoist d $id
			echo "$OPTARG has been deleted."
			;;
		c) 
			echo "Closing $OPTARG"
			todoist c $id
			echo "$OPTARG has been closed."
			;;
		m)
			echo "Modifying $OPTARG"
			todoist m -c $3 $id
			echo "$OPTARG has changed to $3"
			;;
		s)
			echo "Showing $OPTARG"
			todoist show $id
			;;
	esac
done
