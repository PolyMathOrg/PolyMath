tests - testing
testTesting
"isEmpty"
self assert: (IntervalUnion with: empty) isEmpty  .
self assert: i isEmpty  .
self deny: x isEmpty  .
