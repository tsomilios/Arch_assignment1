#!/bin/bash
for num in {1..8}
do
	echo "${num}" >> test.txt
	for i in 60 61 63 65 66 276 277 279 281 282
	do 
		line=$i;
		prep=`grep -ne ^ $num/results.txt | grep -e ^$line:`; 
		echo "${prep#$line:}" >> test.txt ;
      		
	done
done
for num in {9..16}
do
	echo "${num}" >> test.txt
	for i in 61 62 64 66 67 277 278 280 282 283
	do 
		line=$i;
		prep=`grep -ne ^ $num/results.txt | grep -e ^$line:`; 
		echo "${prep#$line:}" >> test.txt ;
      		
	done
done
