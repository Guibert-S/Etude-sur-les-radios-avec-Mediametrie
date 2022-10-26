library(readr)
library(ggplot2)
library(dplyr)
library(knitr)
library(readr)
library(forcats)
library(magrittr)
library(scales)
library(viridis)
library(stringr)
library(xlsx)
library(forcats)
library(tidyverse)
library(readxl)
library(plotly)
library(readr)
#df<- read.csv2("donne_shiny.csv",header = TRUE)

#df<- read.csv2("donne_shiny.csv",header = TRUE)
#df = df[1:19,1:3]
#colnames(df) = c("Radio","Audience_Week_end","Audience_Semaine")




library(shiny)

df <- read_delim("C:/Users/samue/OneDrive/Bureau/Ecole/2A/Projet_S3/Shiny_plan/donne_shiny.csv", 
                          ";")
df = df[1:19,1:3]
colnames(df)= c("1","2","3","4")





ui=shinyUI(fluidPage(
  titlePanel("Etude sur les radios en France"),
  selectInput("choix_x", "Choix des variables", c("2","3")),
  plotOutput("nuage"),
  
))



# Define server logic required to draw a histogram
server = function(input, output) {
  output$nuage <- renderPlot({
    plotly(df,x=~df[,choix_x],y=~1,type="bar")
  })
  

 
}


# Run the application 
shinyApp(ui = ui, server = server)


