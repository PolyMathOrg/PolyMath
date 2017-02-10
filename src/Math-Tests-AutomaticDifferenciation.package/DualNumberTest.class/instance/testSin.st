tests-mathematical functions
testSin
self assert: ((PMDualNumber value: Float halfPi negated eps: 1)sin equalsTo: (PMDualNumber value: -1.0 eps: 0.0) ).
self assert: ((PMDualNumber value: Float halfPi eps: 1)sin equalsTo: (PMDualNumber value: 1.0 eps: 0.0) ).
self assertEquality: zero sin and:zero.