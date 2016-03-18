tests - testing
testIsIntervalUnion
self assert: x isIntervalUnion .
self assert: i isIntervalUnion .
self deny: a isIntervalUnion .
self deny: 3 isIntervalUnion .