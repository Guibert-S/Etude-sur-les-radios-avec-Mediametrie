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
data <- read_excel("TFE_Excel2.xlsm", sheet = "data2")
Donne_TFE<- read.csv2("Donne_TFE.csv",header = TRUE)
Donne_TFE2<- read.csv2("Donne_TFE2.csv",header = TRUE)

var_radio<-c(88,91,94,97,100,103,106,109,112,115,118,121,124,127,130,133,136,139,141) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=186,ncol=3)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE[,p], Donne_TFE$confiance_media,exclude =  "#N/A"),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sexe = round(res_radio_sexe,3)

colnames(res_radio_sexe) = c(" Pas d'accord","Pas du tout d'accord","Plutôt d'accord")
rownames(res_radio_sexe) = a

write.xlsx(res_radio_sexe, file = "TFE_Excel4.xlsx",
           sheetName="confiance_media", append=TRUE)
#test

prop.table(table(Donne_TFE$Nostalgie,Donne_TFE$,exclude =  "#N/A"),margin=1)
prop.table(table(Donne_TFE$CHERIE_FM,Donne_TFE$confiance_media),margin=1)
prop.table(table(Donne_TFE$Politique,Donne_TFE$confiance_media,exclude =  "#N/A"),margin=2)

Donne_TFE = Donne_TFE %>% mutate_at(var_radio,funs(recode(.,"#N/A"="Pas_du_tout_d_accord","Pas_d_accord"="Pas_d_accord","Plutot_d_accord"="Plutot_d_accord")))


data[,radio]
a = colnames(data[,radio])
