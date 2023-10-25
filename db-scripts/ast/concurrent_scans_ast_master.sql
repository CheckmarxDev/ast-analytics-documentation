WITH cte_interval as (
                select '2023-09-15 00:00:00'::timestamp as _min, '2023-09-15 23:59:59'::timestamp _max
				--select current_timestamp - interval '1 day' as _min, current_timestamp _max
                )
                ,cte_mark as (
	                select scans.tenant,scans.created_at as dte, 1 as inc
	                from scans, cte_interval
	                where (scans.created_at between cte_interval._min and cte_interval._max)
	                union all
	                select scans.tenant,scans.updated_at as dte, -1 as inc
	                from scans,cte_interval
	                where (scans.created_at between cte_interval._min and cte_interval._max)
                )
                ,cte_count as (
	                select tenant, dte, sum(sum(inc)) over (partition by tenant order by dte) as concurrent
	                from cte_mark
	                group by dte,tenant
                ) 
	                select cte_count.tenant,max(cte_count.concurrent) as _max
	                from cte_count
					where tenant in ('xxxxxx'
									,'xxxxx'
									)
	                group by cte_count.tenant