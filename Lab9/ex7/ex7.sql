create function age(@nume_student varchar(20), @prenume_student varchar(20))
returns int 
as
begin
	declare @data_nastere date = (
		select st1.Data_Nastere_student
		from studenti as st1
		where st1.Nume_Student = @nume_student and st1.Prenume_Student = @prenume_student
	);
	
	return DATEDIFF(hour,@data_nastere,GETDATE())/8766
end;