/*SCAN DATA*/
select 
	 created_at
	,id as scan_id
	,engines
	,project_id
	,status
	,deleted  
from scan 
where 
	created_at>'2023-09-14 00:00:00'::timestamp
and created_at<'2023-09-14 23:59:59'::timestamp

/*PROJECT DATA*/
select * 
from project 
where 
	created_at>'2023-09-14 00:00:00'::timestamp
and created_at<'2023-09-14 23:59:59'::timestamp

/*SCAN BY ENGINE DATA*/
select 
	 created_at
	,s.id as scan_id
	,es.engine
	,s.engines
	,project_id
	,s.status as scanStatus
	,es.status as engineStatus
	,deleted  
from scan s
inner join public.engine_execution_summary es
	on es.scan_id=s.id
where 
	created_at>'2023-09-14 00:00:00'::timestamp
and created_at<'2023-09-14 23:59:59'::timestamp