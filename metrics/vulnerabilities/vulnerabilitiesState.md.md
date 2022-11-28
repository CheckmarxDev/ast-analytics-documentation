## Vulnerabilities By State
> This metric counts the vulnerabilities by state.
> Each performed scan will store the ammount of scanned lines on the gauge dataPoint.

- Type: *Gauge*
- Name: vulnerabilitiesState

## Event
| Entity        | Action |
| ------------- | ------------- |
| Scan          | Scan_Completed  |

## Tags

- `source`:        *from grpc ast-core-scan/getScanDetails*
- `language`:        *from grpc ast-data-abalytics-api/getVulnerability*
- `scanner`:      `multi values` *from grpc ast-core-scan/getScanDetails*
- `projectId`:     *from event*
- `tenantId`:      *from event*
- `state:`        *from grpc ast-data-abalytics-api/getVulnerabilityByState*


Example:

```json
{
"language":"java",
"state":"TO_VERIFY",
"scanner":"sast",
"projectId":"c2cdf5e7-b450-4f28-ac28-74567372e4a7",
"tenantId":"389c6d78-e97b-4a30-b2f7-da39daf721a4",
} 
```
# Output
```
- vulnerabilitiesState{tenantId="abe9f0e1-7882-4a81-9b09-fd01be27282a",projectId="f495a9ae-fae4-44b5-906c-d7ebc588b352",scanner="sast",state="TO_VERIFY",language="VB6",} 6.0
```
## Split Tags 
- scanner 
- projectId
- language
- state
- tenantId (in case multitenant)

## Filters
- scanner 
- projectId
- language
- state
- tenantId (in case multitenant)

## Views 
### Vulnerability by Severity total 
```json
{
  "step": "30d",
  "definedRange": "1y",
  "queryFunction": 2,
  "format": "pie",
  "splitTag":["state"],
  "showHistorical": "default"
}
```
- `PromQuery`: sum by (values,state)(last_over_time(vulnerabilitiesState[$__range]))
- `Type`: instantQuery
 <img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/vulnerability-state-total.png" alt="Logo" width="300" >

### lines of code periodic timeline 
```json
{
  "step": "30d",
  "definedRange": "1y",
  "queryFunction": 5,
  "format": "series",
  "splitTag":["state"],
  "showHistorical": "default",
  "fullFillGaps": true,
}
```
- `PromQuery`: sum by (values,state)(vulnerabilitiesState)
- `Type`: rangeQuery
<img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/vulnerability-state-overtime.png" alt="Logo" width="800" >
