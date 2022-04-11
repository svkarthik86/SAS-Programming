
*Global Macro;
PROC print DATA=SASHELP.cars;
where make = 'Audi' and type = 'Sports' ;
   TITLE "Sales as of &SYSDAY &SYSDATE";
run;
****Local Macro and Global;
%LET make_name = Audi;
%LET type_name = 'Sports';
proc print data = sashelp.cars;
where make = "&make_name" and type = &type_name ; *Local Macro;
   TITLE "Sales as of &SYSDAY &SYSDATE"; * SYSDAY and SYSDATE are GLOBALMACRO;
run;
********************MACRO PROGRAM STRUCTURE;
# Creating a Macro program.
%MACRO <macro name>(Param1, Param2,….Paramn);

Macro Statements;

%MEND;

# Calling a Macro program.
%MacroName (Value1, Value2,…..Valuen);
***************************************;
**** MACRO FUNCTION Show_result()******;
%MACRO show_result(make_ , type_);
proc print data = sashelp.cars;
where make = "&make_" and type = "&type_" ;
   TITLE "Sales as of &SYSDAY &SYSDATE";
run;
%MEND;

%show_result(Audi,Sedan);
********************Macro %PUT****;
data _null_;
CALL SYMPUT ('today',
TRIM(PUT("&sysdate"d,worddate22.)));
run;
%put &today;
***********************************;
%macro check_condition(val);
   %if &val = 10 %then %return;

   data p;
      x = 34.2;
   run;  

%mend check_condition;  

%check_condition(11)  ;
***********************************;
%macro test(finish);
   %let i = 1;
   %do %while (&i <&finish);
      %put the value of i is &i;
      %let i=%eval(&i+1);
   %end;
%mend test;
%test(5)









