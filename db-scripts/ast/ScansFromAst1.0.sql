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
created_at>'2023-09-27 00:00:00'::timestamp
and created_at<'2023-09-28 23:59:59'::timestamp
limit 10
offset 0
) as scan_data
left join public.ast_sast_scan_summary sast_summary
on  scan_data.scan_id=CAST(sast_summary.scan_id as UUID)
and sast_summary.language is null
left join public.ast_kics_scan_summary kics_summary
on  scan_data.scan_id=CAST(kics_summary.scan_id as UUID)
and kics_summary.platform is null
left join public.ast_sca_scan_summary sca_summary
on  scan_data.scan_id=CAST(sca_summary.scan_id as UUID)
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

select 
p.id as project_id
,p.name as name
from projects p
left join public.project_tags
on p.id = pt.project_id
where p.id='xxxxxxxxxxxx'
limit 10
offset 0
select project_id, count(1) from public.project_tags pt group by project_id
select * from public.application_rules
select ap.value from public.application_rules ap where ap.value like '%proj%'



select 
 ROW_NUMBER() OVER (ORDER BY p.id) AS id
,p.id as project_id
,p.name as name
,p.criticality as criticality
,p.created_at as created_at
,p.groups as groups
--onboarding_date
--onboarding_status
,p.tenant as tenant_id
,p.updated_at as updated_at
,COALESCE(B.tags,'') as tags
,COALESCE(A.applicationIds,'') as application_ids
from projects p
LEFT JOIN LATERAL(
	SELECT string_agg (CAST(AR.Application_id AS VARCHAR),',') as applicationIds from application_rules ar
	WHERE ar.Value LIKE '%'  || (p.name) || '%'
) A ON TRUE
LEFT JOIN LATERAL(
	SELECT string_agg(pt.key,',') as tags from public.project_tags pt where pt.project_id=p.id
)  B ON TRUE
where p.id='xxxxxxxxxxxxxxxxxxxxxx'
p.created_at>'2023-09-27 00:00:00'::timestamp
and p.created_at<'2023-09-28 23:59:59'::timestamp
andp.
limit 10
offset 0


select 
 ROW_NUMBER() OVER (ORDER BY app.id) AS id
,app.id as application_id
,app.name as name
,app.criticality as criticality
,app.created_at as created_at
,app.tenant as tenant_id
,app.updated_at as updated_at
,COALESCE(B.tags,'') as tags
--,string_agg(C.id::text, ',') AS project_ids
from public.applications app
LEFT JOIN LATERAL(
	SELECT ar.value from application_rules ar
	WHERE ar.application_id = app.id
) A ON TRUE
LEFT JOIN LATERAL(
	SELECT string_agg(pt.key,',') as tags from public.application_tags pt where pt.application_id=app.id
)  B ON TRUE
--LEFT JOIN
  --  public.projects C ON (',' || A.value || ',' LIKE '%,' || C.name || ',%') 
--where
--app.created_at>'2023-09-27 00:00:00'::timestamp
--and p.created_at<'2023-09-28 23:59:59'::timestamp
group by 
app.id
,app.name
,app.criticality
,app.created_at 
--,p.groups as groups
,app.tenant 
,app.updated_at 
,B.tags
limit 10
offset 0


