/*Activity1
In your SAS software, open a new program window and perform the following tasks:
Write a DATA step that reads the XLSTROM.Storm_summary table and creates an output table named Storm_cat5. Note: If you are using SAS Studio, try creating storm_cat5 as a permanent table in (output ) folder.
Include only Category 5 storms (MaxWindMPH greater than or equal to 156) with StartDate on or after 01JAN2000.
Add a statement to include the following columns in the output data: Season, Basin, Name, Type, and MaxWindMPH.
How many Category 5 storms have there been since January 1, 2000?

*/;

* Activity1 ********;
* step1- Create Library**;
*LIBNAME name_of_the_Lib  engine_name  "physical Location of file/folder";
LIBNAME XLSTORM xlsx "/home/u61234377/EXL8410-8414/EXLFILE/storm.xlsx";
LIBNAME OUT base "/home/u61234377/EXL8410-8414/OUTPUT";
*** step-2 Create Data Step**************;
data out.storm_cat5;
set XLSTORM.storm_summary;
where startDate >="01JAN2000"d AND MaxWindMPH >=156;
keep season basin name type MaxWindMPH;
run;
proc print data=out.storm_cat5;
run;