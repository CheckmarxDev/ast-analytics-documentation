## Application

| Field                             | Source                                    |
| --------------------------------- | ----------------------------------------- |
|   id String [pk]                  | cloud_event.entityId                      |
|   tenant_id                       | cloud_event.tenant                        |
|   tags hstore // similar to a map | scans(grpc:26503).getDetails().tags       |
|   name String                     | scans(grpc:26503).getDetails().name       |
|   project_ids Array               | scans(grpc:26503).getDetails().projetcIds |
|   active boolean                  | application_deleted?true:false            |
|   created_at Date                 | application_created dateTime.now          |
|   deleted_at Date                 | application_delete dateTime.now           |
