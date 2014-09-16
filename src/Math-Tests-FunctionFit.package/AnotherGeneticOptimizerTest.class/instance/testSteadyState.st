tests
testSteadyState
|r1 r2|
"probabilistic test. not always true"
go steadyState:  false.
go maximumIterations: 1000.
r1 :=go evaluate norm.
self setUp .
go steadyState:  true.
go maximumIterations: 1000.
r2 :=go evaluate norm.
self assert: (r1>r2  ).
