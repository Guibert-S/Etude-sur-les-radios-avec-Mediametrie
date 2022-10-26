##### Vous informe sur ce qui se passe dans votre ville et votre région
#  Q2_2 = monde  Q2_2 = region
Donne_TFE2$Q2_15 = recode_factor(Donne_TFE2$Q2_15,"1"="1","2"="1","3"="3","4"="3","0"=NULL)
Donne_TFE2$Q2_15 = as.numeric(Donne_TFE2$Q2_15)
Donne_TFE2$Q2_15 



var_radio<-c(88,91,94,97,100,103,106,109,112,115,118,121,124,127,130,133,136,139,141) # tous les num?ros de variables de radio qui vous int?resse, ? croiser avec le sexe
res_radio_sexe<-matrix(data=NA ,nrow=186,ncol=2)  # tableau vide

for( p in var_radio) {
  res_radio_sexe[p,]<-prop.table(table(Donne_TFE2[,p], Donne_TFE2$Q2_15),margin=1)[1,]
  # on ne garde que la premi?re ligne qui correspond au % d'auditeur
}

res_radio_sexe<- res_radio_sexe[var_radio,]
res_radio_sexe = round(res_radio_sexe,3)  


prop.table(table(Donne_TFE2$VIRGIN,Donne_TFE2$cspc),margin = 1)
prop.table(table(Donne_TFE2$VIRGIN,Donne_TFE2$Q2_15),margin = 1)


write.xlsx(res_radio_sexe, file = "TFE_Excel4.xlsx",
           sheetName="Q2_15", append=TRUE)

round(prop.table(table(Donne_TFE2$Q2_15)),4)


a=prop.table(table(Donne_TFE2$Age,Donne_TFE2$Q2_15),margin = 1)
b=prop.table(table(Donne_TFE2$CSP,Donne_TFE2$Q2_15),margin = 1)
c=prop.table(table(Donne_TFE2$sexe,Donne_TFE2$Q2_15),margin = 1)

write.xlsx(c, file = "TFE_Excel4.xlsx",
           sheetName="sexe", append=TRUE)



