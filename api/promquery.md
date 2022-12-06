# Promquery

- Step
- Range
- Function

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
"definedRange": "1w"
```
or 

```json
"start": "124332523423"
"end":"124332432423"
```


## Function
>The function is a enum that defiens what is the function applied to the metric.

```
Functions is mandatory
```

### Examples:

```json
"definedRange": "1w"
```
or 

```json
"start": "124332523423"
"end":"124332432423"
```
