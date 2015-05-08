tests-arithmetic
testAdd
self assertEquality: 0+onec+0 and: onec .
self assertEquality: 1+one+onec+0 and: three .
three eps1eps2: 2.
self assertEquality: 1+one+one+three+1 and: (HyperDualNumber value: 7 eps: 3 eps2:3 eps1eps2:2). 