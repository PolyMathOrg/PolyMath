tests - mathematical functions
testArcSin
self assert: i arcSin isEmpty.
self assert: x arcSin =(IntervalUnion with: 0  with: (RealInterval inf: -1 sup: (-3/4)) arcSin) .