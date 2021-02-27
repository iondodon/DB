alter trigger insert_studenti_reusita_instead_of
on studenti_reusita
instead of insert
as
begin
	declare @id_student int = (select Id_Student from inserted);
	declare @id_disciplina int = (select Id_Disciplina from inserted);
	declare @id_profesor int = (select Id_Profesor from inserted);
	declare @id_grupa int = (select Id_Grupa from inserted);
	declare @tip_evaluare varchar(60) = (select Tip_Evaluare from inserted);
	declare @nota tinyint = (select Nota from inserted);
	declare @data_evaluare date = (select Data_Evaluare from inserted);
	
	if not exists (
		select st.Id_Student 
		from inserted as ins
			inner join studenti as st on ins.Id_Student = st.Id_Student
	) begin 
		insert into studenti
		values (@id_student, 'Dodon', 'Ion', '1998-06-14', 'mun. Chisinau, str. Alba-Iulia')
	end;

	insert into studenti_reusita
	values(@id_student, @id_disciplina, @id_profesor, @id_grupa, @tip_evaluare, @nota, @data_evaluare);
end;

insert into studenti_reusita 
values (99, 100, 110, 1, 'Test In', 9, '2018-01-25');

select count(*)
from studenti_reusita
where Tip_Evaluare = 'Test In'

select * from studenti;
select * from discipline;
select * from profesori;
select * from studenti_reusita;