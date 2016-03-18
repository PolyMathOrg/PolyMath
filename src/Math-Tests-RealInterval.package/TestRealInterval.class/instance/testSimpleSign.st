tests - mathematical functions
testSimpleSign
self assert: empty simpleSign =empty.
self assert: z simpleSign=1.
self assert: o simpleSign=1 sign .
self assert: o negated simpleSign= -1 sign.
self assert: a simpleSign=1.
self assert: b simpleSign=(IntervalUnion withAll: #(-1 1)).
self assert: c simpleSign =1.
self assert: d simpleSign= (IntervalUnion withAll: #(-1 1)).
self assert: e simpleSign= -1.
self assert: a negated simpleSign= -1.
