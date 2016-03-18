tests - mathematical functions
testSign
self assert: empty sign =empty.
self assert: z sign=0 sign.
self assert: o sign=1 sign .
self assert: o negated sign= -1 sign.
self assert: a sign=(IntervalUnion withAll: #(0 1)).
self assert: b sign=(IntervalUnion withAll: #(-1 0 1)).
self assert: c sign =1.
self assert: d sign= (IntervalUnion withAll: #(-1 0 1)).
self assert: e sign= -1.
self assert: a negated sign= (IntervalUnion withAll: #(-1 0)) .
self assert: g sign =1.
self assert: h sign= (IntervalUnion withAll: #(-1 0 1)).