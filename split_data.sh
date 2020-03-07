data=FBANK/REVERB_tr_cut/SimData_tr_for_1ch

for x in A B C D E F G H;do
  featdir=${data}_${x}
  echo $featdir 
  utils/subset_data_dir_tr_cv.sh $featdir ${featdir}_tr90 ${featdir}_cv10
done
