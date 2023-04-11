***SAS - Date & Times****;
*** Example****;
DATA Date_exp1;
INPUT @1 Date1 date11. @12 Date2 anydtdte15. @23 Date3 mmddyy10.   ;

DATALINES;
02-mar-2012 3/02/2012 3/02/2012
;
PROC PRINT DATA = Date_exp1;
RUN;


***********SAS Date output format****;
DATA Date_ex2;
INPUT  @1 DOJ1 mmddyy10. @12 DOJ2 mmddyy10.;
format  DOJ1 date11.  DOJ2 worddate20. ;
DATALINES;
01/12/2012 02/11/1998 
;
PROC PRINT DATA = Date_ex2;
RUN;

***Reading ASCII Text File****;

filename myclass "/home/u61234377/EXL8410-8414/class.dat";
data myclass;
infile myclass;
input name $ gender $ age weight;
run;









