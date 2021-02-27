alter function celmai(@cod_grupa char(6), @is_good varchar(10))
	returns @result table(
		Grupa char(6),
		Nume_Student varchar(50),
		Prenume_Student varchar(50),
		Nota_Medie decimal(5,2),
		is_good varchar(20)
	)
as
begin
	insert @result
	select top 1 gr1.Cod_Grupa, st1.Nume_Student, st1.Prenume_Student,
		cast(avg(sr1.Nota*1.0) as decimal(5,2)) as media, @is_good as is_good
	from studenti as st1
		inner join studenti_reusita as sr1
			on st1.Id_Student = sr1.Id_Student
		inner join grupe as gr1
			on gr1.Id_Grupa = sr1.Id_Grupa
	where gr1.Cod_Grupa = @cod_grupa
	group by gr1.Cod_Grupa, st1.Nume_Student, st1.Prenume_Student
	order by case @is_good when 'sarguincios' then cast(avg(sr1.Nota*1.0) as decimal(5,2)) end desc,  
			 case @is_good when 'slab' then cast(avg(sr1.Nota*1.0) as decimal(5,2)) end;

	return
end