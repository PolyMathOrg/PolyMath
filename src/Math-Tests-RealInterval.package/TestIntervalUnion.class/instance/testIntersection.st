tests - set operations
testIntersection
|f|
self assert: (x intersection:  i) isEmpty .
self assert: (i intersection:  x) isEmpty .
self assert: (x intersection:  empty) isEmpty .
self assert: (empty intersection:  x) isEmpty .
self assert: (x intersection: 1) isEmpty .
self assert: (1 intersection:  x) isEmpty .
self assert: (x intersection: o) isEmpty .
self assert: (o intersection:  x) isEmpty .
self assert: (x intersection:  x) =x .
self assert: (x intersection:  3) =3.
self assert: (3 intersection:  x) =(RealInterval fromNumber: 3).
self assert: (x intersection:  e) =e.
a inf:1.
self assert: (a intersection:  x) =g.
f:=e union:0.
a inf:0.
self assert: f isIntervalUnion .
self assert: (x intersection:  a negated) =f.
self assert: (a negated intersection: x ) =f.
f:=e union:(RealInterval inf: -0.1 sup:2) .
self assert: (f intersection:  x) =(IntervalUnion with:0 with:e with:2).
