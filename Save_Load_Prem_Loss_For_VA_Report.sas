/********************************    READ ME       ************************************/
/*  THE TABLE BELOW CASUSER.PRMLS_NO_FORDRVR_ATVS IS CREATED IN OUR PROCESS FLOW */
/*  WANTED TO MAKE THE PROCESS OF RE-LOADING DATA FOR THE VA REPORT MANUAL TO AVOID MISTAKES DESTROYING A GOOD DATA SET */

/****************************    UW DATA FOR DEMO           */
/* proc casutil; */
/* 	droptable incaslib="PUBLIC" casdata="PREM_AND_LOSS" quiet; */
/* run; */
/*  */
/* Promoting the tabel in CAS */
/* DATA PUBLIC.PREM_AND_LOSS (PROMOTE=YES); */
/* SET CASUSER.PRMLS_NO_FORDRVR_ATVS; */
/* RUN; */
/*  */
/* Save table in CAS */
/* proc casutil; */
/* 	save incaslib="PUBLIC" outcaslib="PUBLIC" casdata="PREM_AND_LOSS" replace; */
/* run; */

/* Below will load our HDAT File into memory */

proc casutil incaslib="PUBLIC" outcaslib="PUBLIC";
	droptable casdata="PREM_AND_LOSS" quiet;
	load casdata="PREM_AND_LOSS.sashdat" casout="PREM_AND_LOSS" promote;
run;
