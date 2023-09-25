template-r-exams
================

Template r-exams (about <https://www.r-exams.org/>)

Procedemento
------------

0.  Escribir as 40 preguntas \[*exame1.Rnw,exame40.Rnw*\]

1.  Executar script *1-exame.R*

        template-r-exams$ Rscript 1-exame.R #Xerar pdfs en nops_pdf

    Entregar os pdfs xerados ao alumnado.\
    O alumnado resolve os tests.

2.  Escanear exames realizados polo alumnado(soamente a primeira
    folla(plantilla)) e copialos a *nops*\_*scan*\
    Executar script *2-scan.R*

        template-r-exams$ Rscript 2-scan.R #Procesar os exames escaneados (1 ou múltiples ficheiros tipo PDF)

3.  Executar script *3-aval.R* para calcular notas:

        template-r-exams$ Rscript 3-aval.R #Xenérase un nops_eval.zip coas notas do alumnado
        template-r-exams$ unzip nops_eval.zip -d nops_eval #Descomprimir en nops_eval

4.  Executar script *4-changes-css-html.sh* para cambiar o css dos html
    dentro do directorio *nops*\_*eval* para que ao abrir os html e
    imprimilos teñamos 2 follas e non 3 (sendo esta última en branco):

        template-r-exams$ bash 4-changes-css-html.sh #Modificar css
        template-r-exams$ firefox nops_eval/*/*html #Ver notas do alumnado
