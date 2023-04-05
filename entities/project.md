## Project

| Field                            | Source                                        |
| -------------------------------- | --------------------------------------------- |
|   id String [pk]                 | cloud_event.entityId                          |
|   tenant_id String               | cloud_event.tenant                            |
|   name String                    | scans(grpc:26502).getDetails().name           |
|   application_ids Array          | scans(grpc:26502).getDetails().applicationIds |
|   tags hstore //similar to a map | scans(grpc:26502).getDetails().tags           |
|   active boolean                 | project_deleted?true:false                    |
|   created_at Date                | project_created dateTime.now                  |
|   deleted_at Date                | project_delete dateTime.now                   |
|   criticality Integer            |                                               |
|   groups String                  | scans(grpc:26502).getDetails().groups         |
