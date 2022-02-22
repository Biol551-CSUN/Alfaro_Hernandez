###################################
### Today we are going to practice tidy with biogeochemistry data from Hawaii ###
### Created by: Margarita Alfaro ###
### Created on: 2022-02-17
######################################

### load libraries ###
library(tidyverse)
library(here)

### load libraries ###
ChemData<-read_csv(here("week_4","data","chemicaldata_maunalua.csv"))
view(ChemData)
glimpse(ChemData)

### another way to remove all the NAs ###
ChemData_clean<-ChemData %>% 
  filter(complete.cases(.)) %>% #filters out everything that is not a complete row
separate(col = Tide_time, # choose the tide time col
         into = c("Tide","Time"), #separate it into two columns tide and time
         sep = "_", # separate by _
         remove = FALSE) %>% # keep the original tide_time column
  unite(col = "Site_zone", # the name of the NEW col
        c(Site,Zone), # the columns to unite
        sep = ".", # lets put a . in the middle
        remove = FALSE) # keep the original

head(ChemData_clean)

ChemData_long <-ChemData_clean %>% 
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you wnat to pivot. This says select the temp to percent SGD cols
               names_to = "Variables", # the names of the new cols with all the column names
               values_to = "Values") # names of the new column with all the values
view(ChemData_long)

ChemData_long %>% 
  group_by(Variables, Site, Zone, Tide) %>% # group by everything we want
  summarise(Param_means = mean(Values, na.rn = TRUE), # get mean
            Param_vars = var(Values, na.rm = TRUE), # get variance
            Param_sd = sd(values, na.rn = TRUE))

### create boxplot ###
ChemData_long %>% 
  ggplot(aes(x = Site, y = Values))+
  geom_boxplot()+
  facet_wrap(~Variables, scales = "free")

ChemData_wide<-ChemData_long %>%
  pivot_wider(names_from = Variables, # column with the names for the new column 
              values_from = Values) # column with the values
  
ChemData_clean<-ChemData %>% 
  filter(complete.cases(.)) %>% # filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time col
           into = c("Tide","Time"), # separate it into two columns tide and time
           sep = "_", # separate by _
           remove = FALSE) %>%
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says the temp to percent SGD cols
               names_to = "Variables", # the names of the new cols with all the new column names
               values_to = "Values") %>%  # names of the new column with all the values
  group_by(Variables, Site, Time) %>% 
  summarise(mean_vals = mean(Values, na.rm = TRUE)) %>% 
  pivot_wider(names_from = Variables,
                         values_from = mean_vals) %>% # notice it is now mean_vals as the col names
  write_csv(here("week_4","output","summary.csv")) # export as csv to the right folder
view(ChemData_clean)

