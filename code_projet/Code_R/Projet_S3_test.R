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
#Importation des bases
base_premium2<-read.csv2("base_premium2.csv",sep=";",header=T)
base_premium2$id <- as.character(base_premium2$id) 
base_audience<-read.csv("base_audience.csv",sep=";",header=T)
base_audience$id <- as.character(base_audience$id)
base_sociodemo<-read.csv("base_sociodemo.csv",sep=";",header=T)
base_sociodemo$id <- as.character(base_sociodemo$id) 
#Merge des bases en 2 temps
data2 <- merge(base_premium2, base_sociodemo, by.x=c("id"),by.y=c("id"))
data <-merge(data2, base_audience, by.x=c("id"),by.y=c("id"))
# exportation de la base fussionn?e 
write.csv(data,file = "donne_TFE")



# Cr?ation d'un tableau pour observer le nombre de NA
var_na = (data %>% is.na %>% colSums)/nrow(data)*100
var_na = var_na %>% as_tibble 
SW_var_name = data %>% colnames 
SW_var_name = SW_var_name %>% as_tibble
SW_var_name
SW_var_na = SW_var_name %>% bind_cols(var_na)
SW_var_na %>% View

#age en fonction des CSP
data%>% group_by(data$cspi) %>% summarise(n=n(),age_moyen = mean(ag99),age_median =median(ag99))

# age moyen des auditeurs de skyrock
data  %>%
  group_by(audLV_SKYROCK,audWE_SKYROCK) %>%
  summarise(
    n = n(),
    moyenne_age = mean(ag99))
  )



data$sexe
names(data)
# nombre de femmes  et d'hommes
table(data$sexe)

# regroupement du facteur CSP
table(data[,46],data$sexe)

data[,46] = recode_factor(data[,46],
                          = "CSP_moins",
                          = "CSP_moins",
                           = "CSP_moins",
                           = "Autres_inactifs ",
                          = "CSP_plus",
                            = "CSP_plus",
                           =  "Autres_inactifs ",
                           =   "CSP_plus"                          )
data[,46] 

data$sexe = as.factor(data$sexe)
data$sexe = recode_factor(data$sexe,
                          "1"="Homme",
                          "2"="Femme")



l
################## ################## ################## ################## 
################## ################## ################## ################## 
#                                   2 eme partie
################## ################## ################## ################## 
################## ################## ################## ################## 
library(readxl)
data <- read_excel("TFE_Excel2.xlsm", sheet = "data2")

# recuperer l'audience des radios week end 
week = c('audWE_RADIO',
              'audWE_CHERIE',
              'audWE_EUROPE1',
              'audWE_FrBLEU',
              'audWE_FrCULTURE',
              'audWE_FrINFO',
              'audWE_FrINTER',
              'audWE_FrMUSIQUE',
              'audWE_FUN',
              'audWE_MRadio',
              'audWE_NOSTALGIE',
              'audWE_NRJ',
              'audWE_RClassique',
              'audWE_RFM',
              'audWE_RireChans',
              'audWE_RMC',
              'audWE_RTL',
              'audWE_RTL2',
              'audWE_SKYROCK',
              'audWE_VIRGIN') %>%as.factor()
# recuperer l'audience des radios semaine

semaine = data %>% select(starts_with('audLV')) 
nom_semaine = colnames(semaine) %>% as.factor()
#######################################################################
# GRAPHIQUE DES AUDITEUR SEMAINES ET WEEK END 
#######################################################################
#WEEK END 
# somme des diff?rnetes colonnes pour avoir le nombre d'auditeurs
radio_week = data[week] %>% colSums()
#radio_week = round((radio_week /4500 *100),2) %>%as.numeric()
radio_week = (radio_week /4500 ) %>%as.numeric()

# creation du dataframe
df = radio_week %>% data.frame()  
df_week = cbind(df,week) %>%arrange(df)
names(df_week) = c("Audience","Radio")
df_week['Audience'] =  round(df_week['Audience'],3)
# organisation des facteurs
df_week$Radio <- factor(df_week$Radio, levels = df_week$Radio[order(df_week$Audience)])
# Recoder le nom des variables 
df_week$Radio = recode_factor(df_week$Radio,"audWE_RClassique"="Radio Classique","audWE_MRadio"="M Radio", "audWE_FrMUSIQUE"="France Musique","audWE_FrCULTURE"="France Culture", "audWE_RireChans"="Rires et Chansons", "audWE_SKYROCK"="Skyrock",   "audWE_CHERIE"="Ch?rie FM",   
                               "audWE_FUN"="Fun Radio",       "audWE_RMC"="RMC"  ,     "audWE_VIRGIN"="Virgin"  ,  "audWE_EUROPE1"="Europe 1" ,  "audWE_RFM"='RFM'   ,    "audWE_RTL2"="RTL2" ,     "audWE_FrBLEU" = "France Bleu",  
                               "audWE_FrINFO"="France Info" ,   "audWE_NOSTALGIE"= "Nostalgie"," audWE_RTL" = "RTL"      , "audWE_NRJ" = "NRJ",       "audWE_FrINTER"="France Inter"  , "audWE_RADIO"="Audience Globale")

