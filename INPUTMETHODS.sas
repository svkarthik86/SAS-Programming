**** INPUT METHODS***************;
*LIST INPUT METHOD;
*The following code and the output shows the use of list input method;

DATA List_input_ex;
	INPUT EMPID ENAME $ DEPT $;
	DATALINES;
1 Rick  IT
2 Dan  OPS
3 Tusar  IT
4 Pranab  OPS
5 Rasmi  FIN
;

PROC PRINT DATA=List_input_ex;
RUN;

*The following code and the output show the use of Named Input Method.;

DATA NAMED_INPUT_EX;
	INPUT EMPID=ENAME=$ DEPT=$;
	DATALINES;
EMPID =1 ENAME=Rick  DEPT=IT
EMPID =2 ENAME=Dan DEPT=OPS
EMPID =3 ENAME=Tushar DEPT=IT
EMPID =4 ENAME=Prashant DEPT=OPS
EMPID =5 ENAME=Rashmi DEPT=FIN 
;

PROC PRINT DATA=NAMED_INPUT_EX;
RUN;

*Column Input Method;
*Following code shows the use of Column Input Method.;

DATA COLUMN_INPUT_EX;
	INPUT EMPID 1-3 ENAME $ 4-12 DEPT $ 13-16;
	DATALINES;
14 Rick     IT 
241Dan      OPS 
30 Sanvi    IT 
410Chanchal OPS 
52 Piyu     FIN 
;

PROC PRINT DATA=COLUMN_INPUT_EX;
RUN;

*Formatted Input Method******;
*the The following code shows the use of Formatted Input Method;

DATA FORMATTED_INPUT_EX;
INPUT   @1 EMPID $ @4 ENAME $ @13 DEPT $ ;
DATALINES;
14 Rick     IT 
241 Dan      OPS 
30 Sanvi    IT 
410 Chanchal OPS 
52 Piyu     FIN 
;
PROC PRINT DATA = FORMATTED_INPUT_EX;
RUN;





