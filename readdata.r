url <- "http://www.ats.ucla.edu/stat/paperexamples/atkins_mlm/Atkins_JFP_data.txt"
data <- read.table(url,  header=TRUE, sep="\t")
summary(data)
plot(data$TIME, data$DAS)

