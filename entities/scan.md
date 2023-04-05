
| Field                |      Source                |  Output               |
|----------------------|:---------------------------:|----------------------:|
| id |  cloud_event.entityId | scan_id |
| tenant_id |    cloud_event.tenant   | tenant_id |
| project_id | scans(grpc:50051).projectId | projectId  |
