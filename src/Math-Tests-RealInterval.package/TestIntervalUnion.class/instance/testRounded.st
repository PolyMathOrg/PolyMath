tests - truncation
testRounded
self assert: i rounded isEmpty .
i:=(IntervalUnion with:0 with: -1 with: g with: -4).
x add: -3.7.
self assert: x rounded =i .
self assert: i rounded =i .
self assert: x negated rounded =i negated .

