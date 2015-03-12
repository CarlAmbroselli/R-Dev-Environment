library(knitr); 
setwd("/home/ubuntu/i2b2/reportScripts/Report")
knit('main.Rhtml')
fileName <- 'main.html'
report.output[["Report"]] <- readChar(fileName, file.info(fileName)$size)
