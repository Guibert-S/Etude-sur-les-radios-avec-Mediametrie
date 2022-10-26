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
library(viridis)
library(hrbrthemes)
library(plotly)
df<- read.csv2("Donne_TFE2.csv",header = TRUE)

#Confiance
df$Q2_15 = recode_factor(df$Q2_15,"1"="1","2"="1","3"="3","4"="3","0"=NULL)

var_radio<-c(88,91,94,97,100,103,106,109,112,115,118,121,124,127,130,133,136,139,141) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=186,ncol=2)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(df[,p], df$Q2_15),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sexe = round(res_radio_sexe,3) 

radio_confiance=as.data.frame(res_radio_sexe)
ggplot

prop.table(table(df$NRJ,df$Q2_15),margin = 1)




mtcars = mtcars
ggplot(mtcars,aes(y=mpg,x=rownames(mtcars)))+geom_bar(stat = "identity")+ coord_flip()

plot_ly(y=d,x=c,type="bar")       
plot_ly(y=mtcars$mpg,x=rownames(mtcars),type="bar") 

# Tentative shiny
df<- read.csv2("donne_shiny.csv",header = TRUE)
df = df[1:19,1:3]
colnames(df) = c("Radio","Audience_Week_end","Audience Semaine")

plot_ly(data=df,y=~Audience.Week.end,x=~ï..Radio,type="bar") 
plot_ly(data=df,y=~Audience_Week_end,x=~Radio,type="bar") 
df
colnames(df)


ggplot(df,aes(Audience_Week_end,Radio))+geom_bar(stat="identity",color="white",fill="#87CEEB")

r=ggplot(df,aes(Audience_Week_end,Radio))+geom_bar(stat="identity")
ggplotly(r)


colnames(df)
colnames(df2)
colnames(df3)
colnames(df4)
colnames(df5)

df = read.csv2(file="donne_shiny.csv")
df2 =read.csv2(file="donne_shiny2.csv")
df4 =read.csv2(file="df4.csv")
df5 =read.csv2(file="df5.csv")


plot_ly(df, x = ~Horaire_CSP, y = ~CSP, color = ~Groupe_CSP, type='bar') %>% 
  layout(barmode = 'stack')


plot_ly(df2, x = ~Radio2, y = ~Ecoute_internet, color = ~X.1, type='bar') %>% 
  layout(barmode = 'stack')


plot_ly(df4, x = ~ï..Radio, y = ~Picardie, type='bar') 


plot_ly(df4, x = df4$ï..Radio, y = df4$Ile.de.France, type='bar')

plot_ly(df4, x = df4$Colonne1, y = df4$ActualitÃ.s.Internationales, type='bar',color = df4$Colonne1)
        
        
plot_ly(df4, x = df4$Radio, y = df4$Actualites_internationales, type='bar',color = df4$Actualites_internationales_color)

levels(df$Horaire) =c("5-6H" ,   "6-9H",    "9-12H"  , "12-14 H" ,"14-16H" , "16-18H" , "18-20H" , "20-24H" , "24-5H")
plot_ly(df, x = ~Horaire, y = ~Horaire_semaine, type='bar') %>% layout(xaxis=list(categoryarray =~Horaire,categoryorder="array"))

