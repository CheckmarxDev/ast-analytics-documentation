## Users

> Only when event.type="user_created" or event.type="user_updated"

| Field              | Source |
| ------------------ | ------ |
|   id String [pk]   | event.entityId      |
|   tenant_id String | event.tenant      |
|   username String  | event.data.data.userName |

## Login
> Only when event.type="login"

| Field            | Source |
| ---------------- | ------ |
|   id String [pk] | incremental  |
|   user_id String | event.entityId   |
|   date String    | event Datetime.now     |
