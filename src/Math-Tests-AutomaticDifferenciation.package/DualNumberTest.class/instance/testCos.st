tests-mathematical functions
testCos
self assert: ((PMDualNumber value: Float halfPi negated eps: 1)cos equalsTo: (PMDualNumber value: 0 eps: 1) ).
self assert: ((PMDualNumber value: Float halfPi eps: 1)cos equalsTo: (PMDualNumber value: 0 eps: -1) ).
self assert: ((PMDualNumber value: Float halfPi eps: 0)cos equalsTo: zeroc).