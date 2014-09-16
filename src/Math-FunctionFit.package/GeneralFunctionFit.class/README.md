GeneralFunctionFit fits a function to some data. the data has to be a collection of points x@f(x). the fitting minimizes by default the squared error, but it can also do more robust regressions. GeneralFunctionFit can also deal with local minima. if you have a function with many parameters you might want to enlarge the populationSize and/or the maximumIterations. if the result is not exact enough, it is faster and often sufficient to rerun #evaluate.
f:=[:x :a :b |x squared sin squared -b/ (a+x squared)].
col:=(-2.5 to: 2.5 by:0.25)collect: [:i|i@(f cull: i cull: 2 cull: 3 )].
fit:= GeneralFunctionFit function: f data: col minimumValues: #(0 0) maximumValues: #(10 10) .
fit evaluate . 
fit result  .  --> #(2.0000000000000413 3.000000000000014)