library(knitr); 
setwd("/home/ubuntu/i2b2/reportScripts/Report")

# Unique information
randomNumber <- floor(runif(1, 10000000, 99999999))
currentTimestamp <- print(as.numeric(Sys.time()))
tmpFolder <- paste('tmp/', randomNumber, currentTimestamp, sep='')

dir.create(tmpFolder, mode="0777")
dir.create(paste(tmpFolder, '/plots',  sep=''), mode="0777")

setwd(tmpFolder)
file.copy('../../layout/main.Rhtml', 'main.Rhtml')
file.copy('../../layout/main.css', 'main.css')

# Generate File
fileName <- 'main.html'
knit('../../layout/main.Rhtml', output=fileName)

# Output
report.output[["Report"]] <- readChar(fileName, file.info(fileName)$size)
report.output[[1]] <- "Hallo"
