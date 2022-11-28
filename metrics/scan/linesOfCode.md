## Sast Lines Of Code
> This metric counts the scanned lines of code from sast.

- Type: *Gauge*
- Name: linesOfCode

## Event
| Entity        | Action |
| ------------- | ------------- |
| Scan          | Scan_Completed  |

## Tags

- `source`:        *from grpc ast-core-scan/getScanDetails*
- `origin`:        *from grpc ast-core-scan/getScanDetails*
- `scanners`:      `multi values` *from grpc ast-core-scan/getScanDetails*
- `projectId`:     *from event*
- `tenantId`:      *from event*
- `source:`        *from grpc ast-core-scan/getScanDetails*


Example:

```json
{
"source":"github",
"origin":"project scan",
"scanners":"sast,kics",
"projectId":"c2cdf5e7-b450-4f28-ac28-74567372e4a7",
"tenantId":"389c6d78-e97b-4a30-b2f7-da39daf721a4",
} 
```
# Output
- linesOfCode_events_total{origin="webapp",projectId="4d19570b-e395-4043-a71f-e959915f34c8",scanners="sast",source="github",tenantId="abe9f0e1-7882-4a81-9b09-fd01be27282a",} 1065.0

## Split Tags 
- scanners (*splitCombination)
- projectId
- source
- origin
- tenantId (in case multitenant)

## Filters
- scanners 
- projectId
- source
- origin
- tenantId (in case multitenant)

## Views 
### lines of code total 
```json
{
  "step": "30d",
  "definedRange": "1y",
  "queryFunction": 2,
  "format": "point",
  "showHistorical": "default"
}
```
### lines of code periodic timeline 
```json
{
  "step": "30d",
  "definedRange": "1y",
  "queryFunction": 5,
  "format": "series",
  "showHistorical": "default",
  "fullFillGaps": true,
}
```
