drop table orarul;

select * from orarul;

create table orarul (
	Id_Disciplina int not null,
	Id_Profesor int not null,
	Id_Grupa smallint not null,
	Ora time not null,
	Auditoriu int not null,
	Bloc char(1),
	Zi char(10),

	primary key (Id_Grupa, Zi, Ora, Auditoriu)
);