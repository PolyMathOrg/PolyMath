tests - testing
testBetween
self assert: (empty between: 1 and: 1).
self assert: (empty between: -1 and: 1).
self assert: (empty between: 1 and: -1).
self deny: (a between: 1 and: Float infinity ).
self deny: (a between: Float infinity negated and: -1).
self deny: (a between: 1 and: 1).
self assert: (a between: 0 and: Float infinity).
self assert: (a between: Float infinity negated and: Float infinity).
