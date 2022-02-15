################################
#### homework 3 ###
### Created by: Margarita Alfaro ###
### Created on: 2022-02-10 ###
#################################

library(palmerpenguins)
library(tidyverse)
library(here)

### Plot ###
ggplot(data = penguins, 
       mapping =aes (x = bill_depth_mm, 
                     y = bill_length_mm, 
                     group = species, 
                     color = species)) + 
  geom_boxplot() + labs(x = "Bill Depth (mm)", 
                        y = "Bill Lenth (mm)") + 
  scale_color_viridis_d() +
  theme_grey()
                        
                     