##########################
### Today we are going to plot penguin data ###
### Created by: Margarita Alfaro ###
### Created on: 2022-02-10 ###

### load libraries ###
library(palmerpenguins)
library(tidyverse)
library(here)

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm, 
                     y = bill_length_mm, group = species, 
                     color = species)) + 
  geom_point()+ geom_smooth(method = "lm")+
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)") + 
  scale_color_viridis_d()+ 
  scale_x_continuous(breaks = c(14, 17, 21), 
                     labels = c("low","medium","high")) + scale_y_continuous(limits = c(0,50))+
                     theme_bw() + 
                    theme(axis.title = element_text(size = 20, 
                                                    color = "red"), 
                          panel.background = element_rect(fill = "linen"), 
                          panel.border = element-rect(color = "green"))

ggsave(here("week_3","output","penguin.png"), 
width = 7, height = 5)

  