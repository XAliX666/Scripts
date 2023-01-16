#!/bin/bash

read -r -p "IP host: " iphost
read -r -p "Name host: " namehost
read -r  -s -p  "Enter password for sudo: " passwd

$passwd | sudo -S  echo $iphost  $namehost>>/etc/hosts
