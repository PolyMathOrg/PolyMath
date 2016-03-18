tests - mathematical functions
testCos
self assert: i cos  isEmpty.
self assert: x cos =(RealInterval inf: -1 sup: 1) .
self assert: (x  min: 1)cos=(IntervalUnion with: e cos with: 1).