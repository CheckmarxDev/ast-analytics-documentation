
## Concurrent Scans
> This metric counts the concurrent scans.
> Each performed scan will check for scans that are running on the same moment.

- Type: *Gauge*
- Name: concurrentScans

## Event
| Entity        | Action |
| ------------- | ------------- |
| Scan          | Scan_Created |

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
- concurrentScans{tenantId="abe9f0e1-7882-4a81-9b09-fd01be27282a",} 2.0
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
  "format": "trend",
  "showHistorical": "default"
}
```
- `PromQuery`: 
- min by (value)(last_over_time(concurrentScans[1h]))
- avg by (value)(last_over_time(concurrentScans[1h]))
- max by (value)(last_over_time(concurrentScans[1h]))
- `Type`: instantQuery
 <img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/concurrent-scans-total.png" alt="Logo" width="300" >

### concurrent Scans periodic timeline 
```json
{
  "step": "30d",
  "definedRange": "1y",
  "format": "series",
  "showHistorical": "cleanHistorica",
  "fullFillGaps": true,
}
```
- `PromQuery`: 
- min by (value)(last_over_time(concurrentScans[1h]))
- avg by (value)(last_over_time(concurrentScans[1h]))
- max by (value)(last_over_time(concurrentScans[1h]))
- `Type`: rangeQuery
<img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/concurrent-scans-overtime.png" alt="Logo" width="800" >
