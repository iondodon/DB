alter trigger changes_on_time
on database
after alter_table
as
begin
	declare @work_time_start time = '08:00:00';
	declare @work_time_end time = '23:00:00';
	declare @current_time time = CONVERT (time, SYSDATETIME());

	if @current_time < @work_time_start or @current_time > @work_time_end
		begin
			print('Alter is not allowed outside the work time.');
			rollback transaction;
		end
end;

alter table studenti_reusita
alter column Id_Profesor int not null;