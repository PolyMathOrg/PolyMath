tests-arithmetic
testAdd
self assertEquality: 0+onec+0 and: onec .
self assertEquality: 1+one+onec+0 and: three .
self assertEquality: 1+one+one+three+1 and: (DualNumber value: 7 eps: 3). 