---
title: AMPHIBIAN Working Group 2014-2015
subtitle: "Switch2R 01 (http://goo.gl/LOCyBi)"
author: "Rich Jones"
date: "Monday, October 20, 2014"
output:
  slidy_presentation:
   font_adjustment: +1
   includes:
      in_header: header.html
      self-contained: false
---

![AMPHIBIAN logo](../logo-amphibian.jpg)

## 2014-2015 presentation series: Switch2R

- ![R icon](../ricon.jpg) 

    - is a *free* general purpose statistical software and programming language
    - is the lingua franca of statisticians
    - is eating the lunch of SAS and SPSS
    - learning is hard, so we're going to help each other and form a local R users group

---

 ![BRAUN logo](../logo-braun.png)
 
  - Narragansett Bay Area R Users
  - http://www.meetup.com/Narragansett-Bay-Area-R-Users/
  - BRAUN kick-off will be the second Switch2R/AMPHIBIAN meeting (November)
  - Why 
  
    + R User Groups are supportive environments
    + The closest R Users Group is in Boston
    + There has got to be some experienced R users in the area who can help us
  

---

# Switch2R Series

## October 2014: R Basics 

  - Install R
  - Install and load packages
  - Use R to 
  
    + read in a data set and 
    + generate some descriptive statistics and 
    + basic plots
  
  - R environments
  - Learning resources for R

---

## November 2014: Clean Data with R

 - Use R to clean data
 
     + make new variables
     + label variables and values
     + produce dataset documentation
     
 Monday, November 10, 2014, 2-3pm

---

## December 2014 Analysis with R

 - Use R to do multivariable analysis
 
    + Linear regression
    + Logistic regression
    + Survival analysis
    + Repeated measures mixed models

 Monday, December 8, 2014, 2-3pm.

--- 

## January 2015 Graphics with R (1/2)

