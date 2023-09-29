# This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License
# Creative Commons License: http://creativecommons.org/licenses/by-sa/4.0/
# Author: Ricardo Feijoo Costa 
# DATA: lun 25 sep 2023 22:59:48 CEST

#!/bin/bash

##VARIABLES
DIR="$(pwd)/nops_eval"

##main()
for i in $(ls -v ${DIR}/*/*html)
do
  echo '-----------------'
  echo Procesando $i
  NUM=$(grep -n '</style>' $i | cut -d ':' -f1)
  sed -i "${NUM}s|</style>|h3 {margin-bottom:10px;}\nimg {margin-bottom:-40px; max-width: 98%; height: auto;}\ntr {line-height:1;}\n</style>|" $i 
  sed -i "s|<h3>Folla do exame|<h3 style='page-break-before:always;'>Folla do exame|" $i
  PDF_FILE=$(echo $i | sed "s/.html/.pdf/")
  wkhtmltopdf $i ${PDF_FILE}
done
