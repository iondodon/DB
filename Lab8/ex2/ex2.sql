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