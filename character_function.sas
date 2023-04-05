*********************Character Function in SAS*****************************;

LIBNAME XLSTORM xlsx "/home/u61234377/EXL8410-8414/EXLFILE/storm.xlsx";
LIBNAME OUT base "/home/u61234377/EXL8410-8414/OUTPUT";

data out.storm_new;
set xlstorm.storm_summary;
drop Type Lat Lon;
Basin=upcase(Basin);
Name=propcase(Name);
Hemisphere=cat(Hem_NS,Hem_EW);
ocean=substr(Basin,2,1);
run;

proc print data=out.storm_new (obs=10);
run;
*****LAB Activity*************************************************************;
*/
Perform the following tasks:
1.Add a WHERE statement that uses the SUBSTR function to include rows where the second letter of Basin is P (Pacific ocean storms).
2.Run the program and view the log and data.
3.How many storms were in the Pacific basin?
*/;
data out.pacific;
    set xlstorm.storm_summary;
    drop type Hem_EW Hem_NS MinPressure Lat Lon;
    where substr(Basin,2,1)="P";
run;  
proc print data=out.pacific;
run;








