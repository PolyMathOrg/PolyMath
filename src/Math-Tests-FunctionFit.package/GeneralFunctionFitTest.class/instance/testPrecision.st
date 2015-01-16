tests
testPrecision
fit:=GeneralFunctionFit function: f data: col minimumValues: 0 maximumValues: 5 .
self assert:fit precision isNil.
fit evaluate .
self assert: (fit precision < 1e-6 ).