Use R to produce high-quality, publication quality statistical graphics

 - Two systems

    + base graphics (http://goo.gl/e51V0a)
    + lattice (http://goo.gl/3EnSfa)

Monday, January 12, 2015, 2-3pm

---

## February 2015: Graphics with R (2/2)

Use R to produce high-quality, publication quality statistical graphics

  - Two more systems
 
    + ggplot2 (http://goo.gl/Ri05Pw)
    + ggvis (http://ggvis.rstudio.com/)

Monday, February 9, 2015, 2-3pm.

---

## March 2015 Reproducible research with R

  - R/Markdown

    + Documents
    + Slides 
  
Monday, March 16, 2015, 2-3pm.

--- 

## April 2015: GIS with R 

Maps and geospatial data analysis

Monday, April 13, 2015, 2-3pm.

---

## May 2015: Power and sample size

  - Canned programs and 
  - Simulation approach

Monday, May 11, 2015, 2-3pm.

---

## June, July Aug. 2015: Summer break

No meetings
July 2015 Latent Variable Models Workshop

  - Longitudinal Data Analysis Using R/lavaan and Mplus
  - Weds-Fri July 29 - 31, 9:30am - 4:00pm

---

## What is missing?

 - EMA data
   - see (http://www.rdocumentation.org/packages/funreg)
 - Something else?

---

## Installing R

---

# Installing R

Install R by googling for  "R Cran" 

<iframe width="1080" height="810" src="http://www.youtube.com/embed/0EB4VEnCZ44" frameborder="0" allowfullscreen></iframe>


---

## Installing R Packages

# What are R Packages

  - R has base packages and add-on packages

  - R base packages load automatically

  - R Users write packages and post them on the web (repositories)

    + CRAN
    + Bioconductor
    + Github
 
# Installing R & Packages

Here I am installing *Rcmdr*

<iframe width="1080" height="810" src="http://www.youtube.com/embed/csx5kCEhL3Y" frameborder="0" allowfullscreen></iframe>

---


## Read in Data

ASCII Data

Example at UCLA Institute for Digital Research and Education 

(http://www.ats.ucla.edu/stat/paperexamples/atkins_mlm/default.htm)

Atkins, D. C. (2005). Using multilevel models to analyze couple and family treatment data: 
Basic and advanced issues. *Journal of Family Psychology*, 19, 98-110. 

post-print version (PDF) (http://goo.gl/7uZiEH)

psycnet (http://psycnet.apa.org/journals/fam/19/1/98/)

findit at Brown full text (http://goo.gl/D6m2ID)


---


```r
# Read data from UCLA Web site
url <- "http://www.ats.ucla.edu/stat/paperexamples/atkins_mlm/Atkins_JFP_data.txt"
data <- read.csv(url, sep="\t", header=TRUE)
# show the first six lines
head(data)
```

```
##   ID SEX THERAPY TIME   DAS PILOT MISS M.IND
## 1  1   0    -0.5    0 94.51     1    0     1
## 2  1   0    -0.5   13 87.53     1    0     1
## 3  1   0    -0.5   26 81.47     1    1     1
## 4  1   0    -0.5   35 83.45     1    1     1
## 5  1   1    -0.5    0 81.28     1    0     1
## 6  1   1    -0.5   13 68.80     1    0     1
```

---

# Other ways to read in data

  - R Package: foreign 
  
    + SPSS
    + SAS
    + Stata
    + and others 
    
  - R package: sjPlot 
  
    + specifically for SPSS

---

## Basic descriptive statitics

```r
summary(data)
```

```
##        ID             SEX         THERAPY          TIME      
##  Min.   :  1.0   Min.   :0.0   Min.   :-0.5   Min.   : 0.00  
##  1st Qu.: 34.0   1st Qu.:0.0   1st Qu.:-0.5   1st Qu.: 9.75  
##  Median : 67.5   Median :0.5   Median : 0.0   Median :19.50  
##  Mean   : 67.5   Mean   :0.5   Mean   : 0.0   Mean   :18.50  
##  3rd Qu.:101.0   3rd Qu.:1.0   3rd Qu.: 0.5   3rd Qu.:28.25  
##  Max.   :134.0   Max.   :1.0   Max.   : 0.5   Max.   :35.00  
##       DAS            PILOT            MISS            M.IND      
##  Min.   : 40.7   Min.   :0.000   Min.   :0.0000   Min.   :0.000  
##  1st Qu.: 77.8   1st Qu.:0.000   1st Qu.:0.0000   1st Qu.:0.000  
##  Median : 88.2   Median :0.000   Median :0.0000   Median :0.000  
##  Mean   : 89.0   Mean   :0.224   Mean   :0.0784   Mean   :0.157  
##  3rd Qu.: 99.1   3rd Qu.:0.000   3rd Qu.:0.0000   3rd Qu.:0.000  
##  Max.   :154.3   Max.   :1.000   Max.   :1.0000   Max.   :1.000
```

---

# More descriptive statistics


```r
library(pipeR)
library(xtable)
library(plyr)

data %>>%
  {do.call(data.frame, 
           list(mean = apply(., 2, mean),
                sd = apply(., 2, sd),
                median = apply(., 2, median),
                min = apply(., 2, min),
                max = apply(., 2, max),
                n = apply(., 2, length)))} %>>%
  xtable(caption = "Summary of the data", 
         digits=2) %>>%
  print(type = "html", caption.placement="top",
        html.table.attributes = FALSE)
```

<!-- html table generated in R 3.1.1 by xtable 1.7-3 package -->
<!-- Mon Oct 20 21:51:23 2014 -->
<TABLE FALSE>
<CAPTION ALIGN="top"> Summary of the data </CAPTION>
<TR> <TH>  </TH> <TH> mean </TH> <TH> sd </TH> <TH> median </TH> <TH> min </TH> <TH> max </TH> <TH> n </TH>  </TR>
  <TR> <TD align="right"> ID </TD> <TD align="right"> 67.50 </TD> <TD align="right"> 38.70 </TD> <TD align="right"> 67.50 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 134.00 </TD> <TD align="right"> 1072 </TD> </TR>
  <TR> <TD align="right"> SEX </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.00 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 1072 </TD> </TR>
  <TR> <TD align="right"> THERAPY </TD> <TD align="right"> 0.00 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.00 </TD> <TD align="right"> -0.50 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 1072 </TD> </TR>
  <TR> <TD align="right"> TIME </TD> <TD align="right"> 18.50 </TD> <TD align="right"> 13.24 </TD> <TD align="right"> 19.50 </TD> <TD align="right"> 0.00 </TD> <TD align="right"> 35.00 </TD> <TD align="right"> 1072 </TD> </TR>
  <TR> <TD align="right"> DAS </TD> <TD align="right"> 89.00 </TD> <TD align="right"> 16.67 </TD> <TD align="right"> 88.19 </TD> <TD align="right"> 40.66 </TD> <TD align="right"> 154.31 </TD> <TD align="right"> 1072 </TD> </TR>
  <TR> <TD align="right"> PILOT </TD> <TD align="right"> 0.22 </TD> <TD align="right"> 0.42 </TD> <TD align="right"> 0.00 </TD> <TD align="right"> 0.00 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 1072 </TD> </TR>
  <TR> <TD align="right"> MISS </TD> <TD align="right"> 0.08 </TD> <TD align="right"> 0.27 </TD> <TD align="right"> 0.00 </TD> <TD align="right"> 0.00 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 1072 </TD> </TR>
  <TR> <TD align="right"> M.IND </TD> <TD align="right"> 0.16 </TD> <TD align="right"> 0.36 </TD> <TD align="right"> 0.00 </TD> <TD align="right"> 0.00 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 1072 </TD> </TR>
   </TABLE>

---

## R Environments

# R Environments
  - Regular R (Revolution R Open)
  - RStudio
  - RCmdr


---

# Regular R (Revolution R Open looks and feels the same)

<iframe width="1080" height="810" src="http://www.youtube.com/embed/PMK_i-wTCYY" frameborder="0" allowfullscreen></iframe>

---

# RStudio

<iframe width="1080" height="810" src="http://www.youtube.com/embed/t15SfDqAdTg" frameborder="0" allowfullscreen></iframe>

---

# RCmdr

<iframe width="1080" height="810" src="http://www.youtube.com/embed/KJm6_KSVYds" frameborder="0" allowfullscreen></iframe>


---

## Where to get more information

---

# Training

  * COURSERA Data Science from Johns Hopkins University
    * The Data Scientist's Toolbox
    * R Programming
    * Getting and Cleaning Data
    * Exploratory Data Analysis
    * Reproducible Research
    * Statistical Inference
    * Regression Models
    * Practical Machine Learning
    * Developing Data Products
  
---

# Web Sites

  * R-Bloggers (http://www.r-bloggers.com/)
  * 2 minute R (http://www.twotorials.com/)
  * Quick-R (http://www.statmethods.net/)
  * Search all R documentation (http://www.rdocumentation.org/)
  * Google (http://www.google.com/)
  * Twitter (#rstats)
  
---

## See you next time

 Use R to clean data
 
 Monday, November 10, 2014, 2-3pm
 
 Inaugural BRAUN  meeting
 
 






