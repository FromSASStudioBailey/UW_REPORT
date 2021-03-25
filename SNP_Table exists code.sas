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