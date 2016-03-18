tests - arithmetic
testQuo
|f|
self assert: (d quo: empty)=empty.
self assert: (empty quo: a)=empty.
self assert: (empty quo: 0)=empty.
self assert: (empty quo: o)=empty.
self assert: (0 quo: empty)=empty.
self assert: (3 quo: empty)=empty.
self assert: (0.0 quo: empty)=empty.
self assert: (empty quo: empty)=empty.
self assert: (z quo: z)=empty.
self assert: (o quo: z)=empty.
self assert: (d quo: 0)=empty.
self assert: (0 quo: z)=empty.
self assert: (0.8 quo: z)=empty.
self assert: (0 quo: o) isZeroInterval .
self assert: (0 quo: a) isZeroInterval.
self assert: (0 quo: c) isZeroInterval.
f:=RealInterval inf: 0 sup:1 .
self assert:( f quo: f)=a.
self assert: (1quo: b)=b.
self assert: (o quo:d)=(IntervalUnion with: (RealInterval inf: Float infinity negated sup: -1 ) with:a) .
self assert: (1quo: h)=b .
self assert: (c quo: e)=(IntervalUnion from: -9 to: 0).
self assert: (d quo: c)=(IntervalUnion from: -1 to: 8).
self assert: (d quo: 2)=(IntervalUnion from: 0  to: 4).
self assert: (d quo: g)=(IntervalUnion from: 0 to: 4).
self assert: (h quo: g) =(RealInterval inf: Float infinity negated sup: 1 ).
self assert: (d quo: d)=b.
self assert: (d quo: a negated) =b.
self assert: (e quo: a negated) =a.
self assert: (c negated quo: (RealInterval inf: (-9/20) sup: 0))=g.
self assert: (g quo: d)=(IntervalUnion with: g negated with: a) .
self assert: (-2 quo: e)=(IntervalUnion with: 1with: 2) .
