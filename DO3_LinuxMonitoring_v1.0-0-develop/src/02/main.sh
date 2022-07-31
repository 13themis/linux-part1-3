#!/bin/bash

./info.sh
echo "Writing to file?"
read  options
var=$(date +%d_%m_%y_%H:%M:%S)

if [[ $options = 'y' || $options = 'Y' ]]
then
	./info.sh > $var.status
fi
