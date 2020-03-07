#!/bin/bash


while read -r line;
do
     temp=$(echo $line | cut --complement -d '_' -f5-)
     echo "$temp.npy"
done < wav_temp.scp > temp.scp

awk '!seen[$0]++' temp.scp > wav_joint_npy.scp

rm temp.scp
