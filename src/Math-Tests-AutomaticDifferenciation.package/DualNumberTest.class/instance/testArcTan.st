tests-mathematical functions
testArcTan
self assertEquality: zero arcTan and: zero.
self assertEquality: one negated arcTan and:(PMDualNumber value: -1 arcTan eps: (-1/2)).
self assert: (three arcTan eps equalsTo:0.1).