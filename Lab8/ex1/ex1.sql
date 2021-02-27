-- 10. Gasiti studentii (numele, prenumele), care au obtinut la disciplina Baze de date (examen), 
--    in anul 2018, vreo nota mai mica de 8 si mai mare ca 4
select Nume_Student, Prenume_Student
from studenti_reusita
	inner join discipline
		on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
	inner join studenti
		on studenti.Id_Student = studenti_reusita.Id_Student
where Data_Evaluare like '2018-%' and Nota < 8 and Nota > 4 and Tip_Evaluare = 'Examen' and Disciplina = 'Baze de date'


select Nume_Student, Prenume_Student
from dis_sr_st
where Data_Evaluare like '2018-%' and Nota < 8 and Nota > 4 and Tip_Evaluare = 'Examen' and Disciplina = 'Baze de date'


-- 22. Sa se obtina numarul de discipline predate de fiecare profesor (Nume_Profesor, Prenume _ Profesor).

select distinct pr1.Nume_Profesor, pr1.Prenume_Profesor, count(distinct sr1.Id_Disciplina) as discipline_predate
from studenti_reusita as sr1
	inner join profesori as pr1
		on pr1.Id_Profesor = sr1.Id_Profesor
group by pr1.Nume_Profesor, pr1.Prenume_Profesor

select distinct pr1.Nume_Profesor, pr1.Prenume_Profesor, count(distinct sr1.Id_Disciplina) as discipline_predate
from st_re as sr1
	inner join profesori as pr1
		on pr1.Id_Profesor = sr1.Id_Profesor
group by pr1.Nume_Profesor, pr1.Prenume_Profesor


go
create view st_re
	with schemabinding
	as 
	select Id_Student, Id_Disciplina, Id_Profesor, Id_Grupa, Tip_Evaluare
	from studenti.studenti_reusita