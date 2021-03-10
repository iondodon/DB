1. Sa se scrie o instructiune T-SQL, care ar popula co Joana Adresa _ Postala _ Profesor din tabelul
profesori cu valoarea 'mun. Chisinau', unde adresa este necunoscuta. 

<img src="https://github.com/iondodon/DB/blob/main/Lab6/ex1/m1.png"/>

2. Sa se modifice schema tabelului grupe, ca sa corespunda urmatoarelor cerinte:
a) Campul Cod_ Grupa sa accepte numai valorile unice si sa nu accepte valori necunoscute.
b) Sa se tina cont ca cheie primarii, deja, este definitii asupra coloanei Id_ Grupa.

<img src="https://github.com/iondodon/DB/blob/main/Lab6/ex2/m1.png"/>

3. La tabelul grupe, sa se adauge 2 coloane noi Sef_grupa si Prof_Indrumator, ambele de tip
INT. Sii se populeze campurile nou-create cu cele mai potrivite candidaturi ill baza criteriilor
de maijos:
a) Seful grupei trebuie sa aiba cea mai buna reusitii (medie) din grupa la toate formele de
evaluare si la toate disciplinele. Un student nu poate fi sef de grupa la mai multe grupe.
b) Profesorul fndrumator trebuie sa predea un numiir maximal posibil de discipline la grupa
data. Daca nu existii o singurii candidaturii, care corespunde primei cerinte, atunci este
ales din grupul de candidati acel cu identificatorul (Id_Profesor) minimal. Un profesor nu
poate fi illdrumator la mai multe grupe.
c) Sii se scrie instructiunile ALTER, SELECT, UPDATE necesare pentru crearea coloanelor
in tabelul grupe, pentru selectarea candidatilor si inserarea datelor.

<img src="https://github.com/iondodon/DB/blob/main/Lab6/ex3/ex3a.png"/>
<img src="https://github.com/iondodon/DB/blob/main/Lab6/ex3/ex3b.png"/>
<img src="https://github.com/iondodon/DB/blob/main/Lab6/ex3/ex3c.png"/>

4. Sa se scrie o instructiune T-SQL, care ar mari toate notele de evaluare sefilor de grupe cu un
punct. Nota maximala (10) nu poate fi miirita. 

<img src="https://github.com/iondodon/DB/blob/main/Lab6/ex4/ex4.png"/>

5. Sa se creeze un tabel profesori_new, care include urmatoarele coloane: Id_Profesor, Nume _ Profesor, Prenume _ Profesor, Localitate, Adresa _ 1, Adresa _ 2.

<img src="https://github.com/iondodon/DB/blob/main/Lab6/ex5/ex5.png"/>

``` sql
create table profesori_new(
	[Id Profesor] int,
	[Numer Profesor] varchar(60) not null,
	[Prenume Profesor] varchar(60) not null,
	Localitatea varchar(60) default 'mun. Chisinau',
	[Adresa 1] varchar(255),
	[Adresa 2] varchar(255),
	primary key ([Id Profesor])
);

insert into profesori_new
([Id Profesor], [Numer Profesor], [Prenume Profesor], Localitatea, [Adresa 1], [Adresa 2])
(select Id_Profesor, Nume_Profesor, Prenume_Profesor, 
case 
	when charindex('s.', Adresa_Postala_Profesor) > 0 then
		case 
			when charindex('str.', Adresa_Postala_Profesor) > 0
				then substring(Adresa_Postala_Profesor, 1, charindex(', str.', Adresa_Postala_Profesor)-1)
			when charindex('bd.', Adresa_Postala_Profesor) > 0
				then substring(Adresa_Postala_Profesor, 1, charindex(', bd.', Adresa_Postala_Profesor)-1)
		end
	when charindex('or.', Adresa_Postala_Profesor) > 0 then
		case 
			when charindex('str.', Adresa_Postala_Profesor) > 0
				then substring(Adresa_Postala_Profesor, 1, charindex(', str.', Adresa_Postala_Profesor)-1)
			when charindex('bd.', Adresa_Postala_Profesor) > 0
				then substring(Adresa_Postala_Profesor, 1, charindex(', bd.', Adresa_Postala_Profesor)-1)
		end
	when charindex('mun.', Adresa_Postala_Profesor) > 0 
		then substring(Adresa_Postala_Profesor, 1, charindex('au', Adresa_Postala_Profesor)+1)
end, 

case
	when charindex('str.', Adresa_Postala_Profesor) > 0
		then substring(Adresa_Postala_Profesor, charindex('str.', Adresa_Postala_Profesor), 
											patindex('%, [0-9]%', Adresa_Postala_Profesor) - charindex('str.', Adresa_Postala_Profesor) )
	when charindex('bd.', Adresa_Postala_Profesor) > 0
		then substring(Adresa_Postala_Profesor, charindex('bd.', Adresa_Postala_Profesor), 
											patindex('%, [0-9]%', Adresa_Postala_Profesor) - charindex('bd.', Adresa_Postala_Profesor) )
end,

case
	when patindex('%, [0-9]%', Adresa_Postala_Profesor) > 0
	then substring(Adresa_Postala_Profesor, patindex('%, [0-9]%', Adresa_Postala_Profesor) + 1, 
										len(Adresa_Postala_Profesor) - patindex('%, [0-9]%', Adresa_Postala_Profesor) + 1)
end
from profesori)

delete from profesori_new;

select * from profesori
select * from profesori_new
```

