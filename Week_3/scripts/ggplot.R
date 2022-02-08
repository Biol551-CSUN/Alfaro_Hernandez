##############################
### ggplot for palmer penguins
### Created by: Margarita Alfaro
### Created on: 2022-02-08
################################

### load libraries ###
library(tidyverse)
library(palmerpenguins)

### data analysis ###
glimpse(penguins) # packages that create plots #

### start with penguin dataframe ###
ggplot(data=penguins, 
       mapping= aes(x = bill_depth_mm, 
                    y = bill_length_mm, 
                    color = species, 
                    shape = species, 
                    size = body_mass_g, 
                    alpha = flipper_length_mm)) +
  geom_point() + 
  labs(title = "Species", 
       subtitle = "length and depth", 
       x = "Bill depth (mm)", 
       y = "Bill length (mm)", 
       color = "species", 
       shape = "Species",
       caption = "Source: Palmer station LTER / 
       palmer penguins package") + 
  scale_color_viridis_d()

### Notes:quotes ("") are use in labels ###
### commas (,) are use within a function ###
### plus sign (+) add another layer after the end of a quote ### 
### alpha is use for transparency ###

### visualize data with setting ###
ggplot(data = penguins, 
       mapping = aes(x = bill_depth_mm,
        y = bill_length_mm)) + 
  geom_point(size = 4, alpha = 0.5, color = "red") 

### Plot  with facet grid ###
ggplot(data = penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm, 
                     color = species,)) + 
  geom_point() +
  facet_grid(species~sex)+ 
  guides(color = FALSE)

### Plot with facet wrap ###
ggplot(data = penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm)) + 
  geom_point() + 
  facet_wrap(~species, ncol=2)
