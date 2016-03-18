tests - arithmetic
testIntegerDiv
|f|
self assert: (d // empty)=empty.
self assert: (empty // a)=empty.
self assert: (empty // 0)=empty.
self assert: (empty // o)=empty.
self assert: (0 // empty)=empty.
self assert: ((3/4) // empty)=empty.
self assert: (0.0 // empty)=empty.
self assert: (empty // empty)=empty.
self assert: (z // z)=empty.
self assert: (o // z)=empty.
self assert: (d // 0)=empty.
self assert: (0 // z)=empty.
self assert: (0.8 // z)=empty.
self assert: (0 // o) isZeroInterval .
self assert: (0 // a) isZeroInterval.
self assert: (0 // c) isZeroInterval.
f:=RealInterval inf: 0 sup:1 .
self assert:( f // f)=a.
self assert: (1// b)=b.
self assert: (o //d)=(IntervalUnion with: (RealInterval inf: Float infinity negated sup: -1 ) with:a) .
self assert: (1// h)=(IntervalUnion with: b) .
self assert: (c // e)=(IntervalUnion from: -10 to: -1).
self assert: (d // c)=(IntervalUnion from: -1 to: 8).
self assert: (d // g)=(IntervalUnion from: -1 to: 4).
self assert: (h // g) =(RealInterval inf: Float infinity negated sup: 1 ).
self assert: (d // d)=b.
self assert: (d // 2)=(IntervalUnion from: -1  to: 4).
self assert: d//a negated =b.
self assert: e//a negated =a.
self assert: (c negated // (RealInterval inf: (-9/20) sup: 0))=g.
self assert: (g // d)=(IntervalUnion with: g negated with: a) .
self assert: (-2 // c)= (IntervalUnion with: -1 with: -2).
self assert: (10 // c)= (IntervalUnion from: 1 to: 10).
self assert: (0.88 // c) isZeroInterval .
self assert: (9.7 // d)= (IntervalUnion with: ((a + 1) * -10) with: a+1).
self assert: (10 // e)= (IntervalUnion from: -14 to: -8).

