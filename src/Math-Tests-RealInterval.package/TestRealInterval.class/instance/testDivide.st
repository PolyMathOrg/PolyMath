tests - arithmetic
testDivide
|f|
f:=a negated.
self assert: d/empty=empty.
self assert: empty/a=empty.
self assert: empty/0=empty.
self assert: empty/z=empty.
self assert: 0/empty=empty.
self assert: empty/empty=empty.
self assert: z/z=empty.
self assert: o/z=empty.
self assert: d/0=empty.
self assert: 0/z=empty.
self assert: 1.7/z=empty.
self assert: (-5/4) /z=empty .
self assert: (0/o) isZeroInterval .
self assert: (0/a) isZeroInterval.
self assert: (0/c) isZeroInterval.
f:=RealInterval inf: 0 sup:1 .
self assert: f/f=a.
self assert: 1/b=b.
self assert: (o/d)=(IntervalUnion with: (RealInterval inf: Float infinity negated sup: -1 ) with:(RealInterval inf: (1/8) sup: Float infinity )) .
self assert: (1/h)=(IntervalUnion with: (RealInterval inf: Float infinity negated sup: 0 ) with:(RealInterval inf: (1/2) sup: Float infinity )) .
self assert: c/e=(RealInterval inf: (-28/3) sup: (-4/5) ).
self assert: d/c=(RealInterval inf: -1 sup: 8 ).
self assert: d/g=(RealInterval inf: (-1/2) sup: 4 ).
self assert: c/a negated =a negated.
self assert: c negated /a negated =a.
self assert: d/d=b.
self assert: d/a negated =b.
self assert: e/a negated =a.
self assert: h/c=h.
self assert: (c negated / (RealInterval inf: (-1/2) sup: 0))=g.
self assert: c/d=(IntervalUnion with: (RealInterval inf: Float infinity negated sup: -1 ) with:(RealInterval inf: (1/8) sup: Float infinity )) .
self assert: g/d=(IntervalUnion with: (RealInterval inf: Float infinity negated sup: -2 ) with:(RealInterval inf: (1/4) sup: Float infinity )) .
self assert: g/h=(IntervalUnion with: (RealInterval inf: Float infinity negated sup: 0 ) with:(RealInterval inf: 1 sup: Float infinity )) .
