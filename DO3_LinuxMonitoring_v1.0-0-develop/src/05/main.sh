#!/bin/bash

clear

# variables

start=$(date +%S)
sleep 0.5
num_folders=$(find $1 -mindepth 1 -type d | wc -l)
all_files=$(find $1 -type f | wc -l)
top_v=$(du -h $1 | sort -rh | head -5 | awk '{print $2}')
top_x=$(ls -lh $1 | sort -rh | head -10 | awk '{print $9}')
top_x_exe=$(ls -lh $1 | sort -rh | awk '/^.........x/{print $9}' | head -10)
MB_top_exe=$(ls -lh $1 |awk '/^.........x/{print $5}' | sort -rh | head -10)
MB_top_v=$(du -h $1 | sort -rh | head -5 | awk '{print $1}')
MB_top_x=$(du -h $1 | sort -rh | head -10 | awk '{print $1}')
cfg_file=$(find $1 -type f -name "*.conf" | wc -l)
txt_file=$(find $1 -type f -name "*.txt" | wc -l)
exe_file=$(ls -lh $1 | cut -c 10 | grep x | wc -l)
log_file=$(find $1 -type f -name "*.log" | wc -l)
arch_file=$(find $1 -type f -name "*.gz" | wc -l)
symb_link=$(find $1 -type l | grep -e / | wc -l)
cfg_filenm=$(find $1 -type f -name "*.conf")
txt_filenm=$(find $1 -type f -name "*.txt")
exe_filenm=$(ls -lh $1 | cut -c 10 | grep x)
log_filenm=$(find $1 -type f -name "*.log")
arch_filenm=$(find $1 -type f -name "*.gz")

# arrays

arr_top_v=($top_v)
arr_v_MB=($MB_top_v)
arr_x_MB=($MB_top_x)
arr_exe_MB=($MB_top_exe)
arr_top_x=($top_x)
arr_exe=($top_x_exe)

# output

echo "Total number of folders (including all nested ones) = $num_folders"
echo ""
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"

for (( i = 0; i < 5; i++ ))
do
	echo "$(( i + 1 )) - ${arr_top_v[$i]},  ${arr_v_MB[$i]}"
done
echo ""
echo "Total number of files = $all_files"
echo ""
echo "Number of:"
echo "Configuration files (whith the .conf extension) = $cfg_file"
echo "Text files = $txt_file"
echo "Executable files = $exe_file"
echo "Log files (whith the extension .log) = $log_file"
echo "Archive files = $arch_file"
echo "Symbolyc links = $symb_link"
echo ""
echo "TOP 10 files of  maximum size arranged in descending order (path, size and type):"
for (( i = 0; i < 10; i++ ))
do
	echo -n "$(( i + 1 )) - $1${arr_top_x[$i]},  ${arr_x_MB[$i]}, "
	if [[ "${log_filenm[*]}" =~ "${arr_top_x[$i]}" ]]
	then
		echo ".log"
	elif [[ "${txt_filenm[*]}" =~ "${arr_top_x[$i]}" ]]
	then
		echo ".txt"
	elif [[ "${cfg_filenm[*]}" =~ "${arr_top_x[$i]}" ]]
	then
		echo ".conf"
	elif [[ "${arch_filenm[*]}" =~ "${arr_top_x[$i]}" ]]
	then
		echo ".gz"
	elif [[ "${arr_exe[*]}" =~ "${arr_top_x[$i]}" ]]
	then
		echo ".exe"
	else
		echo ".txt"
	fi
done
echo ""
echo "TOP 10 executable files of the maximum size arranged in descanding order (path, size and MD5 hash of file)"
for (( i = 0; i < 10; i++ ))
do
	echo "$(( i + 1 )) - $1${arr_exe[$i]}, ${arr_exe_MB[$i]}, $(ls -alR $1${arr_exe[$i]} | md5sum | awk '{print $1}')"
done
end=$(date +%S)
time=$(( $end-$start ))
echo ""
echo "Script execution time (in second) =  $time"
