create table orarul (
	Id_Disciplina int not null,
	Id_Profesor int not null,
	Id_Grupa int not null,
	Ora time not null,
	Auditoriu int not null,
	Bloc char(1) not null,
	Zi char(10),

	primary key (Id_Grupa, Zi, Ora, Auditoriu)
);


insert into orarul (Id_Disciplina, Id_Profesor, Id_Grupa, Ora, Auditoriu, Zi)
select distinct dis.Id_Disciplina, pr.Id_Profesor, gr.Id_Grupa, 
	case
		when pr.Nume_Profesor = 'Bivol' and pr.Prenume_Profesor = 'Ion' then '08:00'
		when pr.Nume_Profesor = 'Mircea' and pr.Prenume_Profesor = 'Sorin' then '11:30' 
		when pr.Nume_Profesor = 'Micu' and pr.Prenume_Profesor = 'Elena' then '13:00'
	end,

	202,
	'Luni'

	from discipline as dis
		inner join studenti_reusita as sr
			on dis.Id_Disciplina = sr.Id_Disciplina
		inner join profesori as pr
			on sr.Id_Profesor = pr.Id_Profesor
		inner join grupe as gr
			on sr.Id_Grupa = gr.Id_Grupa
	where ((dis.Disciplina  = 'Structuri de date si algoritmi' and pr.Nume_Profesor = 'Bivol' and pr.Prenume_Profesor = 'Ion') 
		or (dis.Disciplina = 'Programe aplicative' and pr.Nume_Profesor = 'Mircea' and pr.Prenume_Profesor = 'Sorin')
		or (dis.Disciplina = 'Baze de date' and pr.Nume_Profesor = 'Micu' and pr.Prenume_Profesor = 'Elena'))
		and gr.Cod_Grupa = 'INF171'

select * from profesori;
select * from orarul;
select * from grupe;
select * from studenti_reusita;

delete from orarul;