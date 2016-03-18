tests - testing
testIsInfinite
self assert: x isInfinite .
(x at:3)sup: 5.
self deny: x isInfinite .
self deny: i isInfinite .

