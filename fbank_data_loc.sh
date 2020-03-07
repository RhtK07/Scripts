#!/bin/bash

middle_part1=REVERB_tr_cut/SimData_tr_for_1ch_A_tr90
middle_part2=REVERB_tr_cut/SimData_tr_for_1ch_A_cv10
pwdir=/home/rohitk/Workspace/Complex_Transformer/Exp/Exp3/Data_Kaldi_format/REVERB_tr_cut

while read -r line;
do
  front=$(echo $line | cut --complement -d '/'  -f7-)
  back=$(echo $line | cut -d '/' -f13-)
  ID=$(echo $back | cut -d '.' -f1)
  #$front/$middle_part2/$back
  echo "$ID $front/$middle_part2/$back"
done < $pwdir/SimData_tr_for_1ch_A_cv10/wav.scp > $pwdir/SimData_tr_for_1ch_A_cv10/temp.scp

rm $pwdir/SimData_tr_for_1ch_A_cv10/wav.scp
mv $pwdir/SimData_tr_for_1ch_A_cv10/temp.scp $pwdir/SimData_tr_for_1ch_A_cv10/wav.scp

############################################################

while read -r line;
do
  front=$(echo $line | cut --complement -d '/'  -f7-)
  back=$(echo $line | cut -d '/' -f13-)
  ID=$(echo $back | cut -d '.' -f1)

  echo "$ID $front/$middle_part2/$back"
done < $pwdir/SimData_tr_for_1ch_A_tr90/wav.scp > $pwdir/SimData_tr_for_1ch_A_tr90/temp.scp

rm $pwdir/SimData_tr_for_1ch_A_tr90/wav.scp
mv $pwdir/SimData_tr_for_1ch_A_tr90/temp.scp $pwdir/SimData_tr_for_1ch_A_tr90/wav.scp
