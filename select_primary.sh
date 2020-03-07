#!/bin/bash

pwdir=/home/rohitk/Workspace/Complex_Transformer/Exp/Exp3/Trans_data_scp/REVERB_et

for y in $pwdir/*
do
  cat $y/wav.scp | grep primary_microphone > $y/temp.scp
  mkdir $y/OLD

  cp $y/wav.scp $y/OLD/wav.scp
  rm $y/wav.scp

  mv $y/temp.scp $y/wav.scp
done
