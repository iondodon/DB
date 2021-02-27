1. Sa se creeze doua viziuni in baza interogarilor formulate in doua exercitii indicate din capitolul
4. Prima viziune sa fie construita in Editorul de interogari, iar a doua, utilizand View
Designer. 

<img src="https://github.com/eminescum/DB/blob/master/Lab8/ex1/m1.png"/>

2. Sa se scrie cate un exemplu de instructiuni INSERT, UPDATE, DELETE asupra viziunilor
create. Sa se adauge comentariile respective referitoare la rezultatele executarii acestor
instructiuni. 

<img src="https://github.com/eminescum/DB/blob/master/Lab8/ex2/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab8/ex2/m2.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab8/ex2/m3.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab8/ex2/m4.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab8/ex2/m5.png"/>

``` sql 
go
create view studenti_reusita_view
	with schemabinding
	as 
	select Id_Student, Id_Disciplina, Id_Profesor, Id_Grupa, Tip_Evaluare, Nota
	from studenti.studenti_reusita

go
create view grupe_view
	with schemabinding 
	as
	select Id_Grupa, Cod_grupa
	from dbo.grupe
---------------------------------------------------------------------------------------------

insert into studenti_reusita_view(Id_Student, Id_Disciplina, Id_Profesor, Id_Grupa, Tip_Evaluare)
values (100, 103, 101, 3, 'Examen');
select * from studenti_reusita_view;

insert into grupe_view(Cod_Grupa)
values ('FAF172');
select * from grupe_view;
---------------------------------------------------------------------------------------------

update studenti_reusita_view
set Tip_Evaluare = 'Test'
where Id_Student = 100;

update grupe_view
set Cod_grupa = 'TI171'
where Id_Grupa = 3
---------------------------------------------------------------------------------------------
delete from studenti_reusita_view
where Id_Student = 100

delete from grupe_view
where Id_Grupa = 4
---------------------------------------------------------------------------------------------



select * from studenti_reusita_view;
select * from grupe_view;





select * from studenti_reusita;
select * from profesori;
select * from studenti;
select * from discipline;
select * from grupe;
```

3. Sa se scrie instructiunile SQL care ar modifica viziunile create (in exercitiul 1) in asa fel, incat
sa nu fie posibila modificarea sau stergerea tabelelor pe care acestea sunt definite si viziunile
sa nu accepte operatiuni DML, daca conditiile clauzei WHERE nu sunt satisfacute.

``` sql
go
create view studenti_reusita_view_ex3
	with schemabinding
	as 
	select Id_Student, Id_Disciplina, Id_Profesor, Id_Grupa, Tip_Evaluare, Nota
	from studenti.studenti_reusita
	where Tip_Evaluare = 'Examen'
	with check option

go
create view grupe_view_ex3
	with schemabinding 
	as
	select Id_Grupa, Cod_grupa
	from dbo.grupe
	where Nume_Facultate = 'Informatica si Cibernetica'
	with check option


select * from studenti_reusita_view_ex3;
select * from grupe_view_ex3;
```

4. Sa se scrie instructiunile de testare a proprietatilor noi definite. 

<img src="https://github.com/eminescum/DB/blob/master/Lab8/ex4/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab8/ex4/m2.png"/>

5. Sa se rescrie 2 interogari formulate in exercitiile din capitolul 4, in asa fel. incat interogarile
imbricate sa fie redate sub forma expresiilor CTE.

<img src="https://github.com/eminescum/DB/blob/master/Lab8/ex5/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab8/ex5/m2.png"/>

``` sql 
-- 10. Gasiti studentii (numele, prenumele), care au obtinut la disciplina Baze de date (examen), 
--    in anul 2018, vreo nota mai mica de 8 si mai mare ca 4
select Nume_Student, Prenume_Student
from studenti_reusita
	inner join discipline
		on studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
	inner join studenti
		on studenti.Id_Student = studenti_reusita.Id_Student
where Data_Evaluare like '2018-%' and Nota < 8 and Nota > 4 and Tip_Evaluare = 'Examen' and Disciplina = 'Baze de date';


with sr_dis_st
(Id_Student, Id_Disciplina, Id_Profesor, Tip_Evaluare, Nota, Data_Evaluare, Disciplina, Nume_Student, Prenume_Student) as (
select sr1.Id_Student, dis1.Id_Disciplina, Id_Profesor, Tip_Evaluare, Nota, Data_Evaluare, Disciplina, Nume_Student, Prenume_Student  
	from studenti_reusita as sr1
		inner join discipline as dis1
			on sr1.Id_Disciplina = dis1.Id_Disciplina
		inner join studenti
			on studenti.Id_Student = sr1.Id_Student
)
select Nume_Student, Prenume_student
from sr_dis_st
where Data_Evaluare like '2018-%' and Nota < 8 and Nota > 4 and Tip_Evaluare = 'Examen' and Disciplina = 'Baze de date';



-- 22. Sa se obtina numarul de discipline predate de fiecare profesor (Nume_Profesor, Prenume _ Profesor).

select distinct pr1.Nume_Profesor, pr1.Prenume_Profesor, count(distinct sr1.Id_Disciplina) as discipline_predate
from studenti_reusita as sr1
	inner join profesori as pr1
		on pr1.Id_Profesor = sr1.Id_Profesor
group by pr1.Nume_Profesor, pr1.Prenume_Profesor;


with sr_pr (Id_Profesor, Nume_Profesor, Prenume_Profesor, Id_Disciplina)
as (
	select pr1.Id_Profesor, pr1.Nume_Profesor, pr1.Prenume_Profesor, sr1.Id_Disciplina
	from studenti_reusita as sr1
		inner join profesori as pr1
			on sr1.Id_Profesor = pr1.Id_Profesor
)
select distinct Nume_Profesor, Prenume_Profesor, count(distinct Id_Disciplina) as discipline_predate
from sr_pr
group by Nume_Profesor, Prenume_Profesor;



select * from studenti_reusita;
select * from discipline;
select * from studenti;
```

6. Se considera un graf orientat, precum cel din figura de mai jos si fie se doreste parcursa calea
de la nodul id = 3 la nodul unde id = 0. Sa se faca reprezentarea grafului orientat in forma de
expresie-tabel recursiv.
Sa se observe instructiunea de dupa UNION ALL a membrului recursiv, precum si partea de
pana la UNION ALL reprezentata de membrul-ancora.

<img src="https://github.com/eminescum/DB/blob/master/Lab8/ex6/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab8/ex6/m2.png"/>
 

 