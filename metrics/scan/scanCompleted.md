## Scan Completed
> This metric counts the scans completed in AST

- Type: *Counter*
- Name: astScansCompleted_events_total

## Event
| Entity        | Action |
| ------------- | ------------- |
| Scan          | Scan_Completed  |

## Tags

- `source`:        *from grpc ast-core-scan/getScanDetails*
- `origin`:        *from grpc ast-core-scan/getScanDetails*
- `scanners`:      `multi values` *from grpc ast-core-scan/getScanDetails*
- `projectId`:     *from event*
- `projectName`:   *from grpc ast-core-scan/getScanDetails*
- `tenantId`:      *from event*
- `scanId`:        *from event* 
- `source:`        *from grpc ast-core-scan/getScanDetails*
- `domain`:        core / integrations
- `tags`:         `multi values`   *from grpc ast-core-scan/getScanDetails*



Example:

```json
{
"source":"github",
"origin":"project scan",
"scanners":"sast,kics",
"environment":"master",
"projectId":"c2cdf5e7-b450-4f28-ac28-74567372e4a7",
"projectName":"My Project",
"tenantId":"389c6d78-e97b-4a30-b2f7-da39daf721a4",
"scanId":"7c5b7356-6837-43e9-827b-2e31d6571f6e",
"domain":"core",
"tags":"tag1,tag2"
} 
```

## Views 
- Scans Completed  By Origin 
- Scans Completed  By Source
- Scans Completed  By Scanners
- Scans Completed  By Scanner groups
- Total Scans Completed


 
