tests - truncation
testCeiling
self assert: i ceiling isEmpty.
i:=x copy removeAt: 1;add: -1;yourself.
self assert: x ceiling =i.
i:=i negated add: 2; yourself.
self assert: x negated ceiling =i.
