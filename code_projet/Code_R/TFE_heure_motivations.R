##############################

##############################
Radio_Semaine =  colnames(data[,40:48])

var_radio<-c(40,41,42,43,44,45,46,47,48) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=180,ncol=4)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE[,p], Donne_TFE$Sports),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sport = round(res_radio_sexe*100,1)

Donne_TFE$radioLV0_1 = recode_factor(Donne_TFE$radioLV0_1,"1"="1","2"="1","3"="3","4"="4","5"="5")
Donne_TFE = Donne_TFE %>% mutate_at(Radio_Semaine,funs(recode(.,"1"="1","2"="1","3"="3","4"="4","5"="5")))    
data = data %>% mutate_at(Radio_Semaine,funs(recode(.,"1"="1","2"="1","3"="3","4"="4","5"="5"))) 

prop.table(table(Donne_TFE[,40],Donne_TFE$info_actualite),margin = 1)
prop.table(table(Donne_TFE[,41],Donne_TFE$info_actualite),margin = 1)
prop.table(table(data[,40],data$info_actualite),margin = 1)

table(data[,41],data$info_actualite)

class(data$info_actualite)
class(data$radioLV0_1)
class(Donne_TFE$info_actualite)
class(Donne_TFE$radioLV0_1)
head(data$radioLV0_1)
head(Donne_TFE$radioLV0_1)


data$radioLV0_1 = as.integer(data$radioLV0_1)
data2 = data %>% filter(!is.na(data$radioLV0_1))

write.csv(res_radio_divertissement,file="Sport.csv")
Donne_TFE$Sports %>% unique()
Donne_TFE$Meteo %>% unique()
data$Sports %>% unique()
data$Meteo %>% unique()
Donne_TFE$info_actualite %>% unique()
# info actu / musique / divertissement /    Meteo /ciruclation    / Politique / /        Sport  interactives?

################################
################################
################################
var_radio<-c(40,41,42,43,44,45,46,47,48) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=186,ncol=3)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE[,p], Donne_TFE$Divertissement.humour),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sport = round(res_radio_sexe*100,1)

Donne_TFE$radioLV0_1 = recode_factor(Donne_TFE$radioLV0_1,"1"="1","2"="1","3"="3","4"="4","5"="5")
Donne_TFE = Donne_TFE %>% mutate_at(Radio_Semaine,funs(recode(.,"1"="1","2"="1","3"="3","4"="4","5"="5"))) 
data$radioLV0_3

write.xlsx(res_radio_sport, file = "TFE_Excel4.xlsx",
           sheetName="Divertissement2", append=TRUE)

prop.table(table(Donne_TFE$radioLV0_1,Donne_TFE$Sports))
prop.table(table(data$radioLV0_1,data$Politique),margin=1)
Donne_TFE$divertissement
