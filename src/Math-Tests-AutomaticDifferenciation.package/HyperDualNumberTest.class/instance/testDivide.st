tests-arithmetic
testDivide
self should: [ 4.0/(one-1) ] raise:ZeroDivide. 
self should: [ three/(onec-1) ] raise:ZeroDivide.
self assertEquality: three/onec and:  three.
self assertEquality: three/three and:  onec.
self assertEquality: 1/one and:  ( HyperDualNumber value: 1 eps: -1 eps2: -1 eps1eps2: 2).
self assertEquality: 1/three reciprocal and:  three.
self assertEquality: 2/(three reciprocal) and:  three*2.
self assertEquality: 1/three and: (HyperDualNumber value: 1/3 eps: -1/9 eps2: -1/9 eps1eps2: 2/27).