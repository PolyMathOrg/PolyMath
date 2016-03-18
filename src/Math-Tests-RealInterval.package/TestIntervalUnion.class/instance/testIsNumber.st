tests - testing
testIsNumber
self deny: x isNumber .
self deny: i isNumber .
self deny: (IntervalUnion with: 0 with: 1) isNumber .
self deny: (IntervalUnion with: c) isNumber .
self assert: (IntervalUnion with: 3.8) isNumber  .
self assert: (IntervalUnion with: 3) isNumber  .
self assert: (IntervalUnion with: (-3/8)) isNumber  .

