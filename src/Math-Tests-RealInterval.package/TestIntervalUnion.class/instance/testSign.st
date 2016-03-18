tests - mathematical functions
testSign
self assert: i sign isEmpty.
self assert: (IntervalUnion with:z) sign==0 sign.
self assert: (IntervalUnion with:o with: e negated) sign==1 sign .
self assert: (IntervalUnion with: o negated) sign== -1 sign.
self assert: (IntervalUnion with:a) sign=(IntervalUnion withAll: #(0 1)).
self assert: (IntervalUnion with:b) sign=(IntervalUnion withAll: #(-1 0 1)).
self assert: (IntervalUnion with:a) negated sign= (IntervalUnion withAll: #(-1 0)) .
self assert: x sign= (IntervalUnion withAll: #(-1 0 1)).