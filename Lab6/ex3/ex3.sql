alter table grupe
add Sef_grupa int, Prof_Indrumator int

update grupe
set Sef_grupa = (select top 1 studenti_sortati.Id_Student
				  from (select distinct top 1 sr1.Id_Student, (select cast(avg(sr2.Nota*1.0) as decimal(5,3))
														 from studenti.studenti_reusita as sr2
														 where sr2.Id_Student = sr1.Id_Student
														) as media
						 from studenti.studenti_reusita as sr1
						 where grupe.Id_Grupa = sr1.Id_Grupa
						 order by media desc
				       ) as studenti_sortati
				)
				--
declare @profesori table(Id_Profesor int primary key);



update grupe
set Prof_Indrumator = (select top 1 profesori_sortati.Id_Profesor
						from (select distinct top 1 sr1.Id_Profesor, (select count(distinct sr2.Id_Profesor)
																   from studenti_reusita as sr2
																   where sr2.Id_Profesor = sr1.Id_Profesor
																 ) as nrDiscipline
							   from studenti_reusita as sr1
							   where grupe.Id_Grupa = sr1.Id_Grupa
							   order by nrDiscipline desc
							 ) as profesori_sortati
				      )

-- c)
alter table grupe
add Nr_studenti int

select gr1.Sef_grupa
from grupe as gr1
where gr1.Cod_Grupa = 'INF171'

update grupe
set Nr_studenti = 25
where Prof_Indrumator = 100


select * from grupe
select * from studenti_reusita