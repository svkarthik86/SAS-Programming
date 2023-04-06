********************PROC IMPORT***********************************;
*IMPORTING XLSX FILE*;
PROC IMPORT datafile="/home/u61234377/EXL8410-8414/EXLFILE/storm.xlsx"
dbms=XLSX OUT=WORK.STROM_SHEET2 REPLACE ;
SHEET='Storm_Detail';
RUN;

*import csv file*****;
proc IMPORT  datafile=COVID
DBMS=CSV OUT=WORK.COVID_DATA REPLACE;
RUN;
*****LAB ACTIVITY********************;
/*
1. create file shortcuts for url  datafile
2. proc import to write output to work.Covid_data 
3. proc content to data=work.table*/;

proc contents data=work.covid_data;
run;
title "COVID- Asia Data";
proc print data=work.covid_data;
where continent="Asia";
run;

proc means data=work.covid_data;
run;


proc univariate data=work.covid_data;
*var cases;
run;

proc freq data=work.covid_data ;
TABLE continent;
run;


proc print data=sashelp.cars;
where type in ("SUV","Wagon");
run;
* Find missing value***;
proc print data=out.storm_length;
*where MaxWindMPH=.;
where MaxWindMPH is missing;
run;
*not missing *****;
proc print data=out.storm_length;
*where MaxWindMPH=.;
where MaxWindMPH is not missing;
run;



