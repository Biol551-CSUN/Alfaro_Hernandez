###################################
### Group work number 2 ###
### Created by: Margarita Alfaro ###
### Created on: 2022-0217 ###
##################################

### load libraries ###
library(tidyverse)
library(here)
        
ChemData<-read_csv(here("week_4","data","chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)

ChemData1 <- ChemData %>% 
  filter(complete.cases(.)) %>% 
  separate(col = Tide_time,
           into = c("Tide","Time"),
           sep = "_",
           remove = TRUE) %>% 
  unite(col = "Site_Zone",
        c(Site,Zone),
        sep = "_",
        remove = TRUE)

view(ChemData1)

ChemData1 <- ChemData1 %>% 
  pivot_longer (cols = Temp_in:percent_sgd,
                names_to = "Variables",
                values_to = "Values")

view(ChemData1)

ChemData2 <- ChemData1 %>% 
  group_by(Variables, Time) %>%
  summarise(Param_means = mean(Values, na.rm = TRUE),
            Param_vars = var(Values, na.rm = TRUE),
            Param_sd = sd(Values, na.rm = TRUE)) %>%
write_csv(here("week_4", "output", "LabW4b.csv"))  
  
View(ChemData1)

ChemData2 %>% 
  ggplot(aes(x = Variables, 
             y = log10(Param_means +1), color= Time))+
  geom_area()+
  ggtitle("Temperature Data")+
  theme(plot.title= element_text(hjust = 0.5))
  labs(x= "Variables", y= "log of mean Parameter")+
  theme_light()
 
View(ChemData2)


