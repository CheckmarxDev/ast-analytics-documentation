## Vulnerabilities By Severity
> This metric counts the vulnerabilities by severity.
> Each performed scan will store the ammount of scanned lines on the gauge dataPoint.

- Type: *Gauge*
- Name: vulnerabilitiesSeverity

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
- `severity:`        *from grpc ast-data-abalytics-api/getVulnerability*


Example:

```json
{
"language":"java",
"severity":"HIGH",
"scanner":"sast",
"projectId":"c2cdf5e7-b450-4f28-ac28-74567372e4a7",
"tenantId":"389c6d78-e97b-4a30-b2f7-da39daf721a4",
} 
```
# Output
```
- vulnerabilitiesSeverity{tenantId="abe9f0e1-7882-4a81-9b09-fd01be27282a",projectId="f495a9ae-fae4-44b5-906c-d7ebc588b352",scanner="sast",severity="HIGH",language="VB6",} 2.0
```
## Split Tags 
- scanner 
- projectId
- language
- severity
- tenantId (in case multitenant)

## Filters
- scanner 
- projectId
- language
- severity
- tenantId (in case multitenant)

## Views 
### Vulnerability by Severity total 
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
- `PromQuery`: sum by (values,severity)(last_over_time(vulnerabilitiesSeverity[$__range]))
- `Type`: instantQuery
 <img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/vulnerability-severity-total.png" alt="Logo" width="300" >

### lines of code periodic timeline 
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
- `PromQuery`: sum by (values,severity)(vulnerabilitiesSeverity)
- `Type`: rangeQuery
<img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/vulnerability-severity-overtime.png" alt="Logo" width="800" >
