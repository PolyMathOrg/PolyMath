tests-arithmetic
testMultiply
self assertEquality: 0*onec and: zeroc .
self assertEquality: three*0 and: zeroc.
self assertEquality: onec*three and: three .
self assertEquality: three*one and: ( PMHyperDualNumber value: 3 eps: 4 eps2: 4 eps1eps2: 2). 
self assertEquality: (three+2.0)*(1+one) and: ( PMHyperDualNumber value: 10.0 eps: 7.0 eps2: 7.0 eps1eps2: 2.0). 