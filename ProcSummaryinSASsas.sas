**********How to Use Proc Summary in SAS (With Examples)*************;
/*
You can use proc summary in SAS to quickly calculate the following descriptive statistics for one or more variables in a dataset:

N: The total number of observations
MIN: The minimum value
MAX: The maximum value
MEAN: The mean
STD: The standard deviation
*/;

***Example 1: Proc Summary with One Variable***;
proc summary data=sashelp.iris;
var PetalLength;
output out=Summary_PetalLength;
run;
proc print data=Summary_PetalLength;
run;

***Example 2: Proc Summary with Multiple Variables****;
/*calculate descriptive statistics for Weight and Height variables*/
proc summary data=sashelp.Fish;
   var Weight Height;
   output out=summaryWeightHeight;
run;

/*print output dataset*/
proc print data=summaryWeightHeight;

*****Example 3: Proc Summary with One Variable Grouped by Another Variable****;
/*calculate descriptive statistics for Weight grouped by Species*/
proc summary data=sashelp.Fish;
   var Weight;
   class Species;
   output out=summaryWeightSpecies;
run;

/*print output dataset*/
proc print data=summaryWeightSpecies;
run;

**************************************;
proc summary data=sashelp.Fish;
   var Weight Height;
   class Species;
   output out=summaryWeightSpecies;
run;

/*print output dataset*/
proc print data=summaryWeightSpecies;
run;







