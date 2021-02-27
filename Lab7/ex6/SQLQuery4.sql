--create schema plan_studii authorization dbo;

alter schema plan_studii
	transfer dbo.orarul

alter schema plan_studii
	transfer dbo.discipline