## Scans

| Field                              | Source                                                                 |
| ---------------------------------- | ---------------------------------------------------------------------- | 
|   id [pk] UUID                     | cloud_event.entityId                                                   | 
|   tenant_id   UUID                 | cloud_event.tenant                                                     | 
|   project_id  UUID                 | scans(grpc:26501).getDetails().projectId                               | 
|   deleted boolean                  | event if(scan_created) true, if(scan_deleted) false                    |   
|   created_at long(UTC)             | event dateTime.now                                                     |         
|   deleted_at long(UTC)             | event dateTime.now                                                     |           
|   updated_at long(UTC)             | event dateTime.now                                                     |           
|   source String                    | scans(grpc:26501).getDetails().scanSource                              |           
|   origin String                    | scans(grpc:26501).getDetails().scanOrigin                              |           
|   status string                    | event                                                                  |          
|   engine_execution_summaries Array | new EngineExecutionSumary[]                                            |          
|   concurrent_scans integer(0 or >1)| scan_created:Select count() from scans where status=created            |
|   tags List<String>                       | scans(grpc:26501).getDetails().initiator                               |         
|   initiator String                 | scans(grpc:26501).getDetails().scansTags                               |    
|   branch String                    | scans(grpc:26501).getDetails().branch.                                 |   
|   total_execution_time  BigInt           |                                                                  |

## EngineExecutionSummaries

| Field                   | Source                                                                            |
| ----------------------- | ------                                                                            |
|   id String [pk]        | incremental                                                                       |
|   scan_id String        | cloud_event.entityId                                                              |
|   engine String         | one for each engine in cloud_event.scanners.split()                               |
|   loc String            | sast_metadata(grpc:26500).getDetails().linesOfCode                                |
  |   nodes Nodes            | sast_metadata(grpc:26500).getDetails().nodes                                |
|   scan_error_code String | scans(grpc:26501).getDetails().scanFailureDetails   (Descriptions associated to table below Scan Error) |
|   sources String        | Only, when has some vulnerability: results(grpc:26500).getsummary().language      |
|   scan_type String      | if(sast)sast_metadata(grpc:26500).getDetails().type else null                     |
|   execution_time BigInt | need Task from Sonia´s team to create  executionTime per engine.                  |
|   engine_status String  | scans(grpc:26501).getDetails().statusDetails                                      |
|   engine_status String  | scans(grpc:26501).getDetails().statusDetails                                      |
|   severities            | new EngineSeverities[]                                                            |

## Scan Error 

| Field                   | Source                                                                            |
| ----------------------- | ------                                                                            |                                        
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


## Scan Engine State
> Data does not change. If we change seveity or state to a vulnerability on the UI
> the replacement of the new values should be done dynamically using the table vulnerabilitiesDefinitions

| Field                   | Source                                                                            |
| ----------------------- | ------                                                                            |                                           
| scan_id String          | cloud_event.entityId                                                              |                                         
| state String         | (LOW,MEDIUM,HIGH,INFO,...)                                                        |    
| counter  int.           | Total of vulnerabilities on the engine/scan  |


## Scan Engine Status
> Data does not change. If we change seveity or state to a vulnerability on the UI
> the replacement of the new values should be done dynamically using the table vulnerabilitiesDefinitions

| Field                   | Source                                                                            |
| ----------------------- | ------                                                                            |                                           
| scan_id String          | cloud_event.entityId                                                              |                                         
| status String         | (LOW,MEDIUM,HIGH,INFO,...)                                                        |    
| counter  int.           | Total of vulnerabilities on the engine/scan  |

