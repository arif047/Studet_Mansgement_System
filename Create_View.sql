drop view if EXISTS result;

create view result as 
	select distinct s.roll,s.name,r.year,r.term,r.credit,r.GPA from students s natural join results r;

select * from result;

