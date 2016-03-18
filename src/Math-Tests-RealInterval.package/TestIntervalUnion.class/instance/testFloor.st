tests - truncation
testFloor
self assert: i floor isEmpty .
i:=(IntervalUnion with:0 with: -1 with: -2 with: g).
self assert: x floor =i .
self assert: i floor =i .
i removeAt: 1.
self assert: x negated floor =i negated .

