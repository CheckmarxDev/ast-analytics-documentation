
## Scan Created
> This metric counts the scans created in AST
> Each performed scan will increase the count +1.

- Type: *Counter*
- Name: scansCreated_events_total

## Event
| Entity        | Action |
| ------------- | ------------- |
| Scan          | Scan_Created |



## Tags

- `source`:        *from grpc ast-core-scan/getScanDetails*
- `origin`:        *from grpc ast-core-scan/getScanDetails*
- `scanners`:      `multi values` *from grpc ast-core-scan/getScanDetails*
- `projectId`:     *from event*
- `projectName`:   *from grpc ast-core-scan/getScanDetails*
- `tenantId`:      *from event*
- `source:`        *from grpc ast-core-scan/getScanDetails*
- `domain`:        core / integrations



Example:

```json
{
"source":"github",
"origin":"project scan",
"scanners":"sast,kics",
"projectId":"c2cdf5e7-b450-4f28-ac28-74567372e4a7",
"projectName":"My Project",
"tenantId":"389c6d78-e97b-4a30-b2f7-da39daf721a4",
"domain":"core",
} 
```
# Output
```
- scanCreated_events_total{domain="Core",origin="webapp",projectId="114e1d32-e9ac-4c70-b6cf-7aea50e60fb0",projectName="From Url",scanners="sast,sca,kics",source="github",tenantId="abe9f0e1-7882-4a81-9b09-fd01be27282a",} 1.0
```
## Split Tags 
- tenantId (in case multitenant)
- source
- origin
- projectId
- scanners

## Filters
- tenantId (in case multitenant)
- source
- origin
- projectId
- scanners

## Views 
### Scanner Activation total 🟢:OK
```json
{
  "step": "30d",
  "definedRange": "1y",
   "queryFunction":2,
  "format": "pie",
  "showHistorical": "default",
  "splitTag":["scanners"],
  "splitCombinations":true
}
```
- `PromQuery`: 
- sum by (value ,scanners)(last_over_time(scanCreated_events_total{tenantId=~'abe9f0e1-7882-4a81-9b09-fd01be27282a', service=~'.*metrics-management*.'}[365d]))
- `Type`: rangeQuery
 <img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/scan-activation-total.png" alt="Logo" width="300" >

### Scanner Activation overtime 
```json
{
  "step": "30d",
  "definedRange": "1y",
  "queryFunction":3,
  "format": "series",
  "showHistorical": "default",
  "splitTag":["scanners"],
  "period":"30d",
  "splitCombinations":true,
  "fullFillGaps": true
}
```
- `PromQuery`: 
- increase(sum by (value,scanners)(last_over_time(scanCreated_events_total[$__range]))[$period:])

<img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/scan-activation-overtime.png" alt="Logo" width="800" >

### Scanned Project total 🟢:OK
```json
{
  "step": "1d",
  "definedRange": "1y",
  "queryFunction":1, 
  "format": "pie",
  "showHistorical": "default"
}
```
- `PromQuery`: 
- sum by (value,scanners)(last_over_time(scanCreated_events_total[$__range]))
- `Type`: rangeQuery
 <img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/scanned-project-total.png" alt="Logo" width="300" >


### Scanned Project overtime
```json

{
  "step": "1d",
  "definedRange": "1y",
  "queryFunction":1, 
  "format": "series",
  "showHistorical": "default",
  "fullFillGaps": true
}
```
- `PromQuery`: count(count(last_over_time(scanCreated_events_total {tenantId=~'abe9f0e1-7882-4a81-9b09-fd01be27282a', service=~'.*metrics-management*.'} [100y])) by(projectId)) OR on() vector(0)

<img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/scanned-project-overtime.png" alt="Logo" width="800" >

### Scans by scanner group total 
```json
{
  "step": "30d",
  "definedRange": "1y",
  "queryFunction":2,
  "format": "point",
  "showHistorical": "default",
  "splitTag":["scanners"],
  "splitCombination":true
}
```
- `PromQuery`: 
- sum by (value,scanners)(last_over_time(scanCreated_events_total[$__range]))
- `Type`: rangeQuery
 <img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/scan-scanner-group-total.png" alt="Logo" width="300" >


### Scan by scanner group overtime
```json
{
  "step": "30d",
  "definedRange": "1y",
  "queryFunction":2,
  "format": "series",
  "showHistorical": "cleanHistorical",
  "fullFillGaps": true
}
```
- `PromQuery`: count(count(last_over_time(scanCreated_events_total {tenantId=~'abe9f0e1-7882-4a81-9b09-fd01be27282a', service=~'.*metrics-management*.'} [100y])) by(projectId)) OR on() vector(0)

<img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/scan-scanner-group-overtime.png" alt="Logo" width="800" >







## Other Views 
- Scans Created  By Origin 
- Scans Created  By Source
- Total Scans Created

