tests-mathematical functions
testSin
self assert: ((PMHyperDualNumber value: Float halfPi negated eps: 1 eps2: 1 eps1eps2: 0)sin equalsTo: ( PMHyperDualNumber value: -1 eps: 0 eps2: 0 eps1eps2: 1)) .
self assert: ((PMHyperDualNumber value: Float halfPi eps: 1 eps2: 1 eps1eps2: 0)sin equalsTo: (PMHyperDualNumber value: 1 eps: 0 eps2: 0 eps1eps2: -1) ).
self assertEquality: zero sin and: zero.