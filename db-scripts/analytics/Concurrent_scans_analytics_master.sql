

/*
SELECT  ROW_NUMBER() OVER (ORDER BY tenant) AS id, COALESCE(MAX(intersections),0) AS max_intersections, tenant
FROM (
SELECT COUNT(*) AS intersections, t1.id as scan_id, t1.tenant_id as tenant
FROM public.scan t1
JOIN public.scan t2
ON t1.created_at <= t2.updated_at AND t1.updated_at >= t2.created_at 
AND t2.tenant_id=t1.tenant_id
AND t1.deleted = 'false'
WHERE t1.created_at >= '2023-09-15 00:00:00'::timestamp AND t1.created_at < '2023-09-15 23:59:59'
AND t1.updated_at >= '2023-09-15 00:00:00'::timestamp AND  t1.updated_at < '2023-09-15 23:59:59'
AND t2.created_at >= cast('2023-09-15 00:00:00'::timestamp as date) - interval '7 days' AND t2.created_at < '2023-09-15 23:59:59'
AND t2.updated_at >= cast('2023-09-15 00:00:00'::timestamp as date) - interval '7 days' AND t2.updated_at < '2023-09-15 23:59:59'
GROUP BY t1.created_at, t1.updated_at, t1.tenant_id, t1.id) AS intersection_counts
GROUP BY tenant
LIMIT 5
OFFSET 0

*/



--WITH cte_interval as (select :startDate as _min, :endDate _max) ,cte_mark as (     select scan.tenant_id,scan.created_at as dte, 1 as inc     from scan, cte_interval     where (scan.created_at between cte_interval._min and cte_interval._max)     union all     select scan.tenant_id,scan.updated_at as dte, -1 as inc     from scan,cte_interval     where (scan.created_at between cte_interval._min and cte_interval._max) ) ,cte_count as (     select tenant_id, dte, sum(sum(inc)) over (partition by tenant_id order by dte) as concurrent     from cte_mark     group by dte,tenant_id )      select ROW_NUMBER() OVER (ORDER BY tenant_id) AS id, max(cte_count.concurrent) as max_intersections, cte_count.tenant_id as tenant     from cte_count     group by cte_count.tenant_id 	LIMIT :limitParam 	OFFSET :offsetParam"





WITH cte_interval as (select 1694816502 as _min, 1695853302 _max)
                ,cte_mark as (
	                select scan.tenant_id,scan.created_at as dte, 1 as inc
	                from scan, cte_interval
	                where (scan.created_at between TO_TIMESTAMP(cte_interval._min) and TO_TIMESTAMP(cte_interval._max))
					and scan.deleted = 'false'
	                union all
	                select scan.tenant_id,scan.updated_at as dte, -1 as inc
	                from scan,cte_interval
	                where (scan.created_at between TO_TIMESTAMP(cte_interval._min) and TO_TIMESTAMP(cte_interval._max))
					and scan.deleted = 'false'
                )
                ,cte_count as (
	                select tenant_id, dte, sum(sum(inc)) over (partition by tenant_id order by dte) as concurrent
	                from cte_mark
	                group by dte,tenant_id
                ) 
	               select  CAST(ROW_NUMBER() OVER (ORDER BY tenant_id) as bigint) AS id, max(cte_count.concurrent) as max_intersections, cte_count.tenant_id as tenant
	                from cte_count
					/*where tenant_id in ('xxxx'
									,'xx')*/
	                group by cte_count.tenant_id
					LIMIT 5
					OFFSET 0


--select * from public.engine_execution_summary where status='Failed'






/*
select 
	updated_at,
	 created_at
	,id as scan_id
	,engines
	,project_id
	,status
	,deleted  
from scan 
where 
	created_at>'2023-09-15 00:00:00'::timestamp
and created_at<'2023-09-15 23:59:59'::timestamp


select * 
from project 
where 
	created_at>'2023-09-15 00:00:00'::timestamp
and created_at<'2023-09-15 23:59:59'::timestamp


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
	 created_at>'2023-09-15 00:00:00'::timestamp
and created_at<'2023-09-15 23:59:59'::timestamp
--and
--s.id = 'xxxx'













select 
	count(1)
from scan 
where 
	created_at>'2023-09-15 00:00:00'::timestamp
and created_at<'2023-09-15 23:59:59'::timestamp
and deleted = false



select count(1) from
(
select 
	count(1) as totalScan
from scan s
inner join public.engine_execution_summary es
	on es.scan_id=s.id
where 
	created_at>'2023-09-15 00:00:00'::timestamp
and created_at<'2023-09-15 23:59:59'::timestamp
group by es.scan_id
) as x
*/
