//set serveroutput on;


DELIMITER $
CREATE or REPLACE FUNCTION findResult(w int(7)) RETURNS float(3,2)
BEGIN
DECLARE z float(3,2);
select GPA into z from results where roll=w;
RETURN z;
END

select roll, findResult(roll) from results;



DELIMITER $
create or replace PROCEDURE updateStudent(w int(7),new_name char(30)) 
BEGIN
    update students set name = new_name where roll=w;
END;

call updatestudent(1707092,'Arifur Rahman');