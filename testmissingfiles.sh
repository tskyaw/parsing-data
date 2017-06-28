#!/bin/bash

while read line ; do
	
	if [[ $line == "SRR"* ]] || [[ $line == "ERR"* ]] ; then
		array=($line)
		accesion=${array[0]}
		
		if [ -e reads/${accesion}.sra ] && [ -s reads/${accesion}.sra ] ; then
				#echo ok
				:
			else
				echo ${accesion}.sra	
		fi	
	fi
	
done <studies.txt

