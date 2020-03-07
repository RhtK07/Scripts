#!/bin/bash
folder_name=Trans_data_scp
mkdir $folder_name
mkdir $folder_name/REVERB_dt
mkdir $folder_name/REVERB_et
mkdir $folder_name/REVERB_Real_dt
mkdir $folder_name/REVERB_Real_et
mkdir $folder_name/REVERB_tr_cut


data_dir=/home/anirudhs/tmp/anu/rohit/data


#for y in $data_dir/REVERB_tr_cut/*
#do
#   temp=$(echo $y | cut -d '/' -f9)
#   mkdir $folder_name/REVERB_tr_cut/$temp
#   cat $y/wav.scp | awk -F "/" '{print substr($0, index($0,$5))}'| awk ' { print "/home/rohitk/Workspace/MtechProject/wpe_v1.33/nf/" $0 } ' > $folder_name/REVERB_tr_cut/$temp/yoyo.scp

#   while read -r line;
#   do
#     temp=$(echo $line | cut -d '/' -f14)
#     ID=$(echo $temp | cut -d '_' -f1)
#     echo "$ID $line"
#   done < $folder_name/REVERB_tr_cut/$temp/yoyo.scp > $folder_name/REVERB_tr_cut/$temp/wav.scp

#   rm $folder_name/REVERB_tr_cut/$temp/yoyo.scp





#done

for y in $data_dir/REVERB_dt/*
do
   temp=$(echo $y | cut -d '/' -f9)
   mkdir $folder_name/REVERB_dt/$temp
   cat $y/wav.scp | awk -F "/" '{print substr($0, index($0,$9))}'| awk ' { print "/home/rohitk/Workspace/MtechProject/wpe_v1.33/nf/" $0 } ' > $folder_name/REVERB_dt/$temp/yoyo.scp

   while read -r line;
   do
     temp=$(echo $line | cut -d '/' -f14)
     ID=$(echo $temp | cut -d '_' -f1)
     echo "$ID $line"
   done < $folder_name/REVERB_dt/$temp/yoyo.scp > $folder_name/REVERB_dt/$temp/wav.scp


done


for y in $data_dir/REVERB_et/*
do
   temp=$(echo $y | cut -d '/' -f9)
   mkdir $folder_name/REVERB_et/$temp
   cat $y/wav.scp | awk -F "/" '{print substr($0, index($0,$9))}'| awk ' { print "/home/rohitk/Workspace/MtechProject/wpe_v1.33/nf/" $0 } ' > $folder_name/REVERB_et/$temp/yoyo.scp

   while read -r line;
   do
     temp=$(echo $line | cut -d '/' -f14)
     ID=$(echo $temp | cut -d '_' -f1)
     echo "$ID $line"
   done < $folder_name/REVERB_et/$temp/yoyo.scp > $folder_name/REVERB_et/$temp/wav.scp
done



for y in $data_dir/REVERB_Real_dt/*
do
   temp=$(echo $y | cut -d '/' -f9)
   mkdir $folder_name/REVERB_Real_dt/$temp
   cat $y/wav.scp | awk -F "/" '{print substr($0, index($0,$7))}'| awk ' { print "/home/rohitk/Workspace/MtechProject/wpe_v1.33/nf/" $0 } ' > $folder_name/REVERB_Real_dt/$temp/yoyo.scp

   while read -r line;
   do
     temp=$(echo $line | cut -d '/' -f9)
     ID=$(echo $temp | cut -d '_' -f1)
     echo "$ID $line"
   done < $folder_name/REVERB_Real_dt/$temp/yoyo.scp > $folder_name/REVERB_Real_dt/$temp/wav.scp

done


for y in $data_dir/REVERB_Real_et/*
do
   temp=$(echo $y | cut -d '/' -f9)
   mkdir $folder_name/REVERB_Real_et/$temp
   cat $y/wav.scp | awk -F "/" '{print substr($0, index($0,$7))}'| awk ' { print "/home/rohitk/Workspace/MtechProject/wpe_v1.33/nf/" $0 } ' > $folder_name/REVERB_Real_et/$temp/yoyo.scp

   while read -r line;
   do
     temp=$(echo $line | cut -d '/' -f9)
     ID=$(echo $temp | cut -d '_' -f1)
     echo "$ID $line"
   done < $folder_name/REVERB_Real_et/$temp/yoyo.scp > $folder_name/REVERB_Real_et/$temp/wav.scp


done
