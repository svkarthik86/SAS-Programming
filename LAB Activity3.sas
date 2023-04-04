*Activity3;
/*
Perform the following tasks:
Open the XLSTROM.storm_range table and examine the columns. Notice that there are four wind measurements for each storm.
Create a new column named WindAvg that is the mean of wind1, wind2, wind3, and wind4.
Create a new column WindRange that is the range of wind1, wind2, wind3, wind4.
Run the program and view the data. 
What are the WindAvg and WindRange values in row 1?
*/;

* Activity3 ********;
* step1- Create Library**;
*LIBNAME name_of_the_Lib  engine_name  "physical Location of file/folder";
LIBNAME XLSTORM xlsx "/home/u61234377/EXL8410-8414/EXLFILE/storm.xlsx";
LIBNAME OUT base "/home/u61234377/EXL8410-8414/OUTPUT";

Data storm_windavg;
set xlstorm.storm_range;
WindAvg=mean(of wind1-wind4);
WindRange=range(of wind1-wind4);
run;
proc print data=storm_windavg;
run;



