tests - mathematical functions
testArcCos
self assert: i arcCos isEmpty.
self assert: x arcCos =(IntervalUnion with: Float halfPi  with: (RealInterval inf: -1 sup: (-3/4)) arcCos) .