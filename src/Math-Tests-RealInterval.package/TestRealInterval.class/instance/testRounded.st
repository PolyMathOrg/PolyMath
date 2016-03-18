tests - truncation
testRounded
|x|
self assert: empty rounded =empty.
self assert: z rounded=0.
self assert: o negated rounded= -1.
x:= b rounded.
self assert: x=b.
self assert: x comments=(OrderedCollection with:'onlyIntegers').
self assert: a rounded=a.
self assert: c rounded = (IntervalUnion withAll: #(1 2 3 4 5 6 7)).
self assert: (d sup: (4/5) ; rounded)= (IntervalUnion withAll: #(-1 0 1)).
self assert: e rounded=  -1.
self assert: g rounded =g.
x:= (h copy sup: 2.9;yourself) rounded.
self assert: x= (h copy sup:3;yourself).
self assert: x comments=(OrderedCollection with:'onlyIntegers').
