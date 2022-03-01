################################
### Created by: Margarita Alfaro ###
### Created on: 2022-02-24 ###
#######################################

### Load libraries ###
library(tidyverse)
library(here)
library(lubridate)
library(ggplot2)
library(beyonce)

### load data ###
CondData<- read_csv(here("weeK_5", "data", "CondData.csv"))
DepthData <- read_csv(here("week_5", "data", "DepthData.csv"))

CD <- condData %>%
  mutate(CD = mdy_hms(depth)) %>% # adds new colums
  drop_na() %>%
  mutate(Datetime = round_date(CD, "10 sec")) %>% # add "DateTime" to create new column
  mutate(date = Datetime) %>% #creates new column names "date"
  select(date, TempInSitu, SalinityInSitu_1pCal) %>%
  inner_join(DepthData) %>% # inner joins, joins both data set
  mutate(hour = hour(date)) %>% # creates a column name "hou"
  mutate(minute = minute(date)) %>% #creates column named "minute
  mutate(day = day(date)) %>%
  unite(col = "HourMin", #unites the hour and minute column into a column named "HourMin"
        c(hour, minute),
        sep = ":", #separates the hour and minute by ":"
        remove = TRUE) %>%
  group_by(HourMin) %>%
  summarise(MeanDepth = mean(Depth, na.rm = TRUE), #Depth in mts
            MeanSalinity = mean(SalinityInSitu_1pCal, na.rm =TRUE),
            MeanTemp = mean(TempInSitu, na.rm = TRUE),
            MeanDate = mean(date, na.rm = TRUE))

CD %>%
  ggplot(aes(x= MeanDate, y= MeanTemp)) + #plotting MeanDate vs MeanTemp
  geom_line(color = "red")+ #line graph
  labs(x= "TIME", y= "Temperature (C)", title = "Average Temperature Over time")+
  theme(plot.title = element_text(hjust = 0.5)) # centers the title

ggsave(here("week_5", "output", "Conductivity_Depth.png"))



  
  
  
  
  
  
  



