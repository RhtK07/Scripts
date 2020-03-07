#!/bin/bash


pwdir=/home/rohitk/Workspace/Complex_Transformer/Exp/Exp3/REV_data_batch

wav_loc=/home/rohitk/Workspace/Complex_Transformer/Exp/Exp3/Data_Kaldi_format

data_loc=/home/rohitk/Workspace/DATA/Transformer_DREV_Data
#########################################################



#xargs cp -t /home/rohitk/Workspace/DATA/Transformer_DREV_Data/REVERB_dt/SimData_dt_for_1ch_far_room2_A/.
#find  $pwdir -name $temp* | xargs cp -t /home/rohitk/

for loc in SimData_et_for_1ch_far_room1_A SimData_et_for_1ch_far_room2_A SimData_et_for_1ch_far_room3_A SimData_et_for_1ch_near_room1_A SimData_et_for_1ch_near_room2_A SimData_et_for_1ch_near_room3_A;
do
  while read -r line;
  do
    temp=$(echo $line | cut -d '/' -f13 | cut -d '.' -f1)
    find  $pwdir -name $temp* | xargs cp -t $data_loc/REVERB_et/$loc
  done < $wav_loc/REVERB_et/$loc/wav.scp
done


for loc in RealData_dt_for_1ch_far_room1_A RealData_dt_for_1ch_near_room1_A;
do
  while read -r line;
  do
    temp=$(echo $line | cut -d '/' -f8 | cut -d '.' -f1)
    find  $pwdir -name $temp* | xargs cp -t $data_loc/REVERB_Real_dt/$loc
  done < $wav_loc/REVERB_Real_dt/$loc/wav.scp
done



for loc in RealData_et_for_1ch_far_room1_A RealData_et_for_1ch_near_room1_A;
do
  while read -r line;
  do
    temp=$(echo $line | cut -d '/' -f8 | cut -d '.' -f1)
    find  $pwdir -name $temp* | xargs cp -t $data_loc/REVERB_Real_et/$loc
  done < $wav_loc/REVERB_Real_et/$loc/wav.scp
done


for loc in SimData_tr_for_1ch_A SimData_tr_for_1ch_A_tr90 SimData_tr_for_1ch_A_cv10;
do
  while read -r line;
  do
    temp=$(echo $line | cut -d '/' -f13 | cut -d '.' -f1)
    find  $pwdir -name $temp* | xargs cp -t $data_loc/REVERB_tr_cut/$loc
  done < $wav_loc/REVERB_tr_cut/$loc/wav.scp
done
