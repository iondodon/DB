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




select * from discipline;