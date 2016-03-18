tests - comparing
testEqualsTo
self deny: (a equalsTo: (RealInterval inf: 0.0000001 sup: Float infinity)).
self assert: (a equalsTo: (RealInterval inf: 0.00000001 sup: Float infinity)).
self deny:(a equalsTo: b).
self deny:(b equalsTo: a).
self assert: (b equalsTo: b).
self assert: (o equalsTo: 1.00000001).
self deny:(o equalsTo: 0).