################################################################################
#                   SEMAINE
########################################################################
radio_semaine = data[nom_semaine] %>% colSums()
#radio_week = round((radio_week /4500 *100),2) %>%as.numeric()
radio_semaine = (radio_semaine /4500 ) %>%as.numeric()

# creation du dataframe
df = radio_semaine %>% data.frame()  
df_semaine = cbind(df,nom_semaine) %>%arrange(df)
names(df_semaine) = c("Audience","Radio")
df_semaine['Audience'] =  round(df_semaine['Audience'],3)
# organisation des facteurs
df_semaine$Radio <- factor(df_semaine$Radio, levels = df_semaine$Radio[order(df_semaine$Audience)])
# Recoder le nom des variables 
df_semaine$Radio = recode_factor(df_semaine$Radio,"audLV_RClassique"="Radio Classique","audLV_MRadio"="M Radio", "audLV_FrMUSIQUE"="France Musique","audLV_FrCULTURE"="France Culture", "audLV_RireChans"="Rires et Chansons", "audLV_SKYROCK"="Skyrock",   "audLV_CHERIE"="Ch?rie FM",   
                              "audLV_FUN"="Fun Radio",       "audLV_RMC"="RMC"  ,     "audLV_VIRGIN"="Virgin"  ,  "audLV_EUROPE1"="Europe 1" ,  "audLV_RFM"='RFM'   ,    "audLV_RTL2"="RTL2" ,     "audLV_FrBLEU" = "France Bleu",  
                              "audLV_FrINFO"="France Info" ,   "audLV_NOSTALGIE"= "Nostalgie", " audLV_RTL" = "RTL"      , "audLV_NRJ" = "NRJ",       "audLV_FrINTER"="France Inter"  , "audLV_RADIO"="Audience Globale")



# 1 er plot 
p<-ggplot(data=df_week, aes(x=Audience, y=Radio),label=Radio) +
  geom_bar(stat="identity")+ scale_x_continuous(labels = percent)+ geom_text(aes( label = scales::percent(Audience),
                                                                                  x= Audience ), stat= "identity", hjust = -.80)
                                            
p
##################################################### ################## ################## 
#                                     exporter sur excel
############################################################################## ################## 
# Write the first data set in a new workbook
write.xlsx(df_week, file = "TFE_Excel4.xlsx",
           sheetName = "Week", append = FALSE)
# Add a second data set in a new worksheet

# Add a third data set
write.xlsx(df_semaine, file = "TFE_Excel4.xlsx",
           sheetName="semaine", append=TRUE)

write.csv(df_semaine,file="semaine")
#################################################################################################
                                      PROC FRQ

############################################################################################
Donne_TFE<- read.csv2("Donne_TFE.csv",header = TRUE)
##################################
var_radio<-c(121,124,127,133) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=176,ncol=2)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE[,p], Donne_TFE$sexe),margin=2)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]

#########################################################################################################################
                                    PROC FRQ 2 

######################################################################################################################################################




# vecteur qui contient toutes mes radios
radio = c(seq(from=88, to=139,by=3),141) 
radio

# on ne garde que la premi?re ligne qui correspond au % d'auditeur


var_radio<-c(88,91,94,97,100,103,106,109,112,115,118,121,124,127,133,136,139,141) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=176,ncol=2)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE[,p], Donne_TFE$sexe),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
# arrondis et multiplication par 100
res_radio_sexe= round(res_radio_sexe*100,1)
res_radio_sexe






################################################################################################################################
                PROC FREQ SEMAINE
################################################################################################################################
colnames(data[,40:48])


var_radio<-c(40:48) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_semaine<-matrix(data=NA ,nrow=176,ncol=5)  # tableau vide

for( p in var_radio) {
  res_radio_semaine[p,]<-round(prop.table(table(data[,p])),3)
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}
res_radio_semaine<- res_radio_semaine[var_radio,]









