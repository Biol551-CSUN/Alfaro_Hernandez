######################################
### Today we are going to practice joins with data from Becker and Silbiger (2020)
### Created by: Margarita Alfaro ###
### Updated on: 2022-02-22 ###
##########################################

### LOad libraries ####
library(tidyverse)
library(here)

### load data ###
# environmental data from each site
EnviroData<-read_csv(here("week_5", "data", "site.characteristics.data.csv"))

#Thermal performance data
TPCData<-read_csv(here("week_5","data", "Topt_data.csv"))

glimpse(EnviroData)
glimpse(TPCData)
#also use View()

EnviroData_wide <- EnviroData %>%
  pivot_wider(names_from = parameter.measured, #pivot the data wider
              values_from = values)
view(EnviroData_wide) %>%
  arrange(site.letter) #arrange the dataframe by site

FullData_left <- left_join(TPCData, EnviroData_wide) %>% ### joining, by = "site.letter" 
  relocate(where(is.numeric), .after = where(is.character))

### summarise per site: mean and var
sum <- FullData_left %>%
  group_by(site.letter) %>%
  summarise_if(is.numeric, list(mean = mean, var = var), na.rm= TRUE) ### summarise if

head(FullData_left)

### Creating a tibble
### use a tibble()

T1 <- tibble(Site.ID = c("A", "B", "C", "D"), ### make your own data
             Temperature = c(14.1, 16.7, 15.3, 12.8))

T2 <- tibble(Site.ID = c("A", "B", "D", "E"),
             pH = c(7.3, 7.8, 8.1, 7.9))

#joining tibbles
left_join(T1, T2) ### will keep only what is on the left side. Joining by "Site.ID".
right_join(T1, T2) ### will lose what was on the left side that does not match right side

inner_join(T1,T2) ### inner join only keep data complete in both data sets (NAs dropped)
full_join(T1,T2) ### full join keeps everything (NA included)

semi_join(T1, T2) ### semi join keeps rows from first data set where there are matching values in 2nd data. keeps columns from first data set
anti_join(T1, T2) ### anti join keeps missing data









  
  
  
  
  







