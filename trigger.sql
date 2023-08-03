DELIMITER $
create or replace trigger course_fill
after insert on students for each row    

declare rollnumber int(7);

begin 
	set rollnumber	 = :new.roll;
	insert into course_taken values rollnumber,select c_id from courses where year='3' and term='1';
end;
