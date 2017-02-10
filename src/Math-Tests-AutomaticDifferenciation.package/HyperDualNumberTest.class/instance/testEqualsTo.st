tests
testEqualsTo
self assert: (zeroc equalsTo: zeroc).
self deny: (zeroc equalsTo: zero).
self assert: (zero equalsTo: zero).
self assert: (one equalsTo: (PMHyperDualNumber value: 1.0000000001 eps: 1.0000000001 eps2: 1.0000000001 eps1eps2: 0.0000000001)).
self deny: (one equalsTo: (PMHyperDualNumber value: 1.0000000001 eps: 1.0000000001 eps2: 1.0000000001 eps1eps2: 0.0000001)).
self deny: (one equalsTo: (PMHyperDualNumber value: 1.0000000001 eps: 1.0000000001 eps2: 1.0000001 eps1eps2: 0.0000000001)).
