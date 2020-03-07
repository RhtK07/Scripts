#!/bin/bash

data=/home/rohitk/Random/Experiments/wav.scp

pwdir=/home/rohitk/Random/Experiments

#if [ -f $data/segments ]; then
#  echo "$0 [info]: segments file exists: using that."
#  split_segments=""
#  for n in $(seq $nj); do
#    split_segments="$split_segments $logdir/segments.$n"
#  done

#  utils/split_scp.pl $data/segments $split_segments || exit 1;
#  rm $logdir/.error 2>/dev/null

#  $cmd JOB=1:$nj $logdir/make_fbank_${name}.JOB.log \
#    extract-segments scp,p:$scp $logdir/segments.JOB ark:- \| \
#    compute-fbank-feats $vtln_opts --verbose=2 --config=$fbank_config ark:- ark:- \| \
#    copy-feats --compress=$compress ark:- \
#     ark,scp:$fbankdir/raw_fbank_$name.JOB.ark,$fbankdir/raw_fbank_$name.JOB.scp \
#     || exit 1;

#else
echo "Lets see how the splitting work Okay"
nj=5


split_scps=""
for n in $(seq $nj); do
#    echo "$split_scps"
    split_scps="$split_scps $pwdir/wav.$n.scp"
done

utils/split_scp.pl $data $split_scps || exit 1;

#  $cmd JOB=1:$nj $logdir/make_fbank_${name}.JOB.log \
#    compute-fbank-feats $vtln_opts --verbose=2 --config=$fbank_config scp,p:$logdir/wav.JOB.scp ark:- \| \
#    copy-feats --compress=$compress ark:- \
#     ark,scp:$fbankdir/raw_fbank_$name.JOB.ark,$fbankdir/raw_fbank_$name.JOB.scp \
#     || exit 1;

#fi




