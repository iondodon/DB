alter procedure replaceTeacher
	@prof_vechi_nume varchar(20),
	@prof_vechi_prenume varchar(20),
	@prof_nou_nume varchar(20),
	@prof_nou_prenume varchar(20),
	@disciplina varchar(20)
as
begin
	if @prof_nou_nume is null begin print('Introdu prof nou nume.'); return; end;
	if @prof_nou_prenume is null begin print('Introdu prof nou prenume.'); return; end;
	if @prof_vechi_nume is null begin print('Introdu prof vechi nume.'); return; end;
	if @prof_vechi_prenume is null begin print('Introdu prof vechi prenume.'); return; end;
	if @prof_vechi_prenume is null begin print('Introdu disciplina.'); return; end;

	declare @prof_vechi_id int = (
		select pr1.Id_Profesor 
		from profesori as pr1
		where pr1.Nume_Profesor = @prof_vechi_nume and pr1.Prenume_Profesor = @prof_vechi_prenume
	);

	declare @prof_nou_id int = (
		select pr1.Id_Profesor
		from profesori as pr1
		where pr1.Nume_Profesor = @prof_nou_nume and pr1.Prenume_Profesor = @prof_nou_prenume
	);

	update studenti_reusita
	set Id_Profesor = @prof_nou_id
	where Id_Profesor = @prof_vechi_id;
end

execute replaceTeacher 'Popescu', 'Gabriel', 'Munteanu', 'Alexandru', 'Informatica aplicata';

select * from studenti_reusita;
select * from grupe;
select * from profesori;
select * from discipline;
select * from studenti;