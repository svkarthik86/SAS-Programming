***SAS Basic Statistical Procedure****;
***SAS - Arithmetic Mean***;
/*
Syntax
The basic syntax for calculating arithmetic mean in SAS is −
PROC MEANS DATA = DATASET;
CLASS Variables ;
VAR Variables;
RUN;
Following is the description of parameters used −

DATASET − is the name of the dataset used.
Variables − are the name of the variable from the dataset.
*/
*Example*;
PROC MEANS data=sashelp.cars;
run;

PROC MEANS data=sashelp.cars  Mean  skewness sum max MAXDEC=2 ;
run;

***Mean of Select Variables****;
PROC MEANS DATA = sashelp.CARS mean SUM MAXDEC=2 ;
var horsepower invoice EngineSize;
RUN;
**Mean by Class***
We can find the mean of the numeric variables by organizing them to groups by
using some other variables.;
PROC MEANS DATA = sashelp.CARS mean SUM MAXDEC=2;
class make type;
var horsepower;
RUN;

***SAS - Standard Deviation***;
**Example**;

ods pdf file="/home/u61234377/EXL8410-8414/outfiles/cars.pdf";
PROC SQL;
create table CARS1 as
SELECT make, type, invoice, horsepower, length, weight
   FROM 
   SASHELP.CARS
   WHERE make in ('Audi','BMW')
;
RUN;

proc means data = CARS1 STD;
run;

ods pdf close;

**Using PROC SURVEYMEANS**
This procedure is also used for measurement of SD along with some advance features
 like measuring SD for categorical variables as well as provide estimates in variance.
Syntax
The syntax for using PROC SURVEYMEANS is −
PROC SURVEYMEANS options statistic-keywords 
BY variables 
CLASS variables 
VAR variables 

Following is the description of the parameters used −
BY − indicates the variables used to create groups of observations.
CLASS − indicates the variables used for categorical variables.
VAR − indicates the variables for which SD will be calculated.
 
*Example*;
proc surveymeans data = CARS1 STD;
class type;
var type horsepower;
ods output statistics = rectangle;
run;
proc print data = rectangle;
run;

**Using BY option**
The below code gives example of BY option. 
In it the result is grouped for each value in the BY option.;
proc surveymeans data = CARS1 STD;
var horsepower;
BY make;
ods output statistics = rectangle;
run;
proc print data = rectangle;
run;




