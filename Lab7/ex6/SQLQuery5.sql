--create schema studenti authorization dbo;

alter schema studenti
	transfer dbo.studenti;

alter schema studenti
	transfer dbo.studenti_reusita;