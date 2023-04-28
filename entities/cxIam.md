## Users

> Only when event.type="user_created" or event.type="user_updated"

| Field              | Source |
| ------------------ | ------ |
|   id String [pk]   | event.entityId|
|   tenant_id String | event.tenant|
|   created_at long(UTC)  |event.time |
|   deleted_at long(UTC)  |event.time |
|   exported_at long(UTC)  |event.time |
|   exported boolean | whdn exported finilizes |
|   deleted boolean  | only when deleted |

Test Cases
: system test: User Created
: system test: User Deleted
: component test: simulate event user created
: component test: simulate event user deleted


## Login
> Only when event.type="login"

| Field            | Source |
| ---------------- | ------ |
|   id String [pk] | incremental  |
|   user_id String | event.entityId   |
|   created_at long(UTC)  |event.time |
|   exported_at long(UTC)  |event.time |
|   exported boolean | whdn exported finilizes |
|   status String  | event.status|
