LIBNAME donnees '/folders/myfolders/data/' ;

%LET Chemin = /folders/myfolders/data/ ;
PROC IMPORT DATAFILE = "&Chemin.\TFE_Excel2.xlsm"
            OUT = data 
			DBMS = XLSX REPLACE ;
			SHEET = 'data' ;
RUN ;


/* Pourcentage d'auditeurs par radio  */
 
PROC FREQ DATA = data   ;
  table RFM*&var CHERIE_FM France_Musique France_culture France_info France_Inter M_radio Fun_Radio Skyrock VIRGIN RTL RTL2 Europe1 RMC Rire_Chanson NRJ France_Bleu Radio_classique  Nostalgie; 
	
RUN ;

/* Pourcentage d'auditeurs par variables */
%let var =  Age ;


PROC FREQ DATA = data   ;
   
  table RFM*&var CHERIE_FM*&var  France_Musique*&var France_culture*&var France_info*&var France_Inter*&var M_radio*&var Fun_Radio*&var Skyrock*&var VIRGIN*&var RTL*&var RTL2*&var Europe1*&var RMC*&var Rire_Chanson*&var NRJ*&var France_Bleu*&var Nostalgie*&var Radio_classique*&var ;

RUN ;

/* Pourcentage d'auditeurs par variables et fusion  */

PROC FREQ DATA = data   ;
   
  tables RFM*&var CHERIE_FM*&var France_Musique*&var France_culture*&var France_info*&var France_Inter*&var M_radio*&var Fun_Radio*&var Skyrock*&var VIRGIN*&var RTL*&var RTL2*&var Europe1*&var RMC*&var Rire_Chanson*&var NRJ*&var France_Bleu*&var Nostalgie*&var Radio_classique*&var ;
RUN ;
/* LES MOTIVATIONS   */

PROC FREQ DATA = data   ;
   
  table RFM*&var CHERIE_FM*&var France_Musique*&var France_culture*&var France_info*&var France_Inter*&var M_radio*&var Fun_Radio*&var Skyrock*&var VIRGIN*&var RTL*&var RTL2*&var Europe1*&var RMC*&var Rire_Chanson*&var NRJ*&var France_Bleu*&var Nostalgie*&var Radio_classique*&var ;
RUN ;

/* Tentative proc SQL */

PROC SQL ;
   CREATE TABLE Auditeur_par_radio AS SELECT 
     RFM, CHERIE_FM, France_Musique, France_culture, France_info, France_Inter, M_radio, Fun_Radio, Skyrock, VIRGIN, RTL, RTL2, Europe1, RMC, Rire_Chanson, NRJ, France_Bleu, Nostalgie,
      COUNT("auditeur") AS nombred_auditeur
   FROM 
      work.data
      GROUP BY RFM, CHERIE_FM, France_Musique, France_culture, France_info, France_Inter, M_radio, Fun_Radio, Skyrock, VIRGIN, RTL, RTL2, Europe1, RMC, Rire_Chanson, NRJ, France_Bleu, Nostalgie ;
      ORDER BY DESC ;
      ;
QUIT ;

/*EXPORTER SUR EXCEl  *//*EXPORTER SUR EXCEl  *//*EXPORTER SUR EXCEl  *//*EXPORTER SUR EXCEl  */
/*EXPORTER SUR EXCEl  *//*EXPORTER SUR EXCEl  *//*EXPORTER SUR EXCEl  *//*EXPORTER SUR EXCEl  */
/*EXPORTER SUR EXCEl  *//*EXPORTER SUR EXCEl  *//*EXPORTER SUR EXCEl  *//*EXPORTER SUR EXCEl  */
%let var = Age
ods excel file="&chemin\yourfilename.xlsx" 
OPTIONS(SHEET_INTERVAl = "NONE");

PROC FREQ DATA = data   ;
   
  table RFM*&var CHERIE_FM*&var France_Musique*&var France_culture*&var France_info*&var France_Inter*&var M_radio*&var Fun_Radio*&var Skyrock*&var VIRGIN*&var RTL*&var RTL2*&var Europe1*&var RMC*&var Rire_Chanson*&var NRJ*&var France_Bleu*&var Nostalgie*&var Radio_classique*&var ;
RUN ;


ods excel close;

/* ESSAIS INFRUCTUEUX  *//* ESSAIS INFRUCTUEUX  *//* ESSAIS INFRUCTUEUX  *//* ESSAIS INFRUCTUEUX  *//* ESSAIS INFRUCTUEUX  *//* ESSAIS INFRUCTUEUX  *//* ESSAIS INFRUCTUEUX  */


/* Liste SAS */

%let semaine = lundi - mardi - mercredi - jeudi - vendredi - samedi - dimanche ;

%let jour2 = %scan(&semaine,2,’-’) ;

/* Boucles */
%macro boucle ;
%do i = 1 %to 10 ;
proc print data = tab&i ;
run ;
%end ;
%mend ;

/* Proc FREQ */






%macro myFreq(var1, var2);

