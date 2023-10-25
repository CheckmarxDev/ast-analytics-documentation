--CXONE
select count(1) as projects, 0 as applications, 0 as scans from projects
WHERE created_at > '2023-10-01T00:00:00.000+01:00'
    AND created_at < '2023-10-19T00:00:00.000+01:00'
union all 
select 0 as projects, count(1) as applications, 0 as scans from applications
WHERE created_at > '2023-10-01T00:00:00.000+01:00'
    AND created_at < '2023-10-19T00:00:00.000+01:00'
union all 
select 0 as projects,0 as applications, count(1) as scans from scans
WHERE created_at > '2023-10-01T00:00:00.000+01:00'
    AND created_at < '2023-10-19T00:00:00.000+01:00'
	
select * from scans order by created_at

select * from projects


select * from scans s WHERE s.created_at > '2023-10-01T00:00:00.000+01:00'
   AND s.created_at < '2023-10-21T00:00:00.000+01:00';  
   
   
   select * from scans order by created_at desc where id='xxxx'
   