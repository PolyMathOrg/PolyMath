tests-mathematical functions
testCos
self assert: ((DualNumber value: Float halfPi negated eps: 1)cos equalsTo: (DualNumber value: 0 eps: 1) ).
self assert: ((DualNumber value: Float halfPi eps: 1)cos equalsTo: (DualNumber value: 0 eps: -1) ).
self assert: ((DualNumber value: Float halfPi eps: 0)cos equalsTo: zeroc).