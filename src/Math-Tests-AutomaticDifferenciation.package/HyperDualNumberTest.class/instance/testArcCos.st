tests-mathematical functions
testArcCos
|a|
self assert: (zero arcCos equalsTo:(  HyperDualNumber value: Float halfPi eps: -1 eps2: -1 eps1eps2: 0)).
a:=(HyperDualNumber value: 1.0 predecessor eps: 1 eps2: 1eps1eps2:0)arcCos.
self assert:(a value closeTo: 0). 
self assert:(a eps< -1e6).
self assert:(a eps2< -1e6).
self assert:(a eps1eps2< -1e6).
