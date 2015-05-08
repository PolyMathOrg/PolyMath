tests-arithmetic
testNegated
three eps1eps2: -4.
self assert: three negated = -3.
self assert: three negated eps= -1. 
self assert: three negated eps2= -1. 
self assert: three negated eps1eps2 = 4.    