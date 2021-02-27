-- 4. Modificati exercitiile din sarcinile 1 si 2 pentru a include procesarea erorilor cu TRY si CATCH, si RAISERRROR. 

-- 1. Completati urmatorul cod pentru a afisa eel mai mare numar dintre cele trei numere prezentate:
declare @n1 int, @n2 int, @n3 int
declare @mai_mare int

set @n1 = 60 * rand()
set @n2 = 60 * rand()
set @n3 = 60 * rand()

begin try
	if @n1 is null throw 1, 'n1 is not setted', 1 
	if @n2 is null throw 1, 'n2 is not setted', 1
	if @n3 is null throw 1, 'n3 is not setted', 1

	if @n1 > @n2 
		begin
			if @n1 > @n3 set @mai_mare = @n1
				else set @mai_mare = @n3
		end
	else 
		begin
			if @n2 > @n3 set @mai_mare = @n2 
				else set @mai_mare = @n3
		end
end try
begin catch
	print 'one on the variables is not setted'
end catch

print @n1
print @n2
print @n3
print 'Mai mare = ' + cast(@mai_mare as varchar(2))

-- 2. Afisati primele zece date (numele, prenumele studentului) in functie de valoarea notei (cu exceptia
-- notelor 6 si 8) a studentului la primul test al disciplinei Baze de date , folosind structura de
-- altemativa IF. .. ELSE. Sa se foloseasca variabilele. 

declare @counter int 
declare @nume_disciplina varchar(20)
declare @test varchar(20) = 'Testul 1'
declare @note table (nota int)

insert into @note(nota) values (6)
insert into @note(nota) values (8)

if @counter is null raiserror('counter is not setted', 1, 1)
if @nume_disciplina is null raiserror('nume disciplina is not setted', 1, 1)
if @test is null raiserror('test is nod setted', 1, 1)

select distinct st1.Nume_Student, st1.Prenume_Student
from studenti_reusita as sr1
	inner join studenti as st1
		on sr1.Id_Student = st1.Id_Student
	inner join discipline as dis1
		on dis1.Id_Disciplina = sr1.Id_Disciplina
where dis1.Disciplina = @nume_disciplina and sr1.Tip_Evaluare = @test
	and sr1.Nota not in (select nt.nota from @note as nt)






select * from studenti_reusita
select * from studenti
select * from profesori
select * from grupe
select * from discipline