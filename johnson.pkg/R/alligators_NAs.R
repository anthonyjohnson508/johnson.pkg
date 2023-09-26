install.packages("tidyverse")
library(tidyverse)
Alligators <- read_csv("johnson.pkg/R/AlligatorPracticeData.csv")

alligators_NAs <- Alligators %>% 
  na.omit()
alligators_NAs
