tests - truncation
testTruncated
|x|
self assert: empty truncated =empty.
self assert: z truncated=0.
self assert: o negated truncated= -1.
x:= b truncated.
self assert: x=b.
self assert: x comments=(OrderedCollection with:'onlyIntegers').
self assert: a truncated=a.
self assert: c truncated = (IntervalUnion withAll: #(1 2 3 4 5 6 7)).
self assert: (d sup: (4/5) ; truncated)= (IntervalUnion  withAll: #(-1 0)).
self assert: e truncated=  (IntervalUnion withAll: #(-1 0)).
self assert: g truncated =g.
x:= (h copy sup: 2.9;yourself) truncated.
self assert: x= h.
self assert: x comments=(OrderedCollection with:'onlyIntegers').
