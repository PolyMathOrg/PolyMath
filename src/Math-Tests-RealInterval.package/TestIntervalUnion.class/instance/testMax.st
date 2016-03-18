tests - comparing
testMax
self assert: (empty max: x)=empty.
self assert: (x max: empty)=empty .
self assert: (x max: i)=empty .
self assert: (i max: x)=empty .
self assert: (3 max: i)=empty.
self assert: (i max: -1)=empty.
self assert: (x max: 2)= g.
self assert: (x max: -2)= x.
self assert: (-1 max: x)=(x copy inf: -1; yourself).
self assert: ((1/2) max: x)=(IntervalUnion with:g with:(1/2)).
self assert: (x max: (RealInterval inf: 0.7 sup: 1)) =(IntervalUnion with:g with:(RealInterval inf: 0.7 sup: 1)).
self assert: (x max: x)=x.
self assert: (x+1 max:x)=(IntervalUnion with: (e+1) with: 1 with:g)."not equal to (x+1)"
i := IntervalUnion with: o with: z.
self assert: (i max: x)=(IntervalUnion with: o with: z with: g).
self assert: (i max: x negated)=(IntervalUnion with: 0 negated with: e negated).
self assert: (Float infinity negated max: x)=x.
self assert: (x max: Float infinity negated)=x.
"here is a little inconsistency, where im not sure whether i should change the result:"
self assert: (Float infinity  max: x)=empty.
self assert: (x max: Float infinity)=empty.