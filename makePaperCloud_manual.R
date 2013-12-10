
makePaperCloud_manual <- function(csvFile, outputFileName) {
  words <- read.csv(csvFile, header=F)
  words <- as.character(unlist(words))
  words <- sapply(words, function(x) paste("\"", x, "\"", sep=""))


  myCorpus <- Corpus(DataframeSource(data.frame(words)))
  #myCorpus <- tm_map(myCorpus, removePunctuation)
  #myCorpus <- tm_map(myCorpus, tolower)
  #myCorpus <- tm_map(myCorpus, function(x) removeWords(x, stopwords("english")))
  
  tdm <- TermDocumentMatrix(myCorpus, control=list(tolower=F))
  m <- as.matrix(tdm)
  v <- sort(rowSums(m),decreasing=TRUE)
  d <- data.frame(word = names(v), freq=v)

  words <- as.character(d$word)
  words <- as.vector(unlist(sapply(words, function(x) ((strsplit(x, split="\""))[[1]])[2] )))
  d$word <- words
  
  #pal = brewer.pal(9, "RdPu")
  #display.brewer.all()
  palRed = brewer.pal(9, "Reds")
  palGrey = brewer.pal(9, "Greys")
  pal <- c(palGrey[c(5,9)], palRed[7:9])
 
    #wordcloud(words = d$word, freq = d$freq, 
  #          min.freq = 1, max.words = Inf,
  #          random.order = FALSE, colors = pal,vfont=c("serif","bold"))

  wordcloud(words = d$word, freq = d$freq, 
            min.freq = 1, max.words = Inf,
            random.order = FALSE, colors = pal)

  png(outputFileName, width=12,height=8, units='in', res=400)
     wordcloud(words = d$word, freq = d$freq, 
            min.freq = 1, max.words = Inf,
            random.order = FALSE, colors = pal)
  dev.off()

}

