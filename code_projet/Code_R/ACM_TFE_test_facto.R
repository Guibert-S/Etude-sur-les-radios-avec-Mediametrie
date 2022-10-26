library(FactoMineR)
library(FactoInvestigate)
library(Factoshiny)
library(missMDA)
Factoshiny(data)

data_heure = data[,40:48]
data_heure = cbind(data_heure,data[,2:10])
data_heure = data_heure[,-11]
Factoshiny(data_heure)
################################################
var_radio<-c(177,178,179,180,181,182,183,184,185) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=186,ncol=5)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE[,p], Donne_TFE$Age),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sport = round(res_radio_sexe*100,1)

colnames(res_radio_sport) = c("CSP-","CSP+","Etudiants","Retraités et inactifs")
colnames(res_radio_sport) =c("13-25 ans","25-34 ans","35-49 ans","50-59 ans","60 ans et plus")

write.xlsx(res_radio_sport, file = "TFE_Excel4.xlsx",
           sheetName="Age_et_heure_week_1", append=TRUE)

prop.table(table(data$radioLV0_1,data$Age),margin=1)

Donne_TFE 



prop.table(table(data$radioW0_1,data$CSP),margin=2)







Donne_TFE = Donne_TFE %>% mutate('radioW0_1' = pmin(radioSA0_1,radioDI0_1))
Donne_TFE = Donne_TFE %>% mutate('radioW0_2' = pmin(radioSA0_2,radioDI0_2))
Donne_TFE = Donne_TFE %>% mutate('radioW0_3' = pmin(radioSA0_3,radioDI0_3))
Donne_TFE = Donne_TFE %>% mutate('radioW0_4' = pmin(radioSA0_4,radioDI0_4))
Donne_TFE = Donne_TFE %>% mutate('radioW0_5' = pmin(radioSA0_5,radioDI0_5))
Donne_TFE = Donne_TFE %>% mutate('radioW0_6' = pmin(radioSA0_6,radioDI0_6))
Donne_TFE = Donne_TFE %>% mutate('radioW0_7' = pmin(radioSA0_7,radioDI0_7))
Donne_TFE = Donne_TFE %>% mutate('radioW0_8' = pmin(radioSA0_8,radioDI0_8))
Donne_TFE = Donne_TFE %>% mutate('radioW0_9' = pmin(radioSA0_9,radioDI0_9))
Radio_week = colnames(Donne_TFE[,177:185])
