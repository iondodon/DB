-- 10. Gasiti studentii (numele, prenumele), care au obtinut la disciplina Baze de date (examen), 
--    in anul 2018, vreo nota mai mica de 8 si mai mare ca 4

select Nume_Student, Prenume_Student
from studenti_reusita
	inner join discipline
		on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
	inner join studenti
		on studenti.Id_Student = studenti_reusita.Id_Student
where Data_Evaluare like '2018-%' and Nota < 8 and Nota > 4 and Tip_Evaluare = 'Examen' and Disciplina = 'Baze de date'


-- 13. Aflati cursurile urmate de catre studentul Florea loan.
select distinct Disciplina
from studenti 
	inner join studenti_reusita
		on studenti.Id_Student = studenti_reusita.Id_Student
	inner join discipline
		on discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
where Nume_Student = 'Florea' and Prenume_Student ='Ioan'

--28. Gasiti numele, prenumele si media grupei studentilor care au sustinut toate disciplinele predate de
--profesorii ce locuiesc pe strada 31 August.

select distinct st1.Nume_Student, st1.Prenume_Student, 
	(select cast(avg(sr0.Nota*1.0) as decimal(5,3)) from studenti_reusita as sr0 where sr0.Id_Grupa = sr1.Id_Grupa) as [Media gruperi]
from studenti_reusita as sr1 
	inner join studenti as st1 
		on sr1.Id_Student = st1.Id_Student
where not exists (

	(select distinct sr2.Id_Disciplina
	from studenti_reusita as sr2 inner join profesori as pr
	on sr2.Id_Profesor = pr.Id_Profesor
	where pr.Adresa_Postala_Profesor like '%Decebal%')

	except

	(select distinct sr3.Id_Disciplina 
	from studenti_reusita as sr3
	where sr3.Id_Student = sr1.Id_Student and sr3.Nota > 4)

)

--39. Gasiti denumirile disciplinelor la care nu au sustinut examenul, in medie, peste 5% de studenti.
select distinct srdis.Disciplina
from studenti_reusita inner join discipline as srdis
on srdis.Id_Disciplina = srdis.Id_Disciplina
where
	cast( (select count(distinct sr1.Id_Student)
	from studenti_reusita as sr1 
	where sr1.Id_Disciplina = srdis.Id_Disciplina and sr1.Nota < 5
	) * 1.0 as decimal(5,3) )
	/
	cast( (select count(distinct sr2.Id_Student)
	from studenti_reusita as sr2 
	where sr2.Id_Disciplina = srdis.Id_Disciplina
	) * 1.0 as decimal(5,3) ) > 0.05

--24. Sa se afisase lista disciplinelor (Disciplina) predate de cel putin doi profesori. 

select Disciplina 
from discipline as dis
where (
	select count(distinct sr.Id_Profesor)
	from studenti_reusita as sr inner join profesori as pr on sr.Id_Profesor = pr.Id_Profesor
	where sr.Id_Disciplina = dis.Id_Disciplina
) > 1

--38. Furnizati denumirile disciplinelor cu o medie mai mica decat media notelor de la disciplina Baze de date.

select distinct dis1.Disciplina
from studenti_reusita as sr1
	inner join discipline as dis1
		on sr1.Id_Disciplina = dis1.Id_Disciplina
where dis1.Disciplina <> 'Baze de date' and (

	(select cast(avg(sr2.Nota*1.0) as decimal(5, 3))
	from studenti_reusita as sr2
	where sr2.Id_Disciplina = sr1.Id_Disciplina)
	-
	(select cast(avg(Nota*1.0) as decimal(5,3))
	from studenti_reusita
		inner join discipline
			on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
	where Disciplina = 'Baze de date')

) < 0

--37. Gasiti disciplina sustinuta de studenti cu nota medie (la examen) cea mai inalta.

select distinct sr3.Id_Disciplina
from studenti_reusita as sr3
where 
	(select max(mediile.media) as med_max
	from 
		(select distinct sr1.Id_Disciplina , 
			(select cast(avg(sr2.Nota*1.0) as decimal(5,3)) 
			from studenti_reusita as sr2 
			where sr1.Id_Disciplina = sr2.Id_Disciplina and sr2.Tip_Evaluare = 'Examen') as media
		from studenti_reusita as sr1
		where sr1.Tip_Evaluare = 'Examen') as mediile)

	=

	(select cast(avg(sr4.Nota*1.0) as decimal(5,3))  
	from studenti_reusita as sr4 
	where sr3.Id_Disciplina = sr4.Id_Disciplina and sr4.Tip_Evaluare = 'Examen')

