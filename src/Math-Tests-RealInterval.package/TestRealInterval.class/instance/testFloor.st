tests - truncation
testFloor
|x|
self assert: empty floor =empty.
self assert: z floor=0.
self assert: o negated floor= -1.
x:= a floor.
self assert: x=a.
self assert: x comments=(OrderedCollection with:'onlyIntegers').
self assert: b floor=b.
self assert: c floor = (IntervalUnion withAll: #(1 2 3 4 5 6 7)).
self assert: (d sup: (4/5) ; floor)= (IntervalUnion withAll: #(-1 0)).
self assert: e floor=  (IntervalUnion withAll: #(-2 -1)).
self assert: g floor =g.
x:= h floor.
self assert: h floor= h.
self assert: x comments=(OrderedCollection with:'onlyIntegers').
