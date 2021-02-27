-- 2. Afisati primele zece date (numele, prenumele studentului) in functie de valoarea notei (cu exceptia
-- notelor 6 si 8) a studentului la primul test al disciplinei Baze de date , folosind structura de
-- altemativa IF. .. ELSE. Sa se foloseasca variabilele. 

declare @nume_disciplina varchar(20) = 'Baze de date'
declare @test varchar(20) = 'Testul 1'
declare @note table (nota int)

insert into @note(nota) values (6)
insert into @note(nota) values (8)

select distinct top 10 st1.Nume_Student, st1.Prenume_Student
from studenti_reusita as sr1
	inner join studenti as st1
		on sr1.Id_Student = st1.Id_Student
	inner join discipline as dis1
		on dis1.Id_Disciplina = sr1.Id_Disciplina
where dis1.Disciplina = @nume_disciplina and sr1.Tip_Evaluare = @test
	and sr1.Nota not in (select nt.nota from @note as nt)