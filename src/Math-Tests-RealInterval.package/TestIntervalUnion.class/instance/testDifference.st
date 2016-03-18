tests - set operations
testDifference
self assert: ((i difference: a) =empty).
self assert: ((i difference: 3.5) =empty).
self assert: ((i difference: empty) =empty).
self assert: ((empty difference: i) =empty).
self assert: ((d difference: i) =d).
self assert: ((i difference: i) =empty ).
self assert: ((x difference: x) =empty ).
i:=(IntervalUnion with: 0	with: e copy).
self assert: ((i difference: i) =empty ).
self assert: ((x difference: i) =g ).
self assert: ((i difference: x) =empty ).
self assert: ((empty difference: x) =empty ).
self assert: ((1 difference: i) =1 ).
i inf: -1.
self assert: (x difference: i) =(IntervalUnion with:(RealInterval inf: (-5/4) sup: -1 )with:g).
self assert: (x difference: empty) =x.
self assert: (x difference: a) =e.
self assert: (x difference: a negated) =g.
self assert: (a difference: x) =(RealInterval inf: 0 negated sup: 2).
self assert: (b difference: x) =(IntervalUnion 
	with: (RealInterval inf: Float infinity negated sup: (-5/4)) 
	with: (RealInterval inf:  (-3/4) sup: 2)).
self assert: ((c difference: x) =(RealInterval inf: 1 sup: 2)).
self assert: ((d difference: x) =(RealInterval inf: (-3/4) sup: 2)).
self assert: ((e difference: x) =empty).
self assert: ((g difference: x) =empty).
self assert: ((h difference: x) =(IntervalUnion 
	with: (RealInterval inf: Float infinity negated sup: (-5/4)) 
	with: (RealInterval inf: (-3/4) sup: 2))).
self assert: (x difference: 0)=(IntervalUnion with: e with:g) .
self assert: (x difference: (-3/4))=x.
self assert: (x difference: 0.7)=x.
self assert: (-1.01 difference: x)=empty.
self assert: (2 difference: x)=empty .
self assert: ((-1/2) difference: x)= (-1/2) .
i:=IntervalUnion with:(a copy inf:3;yourself) with:(e copy inf: -1;yourself).
self assert: (x difference: i)=(IntervalUnion 
	with:0 
	with:(RealInterval inf: (-5/4) sup: -1)
	with:(RealInterval inf: 2 sup: 3)).
self assert: (i difference: x)=empty.
