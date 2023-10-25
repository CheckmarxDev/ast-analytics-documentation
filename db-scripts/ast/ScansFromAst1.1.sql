select 
 
  scan_data.scan_id
 ,scan_data.created_at
 ,scan_data.execution_time
 ,scan_data.initiator
 ,scan_data.origin
 ,scan_data.project_id
 ,scan_data.source
 ,scan_data.status
 ,scan_data.tenant_id
 ,scan_data.updated_at
 ,scan_data.engines
 ,scan_data.incremental
 ,scan_data.branch
 ,scan_data.tags
 ,scan_data.engine
 ,scan_data.engine_status
 ,scan_data.engine_error_code
 ,scan_data.engine_loc
 ,SUM(CAST(COALESCE(sast_summary.counters ->> 'total', '0') as int)) as sast_total
 ,SUM(cast(COALESCE(sast_summary.counters->>'severity:-1','0')as int)) + SUM(cast(COALESCE(sast_summary.counters->>'severity:-1:predicate','0')as int)) as sast_critical
 ,SUM(cast(COALESCE(sast_summary.counters->>'severity:0','0')as int)) + SUM(cast(COALESCE(sast_summary.counters->>'severity:0:predicate','0')as int)) as sast_high 
 ,SUM(cast(COALESCE(sast_summary.counters->>'severity:1','0')as int)) + SUM(cast(COALESCE(sast_summary.counters->>'severity:1:predicate','0')as int)) as sast_medium
 ,SUM(cast(COALESCE(sast_summary.counters->>'severity:2','0')as int)) + SUM(cast(COALESCE(sast_summary.counters->>'severity:2:predicate','0')as int)) as sast_low
 ,SUM(cast(COALESCE(sast_summary.counters->>'severity:3','0')as int)) + SUM(cast(COALESCE(sast_summary.counters->>'severity:3:predicate','0')as int)) as sast_info
 ,SUM(cast(COALESCE(sast_summary.counters->>'state:1','0')as int))  as sast_not_exploitable
 ,SUM(cast(COALESCE(sast_summary.counters->>'state:2','0')as int))  as sast_proposed_not_exploitable
 ,SUM(cast(COALESCE(sast_summary.counters->>'state:3','0')as int))  as sast_confirmed
 ,SUM(cast(COALESCE(sast_summary.counters->>'state:4','0')as int))  as sast_urgent 
 ,SUM(cast(COALESCE(sast_summary.counters->>'status:0','0')as int))  as sast_new
 ,SUM(cast(COALESCE(sast_summary.counters->>'status:1','0')as int))  as sast_recurrent
 ,SUM(cast(COALESCE(sast_summary.counters->>'status:2','0')as int))  as sast_resolved

 ,SUM(CAST(COALESCE(kics_summary.counters ->> 'total', '0') as int)) as kics_total
 ,SUM(cast(COALESCE(kics_summary.counters->>'severity:-1','0')as int)) + SUM(cast(COALESCE(kics_summary.counters->>'severity:-1:predicate','0')as int)) as kics_critical
 ,SUM(cast(COALESCE(kics_summary.counters->>'severity:0','0')as int)) + SUM(cast(COALESCE(kics_summary.counters->>'severity:0:predicate','0')as int)) as kics_high 
 ,SUM(cast(COALESCE(kics_summary.counters->>'severity:1','0')as int)) + SUM(cast(COALESCE(kics_summary.counters->>'severity:1:predicate','0')as int)) as kics_medium
 ,SUM(cast(COALESCE(kics_summary.counters->>'severity:2','0')as int)) + SUM(cast(COALESCE(kics_summary.counters->>'severity:2:predicate','0')as int)) as kics_low
 ,SUM(cast(COALESCE(kics_summary.counters->>'severity:3','0')as int)) + SUM(cast(COALESCE(kics_summary.counters->>'severity:3:predicate','0')as int)) as kics_info
 ,SUM(cast(COALESCE(kics_summary.counters->>'state:1','0')as int))  as kics_not_exploitable
 ,SUM(cast(COALESCE(kics_summary.counters->>'state:2','0')as int))  as kics_proposed_not_exploitable
 ,SUM(cast(COALESCE(kics_summary.counters->>'state:3','0')as int))  as kics_confirmed
 ,SUM(cast(COALESCE(kics_summary.counters->>'state:4','0')as int))  as kics_urgent
 ,SUM(cast(COALESCE(kics_summary.counters->>'status:0','0')as int))  as kics_new
 ,SUM(cast(COALESCE(kics_summary.counters->>'status:1','0')as int))  as kics_recurrent
 ,SUM(cast(COALESCE(kics_summary.counters->>'status:2','0')as int))  as kics_resolved
 
 ,SUM(CAST(COALESCE(sca_summary.counters ->> 'total', '0') as int)) as sca_total
 ,SUM(cast(COALESCE(sca_summary.counters->>'severity:-1','0')as int)) + SUM(cast(COALESCE(sca_summary.counters->>'severity:-1:predicate','0')as int)) as sca_critical
 ,SUM(cast(COALESCE(sca_summary.counters->>'severity:0','0')as int)) + SUM(cast(COALESCE(sca_summary.counters->>'severity:0:predicate','0')as int)) as sca_high 
 ,SUM(cast(COALESCE(sca_summary.counters->>'severity:1','0')as int)) + SUM(cast(COALESCE(sca_summary.counters->>'severity:1:predicate','0')as int)) as sca_medium
 ,SUM(cast(COALESCE(sca_summary.counters->>'severity:2','0')as int)) + SUM(cast(COALESCE(sca_summary.counters->>'severity:2:predicate','0')as int)) as sca_low
 ,SUM(cast(COALESCE(sca_summary.counters->>'severity:3','0')as int)) + SUM(cast(COALESCE(sca_summary.counters->>'severity:3:predicate','0')as int)) as sca_info
 ,SUM(cast(COALESCE(sca_summary.counters->>'state:1','0')as int))  as sca_not_exploitable
 ,SUM(cast(COALESCE(sca_summary.counters->>'state:2','0')as int))  as sca_proposed_not_exploitable
 ,SUM(cast(COALESCE(sca_summary.counters->>'state:3','0')as int))  as sca_confirmed
 ,SUM(cast(COALESCE(sca_summary.counters->>'state:4','0')as int))  as sca_urgent
 ,SUM(cast(COALESCE(sca_summary.counters->>'status:0','0')as int))  as sca_new
 ,SUM(cast(COALESCE(sca_summary.counters->>'status:1','0')as int))  as sca_recurrent
 ,SUM(cast(COALESCE(sca_summary.counters->>'status:2','0')as int))  as sca_resolved
 ,cast(COALESCE(kics_meta.source_metadata->>'loc','0')as int) as kick_loc
