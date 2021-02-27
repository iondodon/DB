1. Creati o diagrama a bazei de date, folosind forma de vizualizare standard, structura careia este
descrisa la inceputul sarcinilor practice din capitolul 4.

<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex1/m1.png"/>

2. Sa se adauge constrangeri referentiale (legate cu tabelele studenti si profesori) necesare
coloanelor Sef_grupa si Prof_Indrumator (sarcina3, capitolul 6) din tabelul grupe. 

<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex2/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex2/m2.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex2/m3.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex2/m4.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex2/m5.png"/>

3. La diagrama construitii, sa se adauge si tabelul orarul definit in capitolul 6 al acestei lucrari:
tabelul orarul contine identificatorul disciplinei (ld_Disciplina), identificatorul profesorului
(Id_Profesor) si blocul de studii (Bloc). Cheia tabelului este constituita din trei caunpuri:
identificatorul grupei (Id_ Grupa), ziua lectiei (Z1), ora de inceput a lectiei (Ora), sala unde
are loc lectia (Auditoriu).

<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex3/m1.png"/>

``` sql

drop table orarul;

select * from orarul;

create table orarul (
	Id_Disciplina int not null,
	Id_Profesor int not null,
	Id_Grupa smallint not null,
	Ora time not null,
	Auditoriu int not null,
	Bloc char(1),
	Zi char(10),

	primary key (Id_Grupa, Zi, Ora, Auditoriu)
);

```

4. Tabelul orarul trebuie sa contina si 2 chei secundare: (Zi, Ora, Id_ Grupa, Id_ Profesor) si
(Zi, Ora, ld_Grupa, ld_Disciplina). 

<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex4/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex4/m2.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex4/m3.png"/>

5. In diagrama, de asemenea, trebuie sa se defineasca constrangerile referentiale (FK-PK) ale
atributelor ld_Disciplina, ld_Profesor, Id_ Grupa din tabelului orarul cu atributele tabelelor
respective.

<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex5/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex5/m2.png"/>

6. Creati, in baza de date universitatea, trei scheme noi: cadre_didactice, plan_studii si studenti.
Transferati tabelul profesori din schema dbo in schema cadre didactice, tinand cont de
dependentelor definite asupra tabelului mentionat. in acelasi mod sa se trateze tabelele orarul,
discipline care apartin schemei plan_studii si tabelele studenti, studenti_reusita, care apartin
schemei studenti. Se scrie instructiunile SQL respective.

``` sql
--create schema cadre_didactice authorization dbo;

alter schema cadre_didactice
	transfer dbo.profesori

--create schema plan_studii authorization dbo;

alter schema plan_studii
	transfer dbo.orarul

alter schema plan_studii
	transfer dbo.discipline

--create schema studenti authorization dbo;

alter schema studenti
	transfer dbo.studenti;

alter schema studenti
	transfer dbo.studenti_reusita;
```

7. Modificati 2-3 interogari asupra bazei de date universitatea prezentate in capitolul 4 astfel ca
numele tabelelor accesate sa fie descrise in mod explicit, tinand cont de faptul ca tabelele au
fost mutate in scheme noi.

<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex7/m1.png"/>
<img src="https://github.com/eminescum/DB/blob/master/Lab7/ex7/m2.png"/>

``` sql 
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
```

8. Creati sinonimele respective pentru a simplifica interogarile construite in exercitiul precedent
si reformulati interogarile, folosind sinonimele create.

``` sql
create synonym studenti_reusita for studenti.studenti_reusita;
create synonym profesori for cadre_didactice.profesori;
create synonym discipline for plan_studii.discipline;
create synonym studenti for studenti.studenti;

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
```