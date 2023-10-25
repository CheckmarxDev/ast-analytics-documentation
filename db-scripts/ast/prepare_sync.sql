--ANALYTICS
select count(1) as projects, 0 as applications, 0 as scans from project
 WHERE 
        created_at >= '2023-10-24T00:00:00.000+01:00'
    AND created_at <= '2023-10-24T23:59:59.000+01:00'
union all 
select 0 as projects, count(1) as applications, 0 as scans from application
WHERE        
    created_at >= '2023-10-24T00:00:00.000+01:00'
    AND created_at <= '2023-10-24T23:59:59.000+01:00'
union all 
select 0 as projects,0 as applications, count(1) as scans from scan
WHERE  created_at >= '2023-10-24T00:00:00.000+01:00'
    AND created_at <= '2023-10-24T23:59:59.000+01:00'

    select * from project order by created_at desc limit 1 
    select * from scans where project_id=''
  