# This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License
# Creative Commons License: http://creativecommons.org/licenses/by-sa/4.0/
# Author: Ricardo Feijoo Costa 
# DATA: lun 25 sep 2023 22:59:48 CEST

#!/usr/bin/env Rscript

library(exams)
# TODO: Parametrizar numberPDF=32 => numbersDNI=32 => asignar os dni_alumno1 a dni_alumno32 => declarar name_alumno1 ata name_alumno32
dni_alumno1 <- "00000001"
dni_alumno2 <- "00000002"
dni_alumno3 <- "00000003"
dni_alumno4 <- "00000004"
dni_alumno5 <- "00000005"
name_alumno1 <- "Nome Apel1 Apel2"
name_alumno2 <- "Nome Apel1 Apel2"
name_alumno3 <- "Nome Apel1 Apel2"
name_alumno4 <- "Nome Apel1 Apel2"
name_alumno5 <- "Nome Apel1 Apel2"

write.table(data.frame(
  registration = c(dni_alumno1, dni_alumno2, dni_alumno3, dni_alumno4, dni_alumno5),
  name = c(name_alumno1, name_alumno2, name_alumno3, name_alumno4, name_alumno5),
  id = c("1-alumno1", "2-alumno2", "3-alumno3", "4-alumno4", "5-alumno5")
), file = "nameFile.csv", sep = ";", quote = FALSE, row.names = FALSE)


ev1 <- nops_eval(
  register = "nameFile.csv",
  solutions = "nops_pdf/nameFile.rds",
  scans = Sys.glob("nops_scan/nops_scan_*.zip"),
  eval = exams_eval(partial = FALSE, negative = 0.5),
  interactive = FALSE,
  language = "gl",
  mark = FALSE
)
dir()
