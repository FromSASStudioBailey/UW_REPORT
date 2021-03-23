/****************************************    READ THIS     ****************************************************/
/*****  BEFORE RUNNING CODE BELOW MAKE SURE THE FOLDER EXISTS IN THE FILENAME STATEMENT OR POINT AT A DIFFERENT FOLDER IN ALL FILENAME STATEMENTS */
filename csv "/home/sasdemo/BuildDemo/PREM_LOSS_CLEAN.csv";

/* Import the CSV file  */
proc import datafile=csv out=work.temp_prem dbms=csv replace;
	getnames=yes;
run;

filename csv;

/* SO THAT BOTH CAS TABLES BELOW ARE READY TO GO WHEN YOU OPEN SAS STUDIO, YOU CAN PLACE ALL THIS CODE IN AUTOEXEC FILE */
/* HOWEVER, PRIOR TO PLACING IN AUTOEXEC FILE, MAKE SURE THE CODE WORKS (MEANING TEST CODE TO MAKE SURE REQUIRED FOLDERS EXIST)  */
/* Push into CAS as the SAS Studio flow will be expecting this table to be in-memory */
DATA CASUSER.PREM_LOSS_CLEAN;
	SET WORK.TEMP_PREM;
RUN;

filename csv "/home/sasdemo/BuildDemo/UW_W_Names.csv";

/* Import the CSV file  */
proc import datafile=csv out=work.temp_names dbms=csv replace;
	getnames=yes;
run;

filename csv;

/* Push into CAS as the SAS Studio flow will be expecting this table to be in-memory */
DATA CASUSER.UW_W_Names;
	SET WORK.temp_names;
RUN;