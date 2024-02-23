module Problema1_tb();

	logic a,b,c,d,s1,s2;
	
	Problema1 modulo(a,b,c,d,s1,s2);
	
	initial begin
	
	//0
	a=0;
	b=0;
	c=0;
	d=0;
	#40
	//2
	a=0;
	b=0;
	c=1;
	d=0;
	#40
	//4
	a=0;
	b=1;
	c=0;
	d=0;
	#40
	//6
	a=0;
	b=1;
	c=1;
	d=1;
	#40
	//8
	a=1;
	b=0;
	c=0;
	d=0;
	#40
	//10
	a=1;
	b=0;
	c=1;
	d=1;
	#40
	//12
	a=1;
	b=1;
	c=0;
	d=0;
	#40
	//14
	a=1;
	b=1;
	c=1;
	d=0;
	end
	
endmodule
	