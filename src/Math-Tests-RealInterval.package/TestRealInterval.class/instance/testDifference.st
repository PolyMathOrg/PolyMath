tests - set operations
testDifference
self assert: ((empty difference: a) =empty).
self assert: ((d difference: empty) =d).
self assert: ((empty difference: empty) =empty ).
self assert: ((a difference: a) =empty ).
self assert: ((a difference:  d) =(RealInterval inf: 8 sup: Float infinity)).
self assert: ((a negated difference: d) =(RealInterval inf: Float infinity negated sup: -1) ).
self assert: ((b difference: c) =(IntervalUnion 
	with: (RealInterval inf: Float infinity negated sup: 1) 
	with: (RealInterval inf:  7 sup: Float infinity))).
self assert: ((e difference: d) =(RealInterval inf: (-5/4) sup: -1)).
self assert: ((d difference: e) =(RealInterval inf: (-3/4) sup: 8)).
self assert: ((e difference: h) =empty ).
self assert: ((h difference: e) =(IntervalUnion 
	with: (RealInterval inf: Float infinity negated sup: (-5/4)) 
	with: (RealInterval inf: (-3/4) sup: 2))).
self assert: ((h difference: a) =a negated ).
self assert: (a difference: g) =(RealInterval inf: 0 sup: 2).
self assert: (c difference: 0)=c.
self assert: (empty difference: 8)=empty.
self assert: (8 difference: 8)=empty.
self assert: (8 difference: 7.5)=8 .
self assert: (7 difference: empty)=7 .
self assert: (o difference: 1)=empty.
self assert: (1 difference: o)=empty.
self assert: (o difference: o)=empty.
self assert: (o difference: 8)=1.
self assert: (8 difference: o)=8.
self assert: (8 difference: c)=8.
self assert: (-1 difference: e)=empty.
self assert: (-1.03 difference: e)=empty.
self assert: ((-5/4) difference: e)=empty.