-----------------------------------------------------------------------------------------
-- (36). Gasiti numele, prenumele si adresele studentilor si ale profesorilor care locuiesc intr-o localitate.
--Sa se afiseze denumirea localitatii si numarul de locuitori inclusi in cele doua categorii. Datele
--se afiseaza in ordinea crescatoare a numarului membrilor din categoria mentionata anterior.

select pr1.Nume_Profesor, pr1.Prenume_Profesor, pr1.Adresa_Postala_Profesor,
		st1.Nume_Student, st1.Prenume_Student, st1.Adresa_Postala_Student, 
		count(pr1.Adresa_Postala_Profesor) as num
from profesori pr1
	inner join studenti st1
		on st1.Adresa_Postala_Student like '%mun. Chisinau%' and pr1.Adresa_Postala_Profesor like '%mun. Chisinau%'
group by pr1.Nume_Profesor, pr1.Prenume_Profesor, pr1.Adresa_Postala_Profesor,
			st1.Nume_Student, st1.Prenume_Student, st1.Adresa_Postala_Student

-- 35. Gasiti denumirile disciplinelor si media notelor pe disciplina. Afisati numai disciplinele cu medii
-- mai mari de 7.0.

select distinct dis1.Disciplina, cast(avg(sr1.Nota*1.0) as decimal(5,3)) as media
from discipline as dis1 
	inner join (select sr2.Id_Disciplina, sr2.Nota from studenti_reusita as sr2 where sr2.Tip_Evaluare = 'Examen') sr1
		on dis1.Id_Disciplina = sr1.Id_Disciplina
group by dis1.Disciplina
having cast(avg(sr1.Nota*1.0) as decimal(5,3)) > 7.0

-- 34. Gasiti numele si prenumele studentilor, care nu au luat note de promovare (inclusiv note
-- intermediare) la nicio disciplina.

select st.Nume_Student, st.Prenume_Student
from 
	((select distinct sr1.Id_Student 
	from studenti_reusita as sr1)
	except
	(select distinct sr2.Id_Student 
	from studenti_reusita as sr2
	where sr2.Nota = 10)) as idst inner join studenti as st
							on idst.Id_Student = st.Id_Student

-- or
select distinct st1.Nume_Student, st1.Prenume_Student
from studenti_reusita as sr1
	inner join studenti as st1
		on sr1.Id_Student = st1.Id_Student
where not exists (select sr2.Id_Student 
					from  studenti_reusita as sr2 
					where sr1.Id_Student = sr2.Id_Student and sr2.Nota = 10)

-- 33.  Gasiti numele si prenumele studentilor, care nu au luat nota de promovare la reuita curenta la nicio
-- disciplina. 

select distinct st1.Nume_Student, st1.Prenume_Student
from studenti as st1
	inner join ((select distinct sr2.Id_Student
				from studenti_reusita as sr2)
				except
				(select distinct sr1.Id_Student
				from studenti_reusita as sr1
				where sr1.Nota = 10)) as idst
	on 	st1.Id_Student = idst.Id_Student

-- 32. Fumizati numele, prenumele si media notelor pe grupe pentru studenti
select distinct st1.Nume_Student, st1.Prenume_Student, (select cast (avg(sr2.Nota*1.0) as decimal(5,4)) 
														from studenti_reusita as sr2 
														where sr2.Id_Grupa = sr1.Id_Grupa) as Media
from studenti_reusita as sr1
	inner join studenti as st1
		on sr1.Id_Student = st1.Id_Student

-- 31. Fumizati numele si prenumele studentilor, care au avut mai mult de doua dezaprobari intr-un an la
-- o disciplina.

select distinct sr2.Id_Student
from studenti_reusita as sr2
where (select count(*)
		from studenti_reusita as sr1
		where sr1.Tip_Evaluare = 'Examen' 
			and str(sr1.Data_Evaluare, 4) = str(sr2.Data_Evaluare, 4) 
			and sr1.Id_Disciplina = sr2.Id_Disciplina) > 2

-- 29. Determinati numele si prenumele studentilor, care au sustinut examene cu o nota mai mica decat
-- oricare dintre notele studentilor cu identificatorul l00.

select distinct st1.Nume_Student, st1.Prenume_Student
from studenti_reusita sr1
	inner join studenti as st1
		on st1.Id_Student = sr1.Id_Student
where sr1.Nota < all (select distinct sr2.Nota 
						from studenti_reusita as sr2 
						where sr2.Id_Student = 100 and sr2.Tip_Evaluare = 'Examen')
	and sr1.Tip_Evaluare = 'Examen'

