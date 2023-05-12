## Tenant Info Data

> Max concurrent scans per Tenant, per day

File : Tenant_Info_YYYY-MM-DD.txt

| Required Fields         | Description         |  Source|
| --------------- | -------------------------------------------- |----------------|
| Tenant Id              | The tenant id should be provided in this  |scan.tenantId|
| Max Concurrent Scans    | This field should provide the maximum concurrent scans   |max(scan.maxXoncurrentScan)|
| File Date (UTC)    | The datetime of the file   |getDate().now()|
| Total Project created | The total of projects created |sum(projects) in range|
| Total Login per day        | Total Login           |distinc(users)|
| Distinct Users by Login        | ?? Total of users that attempted login              ||
| Users Created         | ?? Total of users that attempted login              |sum(users) in range where not deleted  |
| Users Deleted         | ?? Total of users that attempted login              |sum(users) in range where  deleted  |
| Total Contributors | The total number of contributors |distinct(scan.tenant)->foreach(grpc:getContributorCount)  |


