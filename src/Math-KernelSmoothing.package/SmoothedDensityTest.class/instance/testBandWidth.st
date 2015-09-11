tests
testBandWidth

density bandWidth: 2.
self assert: density bandWidth=2.
density ruleOfThumbBandWidth .
self assert: (density bandWidth equalsTo: 0.505899674).
density data:#(1 2 3 1 2.3 2.4 7).
density ruleOfThumbBandWidth .
self assert: (density bandWidth equalsTo: 0.728178892).
density data:#(1 2 3 1 2.3 2.4 7 -7).
density epanechnikov .
self assert: (density bandWidth equalsTo: 0.728178892).
density ruleOfThumbBandWidth .
self assert: (density bandWidth equalsTo: 0.753301158).



