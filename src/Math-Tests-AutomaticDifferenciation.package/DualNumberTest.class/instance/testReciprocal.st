tests-arithmetic
testReciprocal
self should: [ zero reciprocal ] raise:ZeroDivide. 
self should: [ zeroc reciprocal ] raise:ZeroDivide.
self assertEquality: one reciprocal and:  (PMDualNumber value: 1 eps: -1).
self assertEquality: onec reciprocal and:  onec.
self assertEquality: three reciprocal and:  (PMDualNumber value: (1/3.0) eps: -1/9.0).