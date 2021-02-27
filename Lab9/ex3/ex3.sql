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