-- 3. Rezolvati aceesi sarcina, 1, apeland la structura selectiva CASE

declare @n1 int, @n2 int, @n3 int
declare @mai_mare int

set @n1 = 60 * rand()
set @n2 = 60 * rand()
set @n3 = 60 * rand()

print @n1
print @n2
print @n3
print 'Mai mare = ' + cast(
	case
		when @n1 > @n2 and @n1 > @n3 then @n1 
		when @n2 > @n1 and @n2 > @n3 then @n2
		when @n3 > @n1 and @n3 > @n2 then @n3
	end
 as varchar(2))