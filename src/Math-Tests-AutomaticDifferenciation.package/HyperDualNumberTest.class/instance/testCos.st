tests-mathematical functions
testCos
self assert: ((PMHyperDualNumber value: Float halfPi negated eps: 1 eps2:1 eps1eps2:0)cos equalsTo: zero). 
self assert: ((PMHyperDualNumber value: Float halfPi eps: 1 eps2:1 eps1eps2:0)cos equalsTo: zero negated ).
self assert: ((PMHyperDualNumber value: Float halfPi)cos equalsTo: zeroc).