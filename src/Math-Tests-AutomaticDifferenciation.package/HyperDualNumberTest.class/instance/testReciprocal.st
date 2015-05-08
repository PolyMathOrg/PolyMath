tests-arithmetic
testReciprocal
self should: [ zero reciprocal ] raise:ZeroDivide. 
self should: [ zeroc reciprocal ] raise:ZeroDivide.
self assertEquality: one reciprocal and:  ( HyperDualNumber value: 1 eps: -1 eps2: -1 eps1eps2: 2).
self assertEquality: onec reciprocal and:  onec.
self assertEquality: three reciprocal and:  ( HyperDualNumber value: (1/3) eps: (-1/9) eps2: (-1/9) eps1eps2: (2/27)).