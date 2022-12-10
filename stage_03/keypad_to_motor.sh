#!/bin/bash

temp=""

while [ 1 ]
do



	while [ 1 ]
	do
		read new_num

		if [ "$new_num" == "*" ]
		then
        	        break
		fi

		temp="$temp$new_num"
		echo "$temp"

	done

	echo "angle: $temp"

	sudo ./step_motor -q 1 $temp
done
