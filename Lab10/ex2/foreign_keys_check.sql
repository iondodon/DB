--foreign keys deleted
create trigger insert_studenti_reusita_after
on studenti_reusita
after insert
as
begin
	if (select top 1 Id_Student from inserted) is null
	or (select top 1 Id_Disciplina from inserted) is null
	or (select top 1 Id_Profesor from inserted) is null
	or (select top 1 Id_Grupa from inserted) is null
		begin
			print('Id_Student, Id_Disciplina, Id_Profesor, Id_Grupa shouldnt be null');
			rollback transaction;
		end;

	if not exists (
		select st.Id_Student 
		from inserted as ins
			inner join studenti as st on ins.Id_Student = st.Id_Student
	) begin print('A student with this id does not exist'); rollback transaction; return; end;

	if not exists (
		select dis.Id_Disciplina
		from inserted as ins
			inner join discipline as dis on ins.Id_Disciplina = dis.Id_Disciplina
	) begin print('A subject with this id does not exist'); rollback transaction; return; end;

	if not exists (
		select pr.Id_Profesor
		from inserted as ins
			inner join profesori as pr on ins.Id_Profesor = pr.Id_Profesor
	) begin print('A teacher with this id does not exist'); rollback transaction; return; end;

	if not exists (
		select gr.Id_Grupa
		from inserted as ins
			inner join grupe as gr on ins.Id_Grupa = gr.Id_Grupa
	) begin print('A grupe with this id does not exist'); rollback transaction; return; end;


end;