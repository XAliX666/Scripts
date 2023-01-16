#!/bin/bash

while true; do
    read -r -p "Do you wish to reboot the system? (Y/N): " answer
    case $answer in
        [Yy]* ) reboot; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer Y or N.";;
    esac
done
