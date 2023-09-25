# This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License
# Creative Commons License: http://creativecommons.org/licenses/by-sa/4.0/
# Author: Ricardo Feijoo Costa 
# DATA: lun 25 sep 2023 22:59:48 CEST

#!/bin/bash

##VARIABLES
DIR="$(pwd)/nops_eval"

##main()
for i in $(ls ${DIR}/*/*html)
do
  echo $i
  NUM=$(grep -n '</style>' $i | cut -d ':' -f1)
  sed -i "${NUM}s|</style>|h3 {margin-bottom:10px;}\nimg {margin-bottom:-40px;}\n</style>|" $i 
done
