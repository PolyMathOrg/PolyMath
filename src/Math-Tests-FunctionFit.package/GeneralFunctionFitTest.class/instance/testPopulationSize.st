tests
testPopulationSize
|fit|
fit:=GeneralFunctionFit function: f data: col minimumValues: 0 maximumValues: 5 .
self assert: (fit manager populationSize= 50 ).
fit populationSize: 100.
self assert: (fit manager populationSize= 100 ).


