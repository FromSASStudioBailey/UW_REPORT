/****************************************    READ THIS     ****************************************************/                         
/*****  BEFORE RUNNING CODE BELOW MAKE SURE THE FOLDER EXISTS IN THE FILENAME STATEMENT OR POINT AT A DIFFERENT FOLDER IN ALL FILENAME STATEMENTS */


/*******************************  below will re-inflate the first ziped file  ************ */
filename target "/home/sasdemo/UW_DATA/PREM_LOSS_CLEAN.csv" encoding='utf-8';
filename fromzip ZIP "/home/sasdemo/UW_DATA/PREM_LOSS_CLEAN.csv.gz" GZIP;
 
data _null_;   
   infile fromzip;
   file target ;
   input;
   put _infile_ ;
run;

filename target;
filename fromzip;
/*******************************  below will re-inflate the second ziped file  ************ */


filename target "/home/sasdemo/UW_DATA/UW_W_Names.csv" encoding='utf-8';
filename fromzip ZIP "/home/sasdemo/UW_DATA/UW_W_Names.csv.gz" GZIP;
 
data _null_;   
   infile fromzip;
   file target ;
   input;
   put _infile_ ;
run;

filename target;
filename fromzip;
