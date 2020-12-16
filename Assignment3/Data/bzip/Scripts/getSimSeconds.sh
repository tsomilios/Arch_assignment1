#!/bin/bash
for num in {1..16}
do
	echo "${num}" >> test.txt
	for i in 12
	do 
		line=$i;
		prep=`grep -ne ^ $num/stats.txt | grep -e ^$line:`; 
		echo "${prep#$line:}" >> new-test.txt ;
      		
	done
done

