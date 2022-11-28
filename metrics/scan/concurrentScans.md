
## Concurrent Scans
> This metric counts the concurrent scans.
> Each performed scan will check for scans that are running on the same moment.

- Type: *Gauge*
- Name: concurrentScans

## Event
| Entity        | Action |
| ------------- | ------------- |
| Scan          | Scan_Completed  |

## Tags

- `tenantId`:      *from event*



Example:

```json
{

"tenantId":"389c6d78-e97b-4a30-b2f7-da39daf721a4",
} 
```
# Output
```
- vulnerabilitiesSeverity{tenantId="abe9f0e1-7882-4a81-9b09-fd01be27282a",projectId="f495a9ae-fae4-44b5-906c-d7ebc588b352",scanner="sast",severity="HIGH",language="VB6",} 2.0
```
## Split Tags 
- tenantId (in case multitenant)

## Filters
- tenantId (in case multitenant)

## Views 
### concurrentScans by total 
```json
{
  "step": "30d",
  "definedRange": "1y",
  "queryFunction": 2,
  "format": "pie",
  "splitTag":["severity"],
  "showHistorical": "default"
}
```
- `PromQuery`: sum by (values,severity)(last_over_time(concurrentScans[$__range]))
- `Type`: instantQuery
 <img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/concirrent-scans-total.png" alt="Logo" width="300" >

### concurrent Scans periodic timeline 
```json
{
  "step": "30d",
  "definedRange": "1y",
  "queryFunction": 5,
  "format": "series",
  "splitTag":["severity"],
  "showHistorical": "default",
  "fullFillGaps": true,
}
```
- `PromQuery`: sum by (values,severity)(concurrentScans)
- `Type`: rangeQuery
<img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/concurrent-scans-overtime.png" alt="Logo" width="800" >
