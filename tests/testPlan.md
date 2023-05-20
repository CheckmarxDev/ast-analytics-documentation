
ast-metrics circle-ci of metrics (Igor Chaya)
    Integration
    1 - Revive Rabbit tests (integrations between rabbit and ast-metrics)
        Mock the handlers (Scans handlers, User Handlers)
        - send scan event
        - send user event
 

    
ast-analytics-datastore circle-ci of datastore (Sast Team and Jorge)
    - look example integrations_datastore repository
    Component test as it is in integration on the repo of system tests
        1 - Inserting and reading data from scans and execution summaries
    Integration (Orly and Jorge)
        1 - Test Create Scan (sast,kics,sca)
        It will be written on the system test repository
        - Expose a test API on datastore (Jorge)
        Call datastore to check if data was created on the correponding tables 

ast-analytics-exporter in circle-ci of exporter (Orly and Joao)
    End to End on the repo of system test
        1 - Test s3 integration scans
        use the datatastore test data
        start the exporter service
        Check in s3 Bucket if data was exported
    Integration
        2 - Test s3 integration tenant-info
        Create data manually on users table
        start the exporter service
        Check in s3 Bucket if data was exported
        
   

      