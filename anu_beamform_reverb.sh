#!/bin/bash

# Copyright 2015, Mitsubishi Electric Research Laboratories, MERL (Author: Shinji Watanabe)

. ./cmd.sh
. ./path.sh

# Config:
nj=25
cmd=run.pl 

./parse_options.sh || exit 1;

if [ $# != 2 ]; then
   echo "Wrong #arguments ($#, expected 2)"
   echo "Usage: local/chime3_beamform.sh [options] <wav-in-dir> <wav-out-dir>"
   echo "main options (for others, see top of script file)"
   echo "  --nj <nj>                                # number of parallel jobs"
   echo "  --cmd <cmd>                              # Command to run in parallel with"
   exit 1;
fi

sdir=$1
odir=$2
wdir=/home/anirudhs/tmp/anu/rohit
echo "sdir is $sdir"
echo "odir is $odir"
echo "wdir is $wdir"

if [ -z $BEAMFORMIT ] ; then
  export BEAMFORMIT=$KALDI_ROOT/tools/BeamformIt
fi
export PATH=${PATH}:$BEAMFORMIT
! hash BeamformIt && echo "Missing BeamformIt, run 'cd ../../../tools/; make beamformit;'" && exit 1

# Set bash to 'debug' mode, it will exit on :
# -e 'error', -u 'undefined variable', -o ... 'error in pipeline', -x 'print commands',
set -e
set -u
set -o pipefail

mkdir -p $odir
rm -rf $wdir/log/*
mkdir -p $wdir/log
# we use the following channel signals, and remove 2nd channel signal, which located on the back of
# tablet, and behaves very different from the other front channel signals.
bmf="1 2 3 4 5"
echo "Will use the following channels: $bmf"
# number of channels
find $sdir -name "*.wav" | awk '{ file=$1; label=$1; gsub(/.*\//,"",label); gsub(/\..*/,"",label); print label" "file; }' | sort > $sdir/wav.scp

numch=`echo $bmf | tr ' ' '\n' | wc -l`
echo "the number of channels: $numch"

wavlist=$wdir/log/wav.scp
rm -f $wavlist
while IFS="" read -r x || [ -n "$x" ]
do
  np=`echo -n $x | awk -F ' ' '{print $NF}' | sed -e "s/\_ch1//"`
echo $np
done < $sdir/wav.scp > $wavlist


input_arrays=$wdir/log/channels_$numch
rm -f $input_arrays
for x in `cat $wavlist`; do
np=`echo -n $x | awk -F '/' '{print $NF}' | sed -e "s/\.wav//"`
echo -n "$np"
  np=`echo -n $x | awk -F '.' '{print $(NF-1)}'`
  for ch in $bmf; do
    if [ $ch == 1 ] ; then
      
      a=`echo -n ${np}_ch$ch.wav  | sed -e "s/_A/_A/"`
       echo -n " $a"
    elif [ $ch == 2 ] ; then
     a=`echo -n ${np}_ch$ch.wav  | sed -e "s/_A/_B/"`
       echo -n " $a"
    elif [ $ch == 3 ] ; then
     a=`echo -n ${np}_ch$ch.wav  | sed -e "s/_A/_C/"`
       echo -n " $a"
    elif [ $ch == 4 ] ; then
     a=`echo -n ${np}_ch$ch.wav  | sed -e "s/_A/_D/"`
       echo -n " $a"
    elif [ $ch == 5 ] ; then
a=`echo -n ${np}_ch$ch.wav  | sed -e "s/_A/_E/"`
       echo -n " $a"
    elif [ $ch == 6 ] ; then
a=`echo -n ${np}_ch$ch.wav  | sed -e "s/_A/_F/"`
       echo -n " $a"
    elif [ $ch == 7 ] ; then
a=`echo -n ${np}_ch$ch.wav  | sed -e "s/_A/_G/"`
       echo -n " $a"
    else
a=`echo -n ${np}_ch$ch.wav  | sed -e "s/_A/_H/"`
       echo -n " $a"
    fi
  done
  echo ""
done > $input_arrays
echo "input_arrays is $input_arrays"
cat $input_arrays


output_wavfiles=$wdir/log/outlist
rm -f $output_wavfiles
while IFS="" read -r x || [ -n "$x" ]
do
  np=`echo -n $x | awk -F '/' '{print $NF}' | sed -e "s/\.wav//"`
echo $np
done < $wavlist > $output_wavfiles


# split the list for parallel processing
split_wavfiles=""
echo "split_wavfiles is $split_wavfiles"

for n in `seq $nj`; do
  split_wavfiles="$split_wavfiles $output_wavfiles.$n"
done
utils/split_scp.pl $output_wavfiles $split_wavfiles || exit 1;


split_wavfiles=""
echo "split_wavfiles is $split_wavfiles"
for n in `seq $nj`; do
  split_wavfiles="$split_wavfiles $input_arrays.$n"
done
utils/split_scp.pl $input_arrays $split_wavfiles || exit 1;





echo -e "Beamforming\n"
for n in `seq $nj`; do
# making a shell script for each job
cat << EOF > $wdir/log/beamform.$n.sh 
while read line; do 
  $BEAMFORMIT/BeamformIt -s \$line -c $input_arrays.$n --config_file `pwd`/conf/ami.cfg --result_dir $odir  
done < $output_wavfiles.$n
EOF
chmod a+x $wdir/log/beamform.$n.sh
done

for job in `seq 1 $nj`; do
  err=$wdir/log/beam.$job.err
  out=$wdir/log/beam.$job.out
 qsub -l hostname=compute-0-0 -e $err -o $out -S /bin/bash $wdir/log/beamform.$job.sh 
done

echo "`basename $0` Done."

