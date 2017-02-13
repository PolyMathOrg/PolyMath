tests
testErrorMinimzer
|f col er fit|
f:=[:x :a :b|a*x / (b+x)].
col:=(0 to: 20)collect: [:i|i@(f cull: i cull: 2 cull: 0.4) ].
er:=PMErrorOfParameterFunction function: f data: col.
er errorType: #insensitive.
er quartile: 0.9.
fit:= PMErrorMinimizer function: er.
fit evaluate .
self assert: (fit  maxFunction>2) .
self assert: (fit parameters equalsTo: #(2 0.4))