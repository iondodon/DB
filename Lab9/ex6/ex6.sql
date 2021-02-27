-- 10. Gasiti studentii (numele, prenumele), care au obtinut la disciplina Baze de date (examen), 
--    in anul 2018, vreo nota mai mica de 8 si mai mare ca 4

create function func1(@data_evaluare varchar(20), @nota_min int, @nota_max int, @tip_evaluare varchar(20), @disciplina varchar(20))
returns table
as return (
	select Nume_Student, Prenume_Student
	from studenti_reusita
		inner join discipline
			on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
		inner join studenti
			on studenti.Id_Student = studenti_reusita.Id_Student
	where Data_Evaluare like @data_evaluare 
			and Nota < 8 and @nota_max > @nota_min 
			and Tip_Evaluare = @tip_evaluare and Disciplina = @disciplina
);