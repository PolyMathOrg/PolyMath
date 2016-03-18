tests - mathematical functions
testSin
self assert: i sin  isEmpty.
self assert: x sin =(RealInterval inf: -1 sup: 1) .
self assert: (x  min: Float halfPi )sin=(IntervalUnion with: e sin with: 1 with:0).