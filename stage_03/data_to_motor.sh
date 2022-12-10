#!/bin/bash

sudo ./encoder -q > encoder_data &
sudo ./keypad_v6 -q > keypad_data &

./encoder_to_motor.sh < encoder_data &
./keypad_to_motor.sh < keypad_data &
