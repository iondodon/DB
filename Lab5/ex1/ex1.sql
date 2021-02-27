-- 1. Completati urmatorul cod pentru a afi~a eel mai mare numar dintre cele trei numere prezentate:
declare @n1 int, @n2 int, @n3 int
declare @mai_mare int

set @n1 = 60 * rand()
set @n2 = 60 * rand()
set @n3 = 60 * rand()

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

print @n1
print @n2
print @n3
print 'Mai mare = ' + cast(@mai_mare as varchar(2))