
setwd("C:\\Documents and Settings\\abansal\\My Documents\\My Dropbox\\JobSearch\\Webpage")
setwd("/Users/aasthaa/Dropbox/JobSearch/Webpage")

install.packages("wordcloud")
library(wordcloud)

install.packages("tm")
library(tm)

install.packages("sendmailR")
library(sendmailR)


source("googleCite.r")
googleCite(theurl="http://scholar.google.com/citations?hl=en&user=UJoUVL8AAAAJ",
   theauthor="Aasthaa Bansal", pdfname="aasthaa_wordCloud.pdf")


makePaperCloud_manual("publishedArticles.csv", "unpublishedArticles.csv", "aasthaa_wordCloud_manual.pdf")

makePaperCloud_manual("publishedArticles.csv", "unpublishedArticles.csv", "aasthaa_wordCloud_manual2.png")


To see different fonts for argument in wordcloud():
http://gallery.r-enthusiasts.com/graph/Hershey_Vector_Fonts%3Cbr%3ESample_'a',13




source("makePaperCloud_manual.R")
makePaperCloud_manual("testFile.csv", "testOut.png")
