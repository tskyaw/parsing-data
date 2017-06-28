

## download SRR and ERR files from studies.txt that contain a list of accession numbers 
## ignore all the other ones that don't start with SRR or ERR. We will download them separately 
#!/bin/bash

declare -i i
i=0

total=$ grep -e "^SRR" -e "^ERR" -c studies.txt
while read line ; do
	
	if [[ $line == "SRR"* ]] || [[ $line == "ERR"* ]] ; then
		i=$i+1
		#echo $line
		array=($line)
		#echo ${array[0]}
		accesion=${array[0]}
		echo "downloading $accesion which is $i th"
		#echo $accesion
		id1=$(echo $accesion | cut -c-3)
		#echo $id1
		id2=$(echo $accesion | cut -c-6)
		#echo $id2
		wget --quiet ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/$id1/$id2/$accesion/$accesion.sra
	fi	
done <studies.txt




exit


wget ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/SRR304/SRR304976/SRR304976.sra


#sort -k 1 studies.txt

while read line ; do
	grep -c $line
	set $line
	echo $1
done <studies.txt
