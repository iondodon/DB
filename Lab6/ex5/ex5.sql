create table profesori_new(
	[Id Profesor] int,
	[Numer Profesor] varchar(60) not null,
	[Prenume Profesor] varchar(60) not null,
	Localitatea varchar(60) default 'mun. Chisinau',
	[Adresa 1] varchar(255),
	[Adresa 2] varchar(255),
	primary key ([Id Profesor])
);

insert into profesori_new
([Id Profesor], [Numer Profesor], [Prenume Profesor], Localitatea, [Adresa 1], [Adresa 2])
(select Id_Profesor, Nume_Profesor, Prenume_Profesor, 
case 
	when charindex('s.', Adresa_Postala_Profesor) > 0 then
		case 
			when charindex('str.', Adresa_Postala_Profesor) > 0
				then substring(Adresa_Postala_Profesor, 1, charindex(', str.', Adresa_Postala_Profesor)-1)
			when charindex('bd.', Adresa_Postala_Profesor) > 0
				then substring(Adresa_Postala_Profesor, 1, charindex(', bd.', Adresa_Postala_Profesor)-1)
		end
	when charindex('or.', Adresa_Postala_Profesor) > 0 then
		case 
			when charindex('str.', Adresa_Postala_Profesor) > 0
				then substring(Adresa_Postala_Profesor, 1, charindex(', str.', Adresa_Postala_Profesor)-1)
			when charindex('bd.', Adresa_Postala_Profesor) > 0
				then substring(Adresa_Postala_Profesor, 1, charindex(', bd.', Adresa_Postala_Profesor)-1)
		end
	when charindex('mun.', Adresa_Postala_Profesor) > 0 
		then substring(Adresa_Postala_Profesor, 1, charindex('au', Adresa_Postala_Profesor)+1)
end, 

case
	when charindex('str.', Adresa_Postala_Profesor) > 0
		then substring(Adresa_Postala_Profesor, charindex('str.', Adresa_Postala_Profesor), 
											patindex('%, [0-9]%', Adresa_Postala_Profesor) - charindex('str.', Adresa_Postala_Profesor) )
	when charindex('bd.', Adresa_Postala_Profesor) > 0
		then substring(Adresa_Postala_Profesor, charindex('bd.', Adresa_Postala_Profesor), 
											patindex('%, [0-9]%', Adresa_Postala_Profesor) - charindex('bd.', Adresa_Postala_Profesor) )
end,

case
	when patindex('%, [0-9]%', Adresa_Postala_Profesor) > 0
	then substring(Adresa_Postala_Profesor, patindex('%, [0-9]%', Adresa_Postala_Profesor) + 1, 
										len(Adresa_Postala_Profesor) - patindex('%, [0-9]%', Adresa_Postala_Profesor) + 1)
end
from profesori)

delete from profesori_new;

select * from profesori
select * from profesori_new