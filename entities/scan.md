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
|   max_concurrent_scans integer     | Select from scans where datetime.now between created_at and updated_at |           
|   tags Array                       | ?                                                                      |           
|   initiator String                 | ?                                                                      |           
|   branch String                    | ?                                                                      |          