6. Sa se insereze datele in tabelul orarul pentru Grupa= 'CIBJ 71' (Id_ Grupa= 1) pentru ziua de
luni. Toate lectiile vor avea loc ill blocul de studii 'B'.

<img src="https://github.com/iondodon/DB/blob/main/Lab6/ex6/ex6.png"/>

7. Sii se scrie expresiile T-SQL necesare pentru a popula tabelul orarul pentru grupa INFl 71 ,
ziua de luni. 

<img src="https://github.com/iondodon/DB/blob/main/Lab6/ex7/m1.png"/>
<img src="https://github.com/iondodon/DB/blob/main/Lab6/ex7/m2.png"/>

``` sql
create table orarul(
	Id_Disciplina int,
	Id_Profesor int,
	Id_Grupa int,
	Ora time,
	Auditoriu int,
	Bloc char(1) default 'B',
	Ziua char(10) not null
);


insert into orarul (Id_Disciplina, Id_Profesor, Id_Grupa, Ora, Auditoriu, Ziua)
select distinct dis.Id_Disciplina, pr.Id_Profesor, gr.Id_Grupa, 
	case
		when pr.Nume_Profesor = 'Bivol' and pr.Prenume_Profesor = 'Ion' then '08:00'
		when pr.Nume_Profesor = 'Mircea' and pr.Prenume_Profesor = 'Sorin' then '11:30' 
		when pr.Nume_Profesor = 'Micu' and pr.Prenume_Profesor = 'Elena' then '13:00'
	end,

	202,
	'Luni'

	from discipline as dis
		inner join studenti_reusita as sr
			on dis.Id_Disciplina = sr.Id_Disciplina
		inner join profesori as pr
			on sr.Id_Profesor = pr.Id_Profesor
		inner join grupe as gr
			on sr.Id_Grupa = gr.Id_Grupa
	where ((dis.Disciplina  = 'Structuri de date si algoritmi' and pr.Nume_Profesor = 'Bivol' and pr.Prenume_Profesor = 'Ion') 
		or (dis.Disciplina = 'Programe aplicative' and pr.Nume_Profesor = 'Mircea' and pr.Prenume_Profesor = 'Sorin')
		or (dis.Disciplina = 'Baze de date' and pr.Nume_Profesor = 'Micu' and pr.Prenume_Profesor = 'Elena'))
		and gr.Cod_Grupa = 'INF171'

select * from profesori;
select * from orarul;
select * from grupe;
select * from studenti_reusita;

delete from orarul;
```

8. Sa se scrie interogarile de creare a indecsilor asupra tabelelor din baza de date universitatea
pentru a asigura o performanta sporita la executarea interogarilor SELECT din Lucrarea
practica 4. Rezultatele optimizarii sa fie analizate in baza planurilor de executie, pana la si
dupa crearea indecsilor.

<img src="https://github.com/eminescum/DB/blob/main/Lab6/ex8/b1.png"/>
<img src="https://github.com/iondodon/DB/blob/main/Lab6/ex8/indexes_creation.png"/>
<img src="https://github.com/eminescum/DB/blob/main/Lab6/ex8/a1.png"/>