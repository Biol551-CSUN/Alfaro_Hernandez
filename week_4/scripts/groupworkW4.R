############################
### Group work ###
### Created by: Margarita Alfaro ###
### Created on: 2022-02-15 ###
##############################

### load libraries ###
library(palmerpenguins)
library(tidyverse)
library(here)

### load data ###
glimpse(penguins)
head(penguins)

install.packages('devtools')
devtools::install_github("dill/beyonce")
library(beyonce)

### part 1 ###
penguins %>%
  group_by(species, sex, island) %>%
  summarize(mean_bodymass = mean(body_mass_g, na.rm=TRUE), 
            variance_bodymass = var(body_mass_g, na.rm=TRUE)) %>% 
 drop_na(species, sex, island)

### part 2 ###
plot <- penguins %>% 
  filter(sex != "male") %>%
  mutate(log_mass = log(body_mass_g)) %>%
  select(species, sex, island, log_mass) %>%
  ggplot(aes(x = species, 
             y = log_mass, fill = species)) + 
  geom_boxplot(outlier.color=NA)+ 
             labs(title = "Log Body mass of Female Penguins", 
             subtitle = "Mean and variance of body mass by species,
         island, and sex without any NAs", x = "Species", y = "Body Mass(g)", 
                  color = "species",
             caption = "Source: Palmer Station LTER / palmerpenguins packages")+ 
  scale_fill_manual(values = beyonce_palette(5))

ggsave(here('week_4/output',"Box_plot.png"), plot)


  
  

  

