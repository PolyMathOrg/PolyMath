tests-arithmetic
testMultiply
self assertEquality: 0*onec and: zeroc .
self assertEquality: three*0 and: zeroc.
self assertEquality: onec*three and: three .
self assertEquality: three*one and: (DualNumber value: 3 eps: 4). 
self assertEquality: (three+2.0)*(1+one) and: (DualNumber value: 10.0 eps: 7.0). 