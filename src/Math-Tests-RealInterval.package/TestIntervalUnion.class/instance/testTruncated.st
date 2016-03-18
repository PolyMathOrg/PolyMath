tests - truncation
testTruncated
self assert: i truncated isEmpty .
i:=(IntervalUnion with:0 with: -1 with: g with: -3).
x add: -3.7.
self assert: x truncated =i .
self assert: i truncated =i .
self assert: x negated truncated =i negated .

