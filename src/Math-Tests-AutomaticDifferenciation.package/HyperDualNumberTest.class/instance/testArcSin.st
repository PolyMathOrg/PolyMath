tests-mathematical functions
testArcSin
|a|
self assert: zero arcSin =zero.
a:=(HyperDualNumber value: 1.0 predecessor eps: 1 eps2: 1eps1eps2:0)arcSin.
self assert:(a value equalsTo: Float halfPi). 
self assert:(a eps>1e6).
self assert:(a eps2>1e6).
self assert:(a eps1eps2>1e6).