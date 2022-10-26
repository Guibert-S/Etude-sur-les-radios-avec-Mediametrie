library(sqldf)
sqldf("select sum(France_Bleu)from Donne_TFE2 group by rg22")

var_radio<-c(88,91,94,97,100,103,106,109,112,115,118,121,124,127,130,133,136,139,141) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=186,ncol=22)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE2[,p], Donne_TFE2$rg22),margin=2)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sexe = round(res_radio_sexe,3)     

colnames(res_radio_sexe) = c("Ile-de-France","Champagne Ardenne","Picardie","Haute-Normandie","Centre","Nord-Pas-de-Calais",
                                "Lorraine","Alsace","Franche-Comté","Basse-Normandie","Pays de la Loire",
                                "Bretagne","Limousin","Auvergne","Poitou-Charentes","Aquitaine","Midi-Pyrénées",
                                "Bourgogne","Rhône-Alpes","Languedoc-Roussillon","Provence-Alpes-Côte d'Azur","Corse")

prop.table(table(Donne_TFE2$rg22,Donne_TFE2$France_Bleu),margin = 1)[,1]
prop.table(table(Donne_TFE2$rg22,Donne_TFE2$France_Bleu),margin = 1)
prop.table(table(Donne_TFE2$rg22,Donne_TFE2$France_Bleu),margin = 2)
prop.table(table(Donne_TFE2$rg22,Donne_TFE2$France_Bleu),margin = 2)[,1]

Donne_TFE2$rg22 = recode_factor(Donne_TFE2$rg22,"1"="Ile-de-France","2"="Champagne Ardenne","3"="Picardie","4"="Haute-Normandie","5"="Centre","6"="Nord-Pas-de-Calais",
                                "7"="Lorraine","8"="Alsace","9"="Franche-Comté","10"="Basse-Normandie","11"="Pays de la Loire",
                                "12"="Bretagne","13"="Limousin","14"="Auvergne","15"="Poitou-Charentes","16"="Aquitaine","17"="Midi-Pyrénées",
                                "18"="Bourgogne","19"="Rhône-Alpes","20"="Languedoc-Roussillon","21"="Provence-Alpes-Côte d'Azur","22"="Corse")

Donne_TFE2$rg22


write.xlsx(res_radio_sexe, file = "TFE_Excel4.xlsx",
           sheetName="region_22_margin2", append=TRUE)

##############################################################



var_radio<-c(88,91,94,97,100,103,106,109,112,115,118,121,124,127,130,133,136,139,141) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=186,ncol=3)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE2[,p], Donne_TFE2$Actualite_regionale,exclude = "#N/A"),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sexe = round(res_radio_sexe,3)  


prop.table(table(Donne_TFE2$VIRGIN,Donne_TFE2$Actualite_regionale,exclude = "#N/A"),margin = 1)


write.xlsx(res_radio_sexe, file = "TFE_Excel4.xlsx",
           sheetName="radio_actu_region", append=TRUE)


##### Vous informe sur ce qui se passe dans votre ville et votre région
#  Q2_2 = monde  Q2_2 = region
Donne_TFE2$Q2_2 = recode_factor(Donne_TFE2$Q2_2,"1"="1","2"="1","3"="3","4"="3","0"=NULL)
Donne_TFE2$Q2_2 = as.numeric(Donne_TFE2$Q2_2)
Donne_TFE2$Q2_2 

Donne_TFE2$Q2_3 = recode_factor(Donne_TFE2$Q2_3,"1"="1","2"="1","3"="3","4"="3","0"=NULL)
Donne_TFE2$Q2_3 = as.numeric(Donne_TFE2$Q2_3)
Donne_TFE2$Q2_3 

var_radio<-c(88,91,94,97,100,103,106,109,112,115,118,121,124,127,130,133,136,139,141) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=186,ncol=2)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE2[,p], Donne_TFE2$Q2_3),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sexe = round(res_radio_sexe,3)  


