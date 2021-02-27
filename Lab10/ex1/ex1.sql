alter trigger inregistrare_noua on orarul
after update
as
begin
	if update(auditoriu)
	select 'Lectia de la disciplina "' + upper(dis.Disciplina) + 
			'" de la ora ' + cast(ins.Ora as varchar(5)) + 
			' a fost transferata de la aula ' + cast(del.Auditoriu as char(3)) + 
			' la aula ' + cast(ins.Auditoriu as char(3)) + 
			' pentru grupa ' + cast(gr.Cod_Grupa as varchar(6)) + 
			' in ziua de ' + cast(ins.Ziua as varchar(10)) + 
			', blocul ' + cast(ins.Bloc as char(1))
	from inserted ins 
		join discipline dis on ins.Id_Disciplina = dis.Id_Disciplina	
		join deleted del on del.Id_Disciplina = ins.Id_Disciplina
		join grupe gr on gr.Id_Grupa = del.Id_Grupa
end;

update orarul
set Auditoriu = 203

select * from orarul;
select * from grupe;