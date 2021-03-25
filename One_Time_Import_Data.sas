libname UW_DATA '/home/sasdemo/UW_DATA/';

/****************************************    READ THIS     ****************************************************/
/*****  BEFORE RUNNING CODE BELOW MAKE SURE THE FOLDER EXISTS IN THE FILENAME STATEMENT OR POINT AT A DIFFERENT FOLDER IN ALL FILENAME STATEMENTS */
filename csv "/home/sasdemo/UW_DATA/PREM_LOSS_CLEAN.csv";

/* Import the CSV file  */
proc import datafile=csv out=UW_DATA.PREM_LOSS_CLEAN dbms=csv replace;
	getnames=yes;
run;

filename csv;


filename csv "/home/sasdemo/UW_DATA/UW_W_Names.csv";

/* Import the CSV file  */
proc import datafile=csv out=UW_DATA.POL_W_NAMES dbms=csv replace;
	getnames=yes;
run;

filename csv;