-- 27. Afisati studentii (identificatorii) care au sustinut (evaluare examen) la toate disciplinele predate de
-- prof. lon. 

select distinct st1.Id_Student
from studenti as st1
where not exists (
	(select distinct sr1.Id_Disciplina
	from studenti_reusita as sr1
	inner join profesori as pr1
	on sr1.Id_Profesor = pr1.Id_Profesor
	where pr1.Prenume_Profesor = 'Ion')

	except

	(select distinct sr2.Id_Disciplina
	from studenti_reusita as sr2
	where sr2.Id_Student = st1.Id_Student and sr2.Tip_Evaluare = 'Examen')
)

-- 26. Gasiti numele, prenumele ~i adresele studentilor ~i ale profesorilor care locuiesc pe strada 31 August. 
select st1.Nume_Student as Nume, st1.Prenume_Student as Prenume, st1.Adresa_Postala_Student as Adresa
from studenti as st1
where st1.Adresa_Postala_Student like '%Decebal%'
union 
select pr1.Nume_Profesor, pr1.Prenume_Profesor, pr1.Adresa_Postala_Profesor
from profesori as pr1
where pr1.Adresa_Postala_Profesor like '%Decebal%'

-- 25. In ce grupe de studii (Cod_ Grupa) figureaza mai mult de 24 de studenti? 

select distinct gr1.Cod_Grupa
from grupe as gr1
where (select distinct count(sr1.Id_Student) 
		from studenti_reusita as sr1
		where sr1.Id_Grupa = gr1.Id_Grupa) > 24

-- 24. Sa se afiseze lista disciplinelor (Disciplina) predate de cel putin doi profesori.
select distinct dis1.Disciplina
from studenti_reusita as sr1
	inner join discipline as dis1
		on dis1.Id_Disciplina = sr1.Id_Disciplina
group by dis1.Disciplina
having count(distinct sr1.Id_Profesor) >= 2

-- or

select distinct dis1.Disciplina
from discipline as dis1
where (select distinct count(distinct sr1.Id_Profesor)
		from studenti_reusita as sr1 
		where sr1.Id_Disciplina = dis1.Id_Disciplina) >= 2

-- 23. Sa se obtina lista disciplinelor (Disciplina) sustinute de studenti cu nota medie de promovare la
-- examen mai mare de 7, in ordine descrescatoare dupa denumirea disciplinei. 

select distinct dis1.Disciplina
from studenti_reusita as sr1
	inner join discipline as dis1
		on dis1.Id_Disciplina = sr1.Id_Disciplina
where sr1.Tip_Evaluare = 'Examen'
group by dis1.Disciplina
having cast(avg(sr1.Nota*1.0) as decimal(5,3)) > 7
order by dis1.Disciplina

-- or

select distinct dis1.Disciplina
from studenti_reusita as sr1
	inner join discipline as dis1
		on dis1.Id_Disciplina = sr1.Id_Disciplina
where (select cast(avg(Nota*1.0) as decimal(5,3))
		from studenti_reusita as sr2
		where sr2.Tip_Evaluare = 'Examen' and sr2.Id_Disciplina = sr1.Id_Disciplina) > 7
order by dis1.Disciplina

-- 22. Sa se obtina numarul de discipline predate de fiecare profesor (Nume_Profesor, Prenume _ Profesor).

select distinct pr1.Nume_Profesor, pr1.Prenume_Profesor, count(distinct sr1.Id_Disciplina) as discipline_predate
from studenti_reusita as sr1
	inner join profesori as pr1
		on pr1.Id_Profesor = sr1.Id_Profesor
group by pr1.Nume_Profesor, pr1.Prenume_Profesor

-- or

select distinct pr1.Nume_Profesor, pr1.Prenume_Profesor, (select count(distinct sr2.Id_Disciplina) 
									from studenti_reusita as sr2 
									where sr2.Id_Profesor = sr1.Id_Profesor) as discipline_predate
from studenti_reusita as sr1
	inner join profesori as pr1
		on pr1.Id_Profesor = sr1.Id_Profesor

-- 21. Cate note are fiecare student? Furnizati numele si prenumele lor.

select distinct st1.Nume_Student, st1.Prenume_Student, count(sr1.Nota) as numar_note
from studenti_reusita as sr1
	inner join studenti as st1
		on st1.Id_Student = sr1.Id_Student
group by st1.Nume_Student, st1.Prenume_Student
order by st1.Nume_Student, st1.Prenume_Student

-- or 

