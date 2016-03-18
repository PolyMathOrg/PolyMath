tests - truncation
testCeiling
|x|
self assert: empty ceiling =empty.
self assert: z ceiling=0.
self assert: o negated ceiling= -1.
x:= a ceiling.
self assert: x=a.
self assert: x comments=(OrderedCollection with:'onlyIntegers').
self assert: b ceiling=b.
self assert: c ceiling = (IntervalUnion withAll: #(1 2 3 4 5 6 7)).
self assert: (d sup: (4/5) ; ceiling)= (IntervalUnion withAll: #(-1 0 1)).
self assert: e ceiling=  (IntervalUnion withAll: #(-1 0)).
self assert: g ceiling =g.
x:= h ceiling.
self assert: h ceiling= h.
self assert: x comments=(OrderedCollection with:'onlyIntegers').
