-- 10. Gasiti studentii (numele, prenumele), care au obtinut la disciplina Baze de date (examen), 
--    in anul 2018, vreo nota mai mica de 8 si mai mare ca 4

select Nume_Student, Prenume_Student
from studenti_reusita
	inner join discipline
		on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
	inner join studenti
		on studenti.Id_Student = studenti_reusita.Id_Student
where Data_Evaluare like '2018-%' and Nota < 8 and Nota > 4 and Tip_Evaluare = 'Examen' and Disciplina = 'Baze de date'

go
create procedure proc1
	@data varchar(20),
	@nota_min int,
	@nota_max int, 
	@tip_evaluare varchar(20),
	@disciplina varchar(20)
as
begin
	select Nume_Student, Prenume_Student
	from studenti_reusita
		inner join discipline
			on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
		inner join studenti
			on studenti.Id_Student = studenti_reusita.Id_Student
	where Data_Evaluare like @data and Nota < @nota_max and Nota > @nota_min 
		and Tip_Evaluare = @tip_evaluare and Disciplina = @disciplina
end

go
execute proc1 '2018-%', 4, 8, 'Examen',  'Baze de date';

----------------------------------------------------------------------------------------------------------------------

-- 13. Aflati cursurile urmate de catre studentul Florea loan.
select distinct Disciplina
from studenti 
	inner join studenti_reusita
		on studenti.Id_Student = studenti_reusita.Id_Student
	inner join discipline
		on discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
where Nume_Student = 'Florea' and Prenume_Student ='Ioan'

go
create procedure proc2
	@nume varchar(10),
	@prenume varchar(10)
as
begin
	select distinct Disciplina
	from studenti 
		inner join studenti_reusita
			on studenti.Id_Student = studenti_reusita.Id_Student
		inner join discipline
			on discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
	where Nume_Student = @nume and Prenume_Student = @prenume
end

execute proc2 'Florea', 'Ioan';