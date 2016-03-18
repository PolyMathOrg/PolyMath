tests - set operations
testIntersection
|f|
self assert: ((a intersection:  a negated) =0).
self assert: ((a negated intersection: a) =0).
self assert: ((a intersection: a) =a).
self assert: ((empty intersection: d) =empty).
self assert: ((a intersection: empty) =empty).
self assert: ((empty intersection: empty) =empty ).
self assert: ((c intersection: e) =empty ).
self assert: ((d intersection: e) =(RealInterval inf: -1 sup: (-3/4))).
self assert: ((d intersection: o) =o).
self assert: ((a intersection: h) =(RealInterval inf: 0 sup: 2)).
f:=a negated.
self assert: ((f intersection: e) =e ).
self assert: (f intersection: 0)=0.
self assert: (z intersection: 0)=0.
self assert: (0 intersection: z)=0.
self assert: (empty intersection: 8)=empty.
self assert: (8 intersection: 8)=8.
self assert: (8 intersection: 7.5)=empty .
self assert: (7 intersection: empty)=empty .
self assert: (-1 intersection: e)= -1.
self assert: (e intersection: -1)= -1.
self assert: (-1.01 intersection: e)= -1.01.
self assert: (-5/4 intersection: e)= (-5/4).









