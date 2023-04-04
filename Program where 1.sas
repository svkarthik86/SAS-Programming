Data myclass;
set sashelp.class;
where age>=15;
format Height 4.1 weight 3.0;
run;