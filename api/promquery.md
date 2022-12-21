# Prometheus Query


```java
    private String step;
    private String period;
    private QueryRange range;
    private String function;
    private OutputFormat outputFormat;
    private String dataHistory;
    private GroupBy groupBy;
    private boolean aggregateByStep;
    private boolean fullFillGaps;
    private boolean showTotals;
    private List<PrometheusQueryFilter> filters;

```
## Step
> The step is the resolution of the data, or the distance between datapoints in a given range. 


```
In Gauge metrics, the step is equals to the *period* of the query.
The step must be smaller than the *range*.
In Counter metrics, the step can be equals or smaller than the *period*.
```

### Examples:

```json
"definedRange": "1w"
"step":"1d"
```

```json
"definedRange": "1d"
"step":"1h"
```

```json
"definedRange": "1h"
"step":"1m"
```


## Range
>The range defines the start date and the end date of the query. 

```
The range can be defined using 2 diferent parameters configuration: (definedRange or start/end).
Using start/end the definedRange should be null.
Using definedRange the start/end should be null.
Defined Range is a enum to facilitate query (1w, 1d, 1h, 30m).
Start and End must be passed as numeric date format UTC.
```

### Examples:

```json
"range":{"
  "definedRange": "1w"
}
```
or 

```json
"range":{"
"start": "124332523423"
"end":"124332432423"
}
```


## Function
>The function is a enum that defiens what is the function applied to the metric.

- 1 Open Query - When the method contains a query that is not one of the pre-defined functions bellow:
- 2 Accumulative - Most comun in counter metrics, used to sum the values in an accumulative way trhough the timeline
- 3 Periodic - Aggregates data by period calclulation trough the timeline. Because it is an calculation made in each step, the values can be sometimes not very accurate. To have a more precise aggrgation use Accumulative function with step aggregation.
- 4 Simple Sum - Just sum data on the timeline
- 5 Simple Count  - Just count data on thetimeline
- 6 Simple Periodic - It is same as periodic but without considering historical aggregation
- 7 Max Overtime - Calculates the max value on the timeline. Generally works well with Gauge metrics
- 8 Min Overtime - Calculates the min value on the timeline. Generally works well with Gauge metrics
- 
```
Functions is mandatory
When function is Periodic (3), the period is mandatory
When function is not periodic period must be null
```



### Examples:

```json
"function": "accumulative"
"step": "1d"
```
or 

```json
"function": "periodic"
"period": "1d"
```

## Data History
> Defines if the data will be calculated using historical data or not

Values
- historical
- cleanHistorical
```
Data History is mandatory
```

### Examples:

```json
"dataHistory": "cleanHistorical"
```


<img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/no_aggregation_historical.png" alt="Logo" width="300" >

<img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/no_aggregation_clean_historical.png" alt="Logo" width="300" >

<img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/step_aggregation_clean_historical.png" alt="Logo" width="300" >

<img src="https://github.com/CheckmarxDev/ast-metrics-documentation/blob/master/imgs/ste_aggregation_clean_historical.png" alt="Logo" width="300" >
