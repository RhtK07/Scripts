sdir=/home/anirudhs/tmp/anu/rohit

for wav in $sdir/Data_BF/* ; do
   #echo $wav
   for files in $wav/* ; do
      #echo $files
      find $files -name "*.wav" | awk '{ file=$1; label=$1; gsub(/.*\//,"",label); gsub(/\..*/,"",label); print label" "file; }' | sort > $files/wav.scp
   done
done
