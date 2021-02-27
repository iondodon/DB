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

----------------------------------------------------------------------------------------------------------------------------------------
	
create nonclustered columnstore index IX_studenti_reusita 
on studenti.studenti_reusita(Id_Student, Id_Disciplina, Id_Profesor, Id_Grupa)
on userdatafgroup01

create unique nonclustered index IX_discipline
on plan_studii.discipline(Id_Disciplina, Disciplina)
on userdatafgroup01

create unique nonclustered index IX_studenti
on studenti.studenti(Id_Student, Nume_Student, Prenume_Student)
on userdatafgroup01

create unique nonclustered index IX_grupe
on grupe(Id_Grupa, Cod_Grupa)
on userdatafgroup01

create unique nonclustered index IX_profesori
on cadre_didactice.profesori(Id_Profesor, Nume_Profesor, Prenume_Profesor)
on userdatafgroup01
--==============================================================================================================================
create unique nonclustered index IX_studenti
on studenti.studenti(Id_Student, Nume_Student, Prenume_Student)
on userdatafgroup01

create unique nonclustered index IX_discipline
on plan_studii.discipline(Id_Disciplina, Disciplina)
on userdatafgroup01

create nonclustered columnstore index IX_studenti_reusita 
on studenti.studenti_reusita(Nota, Tip_Evaluare, Data_Evaluare)
on userdatafgroup01

declare @a int = 133
while @a < 10000
begin

	--insert into studenti.studenti_reusita(Id_Student, Id_Disciplina, Id_Profesor, Id_Grupa, Tip_Evaluare)
	--values (@a+2, @a+4, @a+8, 1, 'Examen')

	--insert into plan_studii.discipline(Id_Disciplina,Disciplina, Nr_ore_plan_disciplina)
	--values (@a, CONVERT(varchar(10), @a) + 'DB', @a);

	--insert into studenti.studenti(Id_Student, Nume_Student, Prenume_Student)
	--values (@a, CONVERT(varchar(10), @a), CONVERT(varchar(10), @a));

	insert into cadre_didactice.profesori(Id_Profesor, Nume_Profesor, Prenume_Profesor)
	values (@a, CONVERT(varchar(10), @a), CONVERT(varchar(10), @a));

	set @a = @a +1
end

select Nume_Student, Prenume_Student
from studenti.studenti_reusita
	inner join plan_studii.discipline
		on studenti.studenti_reusita.Id_Disciplina = plan_studii.discipline.Id_Disciplina
	inner join studenti.studenti
		on studenti.studenti.Id_Student = studenti.studenti_reusita.Id_Student
where Data_Evaluare like '2018-%' and Nota < 8 and Nota > 4 and Tip_Evaluare = 'Examen' and Disciplina = 'Baze de date'
--------------------------------------------------

create nonclustered columnstore index exe
on plan_studii.discipline (Id_Disciplina, Disciplina, Nr_ore_plan_disciplina)

select * from discipline 
where discipline.Disciplina like '%te%'



select * from cadre_didactice.profesori;
select * from grupe;
select * from studenti.studenti_reusita;
select * from plan_studii.discipline;
select * from studenti.studenti;