declare @top3 table(
	Id_Student int,
	media decimal(5,3)
);

exec top3studenti 'Sisteme de operare';

select * from discipline;