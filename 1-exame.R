# This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License
# Creative Commons License: http://creativecommons.org/licenses/by-sa/4.0/
# Author: Ricardo Feijoo Costa 
# DATA: lun 25 sep 2023 22:59:48 CEST

#!/usr/bin/env Rscript

####Limitacións r-exams <= 45 preguntas
####Limitacións deste script <= 40 preguntas


args <- commandArgs(trailingOnly = TRUE)
if (length(args) == 0 || length(args) < 4) {
  stop("Executar con 5 argumentos:\n
  [1] numQuestions: Número enteiro comprendido entre 1 e 40\n
  [2] institutionText: Título\n
  [3] namePDF: Nome dos ficheiros PDF a xerar\n
  [4] groupNumber: Texto que identifica o grupo\n
  [5] numberPDF: Número de exames PDF a xerar\n
  \n
  Exemplo: Rscript 1-exame.R 40 \"Taller SMR2 - Módulo ...\" \"Test-ABCD_alumno\" \"2A\" 32\n\n")
}
if (!grepl("^\\d+$", args[1]) || as.integer(args[1]) > 40 || as.integer(args[1]) == 0) {
  stop("Parámetro 1: numQuestions debe ser un número enteiro comprendido entre 1 e 40!!!")
}
if (!is.character(args[2])) {
  stop("Parámetro2: institutionText debe ser unha cadea de caracteres")
}
if (!is.character(args[3])) {
  stop("Parámetro3: namePDF debe ser unha cadea de caracteres")
}
if (!is.character(args[4])) {
  stop("Parámetro4: groupNumber pode ser unha cadea de caracteres")
}
if (!grepl("^\\d+$", args[5]) || as.integer(args[5]) > 50 || as.integer(args[5]) == 0) {
  stop("Parámetro 5: numberPDF debe ser un número enteiro comprendido entre 1 e 50!!!")
}

##############
library(exams)

namesFiles <- function(numQuestions) {
  questions <- character(numQuestions)
  for (i in 1:numQuestions) {
    questions[i] <- paste("exame", i, sep = "")
  }
  return(questions)
}
courseNow <- function() {
  data <- Sys.Date()
  yearNow <- as.numeric(format(data, format = "%Y"))
  monthNow <- as.numeric(format(data, format = "%m"))
  if (monthNow >= 9) {
    yearNext <- yearNow + 1
  } else {
    yearNext <- yearNow
  }
  result <- paste(yearNow, "/", yearNext, sep = "")
  return(result)
}


numQuestions <- as.integer(args[1])
questions <- namesFiles(numQuestions)
valueQuestion <- round(10 / numQuestions, 2)
institutionText <- as.character(args[2])
namePDF <- as.character(args[3])

data <- Sys.Date()
dir <- getwd()
languageFile <- file.path(dir, "gl-mod.dcf")
logoFile <- file.path(dir, "Rlogo.png")
dirPDF <- file.path(dir, "nops_pdf")
groupNumber <- as.character(args[4])
curso <- courseNow()
titleText <- paste("Test ABCD - Curso ", curso, " - Data", sep = "")
pointsVector <- rep(valueQuestion, numQuestions)
numberPDF <- as.integer(args[5])

set.seed(403)

exams2nops(questions, name = namePDF, date = data, points = pointsVector, showpoints = TRUE, n = numberPDF, dir = dirPDF, language = languageFile, institution = institutionText, title = titleText, duplex = TRUE, course = groupNumber, blank="0", logo = logoFile, samepage = TRUE, reglength = 8)
