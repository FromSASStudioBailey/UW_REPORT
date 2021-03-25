%macro isBlank(param);
		%sysevalf(%superq(param)=, boolean) 
%mend isBlank;


%MACRO PRN(DSN,OBZ,WHR);
	
	%if %isblank(&WHR) %then
		%do;
		PROC PRINT DATA=&DSN(OBS=&OBZ);
		RUN;
		%end;
	%else
		%do;
			PROC PRINT DATA=&DSN(OBS=&OBZ);
			WHERE &WHR;
			RUN;
			%end;
%MEND PRN;

/* 	*CHECKS TO SEE IF MACRO VARIABLES IS BLANK.IF BLANK RETURNS TRUE; */
	%macro isBlank(param);
		%sysevalf(%superq(param)=, boolean) %mend isBlank;


/* code below will generate the Public and Casuser libraries (and others) on your behalf automatically when you open SAS Studio */
cas;
caslib _all_ assign;


libname UW_DATA '/home/sasdemo/UW_DATA/';

DATA CASUSER.UW_W_Names;
SET UW_DATA.POL_W_NAMES;
RUN;

data work.RemoveFormat1;
set UW_DATA.PREM_LOSS_CLEAN;


clm_date_nbr=clm_date;
effective_date_nbr=effective_date;
run;

proc datasets lib=work memtype=data;
   modify RemoveFormat1;
     attrib _all_ format=;
run;
quit;

data work.RemoveFormat2;
set work.RemoveFormat1;

format effective_date clm_date	MMDDYY10.;	 

run;

Data CASUSER.PREM_LOSS_CLEAN;
	SET work.RemoveFormat2;
RUN;


/* below will check to see if the table exists, if it does exist then do nothing, if it does not exist then create table */
%IF %sysfunc(exist(UW_Data.tblRecords, data)) %THEN %DO;
%END;
%ELSE %DO;

proc sql;
	create table UW_Data.tblRecords
          (Records num, tblName char(32), timestamp num 
		informat=DATETIME19. format=DATETIME19., Analyst char(32));
quit;

%END;

proc delete data=work.RemoveFormat1;run;
proc delete data=work.RemoveFormat2;run;
