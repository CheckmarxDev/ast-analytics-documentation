# Promquery

- Step
- Range

## Step
> The step is the resolution of the data, or the distance between datapoints in a given range. 
> In Gauge metrics, the step is equals to the *period* of the query.
> The step must be smaller than the *range*
> In Counter metrics, the step can be equals or smaller than the *period* 
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
