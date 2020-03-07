#!/bin/bash
pwdir=/home/rohitk/Workspace/Complex_Transformer/Exp/Exp3/REV_Data_numpy

while read -r line;
do 
      echo "$pwdir/$line"
done < wav_npy.scp > wav_temp.scp




