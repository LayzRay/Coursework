#!/bin/bash

while [ 1 ]
do

	read angle

	echo "$angle"

	sudo ./step_motor -q 1 $angle

done
