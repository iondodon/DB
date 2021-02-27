 alter trigger profesori_new_changes
 on database
 after ALTER_TABLE
 as
 begin
	if eventdata().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]','nvarchar(max)') = 'Prenume_Profesor'    
	 begin
		declare @querry varchar(100) = eventdata().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)')
		declare @table_name varchar(100) = eventdata().value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(max)')

		declare @new_querry varchar(100) = replace(@querry, @table_name, 'profesori');
		execute (@new_querry)
		set @new_querry = replace(@querry, @table_name, 'profesori_new');
		execute (@new_querry)
	 end
 end;

alter table profesori
alter column Prenume_Profesor char(30);

select * from profesori_new;
select * from profesori;