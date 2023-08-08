#!/bin/bash

IPYNB_FILES=`ls *.ipynb`

for file in $IPYNB_FILES;
do
    echo "Removing outputs from $file"
    nbstripout $file
done