select distinct st1.Nume_Student, st1.Prenume_Student, (select count(sr1.Nota) 
														from studenti_reusita as sr1 
														where sr1.Id_Student = st1.Id_Student) as numar_note
from studenti as st1
order by st1.Nume_Student, st1.Prenume_Student

-- 20. Afisati numarul de studenti care au sustinut testul (Testul 2) la disciplina Baze de date in 2018.

select count(distinct sr1.Id_Student) as num_studenti
from studenti_reusita as sr1 
	inner join discipline as dis1
		on dis1.Id_Disciplina = sr1.Id_Disciplina
where sr1.Tip_Evaluare = 'Testul 2' and sr1.Data_Evaluare like '%2018%' and dis1.Disciplina = 'Baze de date'

-- 19. Gasiti numele si prenumele profesorilor, care au predat discipline, in care studentul "Cosovanu" a
-- fost respins (nota <5) la cel putin o proba.

select distinct pr1.Nume_Profesor, pr1.Prenume_Profesor
from studenti_reusita as sr1
	inner join studenti as st1
		on sr1.Id_Student = st1.Id_Student
	inner join profesori as pr1
		on pr1.Id_Profesor = sr1.Id_Profesor
where st1.Nume_Student = 'Cosovanu' and sr1.Nota < 5
group by pr1.Nume_Profesor, pr1.Prenume_Profesor
having count(distinct Id_Disciplina) > 1
order by pr1.Nume_Profesor, pr1.Prenume_Profesor

-- or ?????????????????????????????????

select distinct pr1.Nume_Profesor, pr1.Prenume_Profesor
from studenti_reusita as sr1
	inner join studenti as st1
		on st1.Id_Student = sr1.Id_Student
	inner join profesori as pr1
		on pr1.Id_Profesor = sr1.Id_Profesor
where st1.Nume_Student = 'Cosovanu' and (select count(sr2.Nota) 
										from studenti_reusita as sr2 
										where sr2.Nota < 5 
											and sr2.Id_Student = sr1.Id_Student 
											and sr2.Id_Profesor = sr1.Id_Profesor
											and sr2.Id_Disciplina = sr1.Id_Disciplina) > 1
order by pr1.Nume_Profesor, pr1.Prenume_Profesor


-- 18. Afisati numele si prenumele profesorilor, care au predat doar discipline cu o incarcare orara mai mica de 60 de ore.

select distinct pr1.Nume_Profesor, pr1.Prenume_Profesor 
from studenti_reusita as sr1
	inner join profesori as pr1
		on pr1.Id_Profesor = sr1.Id_Profesor
where (select count(distinct dis1.Id_Disciplina)
		from discipline as dis1
		where dis1.Id_Disciplina = sr1.Id_Disciplina
			and dis1.Nr_ore_plan_disciplina >= 60) = 0

-- 17. Afisati numele si pronumele profesorilor, care au predat cel putin o disciplina studentului cu identificatorul 100. 

select distinct pr1.Nume_Profesor, pr1.Prenume_Profesor
from studenti_reusita as sr1
	inner join profesori as pr1
		on pr1.Id_Profesor = sr1.Id_Profesor
where (select count(distinct sr2.Id_Disciplina)
		from studenti_reusita as sr2
		where sr2.Id_Profesor = sr1.Id_Profesor and sr2.Id_Student = 100) > 0

-- 16.  Furnizati numele si prenumele studentilor, care au studiat discipline cu un volum de lectii mai mic
-- de 60 de ore, precum si profesorii (identificatorii) respectivi, care le-au predat.

select distinct st1.Nume_Student, st1.Prenume_Student, sr1.Id_Profesor
from studenti_reusita as sr1
	inner join studenti as st1
		on st1.Id_Student = sr1.Id_Student
where exists (select dis1.Id_Disciplina
				from discipline as dis1
				where dis1.Id_Disciplina = sr1.Id_Disciplina and dis1.Nr_ore_plan_disciplina < 60)

-- or 

select distinct st1.Nume_Student, st1.Prenume_Student
from studenti as st1
where not exists(
	(select distinct sr1.Id_Disciplina
	from studenti_reusita as sr1
	where sr1.Id_Student = st1.Id_Student)
	
	except
	
	(select distinct sr2.Id_Disciplina
	from studenti_reusita as sr2
		inner join discipline as dis1
			on dis1.Id_Disciplina = sr2.Id_Disciplina
	where sr2.Id_Student = st1.Id_Student and dis1.Nr_ore_plan_disciplina < 60)
)


SELECT * FROM studenti_reusita
SELECT * FROM studenti
SELECT * FROM discipline
SELECT * FROM grupe
SELECT * FROM profesori