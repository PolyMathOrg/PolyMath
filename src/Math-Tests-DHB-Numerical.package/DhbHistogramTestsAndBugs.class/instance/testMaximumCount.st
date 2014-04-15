tests
testMaximumCount
self assert: ( h maximumCount= 1 ).
h accumulate: 3.
self assert: ( h maximumCount= 2 ).
