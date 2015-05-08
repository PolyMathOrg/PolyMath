tests-mathematical functions
testArcSin
|a|
self assert: zero arcSin =zero.
a:=(DualNumber value: 1.0 predecessor eps: 1)arcSin.
self assert:(a value equalsTo: Float halfPi). 
self assert:(a eps>1e6).
a:=(DualNumber value: -0.5 eps: 1)arcSin.
self assert: a value = -0.5 arcSin .
self assert: a eps = (1/(1-0.5 squared)sqrt).