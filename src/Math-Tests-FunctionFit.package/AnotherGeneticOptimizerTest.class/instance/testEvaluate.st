tests
testEvaluate
go maximumIterations: 170.
go chromosomeManager populationSize: 50.
self assert: (go evaluate equalsTo: #(0 0 0)  ).
