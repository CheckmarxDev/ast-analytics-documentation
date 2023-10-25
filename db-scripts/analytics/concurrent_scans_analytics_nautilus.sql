--select *  from scan_results limit 5
--select * from public.vulnerability_detail 
--where resolved_scan_id <> null
--limit 5



/*
WITH cte_interval as (select '2023-09-15T22:21:42Z'::timestamp  as _min,'2023-09-28T22:21:42Z'::timestamp  _max) ,cte_mark as (     select scan.tenant_id,scan.created_at as dte, 1 as inc     from scan, cte_interval     where (scan.created_at between cte_interval._min and cte_interval._max)     union all     select scan.tenant_id,scan.updated_at as dte, -1 as inc     from scan,cte_interval     where (scan.created_at between cte_interval._min and cte_interval._max) ) ,cte_count as (     select tenant_id, dte, sum(sum(inc)) over (partition by tenant_id order by dte) as concurrent     from cte_mark     group by dte,tenant_id )      select ROW_NUMBER() OVER (ORDER BY tenant_id) AS id, max(cte_count.concurrent) as max_intersections, cte_count.tenant_id as tenant     from cte_count     group by cte_count.tenant_id 	LIMIT 10 	OFFSET 0

WITH cte_interval as (select 1694816502 as _min, 1695939702 _max)
                ,cte_mark as (
	                select scan.tenant_id,scan.created_at as dte, 1 as inc
	                from scan, cte_interval
	                where (scan.created_at between TO_TIMESTAMP(cte_interval._min) and TO_TIMESTAMP(cte_interval._max))
					--and scan.deleted = 'false'
	                union all
	                select scan.tenant_id,scan.updated_at as dte, -1 as inc
	                from scan,cte_interval
	                where (scan.created_at between TO_TIMESTAMP(cte_interval._min) and TO_TIMESTAMP(cte_interval._max))
					--and scan.deleted = 'false'
                )
                ,cte_count as (
	                select tenant_id, dte, sum(sum(inc)) over (partition by tenant_id order by dte) as concurrent
	                from cte_mark
	                group by dte,tenant_id
                ) 
	               select  CAST(ROW_NUMBER() OVER (ORDER BY tenant_id) as bigint) AS id, max(cte_count.concurrent) as max_intersections, cte_count.tenant_id as tenant
	                from cte_count
					/*where tenant_id in ('xxxx'
									,'xx'
									)*/
	                group by cte_count.tenant_id
					LIMIT 20
					OFFSET 0
					
					
		*/			
SELECT 
                s.tenant_id as tenantId
                ,s.project_id as projectId
                 ,ROW_NUMBER() OVER (ORDER BY s.id) AS id
                ,s.id AS scan_id
                 ,s.source as source
               ,s.origin as origin
                ,s.initiator as initiator
                ,s.created_at as createdAt
                ,COALESCE(s.execution_time,0) as executionTime
                ,s.status as status
                ,COALESCE(e.status,'unknown') as engineStatus
                ,e.sources as scanSources
                ,COALESCE(e.error_code,'0') as engineErrorCode
                ,COALESCE(e.loc , 0) as loc
                ,COALESCE(e.scan_type, 'unknown') as scanType
                ,COALESCE(e.execution_time,0) as engineExecutionTime
                ,COALESCE(e.engine, 'unknown') as engine
                ,COALESCE(pe.execution_time,0) as preScanExecutionTime
                ,COALESCE(pe.status,'') as preScanStatus
                ,COALESCE(pe.error_code,'0')as preScanErrorCode
                ,COALESCE(SUM(CASE WHEN Severity = 'CRITICAL' THEN es.counter END),0) AS severityCritical
                ,COALESCE(SUM(CASE WHEN Severity = 'HIGH' THEN es.counter END),0) AS severityHigh
                ,COALESCE(SUM(CASE WHEN Severity = 'LOW' THEN es.counter END),0) AS severityLow
                ,COALESCE(SUM(CASE WHEN Severity = 'MEDIUM' THEN es.counter END),0) AS severityMedium
                ,COALESCE(SUM(CASE WHEN Severity = 'INFO' THEN es.counter END),0) AS severityInfo
                ,COALESCE(s.deleted, false) as isDeleted
				,SUM(est.counter) as state
				,coalesce('PROPOSED_NOT_EXPLOITABLE',coalesce(cast(d.enum_state as varchar),'TO_VERIFY'),'4') as est_enum_state_predicate
				,est.state as state_enum_without_predicate
                FROM scan s
                LEFT JOIN public.engine_execution_summary e
                ON s.id = e.scan_id
                LEFT JOIN pre_scan pe
                ON s.id = pe.scan_id
                LEFT JOIN engine_severities es
                ON e.id=es.engine_execution_summary_id
                AND severity is not null
				LEFT JOIN engine_states est
                ON e.id=est.engine_execution_summary_id
				LEFT JOIN public.vulnerability_definition d
				on s.tenant_id=d.tenant_id and s.project_id=d.project_id
                WHERE s.id='xxxxx'
				
				GROUP BY 
                s.tenant_id,
                s.project_id,
                s.id,
                e.status,
                engine,
                pe.status,
                pe.error_code ,
                e.error_code,
                e.loc,
                e.scan_type,
                e.sources,
                e.execution_time,
                pe.execution_time,
                s.status,
                s.source,
                s.origin,
                s.initiator,
                s.created_at,
                s.deleted,
				d.enum_state,
				est.state
                offset 0
                limit 100
				
				--select coalesce(  '4','TO_VERIFY') from public.engine_states
				--select * from  public.vulnerability_definition d
				
				
				select 
				s.tenant_id,
				s.id,
				e.engine,
				s.created_at,
				es.severity,
				est.state
				from scan s
				LEFT JOIN public.engine_execution_summary e
                ON s.id = e.scan_id
                LEFT JOIN pre_scan pe
                ON s.id = pe.scan_id
                LEFT JOIN engine_severities es
                ON e.id=es.engine_execution_summary_id
                AND severity is not null
				LEFT JOIN engine_states est
                ON e.id=est.engine_execution_summary_id
				LEFT JOIN public.vulnerability_definition d
				on s.tenant_id=d.tenant_id and s.project_id=d.project_id
				where s.project_id = 'xxx'
				and created_at>'2023-09-27T23:59:59Z'::timestamp
				order by s.created_at desc
				
				
				select * from public.engine_execution_summary
				select * from public.vulnerability_definition
				select * from public.vulnerability_detail limit 5
				select * from public.scan_results limit 5
				select * from public.engine_states