alter table grupe
alter column Cod_Grupa char(6) not null

alter table grupe
add unique(Cod_Grupa)

select * from grupe