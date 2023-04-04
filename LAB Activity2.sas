*** LAB Activity 2****************;

/*
perform the following tasks:
1.Create Data Set as storm_length from XLSTROM.Strom_Summary and  add an assignment statement to create StormLength that represents the number of days between StartDate and EndDate.
2.drop Hem_EW Hem_NS lat lon  columns
3.Run the program.
4.In 1980, how long did the storm named Agatha last?
*/;
* Activity2 ********;
* step1- Create Library**;
*LIBNAME name_of_the_Lib  engine_name  "physical Location of file/folder";
LIBNAME XLSTORM xlsx "/home/u61234377/EXL8410-8414/EXLFILE/storm.xlsx";
LIBNAME OUT base "/home/u61234377/EXL8410-8414/OUTPUT";

Data out.storm_length;
	set xlstorm.storm_summary;
	storm_length=EndDate-StartDate;
	drop Hem NS Hem EW Lat Lon;
RUN;
proc print data=out.storm_length;
where Name='AGATHA' and Season=1980 ;
run;