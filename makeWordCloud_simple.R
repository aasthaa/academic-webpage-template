setwd("/Users/aasthaa/Dropbox/Webpage")

install.packages("wordcloud")
library(wordcloud)

install.packages("tm")
library(tm)

source("makePaperCloud_manual.R")
makePaperCloud_manual("testFile.csv", "testOut.png")
