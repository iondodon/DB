go
create procedure proc3
	@result int output
as
begin
	set @result = (
		select count(distinct Id_Student)
		from studenti_reusita as sr1
		where sr1.Nota < 5 or sr1.Nota is null
	)
end

declare @nr_studenti int;
execute proc3 @nr_studenti output;
select @nr_studenti;