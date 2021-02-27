alter trigger dont_change_Id_Disciplina
on database 
after alter_table, drop_table
as
begin
	if EVENTDATA().value
		('(EVENT_INSTANCE/AlterTableActionList/Alter/Columns/Name)[1]', 'nvarchar(max)') = 'Id_Disciplina'
	begin
		print('Alter or drop column Id_Discilina is not allowed.');
		rollback;
		return;
	end
end;

alter table studenti_reusita
alter column Id_Disciplina int not null;