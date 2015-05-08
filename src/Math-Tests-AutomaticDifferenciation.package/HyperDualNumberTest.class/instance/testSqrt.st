tests-mathematical functions
testSqrt
|a|
self assertEquality: (HyperDualNumber value: 16 eps: 5eps2: 1 eps1eps2: 0) sqrt and: (HyperDualNumber value: 4 eps: (5/8) eps2: (1/8) eps1eps2: (-5/256)).
a:=zero sqrt.
self assert: a value=0.
self assert: a eps > 1e60. 
self assert: a eps2  > 1e60. 
self assert: a eps1eps2 < 1e60. 