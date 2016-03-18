tests - testing
testIsZero
self deny: x isZero  .
self deny: i isZero  .
self deny: x isZeroInterval   .
self deny: i isZeroInterval  .
self assert: (IntervalUnion with:0)isZeroInterval.
self deny: (IntervalUnion with:0)isZero.

