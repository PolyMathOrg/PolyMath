tests - testing
testIsFinite
self deny: x isFinite .
self deny: i isFinite .
(x at:3)sup: 5.
self assert: x isFinite .

