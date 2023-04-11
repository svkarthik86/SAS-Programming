/*
Global Macro variable
They are called global macro variables because they can accessed by any SAS program 
available in the SAS environment
*/

proc print data = sashelp.cars;
where make = 'Audi' and type = 'Sports' ;
   TITLE "Sales as of &SYSDAY &SYSDATE";
run;
/*
Local Macro variable
These variables can be accessed by SAS programs in which they are declared as part of 
the program. 
Syntax
The local variables are declared with below syntax.

% LET (Macro Variable Name) = Value;

*/
%LET make_name = 'BMW';
%LET type_name = 'Wagon';
proc print data = sashelp.cars;
where make = &make_name and type = &type_name ;  *macro Local Variable;
   TITLE "Sales as of &SYSDAY &SYSDATE";         * macro global variable;
run;

***Macro Programs********;
/* Macro is a group of SAS statements that is referred by a name and to use 
it in program anywhere, using that name. It starts with a %MACRO statement 
and ends with %MEND statement.
Syntax

# Creating a Macro program.
%MACRO <macro name>(Param1, Param2,….Paramn);

Macro Statements;

%MEND;

# Calling a Macro program.
%MacroName (Value1, Value2,…..Valuen);

*/

* Example*;
%MACRO show_result(make_ , type_);
proc print data = sashelp.cars;
where make = "&make_" and type = "&type_" ;
   TITLE "Sales as of &SYSDAY &SYSDATE";
run;
%MEND;

%show_result(Chevrolet,Sedan);

*LAB Activity SAS Macro Program using sashelp.cars****;

/* Write SAS Macro Programming in the name of display_result for 
Orgin="USA" and MPG_Highway is 30 and above	,
call the Macro Program using Macro Name.

*/	
%MACRO display_result(Origin , milage);
proc print data = sashelp.cars;
where origin = "&Origin" and MPG_Highway =&milage ;
   TITLE "Sales as of &SYSDAY &SYSDATE";
run;
%MEND;
%display_result(USA,MPG_Highway>=30);	

/*Macro %PUT
This macro statement writes text or macro variable information to the SAS log. 
In the below example the value of the variable 'today' is written to the program log.		
*/
data _null_;
CALL SYMPUT ('today',
TRIM(PUT("&sysdate"d,worddate22.)));
run;
%put &today;																					
/*														
Macro %RETURN
Execution of this macro causes normal termination of the currently executing macro when certain 
condition evaluates to be true. In the below example when the value of the variable 
"val" becomes 10, the macro terminates else it contnues.
*/
***Example******;
%macro check_condition(val);
   %if &val >100 %then %return;
   %ELSE %if &val >90 %then %let grade="O";

   data Grade;
      x = &grade;
   run;  

%mend check_condition;  

%check_condition(195)  ;

/*
Macro %END
This macro definition contains a %DO %WHILE loop that ends, as required, 
with a %END statement. In the below example the macro named test takes 
a user input and runs the DO loop using this input value.
The end of DO loop is achieved through the %end statement while 
the end of macro is achieved through %mend statement.
*/
*** Example*****************;
%macro test(finish);
   %let i = 1;
   %do %while (&i <&finish);
      %put the value of i is &i;
      %let i=%eval(&i+1);
   %end;
%mend test;
%test(5)









