tests - mathematical functions
testArcTan
self assert: i arcTan  isEmpty.
self assert: x arcTan =(IntervalUnion with: 0  with: e arcTan with: g arcTan ) .