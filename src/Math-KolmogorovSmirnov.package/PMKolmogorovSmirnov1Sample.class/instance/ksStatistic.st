accessing
ksStatistic
"the kolmogorov-smirnov statistic D"
|s d|
self testDataComplete .
s:=data size.
d:=(1 to:s) collect: [:i||f| f:=compareWith value:(data at:i).(f -((i-1)/s))max: ((i/s)-f)].
^d max.
