## Scans Data

File : Scans_YYYY-MM-DD.txt

| Required Fields         | Description  |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Scan Identification     | The scan id should be provided in this   |
| Tenant Id              | The tenant id should be provided in this  |
| Project Id              | The Project id should be provided in this  |
| Engine                  | Each line of the file should pertain only to one engine (SAST, SCA and IAC). Every report should also have a line with the Prescan|
| Scan Status | Status of the single scan|
| Engine Status                  | Each line of the file should pertain only to the Status of the current Engine (for example, Line 1: Engine SAST → Status Completed<br>Line 2: Engine SCA → Status Failed            Line 3: Engine KICS → Status Completed)<br>A full status should be added to every row (for example, if 2 engines complete but 1 fails the full status would be Partial in every line) |
| Execution Time (possibly not provided while not per engine)          | The execution time resolution should be in minutes<br>The execution time should be per engine (for each engine, the time to complete the scan should be added) |
| Scan Failure Error Type | This field should have an error code which maps to a specific error description (for example,  error code 30121 → Commit Already Exists)|
| Scan Source             | This field should contain the source |
| Scan Origin             | This field should contain the origin |
| Scan Type               | This field should inform if the scan was Full or Incremental (only for SAST)  |
| Lines of Code           | his field should contain the information on the lines of code in the scan<br><br>(Added only for relevant engines (maybe only SAST) |
| Total Info (Engine provided data, no user changes consideration)    | The sum of all info vulnerabilities on this scan   |
| Total Low (Engine provided data, no user changes consideration)    | The sum of all low vulnerabilities on this scan   |
| Total Medium (Engine provided data, no user changes consideration)    | The sum of all medium vulnerabilities on this scan   |
| Total High (Engine provided data, no user changes consideration)    | The sum of all high vulnerabilities on this scan   |
| Scan Date (UTC)    | The datetime of the scan   |

