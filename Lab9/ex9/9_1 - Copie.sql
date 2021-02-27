	if @is_good = 'sarguincios' then
		begin
			insert into @result
			select top 1 gr1.Cod_Grupa concat(st1.Nume_Student, st1.Prenume_Student), 
				cast(avg(sr1.Nota*1.0) as decimal(5,2)) as media, 'sarguincios'
			from studenti as st1
				inner join studenti_reusita as sr1
					on st1.Id_Student = sr1.Id_Student
				inner join grupe as gr1
					on gr1.Id_Grupa = sr1.Id_Grupa
			where gr1.Cod_Grupa = @cod_grupa
			group by st1.Nume_Student, st1.Prenume_student
			order by media desc
		end
	else if @is_good = 'slab' then
		begin
			insert into @result
			select top 1 gr1.Cod_Grupa concat(st1.Nume_Student, st1.Prenume_Student), 
				cast(avg(sr1.Nota*1.0) as decimal(5,2)) as media, 'slab'
			from studenti as st1
				inner join studenti_reusita as sr1
					on st1.Id_Student = sr1.Id_Student
				inner join grupe as gr1
					on gr1.Id_Grupa = sr1.Id_Grupa
			where gr1.Cod_Grupa = @cod_grupa
			group by st1.Nume_Student, st1.Prenume_student
			order by media asc
		end