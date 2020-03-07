#!/bin/bash

#while read -r line;
#do
#     read_scp_write_npy_embeddings.py mat $line REV_Data_numpy
#done < y1.txt

while read -r line;
do
     python read_scp_write_npy_embeddings.py mat $line REV_Data_numpy
done < y1.txt
