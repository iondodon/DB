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
select * from grupe;