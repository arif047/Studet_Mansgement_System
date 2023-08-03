select department,batch,time,title,description from schedule 
	where department in (select department from students where roll='1707092');
