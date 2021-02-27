update studenti_reusita
set Nota = case when Nota < 10 then Nota + 1 else 10 end
where Id_Student = (select distinct top 1 studenti_sortati.Id_Student
					 from (select distinct top 1 Id_Student, (select cast(avg(Nota*1.0) as decimal(5,3))
															   from studenti_reusita as sr2
															   where sr2.Id_Student = sr1.Id_Student
															 ) as media
							from studenti_reusita as sr1
							where studenti_reusita.Id_Grupa = sr1.Id_Grupa
							order by media desc
					      ) as studenti_sortati
				   )


select * from studenti_reusita
select * from grupe
select * from studenti