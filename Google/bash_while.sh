#!/bin/bash
### Remember to include the random.py file as an argument when running this script"
n=1
while [ $n -le 5 ]; do
	echo "Iteration number $n"
	((n+=1))
done