proc freq data=data;
tables &var1.*&var2. /nocum nofreq nopercent  NOCOL out=freq1;
run;
%mend;
%myFreq(RFM,sexe)


proc sql;  
select *
from freq1
where 

quit;





/* PROC SQL */
proc sql noprint;
select catx('*',nliteral(variable1),nliteral(variable2))
  into :table_list separated by ' '
from ALL
;
quit;
proc freq data=VARS;
  tables &table_list ;
run;
/* AUTRE PROC SQL */
proc sql; 
    create table my_freqs as 
    %freq(table=sashelp.class,var=height) 
    union all 
    %freq(table=sashelp.class,var=weight) 
    union all 
    %freq(table=sashelp.class,var=age) 
    ; 
quit; 
/* TEST  */

PROC FREQ DATA = data   ;
  table RFM*sexe ;
RUN ;

proc sql;
select auditeur
quit;
/* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  */
/* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  */
/* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  */
/* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  *//* PROC FREQ SAS OPTIMISE  */


 

%freq_all_variable();

%let liste_questions = RFM CHERIE_FM France_Musique France_culture France_info France_Inter M_radio Fun_Radio Skyrock VIRGIN RTL RTL2 Europe1 RMC Rire_Chanson NRJ France_Bleu Radio_classique  Nostalgie ; /* Liste des questions dont on veut calculer les procs Freq */
%let socio = sexe CSP enfants npf Age Region
/* Liste des questions dont on veut calculer les procs Freq */

/* Macro qui va mettre dans une table l'ensemble des résultats de la proc Freq pour chaque variable */
%macro freq_all_variable();

/* création d'une table qu'on initialise à vide dans laquelle on mettra toutes les procs Freq */
data freq_all;
     set _null_;
run;

/* on boucle sur l'ensemble des questions de la macro variable liste_questions */
%do i=1 %to %sysfunc(countw(&liste_questions.)); /* %sysfunc(countw(&liste_questions.)) : nombre de variables dans liste_questions */

     %let variable_trait = %scan(&liste_questions. , &i.); /* On met la question n°i de la liste dans la macro variable variable_trait */

     proc freq data=data; tables &variable_trait.*sexe/ missing;  ods output onewayfreqs=tmp ; run; /*Proc Freq sur la variable en cours de traitement */ 

     /* Mise en forme de la table issue de proc freq */
     data tmp;
           format question $50.;
           set tmp;
           drop table f_&variable_trait. CumFrequency CumPercent;
           rename &variable_trait.=modalite;
           question="&variable_trait.";
     run;

     /* On sette la variable en cours de traitement issue de la proc Freq à toutes les autres variables déjà traitées */
     data freq_all;
           set freq_all
                tmp;
     run;

     /* Suppression des tables intermédiaires */
     proc sql; drop table tmp; quit;

%end;
%mend;

%freq_all_variable();



/* AUTRES TENTATIVES */

%Frequence(var1, var2);
proc freq data=data;
tables (&var1.)*(&var2.) /norow nocol  missing;
run;
%mend;

%Frequence(RFM,sexe)


%frequence();

%let liste_questions = RFM CHERIE_FM France_Musique France_culture France_info France_Inter M_radio Fun_Radio Skyrock VIRGIN RTL RTL2 Europe1 RMC Rire_Chanson NRJ France_Bleu Radio_classique  Nostalgie;
%let liste_questions2 = sexe CSP enfants npf Age Region
%do i=1 %to %sysfunc(countw(&liste_questions.)); 
%do j=1 %to %sysfunc(countw(&liste_questions2.));
%let variable_trait = %scan(&liste_questions. , &i.);
%let variable_trait2 = %scan(&liste_questions2. , &i.);
proc freq data = data
tables &liste_questions.*&liste_questions2. /out=resultat_&liste_questions;
run;
%end 
%end
%mend;
%frequence();


--------------------------------------


%freq_all_variable();

%let liste_questions = RFM CHERIE_FM France_Musique France_culture France_info France_Inter M_radio Fun_Radio Skyrock VIRGIN RTL RTL2 Europe1 RMC Rire_Chanson NRJ France_Bleu Radio_classique  Nostalgie ; /* Liste des questions dont on veut calculer les procs Freq */
%let liste_questions2 = CSP sexe npf
/* Liste des questions dont on veut calculer les procs Freq */

/* Macro qui va mettre dans une table l'ensemble des résultats de la proc Freq pour chaque variable */
%macro freq_all_variable();

/* création d'une table qu'on initialise à vide dans laquelle on mettra toutes les procs Freq */
data freq_all;
     set _null_;
run;

