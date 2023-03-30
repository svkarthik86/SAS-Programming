*/this is command Line
statement , for example*/;
DAta ex1;
set sashelp.class;
RUN;
porc print data=ex1;
run;
*************************************************;
*Create a cars report;

title "European Cars Priced Over 30K";
footnote "Internal Use Only";

proc print data=sashelp.cars;
    where Origin='Europe'
          and MSRP>30000;
    var Make Model Type
        Mpg_City Mpg_Highway;
run;

***** CREATE LIBRARY*****;
LIBNAME DALIB base "/home/u61234377/EXL8410-8414";

***** Bring Data to SAS using FILENAME*********;
Filename myclass "/home/u61234377/EXL8410-8414/class.dat";
data Ex1;
infile myclass;
input name $ gender $ age weight;
run; 

******* Bring Data to SAS *******************;
data Ex2;
infile cards delimiter=",";
input name $ gender $ age weight;
cards;
John,M,48,128.6
Peter,,.,58,158.3
Liz,F, .115, .5
Joe, M, 28, 170.1
run; 
********************************************************;
********column Input************************************;
data ex3;
input name $ 1-5 age 6-7 gender $ 8 ;
cards;
Lavan24F
sukan22F
raj22M
;
RUN;
******* operators in SAS *********************************;
****** Arithmetic Operators******************************;
Data ex4;
set sashelp.class;
weightkg=weight*0.454;
run;

*****Keeping, Dropping, and Renaming Variables in a Dataset******;
Data ex5;
set sashelp.class;
weightkg=weight*0.454;
keep Name Age weightkg;
run;

***** Dropping****************************************;
Data ex6;
set sashelp.class;
weightkg=weight*0.454;
drop Name Age weightkg;
run;
********If-else Conditional Statements - Deriving BMI Variable*******;
Data ex7;
set sashelp.class;
weightkg=weight*0.454;
heightm=height*2.54/100;
bmi=weightkg/(heightm*heightm);
if bmi<=18 then status='Healthy weight';
else if 18 lt bmi<=21 then status='Overweight';
else if bmi> 21 then status='Obese';
run;




















