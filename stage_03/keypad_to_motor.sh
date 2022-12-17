#!/bin/bash

while [ 1 ]
do
	temp=""

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

	if [ "$temp" == "" ]
	then
		echo "Ошибка! Ничего не было введено"
	else
		if (( "$temp" > "360" ))
		then
			echo "Ошибка! Введённый угол больше 360 градусов"
		else
			echo "Угол приращения: $temp"
			sudo ./step_motor -q 1 $temp
		fi
	fi
done
