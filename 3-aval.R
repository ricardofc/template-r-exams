# This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License
# Creative Commons License: http://creativecommons.org/licenses/by-sa/4.0/
# Author: Ricardo Feijoo Costa 
# DATA: lun 25 sep 2023 22:59:48 CEST

#!/usr/bin/env Rscript

library(exams)
dir <- getwd()
csvFile <- file.path(dir, "DNIAlumnado.csv")
languageFile <- file.path(dir, "gl-mod.dcf")
nomes <- character(0)
dnis <- character(0)

lineas <- readLines(csvFile)
for (linea in lineas) {
  vars <- strsplit(linea, ";")[[1]]
  nomes <- c(nomes, vars[1])
  dnis <- c(dnis, vars[2])
}

alumnos <- character(length(nomes))
for (i in 1:length(nomes)) {
  split_names <- unlist(strsplit(nomes[i], " "))
  alumno <- paste(i, "-",  paste(split_names[-1], collapse = "_"), sep = "")
  alumnos[i] <- alumno
}

write.table(data.frame(
  registration = dnis,
  name = nomes,
  id = alumnos
), file = "nameFile.csv", sep = ";", quote = FALSE, row.names = FALSE)


ev1 <- nops_eval(
  register = "nameFile.csv",
  solutions <- list.files(path = "nops_pdf", pattern = "\\.rds$", full.names = TRUE),
  scans = Sys.glob("nops_scan/nops_scan_*.zip"),
  eval = exams_eval(partial = FALSE, negative = 0.5),
  interactive = FALSE,
  language = languageFile,
  mark = FALSE
)
dir()
