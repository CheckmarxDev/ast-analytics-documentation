## Scans

| Field                              | Source                                                                 |
| ---------------------------------- | ---------------------------------------------------------------------- | 
|   id [pk]                          | cloud_event.entityId                                                   | 
|   tenant_id                        | cloud_event.tenant                                                     | 
|   project_id                       | scans(grpc:26501).getDetails().projectId                               | 
|   active boolean                   | event if(scan_created) true, if(scan_deleted) false                    |   
|   created_at Date                  | event dateTime.now                                                     |         
|   deleted_at Date                  | event dateTime.now                                                     |           
|   updated_at Date                  | event dateTime.now                                                     |           
|   source String                    | scans(grpc:26501).getDetails().scanSource                              |           
|   origin String                    | scans(grpc:26501).getDetails().scanOrigin                              |           
|   status string                    | event                                                                  |          
|   engine_execution_summaries Array | new EngineExecutionSumary[]                                            |          
|   concurrent_scans integer(0 or >1)| scan_created:Select count() from scans where status=created            |
|   tags Array                       | scans(grpc:26501).getDetails().initiator                               |         
|   initiator String                 | scans(grpc:26501).getDetails().scansTags                               |    
|   branch String                    | scans(grpc:26501).getDetails().branch.                                 |          

## EngineExecutionSummaries

| Field                   | Source                                                                            |
| ----------------------- | ------                                                                            |
|   id String [pk]        | incremental                                                                       |
|   scan_id String        | cloud_event.entityId                                                              |
|   engine String         | one for each engine in cloud_event.scanners.split()                               |
|   loc String            | sast_metadata(grpc:26500).getDetails().linesOfCode                                |
|   scan_error String     | new ScanError()                                                                   |
|   sources String        | Only, when has some vulnerability: results(grpc:26500).getsummary().language      |
|   scan_type String      | if(sast)sast_metadata(grpc:26500).getDetails().type else null                     |
|   execution_time BigInt | need Task from Sonia´s team to create  executionTime per engine.                  |
|   engine_status String  | scans(grpc:26501).getDetails().statusDetails                                      |
|   engine_status String  | scans(grpc:26501).getDetails().statusDetails                                      |
|   severities            | new EngineSeverities[]                                                            |

## Scan Error

| Field                   | Source                                                                            |
| ----------------------- | ------                                                                            |
| id String [pk]          | incremental                                                                       |
| scan_id String          | cloud_event.entityId                                                              |                                         
| scan_error_code String  | scans(grpc:26501).getDetails().scanFailureDetails                                 |    
| description String      | scans(grpc:26501).getDetails().scanFailureDetails                                 |



## Scan Engine Severities
> Data does not change. If we change seveity or state to a vulnerability on the UI
> the replacement of the new values should be done dynamically using the table vulnerabilitiesDefinitions

| Field                   | Source                                                                            |
| ----------------------- | ------                                                                            |                                           
| scan_id String          | cloud_event.entityId                                                              |                                         
| severity String         | (LOW,MEDIUM,HIGH,INFO,...)                                                        |    
| counter  int.           | Total of vulnerabilities on the engine/scan  |

