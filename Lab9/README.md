1. Sa se creeze proceduri stocate in baza exercitiilor (2 exercitii) din capitolul 4. Parametrii de
intrare trebuie sa corespunda criteriilor din clauzele WHERE ale exercitiilor respective. 

<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex1/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex1/m2.png"/>

``` sql
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
```

2. Sa se creeze o procedura stocata, care nu are niciun parametru de intrare si poseda un
parametru de iesire. Parametrul de iesire trebuie sa returneze numarul de studenti, care nu au
sustinut cel putin o forma de evaluare (nota mai mica de 5 sau valoare NULL).

<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex2/m1.png"/>

``` sql 
go
create procedure proc3
	@result int output
as
begin
	set @result = (
		select count(distinct Id_Student)
		from studenti_reusita as sr1
		where sr1.Nota < 5 or sr1.Nota is null
	)
end

declare @nr_studenti int;
execute proc3 @nr_studenti output;
select @nr_studenti;
```

3. Sa se creeze o procedura stocata, care ar insera in baza de date informatii despre un student
nou. In calitate de parametri de intrare sa serveasca datele personale ale studentului nou si
Cod_ Grupa. Sa se genereze toate intrarile-cheie necesare in tabelul studenti_reusita. Notele
de evaluare sa fie inserate ca NULL. 

<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex3/m1.png"/>

``` sql 
create procedure addStudent
	@id_student int,
	@nume varchar(20),
	@prenume varchar(20),
	@data_nastere varchar(20),
	@adresa varchar(20),
	@id_disciplina int,
	@id_profesor int,
	@id_grupa int,
	@cod_grupa varchar(20),
	@tip_evaluare varchar(20),
	@data_evaluare varchar(20)
as
begin
	insert into studenti values(@id_student, @nume, @prenume, @data_nastere, @adresa);

	insert into studenti_reusita
	values(@id_student, @id_disciplina, @id_profesor, @id_grupa, @tip_evaluare, NULL, @data_evaluare);
end


go
exec addStudent 175, 'Dodon', 'Ion', '1998-06-14', 'Chisinau, Alba-Iulia', 103, 100, 1, 'CIB171', 'Examen', '2018-01-23';


select * from studenti_reusita;
select * from grupe;
select * from profesori;
select * from discipline;
select * from studenti;
```

4. Fie ca un profesor se elibereaza din functie la mijlocul semestrului. Sa se creeze o procedura
stocata care ar reatribui inregistrarile din tabelul studenti_reusita unui alt profesor. Parametri
de intrare: numele si prenumele profesorului vechi, numele si prenumele profesorului nou,
disciplina. In cazul in care datele inserate sunt incorecte sau incomplete, sa se afiseze un
mesaj de avertizare.

<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex4/m1.png"/>

``` sql
alter procedure replaceTeacher
	@prof_vechi_nume varchar(20),
	@prof_vechi_prenume varchar(20),
	@prof_nou_nume varchar(20),
	@prof_nou_prenume varchar(20),
	@disciplina varchar(20)
as
begin
	if @prof_nou_nume is null begin print('Introdu prof nou nume.'); return; end;
	if @prof_nou_prenume is null begin print('Introdu prof nou prenume.'); return; end;
	if @prof_vechi_nume is null begin print('Introdu prof vechi nume.'); return; end;
	if @prof_vechi_prenume is null begin print('Introdu prof vechi prenume.'); return; end;
	if @prof_vechi_prenume is null begin print('Introdu disciplina.'); return; end;

	declare @prof_vechi_id int = (
		select pr1.Id_Profesor 
		from profesori as pr1
		where pr1.Nume_Profesor = @prof_vechi_nume and pr1.Prenume_Profesor = @prof_vechi_prenume
	);

	declare @prof_nou_id int = (
		select pr1.Id_Profesor
		from profesori as pr1
		where pr1.Nume_Profesor = @prof_nou_nume and pr1.Prenume_Profesor = @prof_nou_prenume
	);

	update studenti_reusita
	set Id_Profesor = @prof_nou_id
	where Id_Profesor = @prof_vechi_id;
end

execute replaceTeacher 'Popescu', 'Gabriel', 'Munteanu', 'Alexandru', 'Informatica aplicata';

select * from studenti_reusita;
select * from grupe;
select * from profesori;
select * from discipline;
select * from studenti;
```

5. Sa se creeze o procedura stocata care ar forma o lista cu primii 3 cei mai buni studenti la o
disciplina, si acestor studenti sa le fie marita nota la examenul final cu un punct (nota
maximala posibila este 10). In calitate de parametru de intrare, va servi denumirea disciplinei.
Procedura sa returneze urmatoarele campuri: Cod_ Grupa, Nume_Prenume_Student,
Disciplina, Nota _ Veche, Nota _ Noua. 

