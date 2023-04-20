<div align="center">
  <a>
    <img src="https://avatars.githubusercontent.com/u/15811295?s=200&v=4" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">AST ANALYTICS TECHNICAL DOCUMENTATION</h3>

  <p align="center">
    Here you can find details about analytics implementation for cxOne.
  </p>
</div> 
  
> The analytics project has several use cases that together requires a solution capable of storing, processing and exporting data to external or interna usage.
> All data will be stored in UTC and converted to other zones when queried.

## ENTITIES

> Entities defined in this document, reflects the implementation of the new datastore for analytics.
The purpose is to store date in a more performatic and kpi oriented structure.
Entities will be implemented inside ast-analytics-datastore

- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/entities/scan.md" target="_blank">`Scan related entities`</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/entities/project.md" target="_blank">`Project related entities`</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/entities/application.md" target="_blank">`Application related entities`</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/entities/vulnerability.md" target="_blank">`Vulnerabilities related entities`</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/entities/cxIam.md" target="_blank">`CxIam related entities`</a>

## BI EXPORT

> During the last few months, a new analytics solution is being designed in order to extract data from the CxOne product. This data comes from the different services of the product and consequently this data has different formats and information depending on the source of it.

The purpose of this document is to define the format that matches the needs of the BI teams that will use the data. To facilitate this documentation process, the information has been divided into Entities that directly relate to the information that can be found in the services (for example, Scans Entity contains information on the scans (from scan creation to scan status).

Please note that document is a work in progress and will be updated until an agreement between both teams has been reached. 

- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/bi/scans.md" target="_blank">`Scan Data Contract`</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/bi/cxiam.md" target="_blank">`CxIam  Data Contract`</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/bi/salesforce.md" target="_blank">`Salesforce Data Contract`</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/bi/backoffice.md" target="_blank">`Back Office Data Contract`</a>

> each entity must have a audit field to control the data export.
> A flag (bit) with true or false to show if the line was exported or not

A notification should be sent if a exception is raised on the line processing.

## DIAGRAMS

> Check all diagrams in draw.io

- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/diagrams/main.draw.io" target="_blank">Main Diagram</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/diagrams/main.draw.io" target="_blank">ast-metrics diagram</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/diagrams/main.draw.io" target="_blank">ast-analytics-api diagram</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/diagrams/main.draw.io" target="_blank">ast-analytics-exporter</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/diagrams/main.draw.io" target="_blank">BI Flow</a>


<img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/main.png" alt="Main" width="300" >


## REPOS

- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/api/promquery.md" target="_blank">`ast-metrics`</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/api/promquery.md" target="_blank">`ast-analytics-api`</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/api/promquery.md" target="_blank">`ast-analytics-datastore`</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/api/promquery.md" target="_blank">`ast-analytics-exporter-job`</a>
- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/api/promquery.md" target="_blank">`ast-analytics-proto`</a>



## API

- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/api/promquery.md" target="_blank">`KPI Query`</a>

## EVENTS

| Event           | Description                                  |
| --------------- | -------------------------------------------- |
| scan_created    | After Scans starts running |
| scan_completed  | After Scan is completed             |
| scan_failed     | After Scan is failed                |
| scan_partial    | After Scan is partialy completed       |
| scan_canceled   | After Scan is canceled      |

| Event           | Description                                  |
| --------------- | -------------------------------------------- |
| project_created   | After project is created      |
| project_deleted   | After projects is deleted       |
| project_updated   | After project is updated       |

| Event           | Description                                  |
| --------------- | -------------------------------------------- |
| application_created   | After application is created       |
| application_deleted   | After application is deleted     |
| application_associated  | After application is associated     |
| application_updated   | After application is updated      |

| Event           | Description                                  |
| --------------- | -------------------------------------------- |
| vulnerabilities_state_changed   | After scan vulnerability(s) state has changed  |

| Event           | Description                                  |
| --------------- | -------------------------------------------- |
| user_account_login   | After user login  |
| user_account_created   | After user created  |
| user_account_deleted   | After user deleted  |
| user_account_updated   | After user updated  |


## OPEN ISSUES

 - Predicates from APISEC must be required by task to be developed (To Notify BI team)
 - Execution Time per engine must be required by task to be developed
 - Add to Sales force file liscence dates (To be discussed how to solve)

## CI VARIABLES

| Event           | Description                                  |
| --------------- | -------------------------------------------- |
| ANALYTICS_READ_DB_HOST   | Variable to store the host of new datastore for analaytics  |
|ANALYTICS_READ_DB_PORT|   |
|ANALYTICS_READ_DB|   |
|ANALYTICS_READ_DB_USER|   |
|ANALYTICS_READ_DB_PASS|   |
|ANALYTICS_WRITE_DB_HOST|   |
|ANALYTICS_WRITE_DB_PORT|   |
|ANALYTICS_WRITE_DB|   |
|ANALYTICS_WRITE_DB_USER|   |
|ANALYTICS_WRITE_DB_PASS|   |



## KPIS

  <!-- ABOUT THE PROJECT -->
##  Metrics

- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/scan/scanCreated.md" target="_blank">`Scan Created`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/scan/scanCompleted.md" target="_blank">`Scan Completed`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/scan/scanFailed.md" target="_blank">`Scan Failed`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/scan/scanPartial.md" target="_blank">`Scan Partial`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/scan/scanCanceled.md" target="_blank">`Scan Canceled`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/scan/scanUnknown.md" target="_blank">`Scan Unknown`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/scan/linesOfCode.md" target="_blank">`Sast Lines of Code`</a>



-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/scan/concurrentScans.md" target="_blank">`Concurrent Scans`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/vulnerabilities/vulnerabilities.md" target="_blank">` Vulnerability`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/vulnerabilities/fixedVulnerabilities.md" target="_blank">`Fixed Vulnerability`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/vulnerabilities/vulnerabilitiesSeverity.md" target="_blank">`Scanned Vulnerabilities By Severity`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/vulnerabilities/vulnerabilitiesState.md" target="_blank">`Scanned Vulnerabilities By State`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/vulnerabilities/scannedLanguages.md" target="_blank">`scanned Language`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/vulnerabilities/scannedPlatform.md" target="_blank">`scanned Platform`</a>
-  <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/scan/scanCreated.md" target="_blank">`Scan Duration`</a>
 

- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/scan/scanCreated.md" target="_blank">`Project Created`</a>


- <a href="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/metrics/scan/scanCreated.md" target="_blank">`Application Created`</a>


<!-- GETTING STARTED -->
## Implementing Handlers
## Adding new Fields



<!-- LICENSE -->
## License

All rights reserved to Checkmarx.

<!-- CONTACT -->
## Contact
Built by Nautilus Team

Team Lead: 
Igor Matos - igor.matos@checkmarx.com

<p align="right">(<a href="#top">back to top</a>)</p>




