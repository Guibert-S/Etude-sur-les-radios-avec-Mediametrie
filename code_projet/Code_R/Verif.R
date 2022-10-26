
# Figure 21 directe 
# directe / diff 

# Q2_8 Confiance / 

Donne_TFE2$Q2_8 = recode_factor(Donne_TFE2$Q2_8,"1"="1","2"="1","3"="3","4"="3","0"=NULL)
Donne_TFE2$Q2_8 

Donne_TFE2$Q2_2 = recode_factor(Donne_TFE2$Q2_2,"1"="1","2"="1","3"="3","4"="3","0"=NULL)
Donne_TFE2$Q2_2 

Donne_TFE2$Q2_3 = recode_factor(Donne_TFE2$Q2_3,"1"="1","2"="1","3"="3","4"="3","0"=NULL)
Donne_TFE2$Q2_3 

#conseil d'achat
Donne_TFE2$Q2_14 = recode_factor(Donne_TFE2$Q2_14,"1"="1","2"="1","3"="3","4"="3","0"=NULL)
Donne_TFE2$Q2_14 

#Politique
round(prop.table(table(Donne_TFE2$Q2_8,Donne_TFE2$Politique),margin = 1),3)*100

#Culture
round(prop.table(table(Donne_TFE2$Q2_8,Donne_TFE2$Culturelle),margin = 1),3)*100

# Inforations et actualité
round(prop.table(table(Donne_TFE2$Q2_8,Donne_TFE2$info_actualite),margin = 1),3)*100

#actu inter
round(prop.table(table(Donne_TFE2$Q2_8,Donne_TFE2$Q2_2),margin = 1),3)*100

#actu regionale
round(prop.table(table(Donne_TFE2$Q2_8,Donne_TFE2$Q2_3),margin = 1),3)*100

#conseil d'achat Vous permet d'être informé(e) des offres ou promotions commerciales
round(prop.table(table(Donne_TFE2$Q2_8,Donne_TFE2$Q2_14),margin = 1),3)*100

Donne_TFE2$Politique
Donne_TFE2$Q2_8

write.xlsx(a, file = "TFE_Excel4.xlsx",
           sheetName="conseil_achat", append=TRUE)


round(prop.table(table(Donne_TFE2$Q2_8,Donne_TFE2$Q2_3),margin = 1),3)*100




