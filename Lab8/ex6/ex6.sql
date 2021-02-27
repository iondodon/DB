declare @graf table(
	id int, 
	next_node int
); 

insert @graf
select 0, null union all
select 1, 0 union all
select 2, 1 union all
select 3, 2 union all
select 4, 2 union all
select 5, 0;
 
;with way(N, id, next_node) as (
	select 0, gf1.id, gf1.next_node 
	from @graf as gf1
	where gf1.id = 3
union all
	select N + 1, gf2.id, gf2.next_node
	from @graf as gf2 inner join way on gf2.id = way.next_node
	where gf2.id < 3
)
select * from way;

select * from @graf;