<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex5/m1.png"/>

``` sql
alter procedure top3studenti
	@disciplina_in varchar(20)
as
begin
	declare @ultimul_examen_data date = (
		select max(Data_Evaluare)
		from studenti_reusita as sr2
			inner join discipline as dis2
				on dis2.Id_Disciplina = sr2.Id_Disciplina
		where dis2.Disciplina = @disciplina_in and sr2.Tip_Evaluare = 'Examen'
	);

	declare @top3 table(
		Id_Student int,
		media decimal(5,3)
	);


	insert into  @top3
	select top 3 Id_Student, (
		select cast(avg(sr1.Nota*1.0) as decimal(5,3))
		from studenti_reusita as sr1
			inner join discipline as dis1
				on dis1.Id_Disciplina = sr1.Id_Disciplina
			where dis1.Disciplina = @disciplina_in and Id_Student = st1.Id_Student
		) as media
	from studenti as st1
	order by media desc;

	select gr3.Cod_Grupa, st3.Nume_Student, st3.Prenume_Student, @disciplina_in, sr3.Nota, 
	case when sr3.Nota < 10 then sr3.Nota + 1 else sr3.Nota end
	from studenti_reusita as sr3
		inner join grupe as gr3
			on sr3.Id_Grupa = gr3.Id_Grupa
		inner join studenti as st3
			on sr3.Id_Student = st3.Id_Student
	where st3.Id_Student in (select Id_Student from @top3) and sr3.Data_Evaluare = @ultimul_examen_data;


	update studenti_reusita
	set Nota = (case when Nota < 10 then Nota + 1 else Nota end)
	where Id_Student in ( select Id_Student from @top3 ) and Tip_Evaluare = 'Examen' and Data_Evaluare = @ultimul_examen_data;

end
```

6. Sa se creeze functii definite de utilizator in baza exercitiilor (2 exercitii) din capitolul 4.
Parametrii de intrare trebuie sa corespunda criteriilor din clauzele WHERE ale exercitiilor
respective. 

<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex6/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex6/m2.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex6/m3.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex6/m4.png"/>

``` sql
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
```
``` sql
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
```
``` sql
select * from  func1('2018-%', 4, 8, 'Examen', 'Baze de date');
select * from func2('Florea', 'Ioan');
```

7. Sa se scrie functia care ar calcula varsta studentului. Sa se defineasca urmatorul format al
functiei: <nume Juncfie>(<Data _ Nastere _Student>).

<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex7/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex7/m2.png"/>

8. Sa se creeze o functie definita de utilizator, care ar returna datele referitoare la reusita unui
student. Se defineste urmatorul format al functiei: <nume Juncfie>
(<Nume_Prenume_Student>). Sa fie afisat tabelul cu urmatoarele campuri:
Nume_Prenume_Student, Disticplina, Nota, Data_Evaluare. 

<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex8/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex8/m2.png"/>

``` sql
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
```

9. Se cere realizarea unei functii definite de utilizator, care ar gasi cel mai sarguincios sau cel
mai slab student dintr-o grupa. Se defineste urmatorul format al functiei: <numeJuncfie>
(<Cod_ Grupa>, <is_good>). Parametrul <is_good> poate accepta valorile "sarguincios" sau
"slab", respectiv. Functia sa returneze un tabel cu urmatoarele campuri Grupa,
Nume_Prenume_Student, Nota Medie , is_good. Nota Medie sa fie cu precizie de 2
zecimale.

<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex9/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab9/ex9/m2.png"/>

``` sql
alter function celmai(@cod_grupa char(6), @is_good varchar(10))
	returns @result table(
		Grupa char(6),
		Nume_Student varchar(50),
		Prenume_Student varchar(50),
		Nota_Medie decimal(5,2),
		is_good varchar(20)
	)
as
begin
	insert @result
	select top 1 gr1.Cod_Grupa, st1.Nume_Student, st1.Prenume_Student,
		cast(avg(sr1.Nota*1.0) as decimal(5,2)) as media, @is_good as is_good
	from studenti as st1
		inner join studenti_reusita as sr1
			on st1.Id_Student = sr1.Id_Student
		inner join grupe as gr1
			on gr1.Id_Grupa = sr1.Id_Grupa
	where gr1.Cod_Grupa = @cod_grupa
	group by gr1.Cod_Grupa, st1.Nume_Student, st1.Prenume_Student
	order by case @is_good when 'sarguincios' then cast(avg(sr1.Nota*1.0) as decimal(5,2)) end desc,  
			 case @is_good when 'slab' then cast(avg(sr1.Nota*1.0) as decimal(5,2)) end;

	return
end
```

``` sql
select * from celmai('INF171', 'sarguincios');

select * from studenti;
select * from grupe;
``