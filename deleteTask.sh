#!bin/bash
taskIds=$(todoist l | awk '{print $1}')
firstId=$(echo $taskIds | awk '{print $1}')
#echo $firstId
todoist d $firstId