/* on boucle sur l'ensemble des questions de la macro variable liste_questions */
%do i=1 %to %sysfunc(countw(&liste_questions.)); /* %sysfunc(countw(&liste_questions.)) : nombre de variables dans liste_questions */
%do j=1 %to %sysfunc(countw(&liste_questions2.));
     %let variable_trait = %scan(&liste_questions. , &i.); /* On met la question n°i de la liste dans la macro variable variable_trait */
	%let variable_trait2 = %scan(&liste_questions. , &j.);
     proc freq data=data; tables &variable_trait.*&variable_trait2./ missing;  ods output onewayfreqs=tmp ; run; /*Proc Freq sur la variable en cours de traitement */ 

     /* Mise en forme de la table issue de proc freq */
     data tmp;
           format question $50.;
           set tmp;
           drop table f_&variable_trait. CumFrequency CumPercent;
           rename &variable_trait.=modalite;
           question="&variable_trait.";
     run;

     /* On sette la variable en cours de traitement issue de la proc Freq à toutes les autres variables déjà traitées */
     data freq_all;
           set freq_all
                tmp;
     run;

     /* Suppression des tables intermédiaires */
     proc sql; drop table tmp; quit;
%end;
%end;
%mend;

%freq_all_variable();


ods excel file="&chemin\yourfilename.xlsx" 
OPTIONS(SHEET_INTERVAl = "NONE");
%let var =  Age ;

PROC FREQ DATA = data   ;
  table RFM*&var CHERIE_FM*&var  France_Musique*&var France_culture*&var France_info*&var France_Inter*&var M_radio*&var Fun_Radio*&var Skyrock*&var VIRGIN*&var RTL*&var RTL2*&var Europe1*&var RMC*&var Rire_Chanson*&var NRJ*&var France_Bleu*&var Nostalgie*&var Radio_classique*&var /nocum nofreq nopercent  NOCOL  ;
RUN ;
ods excel close;



/* PROC MEANS POOUR OBTENIR LES MOYENNES D'AGE PAR RADIO */
ods excel file="&chemin\yourfilename.xlsx" 
OPTIONS(SHEET_INTERVAl = "NONE");
%let var =  Age ;

PROC MEANS DATA = data mean maxdec=2  ;
 var age2 ;
 class RMC NRJ RFM;
 
run;
ods excel close;













%macro myFreq(var1, var2);

proc freq data=data;
tables &var1.*&var2. /nocum nofreq nopercent  NOCOL out=freq1;
run;
%mend;
%myFreq(RFM,Age)

%macro myFreq2(var1, var2);
proc freq data=data;
tables &var1.*&var2. /nocum nofreq nopercent NOCOL   out=freq2;
run;
%mend;
%myFreq2(NRJ,CSP)




proc sql;  
select 
from freq1,freq2 


quit;





nocum nofreq nopercent  NOCOL NOROW CHISQ

%let var = info_actualite



%let liste_questions = RFM CHERIE_FM France_Musique France_culture France_info France_Inter M_radio Fun_Radio Skyrock VIRGIN RTL RTL2 Europe1 RMC Rire_Chanson NRJ France_Bleu Radio_classique Nostalgie; /* Liste des questions dont on veut calculer les procs Freq */
/* Macro qui va mettre dans une table l'ensemble des résultats de la proc Freq pour chaque variable */
%macro freq_all_variable();

/* création d'une table qu'on initialise à vide dans laquelle on mettra toutes les procs Freq */
data freq_all;
     set _null_;
run;

/* on boucle sur l'ensemble des questions de la macro variable liste_questions */
%do i=1 %to %sysfunc(countw(&liste_questions.)); /* %sysfunc(countw(&liste_questions.)) : nombre de variables dans liste_questions */

     %let variable_trait = %scan(&liste_questions. , &i.); /* On met la question n°i de la liste dans la macro variable variable_trait */

     proc freq data=data; tables &variable_trait.*info_actualite/nocum nofreq nopercent  NOCOL  ;  ods output CrossTabFreqs=tmp ; run; /*Proc Freq sur la variable en cours de traitement */ 

     /* Mise en forme de la table issue de proc freq */
     data tmp;
           format question $50.;
           set tmp;
           drop table f_&variable_trait. CumFrequency CumPercent;
           rename &variable_trait.=modalite;
           question="&variable_trait.";
     run;

     /* On sette la variable en cours de traitement issue de la proc Freq à toutes les autres variables déjà traitées */
     data freq_all;
           set freq_all
                tmp;
     run;

     /* Suppression des tables intermédiaires */
     proc sql; drop table tmp; quit;
	
	
%end;
%mend;

%freq_all_variable();

/* NOUVELLE METHODE REVOLUTIONNAIRE ET JE PESE MES MOTS */


PROC SQL;
CREATE TABLE WORK.query AS
SELECT question  , Info_actualite    , RowPercent  FROM WORK.FREQ_ALL WHERE modalite = 'auditeur' and _TYPE_ = '11' ;


proc sort data = query ; by question;
proc transpose data=query out=test2 (drop=_NAME_ _LABEL_) prefix= Info_actualite   ;
   by question;
   var RowPercent;
  
run;

PROC EXPORT DATA = test2
         OUTFILE = "&chemin/Info_actualite"
            DBMS = XLSX ;
   SHEET = "nomFeuille" ; /* nom de la feuille Excel créée */
RUN ;




/* Obtention des quartiles --> pas très convaincant*/
proc means data= data median q3 ; 
 var npf ; output out= quartiles q1=quartile1 median=quartile2 q3=quartile3;
run ;












