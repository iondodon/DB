create table orarul (
	Id_Disciplina int not null,
	Id_Profesor int not null,
	Id_Grupa int not null,
	Ora time not null,
	Auditoriu int not null,
	Bloc char(1),
	Zi char(10),

	primary key (Id_Grupa, Zi, Ora, Auditoriu)
);

insert into orarul (Id_Disciplina, Id_Profesor, Id_Grupa, Ora, Auditoriu, Zi)
	   (select 107, 101, 1, '08:00', 202, 'Luni')
	   union 
	   (select 108, 101, 1, '11:30', 501, 'Luni')
	    union 
	   (select 119, 117, 1, '13:00', 501, 'Luni')

delete from orarul;

select * from discipline
select * from orarul;

drop table orarul;