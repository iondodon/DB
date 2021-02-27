create function func2(@nume varchar(20), @prenume varchar(20))
returns table
as return (
	select distinct Disciplina
	from studenti 
		inner join studenti_reusita
			on studenti.Id_Student = studenti_reusita.Id_Student
		inner join discipline
			on discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
	where Nume_Student = @nume and Prenume_Student = @prenume
);