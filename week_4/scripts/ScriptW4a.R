################################################
### Today we are going to plot penguin data ###
### Created by: Margarita Alfaro ###
### Uptate on: 2022-02-15 ###
###################################

#### load libraries #######
library(palmerpenguins)
library(tidyverse)
library(here)

### load data #####
# the data is part of the package and is called penguins 
glimpse(penguins)
head(penguins)

### data ###
filter(.data = penguins, sex == "female") # this means (==) equal to and can be use to select only females
filter(.data = penguins, year == "2008",
       body_mass_g >5000) # to select specific year, a (,) after "2008" can be replaced for a (&)
filter(.data = penguins, 
       island != "dream" ) # the symbol "!" means that is not include it
filter(.data = penguins, 
       sex == "Adelie & Gentoo") # to select only two specific names
filter(.data = penguins, 
       species %in% c("Adeline","Gento")) # use " %in%" to refer to a specific in (group membership)
data2<-mutate(.data = penguins, 
              body_mass_kg =body_mass_g/1000,
              bill_length_depth = bill_length_mm/bill_depth_mm)
# convert mass to kg
# calculate the ratio of bill length to depth

view(data2) #to view data

data2<-mutate(.data =penguins, # mutate with ifelse
              after_2008 = ifelse(year>2008,
                                  "After 2008", "Before 2008"))
view(data2)

### practice with data2 ###
data2<-mutate(.data = penguins, flipper_length_mm + body_mass_g)

view(data2)
data2<-mutate(.data = penguins, 
              mass_big_small = ifelse(body_mass_g >4000, 
                                      "big", "small"))
view(data2)

penguins %>% # use penguin data frame
  filter(sex == "female") %>% #select or filter only females
  mutate(log_mass =log(body_mass_g)) %>% #calculate log biomass
         select(species, island, sex, log_mass) #we can also use the rename function instead of select
### summarize ###
penguins %>% # to summarized data
  summarise(mean_flipper = mean(flipper_length_mm,
                                na.rm=TRUE), 
            min_flipper = min(flipper_length_mm, 
                              na.rm=TRUE)) # calculate mean and mean flipper length
penguins %>% # to group by
  group_by(island) %>% # group_by () is more powerful when pu before summarize
  summarise(mean_bill_length = mean(bill_length_mm, 
                                    na.rn = TRUE), 
            max_bill_length = max(bill_length_mm, 
                                  na.rn=TRUE))
penguins %>% # to remove NAs
  drop_na(sex) %>% # drop all the rows that are missig data on sex
  group_by(island, sex) %>%
  summarise(mean_bill_length = mean(bill_length_mm,
                                    na.rm =TRUE))

penguins %>%
  drop_na(sex) %>%
  ggplot(aes(x =sex, # pipe into a ggplot
             y = flipper_length_mm)) + geom_boxplot()

