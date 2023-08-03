select roll,name from students
	where section='A' and  
	UNION
	select roll,name from students
		where section='B';

