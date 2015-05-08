tests-testing
testTesting
self deny: 3 isDualNumber .
self assert: one isDualNumber.
self assert: zeroc isDualNumber.
self deny: three isInfinite .
self assert: (HyperDualNumber value: Float infinity negated eps: 3 eps2: 0 eps1eps2:0)isInfinite .
self deny: three isNaN . 
self deny: zeroc isNaN .
self assert: (HyperDualNumber value: Float nan eps: 1)isNaN .
self assert: onec isNumber.
self assert: three isNumber.
self assert: zeroc isZero.
self assert: zero isZero.
self deny: onec isZero.
self deny: one isZero.




