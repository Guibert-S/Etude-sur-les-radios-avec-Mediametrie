library(readxl)
data <- read_excel("TFE_Excel2.xlsm", sheet = "data2")


data$radioLV0_1
head(data$radioLV0_1)

# Nombre de NA 
data %>%  group_by(radioLV0_1)%>% summarise(n=n())   # 311 NA

data %>%group_by(radioLV0_1,radioLV0_2)  %>% summarise_at(n=n())
data %>%  group_rows(radioLV0_1,radioLV0_2,radioLV0_3,radioLV0_4,radioLV0_5,radioLV0_6,radioLV0_7,radioLV0_8,radioLV0_9) 

x=data %>%  group_by(radioLV0_1)%>% summarise(n=n()) %>% filter(radioLV0_1==1 |radioLV0_1==2)
y = data %>%  select(radioLV0_1) %>% filter(radioLV0_1==1) %>%  prop.table(table()) %>%
table(data$radioLV0_1)
# regroupement des heures en semaines
data = data %>% mutate('5H à 9H' = pmin(radioLV0_1,radioLV0_2))
data = data %>% mutate('9H à 14H' = pmin(radioLV0_3,radioLV0_4))               
data = data %>% mutate('14H à 18H' = pmin(radioLV0_5,radioLV0_6)) 
data = data %>% mutate('18H à 24H' = pmin(radioLV0_7,radioLV0_8))
data = data %>% mutate('24H à 5H' = radioLV0_9)



# Creation du tableau pour le graphique
cinq_h= round(prop.table(table(data$radioLV0_1)),2) 
# recuperer la table des fréquence
test = lapply(data[,Radio_Semaine],table ) %>%as.data.frame 
# supprimer les colonnes inutiles
test =select(test,ends_with("Freq"))
test = round(test/4189,3)   # sum(!is.na(data$radioLV0_1)) # 4189 ne sont pas NA
colnames(test) = 
test = slice(test,1:2) %>% t
colnames(test) = c("Presque tous les jours")
# Recodages des facteurs

# tentative mais ne marche pas
data %>% rowsum.data.frame()%>% select (radioLV0_1,radioLV0_2,radioLV0_3,radioLV0_4,radioLV0_5,radioLV0_6,radioLV0_7,radioLV0_8,radioLV0_9)%>%  recode_factor("1"="Presque tous les jours","2"="Presque tous les jours","3"="Moins souvent","4"="Moins souvent","5"="Jamais")

# recuperer le nom des colonnes radios semaine
Radio_Semaine =  colnames(data[,40:48])
# Convertir les 8 radios en factor
data[,Radio_Semaine] = lapply(data[,Radio_Semaine],factor)


# Recoder toutes les variables utiles en semaine
data2 = data %>% mutate_at(Radio_Semaine,funs(recode(.,"1"="Presque tous les jours","2"="Presque tous les jours","3"="Moins souvent","4"="Moins souvent","5"="Jamais")))


# Regroupement WEEK END (samedi et dimanche)
data = data %>% mutate('radioW0_1' = pmin(radioSA0_1,radioDI0_1))
data = data %>% mutate('radioW0_2' = pmin(radioSA0_2,radioDI0_2))
data = data %>% mutate('radioW0_3' = pmin(radioSA0_3,radioDI0_3))
data = data %>% mutate('radioW0_4' = pmin(radioSA0_4,radioDI0_4))
data = data %>% mutate('radioW0_5' = pmin(radioSA0_5,radioDI0_5))
data = data %>% mutate('radioW0_6' = pmin(radioSA0_6,radioDI0_6))
data = data %>% mutate('radioW0_7' = pmin(radioSA0_7,radioDI0_7))
data = data %>% mutate('radioW0_8' = pmin(radioSA0_8,radioDI0_8))
data = data %>% mutate('radioW0_9' = pmin(radioSA0_9,radioDI0_9))


################################################################################################################################
PROC FREQ SEMAINE
################################################################################################################################
colnames(data[,40:48])


var_radio<-c(40:48) 
res_radio_semaine<-matrix(data=NA ,nrow=176,ncol=5)  # tableau vide

for( p in var_radio) {
  res_radio_semaine[p,]<-round(prop.table(table(data[,p])),3)
  
}
res_radio_semaine<- res_radio_semaine[var_radio,]
# renommage des lignes
rownames(res_radio_semaine) = c("5 à 6H","6 à 9H","9 à 12H","12 à 14H","14 à 16H","16 à 18H","18 à 20H","20 à 24H","24 à 5H")

################################################################################################################################
PROC FREQ WEEK END
################################################################################################################################

colnames(data[,177:185])

var_radio<-c(177:185) 
res_radio_W<-matrix(data=NA ,nrow=185,ncol=5)  # tableau vide

for( p in var_radio) {
  res_radio_W[p,]<-round(prop.table(table(data[,p])),3)
  
}
res_radio_W<- res_radio_W[var_radio,]


######################## EXPORTATION SUR EXCEL ################################################
write.xlsx(df_semaine, file = "TFE_Excel4.xlsx",
           sheetName="SEMA", append=TRUE)

write.csv(df_semaine,file="semaine")

prop.table(table(data$radioLV0_1))*100
prop.table(table(data$radioLV0_2))*100

prop.table(table(data$radioLV0_2,data$info_actualite))*100
