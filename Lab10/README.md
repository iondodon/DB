1. Sa se modifice declansatorul inregistrare_noua, in asa fel, incat in cazul actualizarii
auditoriului sa apara mesajul de informare, care, in afara de disciplina si ora, va afisa codul
grupei afectate, ziua, blocul, auditoriul vechi si auditoriul nou.

<img src="https://github.com/iondodon/DB/blob/master/Lab10/ex1/m1.png"/>

2. Sa se creeze declansatorul, care ar asigura popularea corecta (consecutiva) a tabelelor studenti
si studenti_reusita, si ar permite evitarea erorilor la nivelul cheilor exteme.

<img src="https://github.com/iondodon/DB/blob/master/Lab10/ex2/m1.png"/>

3. Sa se creeze un declansator, care ar interzice micsorarea notelor in tabelul studenti_reusita si
modificarea valorilor campului Data_Evaluare, unde valorile acestui camp sunt nenule.
Declansatorul trebuie sa se lanseze, numai daca sunt afectate datele studentilor din grupa
"CIB 171". Se va afisa un mesaj de avertizare in cazul tentativei de a incalca constrangerea.

``` sql
alter trigger studenti_reusita_after_update
on studenti_reusita
after update
as
if (
	select gr.Cod_Grupa
	from grupe as gr 
		inner join inserted as ins on gr.Id_Grupa = ins.Id_Grupa
) = 'CIB171'
begin
	declare @nota_veche tinyint = (select Nota from deleted);
	declare @nota_noua tinyint = (select Nota from inserted);

	if @nota_noua < @nota_veche
		begin
			print('The mark is not allowed to be decreased.');
			rollback transaction;
		end;

	declare @data_evaluare_veche date = (select Data_Evaluare from deleted);
	declare @data_evaluare_noua date = (select Data_Evaluare from inserted);

	if @data_evaluare_veche is not null
	if(@data_evaluare_noua <> @data_evaluare_veche)
		begin
			print('The Data_evaluare is not allowed to be changed.');
			rollback transaction;
		end;
end else 
	begin
		print('Trigger runs only for grupe CIB171.');
	end;
```

<img src="https://github.com/iondodon/DB/blob/master/Lab10/ex3/m1.png"/>
<img src="https://github.com/iondodon/DB/blob/master/Lab10/ex3/m2.png"/>
<img src="https://github.com/iondodon/DB/blob/master/Lab10/ex3/m3.png"/>

4. Sa se creeze un declansator DDL care ar interzice modificarea coloanei ld_Disciplina in
tabelele bazei de date universitatea cu afisarea mesajului respectiv.

<img src="https://github.com/iondodon/DB/blob/master/Lab10/ex4/m1.png"/>

5. Sa se creeze un declansator DDL care ar interzice modificarea schemei bazei de date in afara
orelor de lucru.

<img src="https://github.com/iondodon/DB/blob/master/Lab10/ex5/m1.png"/>

6. Sa se creeze un declansator DDL care, la modificarea proprietatilor coloanei ld_Profesor
dintr-un tabel, ar face schimbari asemanatoare in mod automat in restul tabelelor.

<img src="https://github.com/iondodon/DB/blob/master/Lab10/ex6/m1.png"/>