from
(
select 
 s.id as scan_id
,s.created_at as created_at
,COALESCE(CAST(Extract(epoch from (s.updated_at - s.created_at))*1000 as bigint),0) as execution_time
,s.initiator as initiator
,s.source_origin as origin
,s.project_id as project_id
,s.source_type as source
,s.status as status
,s.tenant as tenant_id
,s.updated_at as updated_at
,s.engines as engines
,type_data.value as incremental
,branch_data.value AS branch
,tags_data.value as tags
,status_data.value->>'name' as engine
,status_data.value->>'status' as engine_status
,status_data.value->>'errorCode' as engine_error_code
,COALESCE(NULLIF(status_data.value->>'loc', 'null')::integer, 0) AS engine_loc
from scans s
CROSS JOIN LATERAL (
  SELECT jsonb_path_query(s.metadata, '$.**.branch') AS value
) AS branch_data
LEFT JOIN LATERAL (
  SELECT jsonb_path_query(s.metadata, '$.**.tags') AS value
) AS tags_data ON TRUE
LEFT JOIN LATERAL (
  SELECT jsonb_path_query(s.metadata, '$.**.incremental') AS value
) AS type_data ON TRUE
LEFT JOIN LATERAL (
  SELECT jsonb_array_elements(s.status_details) AS value
) AS status_data ON TRUE
where
created_at>'2023-10-16 00:00:00'::timestamp
and created_at<'2023-10-29 23:59:59'::timestamp
) as scan_data
left join public.ast_sast_scan_summary sast_summary
on  scan_data.scan_id=CAST(sast_summary.scan_id as UUID)
and sast_summary.language is null
left join public.ast_kics_scan_summary kics_summary
on  scan_data.scan_id=CAST(kics_summary.scan_id as UUID)
and kics_summary.platform is null
left join public.ast_sca_scan_summary sca_summary
on  scan_data.scan_id=CAST(sca_summary.scan_id as UUID)

left join public.kics_source_metadata kics_meta on kics_meta.scan_id=scan_data.scan_id

group by 
  scan_data.scan_id
 ,scan_data.created_at
 ,scan_data.execution_time
 ,scan_data.initiator
 ,scan_data.origin
 ,scan_data.project_id
 ,scan_data.source
 ,scan_data.status
 ,scan_data.tenant_id
 ,scan_data.updated_at
 ,scan_data.engines
 ,scan_data.incremental
 ,scan_data.branch
 ,scan_data.tags
 ,scan_data.engine
 ,scan_data.engine_status
 ,scan_data.engine_error_code
 ,scan_data.engine_loc
,kics_meta.source_metadata