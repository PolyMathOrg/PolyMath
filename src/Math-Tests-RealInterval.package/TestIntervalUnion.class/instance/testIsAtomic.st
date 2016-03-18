tests - testing
testIsAtomic
self deny: (IntervalUnion with:0 with:1) isAtomic .
self deny: (IntervalUnion with: (0 hull:0.00001)) isAtomic .
self assert: (IntervalUnion with: (-3/8)) isAtomic.

