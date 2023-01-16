#!/bin/bash

#Чтобы файл первратился в зашифрованный файл с ключами надо передать аргумент TXT!!!.
#Тест на количество
if [ $# -ne 1 ]
then
    echo "Arguments need one"
    exit 1
fi
#Тест на файл
if [ ! -f $1  ]
then
    echo "$1 don not is file.txt"
    exit 1
fi
filename=FILE
mkdir -p ./"$filename"_ENC_KEYS
openssl genpkey -algorithm RSA -out private.key -pkeyopt rsa_keygen_bits:8192
openssl rsa -in private.key -pubout -out public.key
openssl rsautl -encrypt -pubin -inkey public.key -in $1 -out $1.enc
mv private.key $HOME/"$filename"_ENC_KEYS
mv public.key $HOME/"$filename"_ENC_KEYS
mv "$1".enc $HOME/"$filename"_ENC_KEYS