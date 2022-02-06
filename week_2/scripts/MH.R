#####################################
### This is my first script. I am learning how to import data
### Created by: Margarita Alfaro
### Created on: 2022-02-03
##############################################

### load libraries #########
library(tidyverse)
library(here)

### Read in data ####
WeightData<-read_csv(here("week_2","data","weightdata.csv"))

# Data analysis ####
head(WeightData) # looks at the top 6 lines
tail(WeightData) # looks at the bottom 6 lines of the dataframe
View(WeightData) # view the dataset