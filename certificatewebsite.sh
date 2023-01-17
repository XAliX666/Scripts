#!/bin/bash

read -r -p "IP host: " iphost
read -r -p "Name host: " namehost
read -r  -s -p  "Enter password for sudo: " passwd

echo $passwd | sudo -S chmod g+w /etc/hosts
echo $passwd | sudo -S  echo "$iphost  $namehost" >> /etc/hosts 
echo $passwd | sudo -S chmod g-w /etc/hosts
