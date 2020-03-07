#####bash file in which it is used to just replace the some of the location things and replace them with letters which will actually form the directory


folder=Data_Kaldi_format
data=Transformer_DREV_Data

###############################################################################

pdir=/home/rohitk/Workspace/REVERB/Reverb_neural_mask_asr/data_500_ms/REVERB_dt

sdir=/home/rohitk/Workspace/Complex_Transformer/Exp/Exp3/$folder/REVERB_dt


for loc in SimData_dt_for_1ch_far_room1_A SimData_dt_for_1ch_far_room2_A SimData_dt_for_1ch_far_room3_A SimData_dt_for_1ch_near_room1_A SimData_dt_for_1ch_near_room2_A SimData_dt_for_1ch_near_room3_A;
do

sed 's/MtechProject/Workspace/g' $pdir/$loc/wav.scp > $pdir/$loc/temp1.scp

sed 's/wpe_v1.33/DATA/g' $pdir/$loc/temp1.scp > $pdir/$loc/temp2.scp

sed 's/Output_500ms/Transformer_DREV_Data/g' $pdir/$loc/temp2.scp > $pdir/$loc/temp3.scp

sed 's/wav/npy/g' $pdir/$loc/temp3.scp > $sdir/$loc/wav_t.scp

cat $sdir/$loc/wav_t.scp | awk '{print $2}' > $sdir/$loc/wav.scp

rm $pdir/$loc/temp1.scp
rm $pdir/$loc/temp2.scp
rm $pdir/$loc/temp3.scp
rm $sdir/$loc/wav_t.scp

done

########################################################################################

pdir=/home/rohitk/Workspace/REVERB/Reverb_neural_mask_asr/data_500_ms/REVERB_et

sdir=/home/rohitk/Workspace/Complex_Transformer/Exp/Exp3/$folder/REVERB_et


for loc in SimData_et_for_1ch_far_room1_A SimData_et_for_1ch_far_room2_A SimData_et_for_1ch_far_room3_A SimData_et_for_1ch_near_room1_A SimData_et_for_1ch_near_room2_A SimData_et_for_1ch_near_room3_A;
do

sed 's/MtechProject/Workspace/g' $pdir/$loc/wav.scp > $pdir/$loc/temp1.scp

sed 's/wpe_v1.33/DATA/g' $pdir/$loc/temp1.scp > $pdir/$loc/temp2.scp

sed 's/Output_500ms/Transformer_DREV_Data/g' $pdir/$loc/temp2.scp > $pdir/$loc/temp3.scp

sed 's/wav/npy/g' $pdir/$loc/temp3.scp > $sdir/$loc/wav_t.scp

cat $sdir/$loc/wav_t.scp | awk '{print $2}' > $sdir/$loc/wav.scp

rm $pdir/$loc/temp1.scp
rm $pdir/$loc/temp2.scp
rm $pdir/$loc/temp3.scp
rm $sdir/$loc/wav_t.scp

done



#########################################################################################


pdir=/home/rohitk/Workspace/REVERB/Reverb_neural_mask_asr/data_500_ms/REVERB_Real_dt

sdir=/home/rohitk/Workspace/Complex_Transformer/Exp/Exp3/$folder/REVERB_Real_dt



for loc in RealData_dt_for_1ch_far_room1_A RealData_dt_for_1ch_near_room1_A;
do

sed 's/MtechProject/Workspace/g' $pdir/$loc/wav.scp > $pdir/$loc/temp1.scp

sed 's/wpe_v1.33/DATA/g' $pdir/$loc/temp1.scp > $pdir/$loc/temp2.scp

sed 's/Output_500ms/Transformer_DREV_Data/g' $pdir/$loc/temp2.scp > $pdir/$loc/temp3.scp

sed 's/wav/npy/g' $pdir/$loc/temp3.scp > $sdir/$loc/wav_t.scp

cat $sdir/$loc/wav_t.scp | awk '{print $2}' > $sdir/$loc/wav.scp

rm $pdir/$loc/temp1.scp
rm $pdir/$loc/temp2.scp
rm $pdir/$loc/temp3.scp
rm $sdir/$loc/wav_t.scp

done

######################################################################################

pdir=/home/rohitk/Workspace/REVERB/Reverb_neural_mask_asr/data_500_ms/REVERB_Real_et
#pdir=/home/rohitk/REVERB/Reverb_neural_mask_asr/data_500_ms/REVERB_Real_et

sdir=/home/rohitk/Workspace/Complex_Transformer/Exp/Exp3/$folder/REVERB_Real_et



for loc in RealData_et_for_1ch_far_room1_A RealData_et_for_1ch_near_room1_A;
do

sed 's/MtechProject/Workspace/g' $pdir/$loc/wav.scp > $pdir/$loc/temp1.scp

sed 's/wpe_v1.33/DATA/g' $pdir/$loc/temp1.scp > $pdir/$loc/temp2.scp

sed 's/Output_500ms/Transformer_DREV_Data/g' $pdir/$loc/temp2.scp > $pdir/$loc/temp3.scp

sed 's/wav/npy/g' $pdir/$loc/temp3.scp > $sdir/$loc/wav_t.scp
cat $sdir/$loc/wav_t.scp | awk '{print $2}' > $sdir/$loc/wav.scp

rm $pdir/$loc/temp1.scp
rm $pdir/$loc/temp2.scp
rm $pdir/$loc/temp3.scp
rm $sdir/$loc/wav_t.scp

done

#########################################################################################


pdir=/home/rohitk/Workspace/REVERB/Reverb_neural_mask_asr/data_500_ms/REVERB_tr_cut
#pdir=/home/rohitk/REVERB/Reverb_neural_mask_asr/data_500_ms/

sdir=/home/rohitk/Workspace/Complex_Transformer/Exp/Exp3/$folder/REVERB_tr_cut

for loc in SimData_tr_for_1ch_A SimData_tr_for_1ch_A_tr90 SimData_tr_for_1ch_A_cv10;
do

sed 's/MtechProject/Workspace/g' $pdir/$loc/wav.scp > $pdir/$loc/temp1.scp

sed 's/wpe_v1.33/DATA/g' $pdir/$loc/temp1.scp > $pdir/$loc/temp2.scp

sed 's/Output_500ms/'$data'/g' $pdir/$loc/temp2.scp > $pdir/$loc/temp3.scp

sed 's/wav/npy/g' $pdir/$loc/temp3.scp > $sdir/$loc/wav_t.scp

cat $sdir/$loc/wav_t.scp | awk '{print $2}' > $sdir/$loc/wav.scp

rm $pdir/$loc/temp1.scp
rm $pdir/$loc/temp2.scp
rm $pdir/$loc/temp3.scp
rm $sdir/$loc/wav_t.scp

done
###############################################
