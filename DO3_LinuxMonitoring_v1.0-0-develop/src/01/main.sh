#!/bin/bash

clear

echo "What's your name? "
read NAME

if [[ $NAME =~ ^[a-zA-Z]+$ ]]
then
    echo "Hello, $NAME!"
else
    echo "heh...dump...."
fi
