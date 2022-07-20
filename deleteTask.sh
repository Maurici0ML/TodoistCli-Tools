#!bin/bash

while getopts d:c:m:s: flag; do
	case $flag in
		d)	
			echo "Deleting $OPTARG..."
				task=$(todoist l | grep $OPTARG)	
				id=$(echo $task | awk '{print $1}')
				if ! $(todoist d $id); then
					echo "The $OPTARG task doesn't exist"
				else
					echo "$OPTARG has been deleted."
				fi
			;;
		c) 
			echo "closing $OPTARG"
			;;
		m)
			echo "modifying $OPTARG"
			;;
		s)
			echo "showing $OPTARG"
			;;
	esac
done
#taskIds=$(todoist l | awk '{print $1}')
#firstId=$(echo $taskIds | awk '{print $1}')
#echo $firstId
#todoist d $firstId
