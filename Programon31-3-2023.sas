*******MIN and MAX Operators******;

LIBNAME DAXLLIB xlsx "/home/u61234377/EXL8410-8414/EXLFILE/storm.xlsx";


*************************************************;
proc print data=daxllib.storm_range;
RUN;

DATA find_min_range;
set daxllib.storm_range;
Wind_min=min(Wind1,Wind2,Wind3,Wind4);
run;

proc print data=find_min_range;
run;

DATA find_max_range;
set daxllib.storm_range;
Wind_max=max(Wind1,Wind2,Wind3,Wind4);
run;

proc print data=find_max_range;
run;
*********SAS String****************************;
data class;
input fname $  lname $ class $;
cards;
John Doe STAT100
Liz Hick HIST200
Dave Higgs ECON100
AMY WRIGHT STAT200
Mary Lovel HIST300
JASON Powel ECON400
Chris Ryan HIST100
Peter Paul ECON400
;
run;
data class1;
	set class;
	course=substr(class,1,4);
	courseno=substr(class,5,7);
	fullname= cat(fname,lname);
run;

****************sum , avg************;
DATA ex2;
set daxllib.storm_range;
Wind_total=sum(Wind1,Wind2,Wind3,Wind4);
Wind_avg=mean(Wind1,Wind2,Wind3,Wind4);
run;

proc print data=ex2;
run;
******* SAS Array Example******;
data Ex_array;
set sashelp.class;
array student(4) height weight tot extra;
student(3)=student(1)+student(2);
RUN;


DATA example_OF;
INPUT A1 A2 A3 A4;
ARRAY A(4) A1-A4;
A_SUM=SUM(OF A(*));
A_MEAN=MEAN(OF A(*));
A_MIN=MIN(OF A(*));
DATALINES;
21 4 52 11
96 25 42 6
12 2 45 63
;
RUN;
PROC PRINT DATA=example_OF;
RUN;
*******************************************;
DATA in_example;
INPUT A1 $ A2 $ A3 $ A4 $;
ARRAY COLOURS(4) A1-A4;
IF 'black' IN COLOURS THEN available='Yes'; ELSE available='No';
DATALINES;
Orange pink violet yellow

;
RUN;
PROC PRINT DATA=in_example;
RUN;

*********FORMAT IN SAS ******************************************;

data salary;
input name $ salary id;
format salary dollar10.2 id ssn11.;
cards;
John 55000 145233421 
Peter 85000 432459291
Liz 67500 912342392
Joe 34900 170343929
;
run;

proc print data=salary;
run;

*************************;
data bonus;
input name $ bonus  dob  ;
informat bonus dollar5. dob date7.;
cards;
John $5500 20Apr80 
Peter $1200 01Mar92
Liz $6750 24Oct76
Joe $4560 17Dec87
;
run;


data DAXLLIB.bouns2;
set bonus;
format dob weekdate. ;
run;


































