pwdr=/home/rohitk/Workspace/Complex_Transformer/Exp/Exp3
. ./path.sh
. ./cmd.sh

train_cmd=queue.pl
mfccdir=REV_data_cmvn

for x in $pwdr/Trans_data_scp/*
do
	echo $x	
	for y in $x/*
	do
		echo $y
		L=`wc -l <$y/wav.scp`
		a=1
		N=$((L*a))
		echo "N is = $N"	
		 steps/make_fbank.sh --fbank-config "conf/fbank.conf" --nj 5 --cmd "$train_cmd" \
		      $y exp/yoyo ${mfccdir}
		    

		while [ ! -f $y/feats.scp ]
		do
		  sleep 5s
		done
		cnter=`wc -l <$y/feats.scp`
		echo "center is = $cnter"


		while [ "$cnter" -lt "$N" ]
			do
			   sleep 15s
			   echo "waiting for $cnter to be equal to $N"
			   cnter=`wc -l <$y/feats.scp`
			done
		 steps/compute_cmvn_stats_without_spk2utt.sh $y exp/make_fbank/$y ${mfccdir}

   		
		echo "Feats  for $y is Done"
	done


	echo "Feats  for $x is Done"
done


echo "Feats  for all directories Done"
