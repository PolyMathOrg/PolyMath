tests
testRelativeError
|fit r|
f:=[ :x :a| a].
col:={1@2. 2@6}.
fit:=GeneralFunctionFit function: f data: col minimumValues: -6 maximumValues: 6 .
fit populationSize: 10.
r :=fit evaluate first .
self assert: (r equalsTo: 4 ).
fit errorType: #abs.
fit relativeError: true.
r :=fit evaluate first .
self assert: ((r - (2*6)sqrt)abs<1e-5 ).
fit errorType: #squared.
r :=fit evaluate first .
self assert: (r>(2*6)sqrt ).
self assert: (r<4 ).




