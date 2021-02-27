alter trigger studenti_reusita_after_update
on studenti_reusita
after update
as
if (
	select gr.Cod_Grupa
	from grupe as gr 
		inner join inserted as ins on gr.Id_Grupa = ins.Id_Grupa
) = 'CIB171'
begin
	declare @nota_veche tinyint = (select Nota from deleted);
	declare @nota_noua tinyint = (select Nota from inserted);

	if @nota_noua < @nota_veche
		begin
			print('The mark is not allowed to be decreased.');
			rollback transaction;
		end;

	declare @data_evaluare_veche date = (select Data_Evaluare from deleted);
	declare @data_evaluare_noua date = (select Data_Evaluare from inserted);

	if @data_evaluare_veche is not null
	if(@data_evaluare_noua <> @data_evaluare_veche)
		begin
			print('The Data_evaluare is not allowed to be changed.');
			rollback transaction;
		end;
end else 
	begin
		print('Trigger runs only for grupe CIB171.');
	end;

update studenti_reusita
set Data_Evaluare = '2018-01-26'
where Id_Student = 99 and Id_Disciplina = 100 and Id_Profesor = 110 and Id_Grupa = 1  and Tip_Evaluare = 'Test In'

select * from studenti_reusita;
select * from grupe;