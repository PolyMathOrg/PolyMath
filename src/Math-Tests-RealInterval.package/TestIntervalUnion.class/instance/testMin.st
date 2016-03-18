tests - comparing
testMin
self assert: (empty min: x)=empty.
self assert: (x min: empty)=empty .
self assert: (x min: i)=empty .
self assert: (3 min: i)=empty.
self assert: (i min: -1)=empty.
self assert: (x min: -2)= -2.
self assert: (x min: Float infinity )= x.
self assert: (-1 min: x)=(RealInterval inf: (-5/4) sup: -1).
self assert: ((1/2) min: x)=(IntervalUnion with:e with: 0 with:(1/2)).
self assert: (x min: (RealInterval inf: 0.7 sup: 1)) =(IntervalUnion with:e with: 0 with:(RealInterval inf: 0.7 sup: 1)).
self assert: (x min: x)=x.
self assert: (x+1 min:x)=((x union: ((-1/4)hull:(1/4)))union:1).
i := IntervalUnion with: o with: z.
self assert: (i min: x)=(IntervalUnion with: o with: z with: e).
self assert: (i min: x negated)=(IntervalUnion with: g negated with: z with: (RealInterval inf: (3/4) sup: 1)).
"here is a little inconsistency, where im not sure whether i should change the result "
self assert: (Float infinity negated min: x)=empty.
self assert: (x min: Float infinity negated)=empty.
self assert: (Float infinity  min: x)=x.
self assert: (x min: Float infinity)=x.