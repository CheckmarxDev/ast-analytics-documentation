# Scans

| Field                              | Source                                                                 |
| ---------------------------------- | ---------------------------------------------------------------------- | 
|   id                               | cloud_event.entityId                                                   | 
|   tenant_id                        | cloud_event.tenant                                                     | 
|   project_id                       | scans(grpc:50001).getDetails().projectId                               | 
|   active boolean                   | event if(scan_created) true, if(scan_deleted) false                    |   
|   created_at Date                  | event dateTime.now                                                     |         
|   deleted_at Date                  | event dateTime.now                                                     |           
|   updated_at Date                  | event dateTime.now                                                     |           
|   source String                    | scans(grpc:50001).getDetails().scanSource                              |           
|   origin String                    | scans(grpc:50001).getDetails().scanOrigin                              |           
|   status string                    | event                                                                  |          
|   engine_execution_summaries Array | new EngineExecutionSumary[]                                            |          
|   concurrent_scans integer(0 or >1)| scan_created:Select count() from scans where status=created            |
|   tags Array                       | ?                                                                      |           
|   initiator String                 | ?                                                                      |           
|   branch String                    | ?                                                                      |          

# EngineExecutionSummaries

| Field                   | Source |
| ----------------------- | ------ |
|   id String [pk]        |        |
|   scan_id String        |        |
|   engine String         |        |
|   loc String            |        |
|   scan_error String     |        |
|   sources String        |        |
|   scan_type String      |        |
|   execution_time BigInt |        |
|   engine_status String  |        |

