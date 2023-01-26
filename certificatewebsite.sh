#!/bin/bash

read -r -p "IP host: " iphost
read -r -p "Name host: " namehost
read -r  -s -p  "Enter password for sudo: " passwd
#Добавляем ip и hostname в /etc/hosts
echo $passwd | sudo -S chmod g+w /etc/hosts
echo $passwd | sudo -S  echo "$iphost  $namehost" >> /etc/hosts 
echo $passwd | sudo -S chmod g-w /etc/hosts

mkdir -p /etc/nginx/ssl
cd /etc/nginx/ssl
#Create private key
openssl genrsa -out server.key 4096 
#Create query on certificate with pub key
openssl req -new -key server.key -out server.csr
#Sign certificate on 365 days
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt 
 
modulucrt=openssl x509 -noout -modulus -in server.crt | openssl md5
modulukey=openssl rsa -noout -modulus -in server.key | openssl md5

if [ $modulucrt=$modulukey ]
then
    echo "Modulus server.crt and server.key is equal"
else
    echo "Modulus server.crt and server.key is not equal"
    exit 1
fi
echo $passwd | sudo -S rm server.csr
cd /etc/nginx/sites-available/
#Setting nginx
echo $passwd | sudo -S chmod g+w /etc/nginx/sites-available/default
#Uncomments listen port for ssl
echo $passwd | sudo -S  sed 's/# listen/listen/'  /etc/nginx/sites-available/default
#Add paths the key and certificate
echo $passwd | sudo -S echo "ssl_certificate /etc/nginx/ssl/server.crt" >>  /etc/nginx/sites-available/default
echo $passwd | sudo -S echo "ssl_certificate_key /etc/nginx/ssl/server.key" >>  /etc/nginx/sites-available/default
#Change server_name on server_name ourwebsite
ааук
echo $passwd | sudo -S chmod g-w /etc/nginx/sites-available/default
