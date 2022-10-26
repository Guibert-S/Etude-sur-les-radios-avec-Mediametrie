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
res_radio_sexe<-matrix(data=NA ,nrow=186,ncol=4)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE2[,p], Donne_TFE2$radio_internet,exclude =  "#N/A"),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sexe = round(res_radio_sexe,3)

colnames(res_radio_sexe) = c(" Pas d'accord","Pas du tout d'accord","Plutôt d'accord")
colnames(res_radio_sexe) =c("13-25 ans","25-35 ans","35-50 ans","50-60 ans","60 ans et plus")
rownames(res_radio_sexe) = a

write.xlsx(res_radio_sexe, file = "TFE_Excel4.xlsx",
           sheetName="radio_internet_differe", append=TRUE)

# creation ecoute radio sur internent tout court
Donne_TFE2 = Donne_TFE2 %>% mutate('radio_internet' = pmin(Q3_1,Q3_2))
Donne_TFE2 %>% select(radio_internet) %>% unique
Donne_TFE2 %>% select(radio_internet) %>%   group_by(radio_internet) %>% summarise(n=n()) 
Donne_TFE2 %>% select(Q3_1) %>%   group_by(Q3_1) %>% summarise(n=n()) 
# presence de 0 dans les donne a la place de NA donc go changer ca ...
Donne_TFE2$Q3_1 = recode_factor(Donne_TFE2$Q3_1,"1"="1","2"="2","3"="3","4"=NULL,"0"=NULL)
Donne_TFE2$Q3_2 = recode_factor(Donne_TFE2$Q3_2,"1"="1","2"="2","3"="3","4"=NULL,"0"=NULL)
Donne_TFE2$radio_internet = recode_factor(Donne_TFE2$radio_internet,"1"="1","2"="2","3"="3","4"=NULL,"0"=NULL,"")
# remettre en numérique
Donne_TFE2$Q3_1= as.numeric(Donne_TFE2$Q3_1)
Donne_TFE2$Q3_2= as.numeric(Donne_TFE2$Q3_2)

# test 
prop.table(table(Donne_TFE2$radio_internet,Donne_TFE2$NRJ,exclud),margin = 1)[,1]

prop.table(table(Donne_TFE2$Q3_1,Donne_TFE2$,exclude = '#N/A'),margin = 1)[,1]
############################



var_radio<-c(88,91,94,97,100,103,106,109,112,115,118,121,124,127,130,133,136,139,141) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=186,ncol=3)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE2[,p], Donne_TFE2$Q3_1,exclude =  NA),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sexe = round(res_radio_sexe,3)

colnames(res_radio_sexe) = c(" Pas d'accord","Pas du tout d'accord","Plutôt d'accord")
colnames(res_radio_sexe) =c("13-25 ans","25-35 ans","35-50 ans","50-60 ans","60 ans et plus")
rownames(res_radio_sexe) = a

write.xlsx(res_radio_sexe, file = "TFE_Excel4.xlsx",
           sheetName="radio_DIREK", append=TRUE)




#########################♥ AGE 
var_radio<-c(88,91,94,97,100,103,106,109,112,115,118,121,124,127,130,133,136,139,141) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=186,ncol=4)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE2[,p], Donne_TFE2$Q3_2,exclude =  NA),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sexe = round(res_radio_sexe,3)

colnames(res_radio_sexe) = c(" Pas d'accord","Pas du tout d'accord","Plutôt d'accord")
colnames(res_radio_sexe) =c("13-25 ans","25-35 ans","35-50 ans","50-60 ans","60 ans et plus")
rownames(res_radio_sexe) = a

write.xlsx(res_radio_sexe, file = "TFE_Excel4.xlsx",
           sheetName="internet_CSp", append=TRUE)



res_radio_sexe=prop.table(table(Donne_TFE2$Age,Donne_TFE2$radio_internet,exclude = '#N/A'),margin = 1)[,1]

res_radio_sexe=prop.table(table(Donne_TFE2$CSP,Donne_TFE2$radio_internet,exclude = '#N/A'),margin = 1)
prop.table(table(Donne_TFE2$CSP,Donne_TFE2$radio_internet,exclude = '#N/A'),margin = 1)


# differre
prop.table(table(Donne_TFE2$CHERIE_FM,Donne_TFE2$Q3_2),margin = 1)

# sexe et radio internet
prop.table(table(Donne_TFE2$sexe,Donne_TFE2$radio_internet),margin = 1)

# moyenne auditeur écoute radio internet
sum(table(Donne_TFE2$radio_internet)) # 4070
round(1302/4070,4)
