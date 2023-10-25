--ANALYTICS
select count(1) as projects, 0 as applications, 0 as scans from project
 WHERE created_at > '2023-10-01T00:00:00.000+01:00'
    AND created_at < '2023-10-19T00:00:00.000+01:00'
union all 
select 0 as projects, count(1) as applications, 0 as scans from application
WHERE created_at > '2023-10-01T00:00:00.000+01:00'
    AND created_at < '2023-10-19T00:00:00.000+01:00'
union all 
select 0 as projects,0 as applications, count(1) as scans from scan
WHERE created_at > '2023-10-01T00:00:00.000+01:00'
    AND created_at < '2023-10-19T00:00:00.000+01:00'


select * from scan where id ='xxxxxx'
select * from project
select * from scan order by created_at
select * from public.engine_states

select * from public.engine_status

select * from public.engine_severities

select * from application
--select * from applications  
--WHERE created_at > '2023-10-01T00:00:00.000+01:00'
--    AND created_at < '2023-10-19T00:00:00.000+01:00'
--;

"2023-10-09 12:49:51.087801+00"	"2023-10-09 13:40:59.305981+00"
"2023-10-09 12:50:34.477293+00"	"2023-10-09 13:41:21.511268+00"