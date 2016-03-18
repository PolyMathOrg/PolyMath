tests - mathematical functions
testSimpleSign
self assert: i simpleSign isEmpty.
self assert: (IntervalUnion with:z) simpleSign= 1.
self assert: (IntervalUnion with:z with: e) simpleSign= -1 .
self assert: (IntervalUnion with:a) simpleSign=1.
self assert: (IntervalUnion with:b) simpleSign=(IntervalUnion withAll: #(-1 1)).
self assert: (IntervalUnion with:a) negated simpleSign= -1 .
self assert: x simpleSign= (IntervalUnion withAll: #(-1 1)).