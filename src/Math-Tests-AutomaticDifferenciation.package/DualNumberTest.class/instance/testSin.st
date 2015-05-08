tests-mathematical functions
testSin
self assert: ((DualNumber value: Float halfPi negated eps: 1)sin equalsTo: (DualNumber value: -1.0 eps: 0.0) ).
self assert: ((DualNumber value: Float halfPi eps: 1)sin equalsTo: (DualNumber value: 1.0 eps: 0.0) ).
self assertEquality: zero sin and:zero.