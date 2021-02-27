-- checking schemabinding option
drop table studenti.studenti_reusita;

-- checking : with check option
update studenti_reusita_view_ex3
set Tip_Evaluare = 'Test'
where Id_Profesor = 103;

select * from studenti_reusita_view_ex3;