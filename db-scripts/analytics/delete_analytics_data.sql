
	
delete from public.engine_states where engine_execution_summary_id in(
select id from public.engine_execution_summary
WHERE scan_id IN (
    SELECT scan_id
    FROM scan s
    WHERE s.created_at > '2023-10-01T00:00:00.000+01:00'
    AND s.created_at < '2023-10-21T00:00:00.000+01:00'
)
);
delete from public.engine_severities where engine_execution_summary_id in(
select id from public.engine_execution_summary
WHERE scan_id IN (
    SELECT scan_id
    FROM scan s
    WHERE s.created_at > '2023-10-01T00:00:00.000+01:00'
    AND s.created_at < '2023-10-21T00:00:00.000+01:00'
)
);
delete from public.engine_status where engine_execution_summary_id in(
select id from public.engine_execution_summary
WHERE scan_id IN (
    SELECT scan_id
    FROM scan s
    WHERE s.created_at > '2023-10-01T00:00:00.000+01:00'
    AND s.created_at < '2023-10-21T00:00:00.000+01:00'
)
);
delete from public.pre_scan where scan_id IN (
    SELECT scan_id
    FROM scan s
    WHERE s.created_at > '2023-10-01T00:00:00.000+01:00'
    AND s.created_at < '2023-10-21T00:00:00.000+01:00'
);
DELETE FROM public.engine_execution_summary
WHERE scan_id IN (
    SELECT scan_id
    FROM scan s
    WHERE s.created_at > '2023-10-01T00:00:00.000+01:00'
    AND s.created_at < '2023-10-21T00:00:00.000+01:00'
);
delete from scan s  WHERE s.created_at > '2023-10-01T00:00:00.000+01:00'
   AND s.created_at < '2023-10-21T00:00:00.000+01:00';           
	
	
update scan  set exported=false  WHERE created_at > '2023-10-01T00:00:00.000+01:00'
   AND created_at < '2023-10-21T00:00:00.000+01:00';   
   
select * from scan s WHERE s.created_at > '2023-10-01T00:00:00.000+01:00'
   AND s.created_at < '2023-10-21T00:00:00.000+01:00';  
   
SELECT * FROM public.engine_execution_summary
WHERE scan_id IN (
    SELECT scan_id
    FROM scan s
    WHERE s.created_at > '2023-10-01T00:00:00.000+01:00'
    AND s.created_at < '2023-10-21T00:00:00.000+01:00'
);

select * from public.engine_severities where engine_execution_summary_id=9418
delete from project;
delete from application;
select * from pre_scan