SELECT
s.tenant_id as tenantId
,s.project_id as projectId
,ROW_NUMBER() OVER (ORDER BY s.id) AS id
,s.id AS scan_id
--,s.source as source
--,s.origin as origin
--,s.initiator as initiator
--,s.created_at as createdAt
--,COALESCE(CAST(Extract(epoch from (s.updated_at - s.created_at))*1000 as bigint),0) as executionTime
--,s.status as status
--,COALESCE(e.status,'unknown') as engineStatus
--,e.sources as scanSources
--,COALESCE(e.error_code,'0') as engineErrorCode
--,COALESCE(e.loc , 0) as loc
--,COALESCE(e.scan_type, 'unknown') as scanType
--,COALESCE(e.execution_time,0) as engineExecutionTime
--,COALESCE(e.engine, 'unknown') as engine
--,COALESCE(pe.execution_time,0) as preScanExecutionTime
--,COALESCE(pe.status,'') as preScanStatus
--,COALESCE(pe.error_code,'0')as preScanErrorCode
,COALESCE(SUM(vulnerability_severities.critical),0) AS severityCritical
,COALESCE(SUM(vulnerability_severities.high),0) AS severityHigh
,COALESCE(SUM(vulnerability_severities.low),0) AS  severityLow
,COALESCE(SUM(vulnerability_severities.medium),0) AS  severityMedium
,COALESCE(SUM(vulnerability_severities.info),0) AS  severityInfo
,SUM(vulnerability_states.toVerify) as stateToVerify
,SUM(vulnerability_states.confirmed) as stateConfirmed
,SUM(vulnerability_states.notExploitable) as stateNotExploitable
,SUM(vulnerability_states.proposedNotExploitable) as stateProposedNotExploitable
,SUM(vulnerability_states.urgent) as stateUrgent

,COALESCE(s.deleted, false) as isDeleted
FROM scan s
LEFT JOIN public.engine_execution_summary e
ON s.id = e.scan_id
LEFT JOIN pre_scan pe
ON s.id = pe.scan_id
LEFT JOIN (
SELECT
   engine_execution_summary_id
  ,MAX(CASE WHEN state  = 'TO_VERIFY' THEN counter END) AS toVerify
  ,MAX(CASE WHEN state  = 'NOT_EXPLOITABLE' THEN counter END) AS notExploitable
  ,MAX(CASE WHEN state  = 'PROPOSED_NOT_EXPLOITABLE' THEN counter END) AS proposedNotExploitable
  ,MAX(CASE WHEN state  = 'CONFIRMED' THEN counter END) AS confirmed
  ,MAX(CASE WHEN state  = 'URGENT' THEN counter END) AS urgent
  FROM public.engine_states 
  group by engine_execution_summary_id
) as vulnerability_states
on vulnerability_states.engine_execution_summary_id=e.id
LEFT JOIN (
SELECT
   engine_execution_summary_id
  ,MAX(CASE WHEN severity  = 'HIGH' THEN counter END) AS high
  ,MAX(CASE WHEN severity  = 'LOW' THEN counter END) AS low
  ,MAX(CASE WHEN severity  = 'MEDIUM' THEN counter END) AS medium
  ,MAX(CASE WHEN severity  = 'CRITICAL' THEN counter END) AS critical
  ,MAX(CASE WHEN severity  = 'INFO' THEN counter END) AS info
  from engine_severities
 group by engine_execution_summary_id
) as vulnerability_severities
on vulnerability_severities.engine_execution_summary_id=e.id

WHERE s.status <> 'Running'  and s.created_at < '2023-10-03T00:00Z'
and e.scan_id = 'fa271592-9a94-4a1a-94be-82ad7b8a4ac8'
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
s.deleted

update public.engine_states set state_enum=1


select * from scan where id='xxxx'
select * from public.engine_execution_summary where scan_id='xxx'
select * from public.engine_states where engine_execution_summary_id = 533
select * from public.engine_severities where engine_execution_summary_id = 533
select * from public.engine_status where engine_execution_summary_id = 533

alter table scan add column sync boolean;
select * from scan
select * from pre_scan
select * from engine_execution_summary
select * from engine_severities




delete from public.engine_states; 
delete from public.engine_severities; 
delete from public.engine_status;
delete from public.pre_scan;
delete from public.engine_execution_summary;
delete from scan; 




INSERT INTO parent_table (value)
SELECT DISTINCT value
FROM (
  VALUES
    ('value1'),
    ('value2'),
    ('value3')
) AS new_values(value)
ON CONFLICT (value) DO NOTHING
RETURNING id;

-- Insert into the child table for the first time
INSERT INTO scan 
(id, branch,created_at,deleted,execution_time,initiator,origin,project_id,source,status,tags,tenant_id,updated_at,exported,engines,sync)
VALUES(:id,:branch,:created_at,:deleted,:execution_time,:initiator,:origin,:project_id,:source,:status,:tags,:tenant_id,:updated_at,:exported,:engines,true)
ON CONFLICT (id) DO UPDATE
SET  branch = :branch
	,created_at=:created_at
	,deleted=false
	,execution_time=:execution_time
	,initiator=:initiator
	,origin=origin:
	,project_id=:project_id
	,source=:source
	,status=:status
	,tags=:tags
	,tenant_id=:tenant_id
	,updated_at=:updated_at
	,exported=EXCLUDED.exported
	,engines=engines
	,sync=true;

WITH parent_ids AS (
  INSERT INTO parent_table (id, value2, value3)
  VALUES
    (1, 'value2', 'value3')
  ON CONFLICT (id) DO UPDATE
  SET value2 = EXCLUDED.value2, value3 = EXCLUDED.value3
  RETURNING id
)