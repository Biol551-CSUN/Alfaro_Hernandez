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
filter(.data = penguins, sex == "female") # (==) to select only females
filter(.data = penguins, year == "2008",
       body_mass_g >5000) # to select specific year, a (,) after "2008" can be replaced for a (&)
filter(.data = penguins, 
       island != "dream" )
filter(.data = penguins, 
       sex == "Adelie & Gentoo")
filter(.data = penguins, 
       species %in% c("Adeline","Gento"))
data2<-mutate(.data = penguins, 
              body_mass_kg =body_mass_g/1000,
              bill_length_depth = bill_length_mm/bill_depth_mm)

view(data2) #to view data

data2<-mutate(.data =penguins, 
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
  filter(sex == "female") %>% #select females
  mutate(log_mass =log(body_mass_g)) %>% #calculate log biomass
         select(species, island, sex, log_mass) #we can also use the rename function instead of select
### summarize ###
penguins %>% #
  summarise(mean_flipper = mean(flipper_length_mm,
                                na.rm=TRUE), 
            min_flipper = min(flipper_length_mm, 
                              na.rm=TRUE)) # calculate mean and mean flipper length
penguins %>%
  group_by(island) %>%
  summarise(mean_bill_length = mean(bill_length_mm, 
                                    na.rn = TRUE), 
            max_bill_length = max(bill_length_mm, 
                                  na.rn=TRUE))
penguins %>%
  drop_na(sex) %>%
  group_by(island, sex) %>%
  summarise(mean_bill_length = mean(bill_length_mm,
                                    na.rm =TRUE))

penguins %>%
  drop_na(sex) %>%
  ggplot(aes(x =sex, 
             y = flipper_length_mm)) + geom_boxplot()

