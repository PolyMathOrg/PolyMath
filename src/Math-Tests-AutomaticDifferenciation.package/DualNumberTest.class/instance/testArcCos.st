tests-mathematical functions
testArcCos
|a|
self assert: (zero arcCos equalsTo:( PMDualNumber value: Float halfPi eps: -1)).
a:=(PMDualNumber value: -1.0 successor eps: 1)arcCos.
self assert:(a value equalsTo: Float pi). 
self assert:(a eps< -1e6).