#!/bin/bash
for num in {1..8}
do
	
	for i in 15
	do 
		line=$i;
		prep=`grep -ne ^ $num/results.txt | grep -e ^$line:`; 
		echo "${prep#$line:}" >> 1.txt ;
      		
	done
done
for num in {9..16}
do
	
	for i in 16
	do 
		line=$i;
		prep=`grep -ne ^ $num/results.txt | grep -e ^$line:`; 
		echo "${prep#$line:}" >> 1.txt ;
      		
	done
done
