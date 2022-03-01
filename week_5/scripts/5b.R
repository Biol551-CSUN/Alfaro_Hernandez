#################################
### lubridates date and times ###
### Created by: Margarita Alfaro ###
### Created on: 2022-02-24 ###
########################################

### Load libraries ###
library(tidyverse)
library(here)
library(lubridate)

### load data ###
condData <- read_csv(here("week_5", "Data", "CondData.csv"))

now() # what time is it now?
now(tzone = "EST") # What time is it on the east coast
now(tzone = "GMT") # What time in GMT

today() # what is the date?
today(tzone = "GMT")

am(now()) # is it morning?
leap_year(now()) # is it a leap year?

### will always give ISO format 
ymd("2021-02-24")
mdy("02/24/2021")
mdy("February 21 2021")
dmy("24/02/2021")
### y= year, m= month, d= day

ymd_hms("2021-02-24 10:22:20 PM")
mdy_hms("02/24/2021 22:22:20")
mdy_hm("February 24 2021 10:22 PM")
### h= hours, m= minutes, s= seconds

# make a character string
datetimes<-c("02/24/2021 22:22?20",
             "02/25/2021 11:21:10",
             "02/26/2021 8:01:52")

# convert to datetimes
datetimes <- mdy_hms(datetimes)

month(datetimes)
month(datetimes, label = TRUE, abbr = FALSE) # label= true for month abbr. abbr = FALSE for entire month spelled out

### extracts information form dataset
day(datetimes) # extract day
wday(datetimes, label = TRUE) # extracts days of the week
hour(datetimes)
minute(datetimes)
second(datetimes)

datetimes + hours(4) # this adds 4 hours
datetimes + days(2) # this adds 2 days

round_date(datetimes, "minute") # round to nearest minute
round_date(datetimes, "5 mins") # round to nearest 5 minute

CondData %>%
  mutate(datetime = mdy_hms(depth)) %>%
  drop_na()
