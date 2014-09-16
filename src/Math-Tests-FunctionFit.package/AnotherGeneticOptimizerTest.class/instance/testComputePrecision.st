tests
testComputePrecision
|r|
go maximumIterations: 2.
go evaluate .
r:=go computePrecision:0.
go maximumIterations: 50 .
go evaluate .
self assert: (r>go computePrecision  ).
