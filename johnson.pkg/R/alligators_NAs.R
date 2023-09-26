# installing packages and loading data

install.packages("tidyverse")
library(tidyverse)

#loading data from CSV
Alligators <- read_csv("johnson.pkg/R/AlligatorPracticeData.csv")

#cleaning data by removing NAs

alligators_NAs <- Alligators %>% 
  na.omit()
alligators_NAs
