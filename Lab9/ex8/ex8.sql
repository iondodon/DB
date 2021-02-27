alter function reusita(@nume_prenume_student varchar(50))
	returns @result table (
		nume_prenume_student varchar(50),
		disciplina varchar(50),
		nota int, 
		data_evalaure date
	)
as
begin
	
	declare @student_nume varchar(50) = substring(@nume_prenume_student, 1, charindex(' ', @nume_prenume_student));
	declare @student_prenume varchar(50) = substring(@nume_prenume_student, 
									charindex(' ', @nume_prenume_student)+1, len(@nume_prenume_student));
	
	insert @result
	select @nume_prenume_student, dis1.Disciplina, sr1.Nota, sr1.Data_Evaluare
	from studenti_reusita as sr1
		inner join discipline as dis1
			on sr1.Id_Disciplina = dis1.Id_Disciplina
		inner join studenti as st1
			on sr1.Id_Student = st1.Id_Student
	where st1.Nume_Student = @student_nume and st1.Prenume_Student = @student_prenume;

	return
end