prop.table(table(Donne_TFE2$VIRGIN,Donne_TFE2$Q2_2),margin = 1)
prop.table(table(Donne_TFE2$VIRGIN,Donne_TFE2$Q2_3),margin = 1)


write.xlsx(res_radio_sexe, file = "TFE_Excel4.xlsx",
           sheetName="Q2_10", append=TRUE)


data_corse = Donne_TFE %>% filter(Donne_TFE$rg22=="22")
prop.table(table(Donne_TFE$France_Bleu,Donne_TFE$rg22))

res_radio_sexe
prop.table(table(Donne_TFE2$VIRGIN,Donne_TFE2$rg22),margin = 1)


##### proche de vos preoccupations
#  Q2_7 = proche de vos preocupations  Q2_10 = media auquel attache

Donne_TFE2$Q2_7 = recode_factor(Donne_TFE2$Q2_7,"1"="1","2"="1","3"="3","4"="3","0"=NULL)
Donne_TFE2$Q2_7 = as.numeric(Donne_TFE2$Q2_7)
Donne_TFE2$Q2_7 


Donne_TFE2$Q2_10 = recode_factor(Donne_TFE2$Q2_10,"1"="1","2"="1","3"="3","4"="3","0"=NULL)
Donne_TFE2$Q2_10 = as.numeric(Donne_TFE2$Q2_10)
Donne_TFE2$Q2_10 


var_radio<-c(88,91,94,97,100,103,106,109,112,115,118,121,124,127,130,133,136,139,141) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=186,ncol=2)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE2[,p], Donne_TFE2$Q2_10),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sexe = round(res_radio_sexe,3)  

colnames(res_radio_sexe) =c("attache","non")
Donne_TFE2$Q2_7 %>% unique()

prop.table(table(Donne_TFE2$VIRGIN,Donne_TFE2$Q2_7),margin = 1)

prop.table(table(Donne_TFE2$rg22,Donne_TFE2$Q2_10),margin = 1)

prop.table(table(Donne_TFE2$Q2_7,Donne_TFE2$sexe),margin = 1)

table(Donne_TFE2$Q2_10)
table(Donne_TFE2$Q2_7)


prop.table(table(Donne_TFE2$Q2_15))

############### TEST ##################
# EXEMPLE
# Step 1
data % > % 
  #Step 2
  group_by(lgID) % > % 
  #Step 3
  summarise(mean_home_run = mean(HR)) % > % 
  #Step 4
  ggplot(aes(x = lgID, y = mean_home_run, fill = lgID)) +
  geom_bar(stat = "identity") +
  theme_classic() +
  labs(
    x = "baseball league",
    y = "Average home run",
    title = paste(
      "Example group_by() with summarise()"
    )
  )


# Step 1
Donne_TFE2 %>% 
  #Step 2
  group_by(lgID) %>% 
  #Step 3
  summarise(mean_home_run = mean(HR)) %>% 
  #Step 4
  ggplot(aes(x = lgID, y = mean_home_run, fill = lgID)) +
  geom_bar(stat = "identity") +
  theme_classic() +
  labs(
    x = "baseball league",
    y = "Average home run",
    title = paste(
      "Example group_by() with summarise()"
    )
  )
prop.table(table(Donne_TFE2$NRJ,Donne_TFE2$sexe),margin = 1)[1,] 
  
Donne_TFE2   %>%group_by(sexe) %>% summarise(n=n(table(NRJ)))

  
Donne_TFE2  %>% summarise(prop.table(table(Donne_TFE2$NRJ,Donne_TFE2$sexe),margin = 1)[1,])%>%  ggplot(aes(x = lgID, y = mean_home_run, fill = lgID)) +
  geom_bar(stat = "identity") +
  theme_classic() 



Donne_TFE2  %>% count(confiance_media,NRJ) %>% filter(NRJ =="auditeur")
  mutate(prop = prop.table(n))
  

Donne_TFE2$confiance_media


mtcars %>% count(cyl, gear) %>% mutate(Freq = n/sum(n))  
mtcars %>% count(cyl, gear) %>% mutate(Freq = n/sum(n))  
