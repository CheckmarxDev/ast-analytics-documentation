## Scanned Languages
> This metric counts languages scanned by each scan

- Type: *Counter*
- Name: scannedLanguages_events_total

## Event
| Entity        | Action |
| ------------- | ------------- |
| Scan          | Scan_Completed  |

## Tags

- `scanner`:       *from grpc ast-core-scan/getScanDetails*
- `projectId`:     *from event*
- `projectName`:   *from grpc ast-core-scan/getScanDetails*
- `tenantId`:      *from event*
- `scanId`:        *from event* 
- `language:`       *from grpc ast-core-results/getResults*


Example:

```json
{
"scanner":"sast",
"projectId":"c2cdf5e7-b450-4f28-ac28-74567372e4a7",
"projectName":"My Project",
"tenantId":"389c6d78-e97b-4a30-b2f7-da39daf721a4",
"scanId":"7c5b7356-6837-43e9-827b-2e31d6571f6e",
"language":"javascript"
} 
```

## Views 
- Scanned Languages By Scanner 
- Scanned Languages By Project 
- Total Scanned Languages Found


 
