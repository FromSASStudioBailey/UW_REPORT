/***********************    zip up first file    ************************************************/

filename source "/home/sasdemo/BuildDemo/PREM_LOSS_CLEAN.csv";
filename tozip ZIP "/home/sasdemo/BuildDemo/PREM_LOSS_CLEAN.csv.gz" GZIP;
 
data _null_;   
   infile source;
   file tozip ;
   input;
   put _infile_ ;
run;

filename source;
filename tozip;
/***********************    zip up second file    ************************************************/
filename source "/home/sasdemo/BuildDemo/UW_W_Names.csv";
filename tozip ZIP "/home/sasdemo/BuildDemo/UW_W_Names.csv.gz" GZIP;
 
data _null_;   
   infile source;
   file tozip ;
   input;
   put _infile_ ;
run;

filename source;
filename tozip;




























filename outcsv "/home/sasdemo/BuildDemo.UW_W_Names.csv";

proc export data=UW_DATA.POL_W_NAMES
            outfile=outcsv
            dbms=csv replace;
run;

filename outcsv;







/* Create a CSV representation of SASHELP.CARS in the file specified on  */
/* the filename statement.  The file name should be fully qualified and  */
/* end with .csv                                                         */

filename outcsv "/home/sasdemo/BuildDemo.PREM_LOSS_CLEAN.csv";

proc export data=WORK.REMOVEFORMAT2
            outfile=outcsv
            dbms=csv replace;
run;

filename outcsv;




filename csv "/home/sasdemo/BuildDemo.PREM_LOSS_CLEAN.csv";

/* Import the CSV file  */
proc import datafile=csv out=work.temp_verify dbms=csv replace;
   getnames=yes;
   run;

filename csv;

%prn(work.temp_verify,100,);

/* Print the first 10 observations **/
proc print data=work.SMALL_PREM_LOSS_CLEAN(obs=100);
   run;

/**************************************/
filename csv "/home/sasdemo/BuildDemo.UW_W_Names.csv";

/* Import the CSV file  */
proc import datafile=csv out=work.verify_names dbms=csv replace;
   getnames=yes;
   run;

filename csv;

%prn(work.verify_names,100,);

