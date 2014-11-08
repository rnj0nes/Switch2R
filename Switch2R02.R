
## ------------------------------------------------------------------------
work <- "c:/work/shows/switch2r"
setwd(work)
getwd()


## ----, results='hide', message=FALSE-------------------------------------
# install.packages("lubridate")
# install.packages("psych")
# install.packages("gmodels")
# install.packages("Hmisc")
# install.packages("sjPlot")
require(lubridate) # easy handling of dates and times
require(psych)    # using the scoreItems command 
require(Hmisc)    # using the describe command
require(sjPlot)   # tools for reading SPSS formatted data
require(gmodels)  # using the CrossTable command


## ------------------------------------------------------------------------
# Read data from UCLA Web site
url <- "http://www.ats.ucla.edu/stat/paperexamples/atkins_mlm/Atkins_JFP_data.txt"
data <- read.csv(url, sep="\t", header=TRUE)
# I like all lowercase variable names
names(data)<- tolower(names(data)) 
# show the first 15 lines
head(data, 15)


## ------------------------------------------------------------------------
data$tx <- 1 # New variable tx in data.frame data = 1 (by default)
data$tx[which(data$therapy==0.5)] <- 2 # if therapy == 0.5 data$tx = 2
str(data[,c("tx","therapy")]) # show the characteristics of two variables
# Now check
table(data$tx, data$therapy) # a crosstab of tx and therapy in data.frame data


## ------------------------------------------------------------------------
CrossTable(data$tx, data$therapy, 
  missing.include=TRUE, 
  prop.r=FALSE, 
  prop.c=FALSE, 
  prop.t=FALSE, 
  prop.chisq=FALSE)


## ------------------------------------------------------------------------
tab <- function(r,c) {
  CrossTable(r, c, 
    missing.include=TRUE, prop.r=FALSE, prop.c=FALSE, prop.t=FALSE, 
    prop.chisq=FALSE)
}



## ------------------------------------------------------------------------
tab(data$tx,data$therapy)


## ------------------------------------------------------------------------
data$male <- 0 # initialize to 0
data$male[which(data$sex!=1)] <- 1 # sex is 0:Husband 1:Wife
tab(data$male,data$sex)


## ------------------------------------------------------------------------
set.seed(3481)
data$year <- sample(1:3,nrow(data),replace=T)+2008
data$day <-  sample(1:27,nrow(data),replace=T)
data$month <- round(runif(nrow(data),0.51,12.49))


## ------------------------------------------------------------------------
str(data[,c("day","month","year")])


## ------------------------------------------------------------------------
table(data$day)
table(data$month)
table(data$year)


## ------------------------------------------------------------------------
the.time.is.now <- now()
the.time.is.now.numeric <- as.numeric(now())
the.time.is.now
the.time.is.now.numeric
as.numeric(mdy("1/1/1970"))
as.numeric(mdy("1/2/1970"))
60*60*24
str(the.time.is.now)


## ------------------------------------------------------------------------
data$year <- as.character(data$year)
data$month <- as.character(data$month)
data$day <- as.character(data$day)
data$date <- mdy(paste0(data$month,"/",data$day,"/",data$year))
head(data[,c("year","month","day","date")])


## ------------------------------------------------------------------------
work <- "c:/work/shows/switch2r" # my working folder
setwd(work) # change to it
getwd() # check it


## ------------------------------------------------------------------------
dir("./NCSR")


## ----, results='hide', message=FALSE-------------------------------------
spssdata <- sji.SPSS("./NCSR/20240-0002-Data.sav")
# sji.viewSPSS(spssdata) # opens in the Rstudio Viewer Panel
# Or in a browser window if you're running the R Console


## ----, results='hide', message=FALSE-------------------------------------
#sji.viewSPSS(spssdata, file="codebook.html", showFreq = TRUE, useViewer = FALSE)
codebookpath <- file.path(work,"codebook.html")


## ------------------------------------------------------------------------
psitems <- c("PS1A", "PS1B", "PS1C", "PS1D", "PS1E", "PS1F")
describe(spssdata[psitems])


## ------------------------------------------------------------------------
key <- c(1,1,1,1,1,1) # the "right" answers
results <- scoreItems(
  items = spssdata[psitems],
  keys = key, 
  totals = TRUE, 
  missing = TRUE, # missing data are imputed
  impute = "none"  # person's non-missing mean response used for missing
  )


## ------------------------------------------------------------------------
results


## ------------------------------------------------------------------------
str(results)


## ------------------------------------------------------------------------
table(results$missing)


## ------------------------------------------------------------------------
results$alpha


## ------------------------------------------------------------------------
alpha <- round(results$alpha,2)


## ------------------------------------------------------------------------
str(results$response.freq)
results$response.freq


## ------------------------------------------------------------------------
spssdata$pscount <- results$score 


