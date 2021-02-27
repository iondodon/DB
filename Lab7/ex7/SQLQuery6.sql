-- 17. Afisati numele si pronumele profesorilor, care au predat cel putin o disciplina studentului cu identificatorul 100. 

select distinct pr1.Nume_Profesor, pr1.Prenume_Profesor 
from studenti.studenti_reusita as sr1
	inner join cadre_didactice.profesori as pr1
		on pr1.Id_Profesor = sr1.Id_Profesor
where (select count(distinct sr2.Id_Disciplina)
		from studenti.studenti_reusita as sr2
		where sr2.Id_Profesor = sr1.Id_Profesor and sr2.Id_Student = 100) > 0


-- 16.  Furnizati numele si prenumele studentilor, care au studiat discipline cu un volum de lectii mai mic
-- de 60 de ore, precum si profesorii (identificatorii) respectivi, care le-au predat.

select distinct st1.Nume_Student, st1.Prenume_Student, sr1.Id_Profesor
from studenti.studenti_reusita as sr1
	inner join studenti.studenti as st1
		on st1.Id_Student = sr1.Id_Student
where exists (select dis1.Id_Disciplina
				from plan_studii.discipline as dis1
				where dis1.Id_Disciplina = sr1.Id_Disciplina and dis1.Nr_ore_plan_disciplina < 60)