
*SAS - Frequency Distributions*
/*
Syntax
The basic syntax for calculating frequency distribution in SAS is −

PROC FREQ DATA = Dataset 
TABLES Variable_1 
BY Variable_2 

Following is the description of the parameters used −
Dataset is the name of the dataset.
Variables_1 is the variable names of the dataset whose frequency distribution 
needs to be calculated.
Variables_2 is the variables which categorised the frequency distribution result.
*/;
* Example*;
PROC SQL;
create table CARS1 as
SELECT make, model, type, invoice, horsepower, length, weight
   FROM 
   SASHELP.CARS
   WHERE make in ('Audi','BMW')
;
RUN;

proc FREQ data = CARS1 ;
tables horsepower; 
by make;
run;

**Multiple Variable Frequency Distribution**
We can find the frequency distributions for multiple variables which groups them
into all possible combinations.
;
proc FREQ data = CARS1 ;
tables make type; 
run;


**Frequency Distribution with Weight**
With the weight option we can calculate the frequency distribution
biased with the weight of the variable. 
Here the value of the variable is taken as the number of observations
instead of the count of value.;

proc FREQ data = CARS1 ;
tables make type; 
weight horsepower;
run;



