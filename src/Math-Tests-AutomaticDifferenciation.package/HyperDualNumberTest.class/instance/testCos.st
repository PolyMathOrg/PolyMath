tests-mathematical functions
testCos
self assert: ((HyperDualNumber value: Float halfPi negated eps: 1 eps2:1 eps1eps2:0)cos equalsTo: zero). 
self assert: ((HyperDualNumber value: Float halfPi eps: 1 eps2:1 eps1eps2:0)cos equalsTo: zero negated ).
self assert: ((HyperDualNumber value: Float halfPi)cos equalsTo: zeroc).