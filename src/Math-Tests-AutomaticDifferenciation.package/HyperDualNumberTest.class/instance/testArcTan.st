tests-mathematical functions
testArcTan
self assert: zero arcTan = zero.
self assertEquality: one negated arcTan and:(HyperDualNumber value: -1 arcTan eps: (-1/2)eps2: -1/2 eps1eps2: 1/2).
self assert: (three arcTan eps2 equalsTo:0.1).
self assert: (three arcTan eps1eps2 equalsTo:(-3/50)).