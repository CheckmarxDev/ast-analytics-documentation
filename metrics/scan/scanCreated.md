## Scan Created
> This metric counts the scans created in AST

| Entity        | Action |
| ------------- | ------------- |
| Scan          | Scan_Created  |


- Type: *Counter*
- Name: astScansCreated_events_total

![#f03c15](https://via.placeholder.com/15/f03c15/f03c15.png) `#f03c15`

## Tags

 

- source       
- origin        
- engines       `multi values`
- projectId    
- projectName   
- tenantId     
- scanId        
- source        
- domain        core / integrations
- tags         `multi values`



Example:

```json
{
"source":"github",
"origin":"project scan",
"engines":"sast,kics",
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
- Scans Created  By Origin 
- Scans Created  By Source
- Scans Created  By Engine
- Scans Created  By EngineGroup
- Total Scans


 
