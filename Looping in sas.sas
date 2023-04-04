* revision ***************;
*****DO INDEX  LOOP******;

data loop1;
	x=0;

	do i=1 to 10;
		x=i*2;
		output;
	end;
run;
title "Do Index Loop Example";
proc print data=loop1;
run;
**** DO WHILE Loop********;

data loop2;
	x=0;

	do i=1 to 10 while(x < 20);
		x=i*3;
		output;
	end;
run;
title "Do While Loop Example";
proc print data= loop2;
run;

************DO UNTIL Loop************;

data loop3;
	x=0;

	do i= 1 to 10 until(x>30);
		x=i*4;
		output;
	end;
run;
title "Do Until Loop Example";
proc print data=loop3;
run;




