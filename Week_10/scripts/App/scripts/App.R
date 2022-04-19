### Load Libraries ###
library(shiny)
library(tidyverse)

### Create an Input ###
ui<-fluidPage(
  sliderInput(inputId = "num", # ID name for the input
              label = "Choose a number", # Label above the input
              value = 25, min =1, max = 100 # values for the slider
              ),
  textInput(inputId = "tittle", # new Id is tittle
            label = "Write a title",
            value = "Histogram of Random Normal Values"),
  plotOutput("hist"), # put the histogram here and creates space for a plot called hist
  verbatimTextOutput("stats") # create a space for stats
) # my user interface
# "ui" is how user interact with out interface

server<-function(input,output){
  
  data<-reactive({
    tibble(x = rnorm(input$num)) # 100 random normal points
  })
  
  # {} allows us to put all our R code in one nice chunk
  #(this line is omitted) data<-tibble(x = rnorm(input$num)) # 100 random normal points
 
   output$hist <- renderPlot({
    ggplot(data(),aes(x = x))+ # make a histogram
     geom_histogram()+
     labs(tittle = input$tittle) #add a new tittle
  })
  output$stats <- renderPrint({
    summary(data()) # calculate summary stats based on the numbers
    }) 
}
shinyApp(ui = ui, server = server)





